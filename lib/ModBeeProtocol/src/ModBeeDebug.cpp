#include "ModBeeGlobal.h"

#ifdef DISABLE_MODBEE_DEBUG
    // =============================================================================
    // DEBUG DISABLED - MINIMAL IMPLEMENTATION
    // =============================================================================
    
    // Just the global instance
    ModBeeDebug g_modbeeDebug;
    
#else
    // =============================================================================
    // DEBUG ENABLED - FULL IMPLEMENTATION
    // =============================================================================
    
    // Global debug instance
    ModBeeDebug g_modbeeDebug;
    bool ModBeeDebug::_globalDebugEnabled = true;

    // =============================================================================
    // CONSTRUCTOR AND DESTRUCTOR
    // =============================================================================
    
    ModBeeDebug::ModBeeDebug() :
        _debugLevel(MBEE_DEBUG_INFO),
        _debugCategories(0xFF), // All categories enabled by default
        _debugHandler(nullptr),
        _frameDebugHandler(nullptr),
        _modbusDebugHandler(nullptr),
        _framesSent(0),
        _framesReceived(0),
        _modbusRequestsSent(0),
        _modbusResponsesReceived(0),
        _errors(0)
    {
    }

    ModBeeDebug::~ModBeeDebug() {
    }

    // =============================================================================
    // DEBUG CONFIGURATION METHODS
    // =============================================================================
    
    void ModBeeDebug::setDebugLevel(ModBeeDebugLevel level) {
        _debugLevel = level;
    }

    void ModBeeDebug::setDebugCategories(uint8_t categories) {
        _debugCategories = categories;
    }

    void ModBeeDebug::enableCategory(ModBeeDebugCategory category) {
        _debugCategories |= category;
    }

    void ModBeeDebug::disableCategory(ModBeeDebugCategory category) {
        _debugCategories &= ~category;
    }

    // =============================================================================
    // DEBUG HANDLER REGISTRATION
    // =============================================================================
    
    void ModBeeDebug::onDebug(ModBeeDebugHandler handler) {
        _debugHandler = handler;
    }

    void ModBeeDebug::onFrameDebug(ModBeeFrameDebugHandler handler) {
        _frameDebugHandler = handler;
    }

    void ModBeeDebug::onModbusDebug(ModBeeModbusDebugHandler handler) {
        _modbusDebugHandler = handler;
    }

    // =============================================================================
    // CORE DEBUG OUTPUT METHODS
    // =============================================================================
    
    void ModBeeDebug::debug(ModBeeDebugLevel level, ModBeeDebugCategory category, const char* format, ...) {
        if (!shouldDebug(level, category) || !_debugHandler) {
            return;
        }
        
        char buffer[512];
        va_list args;
        va_start(args, format);
        vsnprintf(buffer, sizeof(buffer), format, args);
        va_end(args);
        
        _debugHandler(level, category, buffer);
    }

    void ModBeeDebug::debugFrame(ModBeeFrameDirection direction, const uint8_t* frame, uint16_t length) {
        if (!shouldDebug(MBEE_DEBUG_INFO, MBEE_DEBUG_FRAMES) || !_frameDebugHandler) {
            return;
        }
        
        // Update statistics
        if (direction == MBEE_FRAME_TX) {
            _framesSent++;
        } else {
            _framesReceived++;
        }
        
        char hexOutput[1024];
        char* p = hexOutput;
        size_t remaining = sizeof(hexOutput) - 1;
        
        const char* dirStr = (direction == MBEE_FRAME_TX) ? "TX" : "RX";
        int written = snprintf(p, remaining, "[ModBee Debug FRAMES] %s: ", dirStr);
        if (written > 0 && (size_t)written < remaining) {
            p += written;
            remaining -= written;
        }
        
        // Add hex data
        for (uint16_t i = 0; i < length && remaining > 3; i++) {
            written = snprintf(p, remaining, "%02X ", frame[i]);
            if (written > 0 && (size_t)written < remaining) {
                p += written;
                remaining -= written;
            }
        }
        
        written = snprintf(p, remaining, "(%d bytes)", length);
        *p = '\0';
        
        // Output via debug handler
        debug(MBEE_DEBUG_INFO, MBEE_DEBUG_FRAMES, "%s", hexOutput);
        
        // Analyze frame
        char analysis[1024];
        analyzeFrame(frame, length, analysis, sizeof(analysis));
        
        if (_frameDebugHandler) {
            _frameDebugHandler(direction, frame, length, analysis);
        }
    }

    void ModBeeDebug::debugModbus(ModBeeModbusType type, uint8_t nodeID, const ModbusRequest& request) {
        if (!shouldDebug(MBEE_DEBUG_INFO, MBEE_DEBUG_MODBUS) || !_modbusDebugHandler) {
            return;
        }
        
        // Update statistics
        if (type == MBEE_MODBUS_REQUEST) {
            _modbusRequestsSent++;
        } else {
            _modbusResponsesReceived++;
        }
        
        // Analyze Modbus request
        char analysis[512];
        analyzeModbusRequest(request, analysis, sizeof(analysis));
        
        _modbusDebugHandler(type, nodeID, request, analysis);
    }

    // =============================================================================
    // FRAME AND MODBUS ANALYSIS METHODS
    // =============================================================================
    
    void ModBeeDebug::analyzeFrame(const uint8_t* frame, uint16_t length, char* output, size_t outputSize) {
        if (!frame || length == 0 || !output || outputSize == 0) {
            return;
        }
        
        char* p = output;
        size_t remaining = outputSize - 1; // Reserve space for null terminator
        
        // Frame type and basic info
        const char* frameType = getFrameTypeString(frame, length);
        int written = snprintf(p, remaining, "Type: %s, Length: %d\n", frameType, length);
        if (written < 0 || (size_t)written >= remaining) return;
        p += written;
        remaining -= written;
        
        // Hex dump
        written = snprintf(p, remaining, "Raw: ");
        if (written < 0 || (size_t)written >= remaining) return;
        p += written;
        remaining -= written;
        
        formatHexDump(frame, length, p, remaining);
        size_t hexLen = strlen(p);
        p += hexLen;
        remaining -= hexLen;
        
        written = snprintf(p, remaining, "\n");
        if (written < 0 || (size_t)written >= remaining) return;
        p += written;
        remaining -= written;
        
        // Decode header
        decodeFrameHeader(frame, length, p, remaining);
        size_t headerLen = strlen(p);
        p += headerLen;
        remaining -= headerLen;
        
        // Decode Modbus sections if present
        if (ModBeeFrame::hasModbusData(frame, length)) {
            decodeModbusSections(frame, length, p, remaining);
        }
        
        *p = '\0'; // Ensure null termination
    }

    void ModBeeDebug::analyzeModbusRequest(const ModbusRequest& request, char* output, size_t outputSize) {
        if (!output || outputSize == 0) {
            return;
        }
        
        const char* functionName = getModbusFunctionString(request.function);
        const char* type = request.isResponse ? "RESP" : "REQ";
        
        snprintf(output, outputSize, 
            "%s | FC:%02X (%s) | Addr:%d | Qty:%d | DataLen:%d",
            type, request.function, functionName, 
            request.startAddr, request.quantity, (int)request.data.size());
    }

    void ModBeeDebug::debugProtocolState(const ModBeeProtocol& protocol) {
        if (!shouldDebug(MBEE_DEBUG_INFO, MBEE_DEBUG_PROTOCOL)) {
            return;
        }
        
        const char* stateName = getProtocolStateString(protocol.getState());
        debug(MBEE_DEBUG_INFO, MBEE_DEBUG_PROTOCOL, 
            "Protocol State: %s (Node %d)", stateName, protocol.getNodeID());
    }

    void ModBeeDebug::debugOperationsQueue(const ModBeeOperations& operations) {
        if (!shouldDebug(MBEE_DEBUG_INFO, MBEE_DEBUG_OPERATIONS)) {
            return;
        }
        
        debug(MBEE_DEBUG_INFO, MBEE_DEBUG_OPERATIONS,
            "Operations Queue: Pending:%d, Responses:%d",
            operations.getPendingOpCount(),
            operations.getPendingResponseCount());
    }

    // =============================================================================
    // PRIVATE HELPER METHODS
    // =============================================================================
    
    bool ModBeeDebug::shouldDebug(ModBeeDebugLevel level, ModBeeDebugCategory category) const {
        return _globalDebugEnabled && 
               level <= _debugLevel && 
               (_debugCategories & category) != 0;
    }

    void ModBeeDebug::formatHexDump(const uint8_t* data, uint16_t length, char* output, size_t outputSize) {
        if (!data || length == 0 || !output || outputSize == 0) {
            return;
        }
        
        char* p = output;
        size_t remaining = outputSize - 1;
        
        for (uint16_t i = 0; i < length && remaining > 3; i++) {
            int written = snprintf(p, remaining, "%02X ", data[i]);
            if (written < 0 || (size_t)written >= remaining) break;
            p += written;
            remaining -= written;
        }
        
        *p = '\0';
    }

    void ModBeeDebug::decodeFrameHeader(const uint8_t* frame, uint16_t length, char* output, size_t outputSize) {
        if (!frame || length < MODBEE_MIN_FRAME_LEN || !output || outputSize == 0) {
            return;
        }
        
        uint8_t srcNodeID, nextMasterID, addNodeID, removeNodeID;
        if (ModBeeFrame::parseHeader(frame, length, srcNodeID, nextMasterID, addNodeID, removeNodeID)) {
            snprintf(output, outputSize,
                "Header: SRC:%d, NextMaster:%d, Add:%d, Remove:%d\n",
                srcNodeID, nextMasterID, addNodeID, removeNodeID);
        } else {
            snprintf(output, outputSize, "Header: INVALID\n");
        }
    }

    void ModBeeDebug::decodeModbusSections(const uint8_t* frame, uint16_t length, char* output, size_t outputSize) {
        if (!frame || length == 0 || !output || outputSize == 0) {
            return;
        }
        
        std::vector<std::pair<uint16_t, uint16_t>> sections;
        int sectionCount = ModBeeFrame::findModbusSections(frame, length, sections);
        
        char* p = output;
        size_t remaining = outputSize - 1;
        
        int written = snprintf(p, remaining, "Modbus Sections: %d\n", sectionCount);
        if (written < 0 || (size_t)written >= remaining) return;
        p += written;
        remaining -= written;
        
        for (int i = 0; i < sectionCount; i++) {
            uint16_t start = sections[i].first;
            uint16_t end = sections[i].second;
            
            if (start < length) {
                uint8_t targetNodeID = frame[start];
                written = snprintf(p, remaining, "  Section %d: Target:%d, Bytes:%d\n", 
                    i, targetNodeID, end - start - 1);
                if (written < 0 || (size_t)written >= remaining) break;
                p += written;
                remaining -= written;
            }
        }
        
        *p = '\0';
    }

    // =============================================================================
    // STRING CONVERSION UTILITY METHODS
    // =============================================================================
    
    const char* ModBeeDebug::getFrameTypeString(const uint8_t* frame, uint16_t length) {
        if (!frame || length < MODBEE_MIN_FRAME_LEN) {
            return "INVALID";
        }
        
        if (ModBeeFrame::isTokenFrame(frame, length)) {
            return "TOKEN";
        } else if (ModBeeFrame::isPresenceFrame(frame, length)) {
            return "PRESENCE";
        } else if (ModBeeFrame::isConnectionFrame(frame, length)) {
            return "CONNECTION";
        } else if (ModBeeFrame::isDisconnectionFrame(frame, length)) {
            return "DISCONNECTION";
        } else if (ModBeeFrame::isDataFrame(frame, length)) {
            return "DATA";
        } else {
            return "CONTROL";
        }
    }

    const char* ModBeeDebug::getModbusFunctionString(uint8_t functionCode) {
        switch (functionCode & 0x7F) {
            case MB_FC_READ_COILS: return "READ_COILS";
            case MB_FC_READ_DISCRETE_INPUTS: return "READ_DISCRETE_INPUTS";
            case MB_FC_READ_HOLDING_REGISTERS: return "READ_HOLDING_REGISTERS";
            case MB_FC_READ_INPUT_REGISTERS: return "READ_INPUT_REGISTERS";
            case MB_FC_WRITE_SINGLE_COIL: return "WRITE_SINGLE_COIL";
            case MB_FC_WRITE_SINGLE_REGISTER: return "WRITE_SINGLE_REGISTER";
            case MB_FC_WRITE_MULTIPLE_COILS: return "WRITE_MULTIPLE_COILS";
            case MB_FC_WRITE_MULTIPLE_REGISTERS: return "WRITE_MULTIPLE_REGISTERS";
            default: return "UNKNOWN";
        }
    }

    const char* ModBeeDebug::getProtocolStateString(ModBeeProtocolState state) {
        switch (state) {
            case MBEE_INITIAL_LISTEN: return "INITIAL_LISTEN";
            case MBEE_COORDINATOR_BUILDING: return "COORDINATOR_BUILDING";
            case MBEE_WAITING_FOR_JOIN_INVITATION: return "WAITING_FOR_JOIN_INVITATION";
            case MBEE_CONNECTING: return "CONNECTING";
            case MBEE_DISCONNECTING: return "DISCONNECTING";
            case MBEE_IDLE: return "IDLE";
            case MBEE_HAVE_TOKEN: return "HAVE_TOKEN";
            case MBEE_PASSING_TOKEN: return "PASSING_TOKEN";
            case MBEE_DISCONNECTED: return "DISCONNECTED";
            default: return "UNKNOWN";
        }
    }

    const char* ModBeeDebug::getErrorString(ModBeeError error) {
        switch (error) {
            case MBEE_TIMEOUT: return "TIMEOUT";
            case MBEE_CRC_ERROR: return "CRC_ERROR";
            case MBEE_FRAME_ERROR: return "FRAME_ERROR";
            case MBEE_UNKNOWN_NODE: return "UNKNOWN_NODE";
            case MBEE_NODE_ADDED: return "NODE_ADDED";
            case MBEE_NODE_REMOVED: return "NODE_REMOVED";
            case MBEE_BUFFER_OVERFLOW: return "BUFFER_OVERFLOW";
            case MBEE_INVALID_REQUEST: return "INVALID_REQUEST";
            case MBEE_PROTOCOL_VIOLATION: return "PROTOCOL_VIOLATION";
            case MBEE_PROTOCOL_ERROR: return "PROTOCOL_ERROR";
            case MBEE_OPERATION_ERROR: return "OPERATION_ERROR";
            case MBEE_OPERATION_TIMEOUT: return "OPERATION_TIMEOUT";
            case MBEE_UNKNOWN_ERROR: return "UNKNOWN_ERROR";
            case MBEE_MODBUS_ERROR: return "MODBUS_ERROR";
            case MBEE_TOKEN_PASS: return "TOKEN_PASS";
            case MBEE_TOKEN_RECLAIM: return "TOKEN_RECLAIM";
            case MBEE_NETWORK_TIMEOUT: return "NETWORK_TIMEOUT";
            case MBEE_NODE_TIMEOUT: return "NODE_TIMEOUT";
            case MBEE_STATE_CHANGE: return "STATE_CHANGE";
            case MBEE_DEBUG_EVENT: return "DEBUG_EVENT";
            case MBEE_INVALID_FUNCTION: return "INVALID_FUNCTION";
            case MBEE_INVALID_ADDRESS: return "INVALID_ADDRESS";
            case MBEE_SLAVE_DEVICE_FAILURE: return "SLAVE_DEVICE_FAILURE";
            default: return "UNKNOWN_ERROR";
        }
    }

    // =============================================================================
    // GLOBAL DEBUG CONTROL
    // =============================================================================
    
    void ModBeeDebug::setGlobalDebugEnabled(bool enabled) {
        _globalDebugEnabled = enabled;
    }

    bool ModBeeDebug::isGlobalDebugEnabled() {
        return _globalDebugEnabled;
    }

    // =============================================================================
    // STATISTICS METHODS
    // =============================================================================
    
    void ModBeeDebug::printStatistics() {
        debug(MBEE_DEBUG_INFO, MBEE_DEBUG_PROTOCOL,
            "Debug Stats - TX:%lu, RX:%lu, MbReq:%lu, MbResp:%lu, Errors:%lu",
            _framesSent, _framesReceived, _modbusRequestsSent, _modbusResponsesReceived, _errors);
    }

    void ModBeeDebug::resetStatistics() {
        _framesSent = 0;
        _framesReceived = 0;
        _modbusRequestsSent = 0;
        _modbusResponsesReceived = 0;
        _errors = 0;
    }

#endif