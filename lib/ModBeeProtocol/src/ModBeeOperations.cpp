#include "ModBeeGlobal.h"

// =============================================================================
// CONSTRUCTOR AND DESTRUCTOR
// =============================================================================
ModBeeOperations::ModBeeOperations() {
    // Constructor - initialize empty containers
    _pendingOps.clear();
    _pendingResponses.clear();
}

ModBeeOperations::~ModBeeOperations() {
    // Destructor - clear all containers
    clearPendingOperations();
    clearPendingResponses();
}

// =============================================================================
// OPERATION MANAGEMENT
// =============================================================================
void ModBeeOperations::addPendingOperation(const PendingModbusOp& op, ModBeeProtocol& protocol) {
    // Check if we already have too many pending operations
    if (_pendingOps.size() >= MODBEE_MAX_PENDING_OPS) {
        protocol.reportError(MBEE_BUFFER_OVERFLOW, "Too many pending operations");
        return;
    }
    
    // Check for EXACT duplicate - don't refresh timestamp
    for (const auto& existingOp : _pendingOps) {
        if (existingOp.destNodeID == op.destNodeID &&
            existingOp.req.function == op.req.function &&
            existingOp.req.startAddr == op.req.startAddr &&
            existingOp.req.quantity == op.req.quantity) {
            // Don't refresh - just reject duplicate
            return;
        }
    }
    
    // Add operation
    _pendingOps.push_back(op);
    
    MBEE_DEBUG_OPERATIONS("ADDED: Op %d/%d - Node:%d FC:%02X Addr:%d Qty:%d", 
        _pendingOps.size(), MODBEE_MAX_PENDING_OPS, op.destNodeID, op.req.function, op.req.startAddr, op.req.quantity);
}

void ModBeeOperations::addPendingResponse(const PendingResponse& response) {
    // Check if we already have too many pending responses
    if (_pendingResponses.size() >= MODBEE_MAX_PENDING_RESPONSES) {
        MBEE_DEBUG_OPERATIONS("REJECTED: Response queue full (%d/%d) - FC:%02X", 
            _pendingResponses.size(), MODBEE_MAX_PENDING_RESPONSES, response.response.function);
        return;
    }

    _pendingResponses.push_back(response);
    
    MBEE_DEBUG_OPERATIONS("RESPONSE ADDED: %d/%d - FC:%02X Addr:%d TO Node:%d FROM Node:%d", 
        _pendingResponses.size(), MODBEE_MAX_PENDING_RESPONSES, 
        response.response.function, response.response.startAddr, 
        response.destNodeID, response.sourceNodeID);
}

