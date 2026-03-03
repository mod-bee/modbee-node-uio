#include "ModBeeGlobal.h"

// =============================================================================
// STATIC VARIABLE DEFINITIONS
// =============================================================================
unsigned long ModBeeAPI::MODBEE_INTERFRAME_GAP_US        = 5000;   
unsigned long ModBeeAPI::MODBEE_OPERATION_TIMEOUT_MS     = 250;
unsigned long ModBeeAPI::MODBEE_RESPONSE_TIMEOUT_MS      = 250;
unsigned long ModBeeAPI::MODBEE_READ_TIMEOUT_MS          = 250;
unsigned long ModBeeAPI::MODBEE_RETRY_DELAY_MS           = 100;
unsigned long ModBeeAPI::MODBEE_MAX_RETRIES              = 2;

// PROTOCOL TIMING ONLY
unsigned long ModBeeAPI::INITIAL_LISTEN_PERIOD_MS        = 2000;  // Base initial listen time
unsigned long ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS       = 200;   // Token passing timeout
unsigned long ModBeeAPI::BASE_TIMEOUT                    = 100;  
unsigned long ModBeeAPI::NODE_TIMEOUT_MS                 = 1000;

unsigned long ModBeeAPI::MODBEE_TOKEN_RECLAIM_TIMEOUT    = 500;   // Token reclaim timeout (ms)
unsigned long ModBeeAPI::MODBEE_JOIN_CYCLE_INTERVAL      = 100;   // Join invitation interval (ms)
unsigned long ModBeeAPI::MODBEE_JOIN_RESPONSE_TIMEOUT    = 200;   // Join response wait time (ms)

int ModBeeAPI::MODBEE_MAX_NODES                          = 10;      // Maximum nodes allowed in network
bool ModBeeAPI::enableFailSafe                           = false;


ModBeeAPI::ModBeeAPI() : _protocol(nullptr), _debugHandler(nullptr) {
    // Constructor - protocol will be created in begin()
}

ModBeeAPI::~ModBeeAPI() {
    end();
}

// =============================================================================
// PROTOCOL MANAGEMENT FUNCTIONS
// =============================================================================

bool ModBeeAPI::begin(Stream* serial, uint8_t nodeID) {
    if (_protocol) {
        return false; // Already initialized
    }
    
    if (!serial) {
        return false; // Invalid stream
    }
    
    // Create protocol instance
    _protocol = new ModBeeProtocol();
    if (!_protocol) {
        return false; // Memory allocation failed
    }
    
    // Initialize protocol
    _protocol->begin(nodeID, serial);
    return true;
}

void ModBeeAPI::loop() {
    if (_protocol) {
        _protocol->loop();
    }
}

void ModBeeAPI::end() {
    if (_protocol) {
        delete _protocol;
        _protocol = nullptr;
    }
}

bool ModBeeAPI::isInitialized() {
    return _protocol != nullptr;
}

uint8_t ModBeeAPI::getNodeID() {
    if (_protocol) {
        return _protocol->getNodeID();
    }
    return 0;
}

bool ModBeeAPI::isConnected() {
    if (_protocol) {
        return _protocol->isConnected();
    }
    return false;
}

void ModBeeAPI::connect() {
    if (_protocol) {
        _protocol->nodeConnect();
    }
}

void ModBeeAPI::disconnect() {
    if (_protocol) {
        _protocol->nodeDisconnect();
    }
}

bool ModBeeAPI::isNodeKnown(uint8_t nodeID) {
    if (_protocol) {
        return _protocol->isNodeKnown(nodeID);
    }
    return false;
}

// =============================================================================
// DATA MAP MANAGEMENT FUNCTIONS
// =============================================================================

void ModBeeAPI::addCoil(uint16_t address, bool* variable) {
    if (!_protocol) return;
    _protocol->getDataMap().addCoil(address, variable);
}

void ModBeeAPI::addHreg(uint16_t address, int16_t* variable) {
    if (!_protocol) return;
    _protocol->getDataMap().addHreg(address, variable);
}

void ModBeeAPI::addIsts(uint16_t address, bool* variable) {
    if (!_protocol) return;
    _protocol->getDataMap().addIsts(address, variable);
}