// =============================================================================
// CLEANUP AND MAINTENANCE
// =============================================================================
void ModBeeOperations::cleanupTimedOutOperations(ModBeeProtocol& protocol) {
    unsigned long now = millis();
    int removedOps = 0;
    int retriedOps = 0;
    int removedResponses = 0;
    
    // Clean up timed out operations
    for (auto it = _pendingOps.begin(); it != _pendingOps.end();) {
        if (now - it->timestamp > (ModBeeAPI::MODBEE_OPERATION_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES) {
            // Check if we should retry
            if (it->retryCount < ModBeeAPI::MODBEE_MAX_RETRIES) {
                // Retry the operation
                it->timestamp = now;
                it->retryCount++;
                retriedOps++;
                MBEE_DEBUG_OPERATIONS("RETRY: Node:%d FC:%02X Addr:%d (attempt %d/%d)", 
                    it->destNodeID, it->req.function, it->req.startAddr, it->retryCount, ModBeeAPI::MODBEE_MAX_RETRIES);
                ++it;
            } else {
                // Max retries reached, remove operation
                MBEE_DEBUG_OPERATIONS("TIMEOUT: Removing Node:%d FC:%02X Addr:%d after %d retries", 
                    it->destNodeID, it->req.function, it->req.startAddr, it->retryCount);
                it = _pendingOps.erase(it);
                removedOps++;
            }
        } else {
            ++it;
        }
    }
    
    // Clean up timed out responses
    for (auto it = _pendingResponses.begin(); it != _pendingResponses.end();) {
        if (now - it->timestamp > (ModBeeAPI::MODBEE_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES) {
            MBEE_DEBUG_OPERATIONS("RESPONSE TIMEOUT: Removing FC:%02X Addr:%d", 
                it->response.function, it->response.startAddr);
            it = _pendingResponses.erase(it);
            removedResponses++;
        } else {
            ++it;
        }
    }
    
    if (removedOps > 0 || retriedOps > 0 || removedResponses > 0) {
        MBEE_DEBUG_OPERATIONS("CLEANUP: Removed:%d ops, %d responses; Retried:%d", 
            removedOps, removedResponses, retriedOps);
    }
}

void ModBeeOperations::clearPendingOperations() {
    int count = _pendingOps.size();
    _pendingOps.clear();
    if (count > 0) {
        MBEE_DEBUG_OPERATIONS("CLEARED: %d pending operations", count);
    }
}

void ModBeeOperations::clearPendingResponses() {
    int count = _pendingResponses.size();
    _pendingResponses.clear();
    if (count > 0) {
        MBEE_DEBUG_OPERATIONS("CLEARED: %d pending responses", count);
    }
}

// =============================================================================
// ACCESSOR METHODS
// =============================================================================
std::vector<PendingModbusOp>& ModBeeOperations::getPendingOps() {
    return _pendingOps;
}

const std::vector<PendingModbusOp>& ModBeeOperations::getPendingOps() const {
    return _pendingOps;
}

std::vector<PendingResponse>& ModBeeOperations::getPendingResponses() {
    return _pendingResponses;
}

const std::vector<PendingResponse>& ModBeeOperations::getPendingResponses() const {
    return _pendingResponses;
}

uint16_t ModBeeOperations::getPendingOpCount() const {
    return _pendingOps.size();
}

uint16_t ModBeeOperations::getPendingResponseCount() const {
    return _pendingResponses.size();
}

bool ModBeeOperations::hasPendingOperations() const {
    return !_pendingOps.empty();
}

bool ModBeeOperations::hasPendingResponses() const {
    return !_pendingResponses.empty();
}

// =============================================================================
// NODE-SPECIFIC OPERATIONS
// =============================================================================
bool ModBeeOperations::hasOperationsForNode(uint8_t nodeID) const {
    for (const auto& op : _pendingOps) {
        if (op.destNodeID == nodeID) {
            return true;
        }
    }
    return false;
}

std::vector<PendingModbusOp> ModBeeOperations::getOperationsForNode(uint8_t nodeID) const {
    std::vector<PendingModbusOp> nodeOps;
    
    for (const auto& op : _pendingOps) {
        if (op.destNodeID == nodeID) {
            nodeOps.push_back(op);
        }
    }
    
    return nodeOps;
}

std::vector<PendingResponse> ModBeeOperations::getResponsesForNode(uint8_t nodeID) const {
    std::vector<PendingResponse> nodeResponses;
    
    // Responses don't have a specific destination node in the current structure
    // This method might need adjustment based on how responses are targeted
    return nodeResponses;
}

void ModBeeOperations::clearNodeOperations(uint8_t nodeID) {
    // Remove all operations for a specific node
    _pendingOps.erase(
        std::remove_if(_pendingOps.begin(), _pendingOps.end(),
            [nodeID](const PendingModbusOp& op) { return op.destNodeID == nodeID; }),
        _pendingOps.end());
    
    MBEE_DEBUG_OPERATIONS("CLEARED: All operations for Node %d", nodeID);
}

void ModBeeOperations::applyFailsafeForNode(uint8_t nodeID) {
    MBEE_DEBUG_OPERATIONS("APPLYING FAILSAFE: Resetting variables for lost Node %d", nodeID);
    int cleared_vars = 0;

    // Iterate through all pending operations. We use a classic for loop with an iterator
    // because we might remove elements, which would invalidate a range-based for loop.
    for (auto it = _pendingOps.begin(); it != _pendingOps.end(); /* no increment here */) {
        // Check if the operation is for the lost node and has a result pointer
        if (it->destNodeID == nodeID && it->resultPtr != nullptr) {
            // Determine the data type from the function code and reset the variable(s)
            switch (it->req.function) {
                case MB_FC_READ_COILS:
                case MB_FC_READ_DISCRETE_INPUTS: {
                    bool* values = static_cast<bool*>(it->resultPtr);
                    for (uint16_t i = 0; i < it->req.quantity; ++i) {
                        values[i] = false;
                    }
                    break;
                }
                case MB_FC_READ_HOLDING_REGISTERS:
                case MB_FC_READ_INPUT_REGISTERS: {
                    int16_t* values = static_cast<int16_t*>(it->resultPtr);
                    for (uint16_t i = 0; i < it->req.quantity; ++i) {
                        values[i] = 0;
                    }
                    break;
                }
                default:
                    // This operation is not a read operation with a result pointer,
                    // so we don't need to do anything for failsafe.
                    break;
            }
            cleared_vars++;
            // Remove the operation now that it's handled
            it = _pendingOps.erase(it);
        } else {
            // Not for the target node or no result pointer, just move to the next operation
            ++it;
        }
    }

    if (cleared_vars > 0) {
        MBEE_DEBUG_OPERATIONS("FAILSAFE APPLIED: Cleared %d variables and removed operations for Node %d", cleared_vars, nodeID);
    }
}

// =============================================================================
// OPERATION OPTIMIZATION AND PRIORITIZATION
// =============================================================================
void ModBeeOperations::prioritizeOperation(const PendingModbusOp& op) {
    // Find the operation and move it to the front
    for (auto it = _pendingOps.begin(); it != _pendingOps.end(); ++it) {
        if (it->destNodeID == op.destNodeID && 
            it->req.function == op.req.function && 
            it->req.startAddr == op.req.startAddr) {
            // Move to front
            PendingModbusOp priorityOp = *it;
            _pendingOps.erase(it);
            _pendingOps.insert(_pendingOps.begin(), priorityOp);
            break;
        }
    }
}

void ModBeeOperations::optimizeOperations() {
    if (_pendingOps.empty()) {
        return;
    }
    
    // Group operations by destination node
    std::map<uint8_t, std::vector<PendingModbusOp*>> nodeGroups;
    
    for (auto& op : _pendingOps) {
        nodeGroups[op.destNodeID].push_back(&op);
    }
    
    // Optimize each node's operations
    for (auto& nodeGroup : nodeGroups) {
        // Sort by address for potential combining
        auto& ops = nodeGroup.second;
        std::sort(ops.begin(), ops.end(), 
            [](const PendingModbusOp* a, const PendingModbusOp* b) {
                if (a->req.function != b->req.function) {
                    return a->req.function < b->req.function;
                }
                return a->req.startAddr < b->req.startAddr;
            });
        
        // TODO: Implement operation combining logic
    }
    
    // Remove combined operations (marked with nodeID = 0)
    _pendingOps.erase(
        std::remove_if(_pendingOps.begin(), _pendingOps.end(),
            [](const PendingModbusOp& op) { return op.destNodeID == 0; }),
        _pendingOps.end());
}

void ModBeeOperations::retryFailedOperations() {
    unsigned long now = millis();
    
    // Reset timestamp for operations that should be retried
    for (auto& op : _pendingOps) {
        if (op.retryCount > 0 && (now - op.timestamp) > (ModBeeAPI::MODBEE_RETRY_DELAY_MS + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES) {
            op.timestamp = now;
        }
    }
}

// =============================================================================
// STATISTICS AND MONITORING
// =============================================================================
void ModBeeOperations::getStatistics(OperationStats& stats) const {
    stats.pendingOperations = _pendingOps.size();
    stats.pendingResponses = _pendingResponses.size();
    stats.pendingReads = 0;  // Always 0 since we removed pending reads
    
    // Count operations by type
    stats.readOperations = 0;
    stats.writeOperations = 0;
    
    for (const auto& op : _pendingOps) {
        if (ModbusFrame::isReadFunction(op.req.function)) {
            stats.readOperations++;
        } else if (ModbusFrame::isWriteFunction(op.req.function)) {
            stats.writeOperations++;
        }
    }
    
    // Count retry operations
    stats.retryOperations = 0;
    for (const auto& op : _pendingOps) {
        if (op.retryCount > 0) {
            stats.retryOperations++;
        }
    }
}

void ModBeeOperations::debugPrintOperations(ModBeeProtocol& protocol) const {
    #ifdef DEBUG_MODBEE_OPERATIONS
    // Debug implementation would go here
    #endif
}

// =============================================================================
// CAPACITY MANAGEMENT
// =============================================================================
void ModBeeOperations::reserveCapacity(uint16_t opCount, uint16_t responseCount) {
    // Reserve capacity to avoid frequent reallocations
    if (opCount > 0) {
        _pendingOps.reserve(opCount);
    }
    
    if (responseCount > 0) {
        _pendingResponses.reserve(responseCount);
    }
}

bool ModBeeOperations::canAddOperation() const {
    return _pendingOps.size() < MODBEE_MAX_PENDING_OPS;
}

bool ModBeeOperations::canAddResponse() const {
    return _pendingResponses.size() < MODBEE_MAX_PENDING_RESPONSES;
}

uint16_t ModBeeOperations::getAvailableOpSlots() const {
    return MODBEE_MAX_PENDING_OPS - _pendingOps.size();
}

uint16_t ModBeeOperations::getAvailableResponseSlots() const {
    return MODBEE_MAX_PENDING_RESPONSES - _pendingResponses.size();
}

// =============================================================================
// OPERATION PROCESSING
// =============================================================================
void ModBeeOperations::processPendingOperations(ModBeeProtocol& protocol) {
    // This method is called to check if any operations need processing
    // The actual sending is done when the protocol has the token
    
    // Check for operations that need retry
    unsigned long now = millis();
    int readyOps = 0;
    
    for (auto& op : _pendingOps) {
        if (isOperationReady(op)) {
            readyOps++;
        }
    }
    
    if (readyOps > 0) {
        // Operations are ready for processing
    }
}

void ModBeeOperations::clearPendingOps() {
    clearPendingOperations();
}

void ModBeeOperations::removePendingOperation(const PendingModbusOp& op) {
    for (auto it = _pendingOps.begin(); it != _pendingOps.end(); ++it) {
        if (it->destNodeID == op.destNodeID && 
            it->req.function == op.req.function && 
            it->req.startAddr == op.req.startAddr &&
            it->req.quantity == op.req.quantity) {
            _pendingOps.erase(it);
            MBEE_DEBUG_OPERATIONS("REMOVED: Op Node:%d FC:%02X Addr:%d", 
                op.destNodeID, op.req.function, op.req.startAddr);
            break;
        }
    }
}

void ModBeeOperations::removePendingResponse(const ModbusRequest& response) {
    for (auto it = _pendingResponses.begin(); it != _pendingResponses.end(); ++it) {
        if (it->response.function == response.function && 
            it->response.startAddr == response.startAddr) {
            _pendingResponses.erase(it);
            MBEE_DEBUG_OPERATIONS("REMOVED: Response FC:%02X Addr:%d", 
                response.function, response.startAddr);
            break;
        }
    }
}

bool ModBeeOperations::isOperationReady(const PendingModbusOp& op) const {
    unsigned long now = millis();
    
    // Check if operation has completely timed out
    if (op.retryCount >= ModBeeAPI::MODBEE_MAX_RETRIES) {
        return false; // Too many retries
    }
    
    // For first attempt
    if (op.retryCount == 0) {
        return true; // Always ready for first send
    }
    
    // For retries, check if enough time has passed
    unsigned long timeSinceLastAttempt = now - op.timestamp;
    return timeSinceLastAttempt >= (ModBeeAPI::MODBEE_RETRY_DELAY_MS + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES;
}

// =============================================================================
// RESPONSE MATCHING AND FULFILLMENT
// =============================================================================
bool ModBeeOperations::matchAndFulfillResponse(const ModbusRequest& response, uint8_t srcNodeID) {
    // Find matching pending request
    PendingModbusOp* matchingOp = findMatchingRequest(srcNodeID, response);
    
    if (matchingOp) {
        // Write response data directly to user's variable
        writeResponseToVariable(*matchingOp, response);
        
        // Call completion callback if provided
        if (matchingOp->onComplete) {
            matchingOp->onComplete();
        }
        
        // Remove the fulfilled operation
        removePendingOperation(*matchingOp);
        
        MBEE_DEBUG_OPERATIONS("FULFILLED: Direct response for Node:%d FC:%02X Addr:%d", 
            srcNodeID, response.function, response.startAddr);
        return true;
    }
    
    return false;
}

PendingModbusOp* ModBeeOperations::findMatchingRequest(uint8_t srcNodeID, const ModbusRequest& response) {
    uint8_t baseFunction = response.function & 0x7F; // Remove error bit
    
    for (auto& op : _pendingOps) {
        if (op.destNodeID == srcNodeID &&
            op.req.function == baseFunction &&
            op.req.startAddr == response.startAddr &&
            op.req.quantity == response.quantity) {
            return &op;
        }
    }
    
    return nullptr;
}

void ModBeeOperations::writeResponseToVariable(const PendingModbusOp& op, const ModbusRequest& response) {
    if (!op.resultPtr) {
        return; // No variable to write to
    }
    
    uint8_t baseFunction = response.function & 0x7F;
    
    switch (baseFunction) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS: {
            bool* boolPtr = static_cast<bool*>(op.resultPtr);
            if (op.isArray) {
                extractCoilData(response, boolPtr, op.arraySize);
            } else {
                // Single value
                if (response.data.size() >= 2) {
                    uint8_t byteData = response.data[1]; // Skip byte count
                    *boolPtr = (byteData & 0x01) != 0;
                }
            }
            break;
        }
        
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS: {
            int16_t* regPtr = static_cast<int16_t*>(op.resultPtr);
            if (op.isArray) {
                extractRegisterData(response, regPtr, op.arraySize);
            } else {
                // Single value
                if (response.data.size() >= 3) {
                    uint8_t highByte = response.data[1]; // Skip byte count
                    uint8_t lowByte = response.data[2];
                    *regPtr = (int16_t)((highByte << 8) | lowByte);
                }
            }
            break;
        }
    }
}

// =============================================================================
// DATA EXTRACTION UTILITIES
// =============================================================================
bool ModBeeOperations::extractCoilData(const ModbusRequest& response, bool* values, uint16_t maxValues) {
    if (response.data.size() < 1 || !values) {
        return false;
    }
    
    uint8_t byteCount = response.data[0];
    if (response.data.size() < (1 + byteCount)) {
        return false;
    }
    
    uint16_t bitIndex = 0;
    for (uint8_t byteIdx = 0; byteIdx < byteCount && bitIndex < maxValues; byteIdx++) {
        uint8_t byteData = response.data[1 + byteIdx];
        
        for (uint8_t bitPos = 0; bitPos < 8 && bitIndex < maxValues; bitPos++) {
            values[bitIndex] = (byteData & (1 << bitPos)) != 0;
            bitIndex++;
        }
    }
    
    return true;
}

bool ModBeeOperations::extractRegisterData(const ModbusRequest& response, int16_t* values, uint16_t maxValues) {
    if (response.data.size() < 1 || !values) {
        return false;
    }
    
    uint8_t byteCount = response.data[0];
    uint16_t regCount = byteCount / 2;
    
    if (response.data.size() < (1 + byteCount) || regCount > maxValues) {
        return false;
    }
    
    for (uint16_t regIdx = 0; regIdx < regCount; regIdx++) {
        uint8_t highByte = response.data[1 + (regIdx * 2)];
        uint8_t lowByte = response.data[2 + (regIdx * 2)];
        values[regIdx] = (int16_t)((highByte << 8) | lowByte);
    }
    
    return true;
}