void ModBeeAPI::addIreg(uint16_t address, int16_t* variable) {
    if (!_protocol) return;
    _protocol->getDataMap().addIreg(address, variable);
}

bool ModBeeAPI::setCoil(uint16_t address, bool value) {
    if (_protocol) {
        return _protocol->getDataMap().setCoil(address, value);
    }
    return false;
}

bool ModBeeAPI::setHreg(uint16_t address, int16_t value) {
    if (_protocol) {
        return _protocol->getDataMap().setHreg(address, value);
    }
    return false;
}

bool ModBeeAPI::setIsts(uint16_t address, bool value) {
    if (_protocol) {
        return _protocol->getDataMap().setIsts(address, value);
    }
    return false;
}

bool ModBeeAPI::setIreg(uint16_t address, int16_t value) {
    if (_protocol) {
        return _protocol->getDataMap().setIreg(address, value);
    }
    return false;
}

bool ModBeeAPI::getCoil(uint16_t address, bool& value) {
    if (_protocol && _protocol->getDataMap().hasCoil(address)) {
        value = _protocol->getDataMap().getCoil(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::getHreg(uint16_t address, int16_t& value) {
    if (_protocol && _protocol->getDataMap().hasHreg(address)) {
        value = _protocol->getDataMap().getHreg(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::getIsts(uint16_t address, bool& value) {
    if (_protocol && _protocol->getDataMap().hasIsts(address)) {
        value = _protocol->getDataMap().getIsts(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::getIreg(uint16_t address, int16_t& value) {
    if (_protocol && _protocol->getDataMap().hasIreg(address)) {
        value = _protocol->getDataMap().getIreg(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::removeCoil(uint16_t address) {
    if (_protocol) {
        _protocol->getDataMap().removeCoil(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::removeHreg(uint16_t address) {
    if (_protocol) {
        _protocol->getDataMap().removeHreg(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::removeIsts(uint16_t address) {
    if (_protocol) {
        _protocol->getDataMap().removeIsts(address);
        return true;
    }
    return false;
}

bool ModBeeAPI::removeIreg(uint16_t address) {
    if (_protocol) {
        _protocol->getDataMap().removeIreg(address);
        return true;
    }
    return false;
}

// =============================================================================
// SINGLE VALUE FUNCTIONS
// =============================================================================

uint32_t ModBeeAPI::readHreg(uint8_t nodeID, uint16_t offset, int16_t& value, uint8_t fc, ModBeeCompletionCallback callback) {
    return readHreg_impl(nodeID, offset, &value, 1, fc, callback);
}

uint32_t ModBeeAPI::readCoil(uint8_t nodeID, uint16_t offset, bool& value, uint8_t fc, ModBeeCompletionCallback callback) {
    return readCoil_impl(nodeID, offset, &value, 1, fc, callback);
}

uint32_t ModBeeAPI::readIreg(uint8_t nodeID, uint16_t offset, int16_t& value, uint8_t fc, ModBeeCompletionCallback callback) {
    return readIreg_impl(nodeID, offset, &value, 1, fc, callback);
}

uint32_t ModBeeAPI::readIsts(uint8_t nodeID, uint16_t offset, bool& value, uint8_t fc, ModBeeCompletionCallback callback) {
    return readIsts_impl(nodeID, offset, &value, 1, fc, callback);
}

uint32_t ModBeeAPI::writeHreg(uint8_t nodeID, uint16_t offset, int16_t value, uint8_t fc, ModBeeCompletionCallback callback) {
    return writeHreg_impl(nodeID, offset, &value, 1, fc, callback);
}

uint32_t ModBeeAPI::writeCoil(uint8_t nodeID, uint16_t offset, bool value, uint8_t fc, ModBeeCompletionCallback callback) {
    return writeCoil_impl(nodeID, offset, &value, 1, fc, callback);
}

// =============================================================================
// MANUAL FUNCTIONS - For dynamic arrays
// =============================================================================

uint32_t ModBeeAPI::readHregManual(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numregs, uint8_t fc, ModBeeCompletionCallback callback) {
    return readHreg_impl(nodeID, offset, values, numregs, fc, callback);
}

uint32_t ModBeeAPI::readCoilManual(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numcoils, uint8_t fc, ModBeeCompletionCallback callback) {
    return readCoil_impl(nodeID, offset, values, numcoils, fc, callback);
}

uint32_t ModBeeAPI::readIregManual(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numiregs, uint8_t fc, ModBeeCompletionCallback callback) {
    return readIreg_impl(nodeID, offset, values, numiregs, fc, callback);
}

uint32_t ModBeeAPI::readIstsManual(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numists, uint8_t fc, ModBeeCompletionCallback callback) {
    return readIsts_impl(nodeID, offset, values, numists, fc, callback);
}

uint32_t ModBeeAPI::writeHregManual(uint8_t nodeID, uint16_t offset, const int16_t* values, uint16_t numregs, uint8_t fc, ModBeeCompletionCallback callback) {
    return writeHreg_impl(nodeID, offset, values, numregs, fc, callback);
}

uint32_t ModBeeAPI::writeCoilManual(uint8_t nodeID, uint16_t offset, const bool* values, uint16_t numcoils, uint8_t fc, ModBeeCompletionCallback callback) {
    return writeCoil_impl(nodeID, offset, values, numcoils, fc, callback);
}

// =============================================================================
// IMPLEMENTATION METHODS - Called by templates and manual functions
// =============================================================================

uint32_t ModBeeAPI::readHreg_impl(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numregs, uint8_t fc, ModBeeCompletionCallback callback) {
    if (!_protocol || !values) return 0;
    
    // Check if target node exists
    if (!isNodeKnown(nodeID)) {
        return 0;
    }
    
    if (nodeID == _protocol->getNodeID()) {
        // Local read - immediate completion
        for (uint16_t i = 0; i < numregs; i++) {
            if (_protocol->getDataMap().hasHreg(offset + i)) {
                values[i] = _protocol->getDataMap().getHreg(offset + i);
            } else {
                return 0; // Missing register
            }
        }
        // For local operations, call callback immediately if provided
        if (callback) callback(0); // Use 0 for local operations
        return 0; // Local operations don't get operation IDs
    }
    
    // Remote read - direct response approach
    uint8_t functionCode = (fc != 0) ? fc : MB_FC_READ_HOLDING_REGISTERS;
    
    // Check for duplicates
    auto& pendingOps = _protocol->getOperations().getPendingOps();
    for (const auto& op : pendingOps) {
        if (op.destNodeID == nodeID && op.req.function == functionCode &&
            op.req.startAddr == offset && op.req.quantity == numregs) {
            return 0; // Already pending
        }
    }
    
    // Create operation with direct response pointer
    ModbusRequest req;
    req.function = functionCode;
    req.startAddr = offset;
    req.quantity = numregs;
    req.isResponse = false;
    
    PendingModbusOp op;
    op.destNodeID = nodeID;
    op.sourceNodeID = _protocol->getNodeID();
    op.req = req;
    op.timestamp = millis();
    op.retryCount = 0;
    op.resultPtr = values;
    op.isArray = (numregs > 1);
    op.arraySize = numregs;
    op.onComplete = callback;
    
    const uint32_t operationId = _protocol->getOperations().addPendingOperation(op, *_protocol);
    if (operationId == 0) {
        return 0;
    }
    
    MBEE_DEBUG_IO("ADDED: Direct response array operation ID:%u - Node:%d FC:%02X Addr:%d Qty:%d", 
        operationId, nodeID, functionCode, offset, numregs);
    return operationId; // Return the operation ID
}

uint32_t ModBeeAPI::readCoil_impl(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numcoils, uint8_t fc, ModBeeCompletionCallback callback) {
    if (!_protocol || !values) return 0;
    
    // Check if target node exists
    if (!isNodeKnown(nodeID)) {
        return 0;
    }
    
    if (nodeID == _protocol->getNodeID()) {
        // Local read - immediate completion
        for (uint16_t i = 0; i < numcoils; i++) {
            if (_protocol->getDataMap().hasCoil(offset + i)) {
                values[i] = _protocol->getDataMap().getCoil(offset + i);
            } else {
                return 0; // Missing coil
            }
        }
        // For local operations, call callback immediately if provided
        if (callback) callback(0); // Use 0 for local operations
        return 0; // Local operations don't get operation IDs
    }
    
    // Remote read - direct response approach
    uint8_t functionCode = (fc != 0) ? fc : MB_FC_READ_COILS;
    
    // Check for duplicates
    auto& pendingOps = _protocol->getOperations().getPendingOps();
    for (const auto& op : pendingOps) {
        if (op.destNodeID == nodeID && op.req.function == functionCode &&
            op.req.startAddr == offset && op.req.quantity == numcoils) {
            return 0; // Already pending
        }
    }
    
    // Create operation with direct response pointer
    ModbusRequest req;
    req.function = functionCode;
    req.startAddr = offset;
    req.quantity = numcoils;
    req.isResponse = false;
    
    PendingModbusOp op;
    op.destNodeID = nodeID;
    op.sourceNodeID = _protocol->getNodeID();
    op.req = req;
    op.timestamp = millis();
    op.retryCount = 0;
    op.resultPtr = values;
    op.isArray = (numcoils > 1);
    op.arraySize = numcoils;
    op.onComplete = callback;
    
    const uint32_t operationId = _protocol->getOperations().addPendingOperation(op, *_protocol);
    if (operationId == 0) {
        return 0;
    }
    
    MBEE_DEBUG_IO("ADDED: Direct response array operation ID:%u - Node:%d FC:%02X Addr:%d Qty:%d", 
        operationId, nodeID, functionCode, offset, numcoils);
    return operationId; // Return the operation ID
}

uint32_t ModBeeAPI::readIreg_impl(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numiregs, uint8_t fc, ModBeeCompletionCallback callback) {
    if (!_protocol || !values) return 0;
    
    // Check if target node exists
    if (!isNodeKnown(nodeID)) {
        return 0;
    }
    
    if (nodeID == _protocol->getNodeID()) {
        // Local read - immediate completion
        for (uint16_t i = 0; i < numiregs; i++) {
            if (_protocol->getDataMap().hasIreg(offset + i)) {
                values[i] = _protocol->getDataMap().getIreg(offset + i);
            } else {
                return 0; // Missing register
            }
        }
        // For local operations, call callback immediately if provided
        if (callback) callback(0); // Use 0 for local operations
        return 0; // Local operations don't get operation IDs
    }
    
    // Remote read - direct response approach
    uint8_t functionCode = (fc != 0) ? fc : MB_FC_READ_INPUT_REGISTERS;
    
    // Check for duplicates
    auto& pendingOps = _protocol->getOperations().getPendingOps();
    for (const auto& op : pendingOps) {
        if (op.destNodeID == nodeID && op.req.function == functionCode &&
            op.req.startAddr == offset && op.req.quantity == numiregs) {
            return 0; // Already pending
        }
    }
    
    // Create operation with direct response pointer
    ModbusRequest req;
    req.function = functionCode;
    req.startAddr = offset;
    req.quantity = numiregs;
    req.isResponse = false;
    
    PendingModbusOp op;
    op.destNodeID = nodeID;
    op.sourceNodeID = _protocol->getNodeID();
    op.req = req;
    op.timestamp = millis();
    op.retryCount = 0;
    op.resultPtr = values;
    op.isArray = (numiregs > 1);
    op.arraySize = numiregs;
    op.onComplete = callback;
    
    const uint32_t operationId = _protocol->getOperations().addPendingOperation(op, *_protocol);
    if (operationId == 0) {
        return 0;
    }
    
    MBEE_DEBUG_IO("ADDED: Direct response array operation ID:%u - Node:%d FC:%02X Addr:%d Qty:%d", 
        operationId, nodeID, functionCode, offset, numiregs);
    return operationId; // Return the operation ID
}

uint32_t ModBeeAPI::readIsts_impl(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numists, uint8_t fc, ModBeeCompletionCallback callback) {
    if (!_protocol || !values) return 0;
    
    // Check if target node exists
    if (!isNodeKnown(nodeID)) {
        return 0;
    }
    
    if (nodeID == _protocol->getNodeID()) {
        // Local read - immediate completion
        for (uint16_t i = 0; i < numists; i++) {
            if (_protocol->getDataMap().hasIsts(offset + i)) {
                values[i] = _protocol->getDataMap().getIsts(offset + i);
            } else {
                return 0; // Missing input
            }
        }
        // For local operations, call callback immediately if provided
        if (callback) callback(0); // Use 0 for local operations
        return 0; // Local operations don't get operation IDs
    }
    
    // Remote read - direct response approach
    uint8_t functionCode = (fc != 0) ? fc : MB_FC_READ_DISCRETE_INPUTS;
    
    // Check for duplicates
    auto& pendingOps = _protocol->getOperations().getPendingOps();
    for (const auto& op : pendingOps) {
        if (op.destNodeID == nodeID && op.req.function == functionCode &&
            op.req.startAddr == offset && op.req.quantity == numists) {
            return 0; // Already pending
        }
    }
    
    // Create operation with direct response pointer
    ModbusRequest req;
    req.function = functionCode;
    req.startAddr = offset;
    req.quantity = numists;
    req.isResponse = false;
    
    PendingModbusOp op;
    op.destNodeID = nodeID;
    op.sourceNodeID = _protocol->getNodeID();
    op.req = req;
    op.timestamp = millis();
    op.retryCount = 0;
    op.resultPtr = values;
    op.isArray = (numists > 1);
    op.arraySize = numists;
    op.onComplete = callback;
    
    const uint32_t operationId = _protocol->getOperations().addPendingOperation(op, *_protocol);
    if (operationId == 0) {
        return 0;
    }
    
    MBEE_DEBUG_IO("ADDED: Direct response array operation ID:%u - Node:%d FC:%02X Addr:%d Qty:%d", 
        operationId, nodeID, functionCode, offset, numists);
    return operationId; // Return the operation ID
}

uint32_t ModBeeAPI::writeHreg_impl(uint8_t nodeID, uint16_t offset, const int16_t* values, uint16_t numregs, uint8_t fc, ModBeeCompletionCallback callback) {
    if (!_protocol || !values) return 0;
    
    // Check if target node exists
    if (!isNodeKnown(nodeID)) {
        return 0;
    }
    
    if (nodeID == _protocol->getNodeID()) {
        // Local write - immediate completion
        for (uint16_t i = 0; i < numregs; i++) {
            if (!_protocol->getDataMap().setHreg(offset + i, values[i])) {
                return 0; // Write failed
            }
        }
        // For local operations, call callback immediately if provided
        if (callback) callback(0); // Use 0 for local operations
        return 0; // Local operations don't get operation IDs
    }
    
    // Determine function code based on quantity
    uint8_t functionCode;
    if (numregs == 1) {
        functionCode = (fc != 0) ? fc : MB_FC_WRITE_SINGLE_REGISTER;
    } else {
        functionCode = (fc != 0) ? fc : MB_FC_WRITE_MULTIPLE_REGISTERS;
    }
    
    ModbusRequest req;
    req.function = functionCode;
    req.startAddr = offset;
    req.quantity = numregs;
    req.isResponse = false;
    // DON'T pack data now - will be read from pointer at send time!
    
    PendingModbusOp op;
    op.destNodeID = nodeID;
    op.sourceNodeID = _protocol->getNodeID();
    op.req = req;
    op.timestamp = millis();
    op.retryCount = 0;
    
    // Store pointer to user's data for real-time access
    op.resultPtr = (void*)values;  // Store pointer to user's write data
    op.isArray = (numregs > 1);
    op.arraySize = numregs;
    op.onComplete = callback;
    
    const uint32_t operationId = _protocol->getOperations().addPendingOperation(op, *_protocol);
    return operationId; // Return the operation ID
}

uint32_t ModBeeAPI::writeCoil_impl(uint8_t nodeID, uint16_t offset, const bool* values, uint16_t numcoils, uint8_t fc, ModBeeCompletionCallback callback) {
    if (!_protocol || !values) return 0;
    
    // Check if target node exists
    if (!isNodeKnown(nodeID)) {
        return 0;
    }
    
    if (nodeID == _protocol->getNodeID()) {
        // Local write - immediate completion
        for (uint16_t i = 0; i < numcoils; i++) {
            if (!_protocol->getDataMap().setCoil(offset + i, values[i])) {
                return 0; // Write failed
            }
        }
        // For local operations, call callback immediately if provided
        if (callback) callback(0); // Use 0 for local operations
        return 0; // Local operations don't get operation IDs
    }
    
    // Determine function code based on quantity
    uint8_t functionCode;
    if (numcoils == 1) {
        functionCode = (fc != 0) ? fc : MB_FC_WRITE_SINGLE_COIL;
    } else {
        functionCode = (fc != 0) ? fc : MB_FC_WRITE_MULTIPLE_COILS;
    }
    
    ModbusRequest req;
    req.function = functionCode;
    req.startAddr = offset;
    req.quantity = numcoils;
    req.isResponse = false;
    // DON'T pack data now - will be read from pointer at send time!
    
    PendingModbusOp op;
    op.destNodeID = nodeID;
    op.sourceNodeID = _protocol->getNodeID();
    op.req = req;
    op.timestamp = millis();
    op.retryCount = 0;
    
    // Store pointer to user's data for real-time access
    op.resultPtr = (void*)values;  // Store pointer to user's write data
    op.isArray = (numcoils > 1);
    op.arraySize = numcoils;
    op.onComplete = callback;
    
    const uint32_t operationId = _protocol->getOperations().addPendingOperation(op, *_protocol);
    return operationId; // Return the operation ID
}

// =============================================================================
// UTILITY FUNCTIONS
// =============================================================================

uint16_t ModBeeAPI::getPendingOpCount() {
    if (_protocol) {
        return _protocol->getOperations().getPendingOpCount();
    }
    return 0;
}

void ModBeeAPI::clearPendingOps() {
    if (_protocol) {
        _protocol->getOperations().clearPendingOps();
    }
}

void ModBeeAPI::getStatistics(uint16_t& pendingOps, uint16_t& completedOps) {
    if (_protocol) {
        pendingOps = _protocol->getOperations().getPendingOpCount();
        completedOps = 0; // This would need to be tracked separately if needed
    } else {
        pendingOps = 0;
        completedOps = 0;
    }
}

// =============================================================================
// CALLBACK REGISTRATION FUNCTIONS
// =============================================================================

void ModBeeAPI::onError(void (*errorHandler)(ModBeeError error, const char* message)) {
    if (_protocol) {
        _protocol->onError(errorHandler);
    }
}

void ModBeeAPI::onDebug(void (*debugHandler)(const char* category, const char* message)) {
    _debugHandler = debugHandler;
    
#ifdef DISABLE_MODBEE_DEBUG
    // DEBUG DISABLED: Function exists but does nothing
    // No error - just silently ignore the debug handler
    
#else
    // DEBUG ENABLED: Set up the debug bridge
    
    // Static storage for debug callback bridge
    static void (*g_currentDebugHandler)(const char* category, const char* message) = nullptr;
    g_currentDebugHandler = debugHandler;
    
    // Bridge function to convert debug callback format
    static auto debugBridge = [](ModBeeDebugLevel level, ModBeeDebugCategory category, const char* message) {
        if (g_currentDebugHandler) {
            const char* categoryStr = "UNKNOWN";
            switch (category) {
                case MBEE_DEBUG_PROTOCOL: categoryStr = "PROTOCOL"; break;
                case MBEE_DEBUG_FRAMES: categoryStr = "FRAMES"; break;
                case MBEE_DEBUG_MODBUS: categoryStr = "MODBUS"; break;
                case MBEE_DEBUG_OPERATIONS: categoryStr = "OPERATIONS"; break;
                case MBEE_DEBUG_IO: categoryStr = "IO"; break;
                default: categoryStr = "DEBUG"; break;
            }
            g_currentDebugHandler(categoryStr, message);
        }
    };
    
    if (debugHandler) {
        g_modbeeDebug.onDebug(debugBridge);
    } else {
        g_modbeeDebug.onDebug(nullptr);
    }
    
#endif
}
