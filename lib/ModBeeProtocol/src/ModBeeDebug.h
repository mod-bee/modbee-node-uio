#pragma once
#include "ModBeeGlobal.h"

// =============================================================================
// SIMPLE DEBUG DISABLE CONFIGURATION
// =============================================================================
//#define DISABLE_MODBEE_DEBUG

#ifdef DISABLE_MODBEE_DEBUG
    // Replace all debug macros with empty ones
    #define MBEE_DEBUG(level, category, ...)
    #define MBEE_DEBUG_FRAME(direction, frame, length)
    #define MBEE_DEBUG_MODBUS(type, nodeID, request)
    #define MBEE_DEBUG_PROTOCOL(...)
    #define MBEE_DEBUG_FRAMES(...)
    #define MBEE_DEBUG_MODBUS_INFO(...)
    #define MBEE_DEBUG_OPERATIONS(...)
    #define MBEE_DEBUG_CACHE_INFO(...)
    #define MBEE_DEBUG_IO(...)
    #define MBEE_DEBUG_ERROR(...)
    #define MBEE_DEBUG_WARN(...)
    #define MBEE_DEBUG_VERBOSE(...)

    // Empty debug class
    class ModBeeDebug {
    public:
        ModBeeDebug() {}
        void onDebug(void* handler) {}
        static void setGlobalDebugEnabled(bool enabled) {}
        static bool isGlobalDebugEnabled() { return false; }
    };
    extern ModBeeDebug g_modbeeDebug;

#else
    // =============================================================================
    // DEBUG SYSTEM WHEN ENABLED
    // =============================================================================
    
    // Debug levels
    enum ModBeeDebugLevel {
        MBEE_DEBUG_NONE = 0,
        MBEE_DEBUG_ERROR = 1,
        MBEE_DEBUG_WARN = 2,
        MBEE_DEBUG_INFO = 3,
        MBEE_DEBUG_VERBOSE = 4,
        MBEE_DEBUG_ALL = 5
    };

    // Debug categories
    enum ModBeeDebugCategory {
        MBEE_DEBUG_PROTOCOL = 0x01,
        MBEE_DEBUG_FRAMES = 0x02,
        MBEE_DEBUG_MODBUS = 0x04,
        MBEE_DEBUG_OPERATIONS = 0x08,
        MBEE_DEBUG_CACHE = 0x10,
        MBEE_DEBUG_IO = 0x20
    };

    // Frame direction
    enum ModBeeFrameDirection {
        MBEE_FRAME_TX,
        MBEE_FRAME_RX
    };

    // Modbus operation type
    enum ModBeeModbusType {
        MBEE_MODBUS_REQUEST,
        MBEE_MODBUS_RESPONSE
    };

    // Callback function types
    typedef void (*ModBeeDebugHandler)(ModBeeDebugLevel level, ModBeeDebugCategory category, const char* message);
    typedef void (*ModBeeFrameDebugHandler)(ModBeeFrameDirection direction, const uint8_t* frame, uint16_t length, const char* decoded);
    typedef void (*ModBeeModbusDebugHandler)(ModBeeModbusType type, uint8_t nodeID, const ModbusRequest& request, const char* decoded);

    /**
     * ModBeeDebug - Comprehensive debugging system for ModBee protocol
     */
    class ModBeeDebug {
    public:
        ModBeeDebug();
        ~ModBeeDebug();
        
        // Debug configuration
        void setDebugLevel(ModBeeDebugLevel level);
        void setDebugCategories(uint8_t categories);
        void enableCategory(ModBeeDebugCategory category);
        void disableCategory(ModBeeDebugCategory category);
        
        // Debug handlers
        void onDebug(ModBeeDebugHandler handler);
        void onFrameDebug(ModBeeFrameDebugHandler handler);
        void onModbusDebug(ModBeeModbusDebugHandler handler);
        
        // Debug output methods
        void debug(ModBeeDebugLevel level, ModBeeDebugCategory category, const char* format, ...);
        void debugFrame(ModBeeFrameDirection direction, const uint8_t* frame, uint16_t length);
        void debugModbus(ModBeeModbusType type, uint8_t nodeID, const ModbusRequest& request);
        
        // Frame analysis
        void analyzeFrame(const uint8_t* frame, uint16_t length, char* output, size_t outputSize);
        void analyzeModbusRequest(const ModbusRequest& request, char* output, size_t outputSize);
        
        // Protocol state debugging
        void debugProtocolState(const class ModBeeProtocol& protocol);
        void debugOperationsQueue(const class ModBeeOperations& operations);
        void debugCache(const class ModBeeCache& cache);
        void debugDataMap(const class ModbusDataMap& dataMap);
        
        // Statistics
        void printStatistics();
        void resetStatistics();
        
        // Utility methods
        const char* getFrameTypeString(const uint8_t* frame, uint16_t length);
        const char* getModbusFunctionString(uint8_t functionCode);
        const char* getProtocolStateString(ModBeeProtocolState state);
        const char* getErrorString(ModBeeError error);
        
        // Enable/disable debug globally
        static void setGlobalDebugEnabled(bool enabled);
        static bool isGlobalDebugEnabled();

    private:
        ModBeeDebugLevel _debugLevel;
        uint8_t _debugCategories;
        
        ModBeeDebugHandler _debugHandler;
        ModBeeFrameDebugHandler _frameDebugHandler;
        ModBeeModbusDebugHandler _modbusDebugHandler;
        
        // Statistics
        uint32_t _framesSent;
        uint32_t _framesReceived;
        uint32_t _modbusRequestsSent;
        uint32_t _modbusResponsesReceived;
        uint32_t _errors;
        
        // Helper methods
        bool shouldDebug(ModBeeDebugLevel level, ModBeeDebugCategory category) const;
        void formatHexDump(const uint8_t* data, uint16_t length, char* output, size_t outputSize);
        void decodeFrameHeader(const uint8_t* frame, uint16_t length, char* output, size_t outputSize);
        void decodeModbusSections(const uint8_t* frame, uint16_t length, char* output, size_t outputSize);
        
        static bool _globalDebugEnabled;
    };

    // Global debug instance
    extern ModBeeDebug g_modbeeDebug;

    // =============================================================================
    // DEBUG MACROS
    // =============================================================================
    
    // Convenience macros for debug output
    #define MBEE_DEBUG(level, category, ...) \
        do { \
            if (ModBeeDebug::isGlobalDebugEnabled()) { \
                g_modbeeDebug.debug(level, category, __VA_ARGS__); \
            } \
        } while(0)

    #define MBEE_DEBUG_FRAME(direction, frame, length) \
        do { \
            if (ModBeeDebug::isGlobalDebugEnabled()) { \
                g_modbeeDebug.debugFrame(direction, frame, length); \
            } \
        } while(0)

    #define MBEE_DEBUG_MODBUS(type, nodeID, request) \
        do { \
            if (ModBeeDebug::isGlobalDebugEnabled()) { \
                g_modbeeDebug.debugModbus(type, nodeID, request); \
            } \
        } while(0)

    // Quick debug macros
    #define MBEE_DEBUG_PROTOCOL(...) MBEE_DEBUG(MBEE_DEBUG_INFO, MBEE_DEBUG_PROTOCOL, __VA_ARGS__)
    #define MBEE_DEBUG_FRAMES(...) MBEE_DEBUG(MBEE_DEBUG_INFO, MBEE_DEBUG_FRAMES, __VA_ARGS__)
    #define MBEE_DEBUG_MODBUS_INFO(...) MBEE_DEBUG(MBEE_DEBUG_INFO, MBEE_DEBUG_MODBUS, __VA_ARGS__)
    #define MBEE_DEBUG_OPERATIONS(...) MBEE_DEBUG(MBEE_DEBUG_INFO, MBEE_DEBUG_OPERATIONS, __VA_ARGS__)
    #define MBEE_DEBUG_CACHE_INFO(...) MBEE_DEBUG(MBEE_DEBUG_INFO, MBEE_DEBUG_CACHE, __VA_ARGS__)
    #define MBEE_DEBUG_IO(...) MBEE_DEBUG(MBEE_DEBUG_INFO, MBEE_DEBUG_IO, __VA_ARGS__)

    #define MBEE_DEBUG_ERROR(...) MBEE_DEBUG(MBEE_DEBUG_ERROR, MBEE_DEBUG_PROTOCOL, __VA_ARGS__)
    #define MBEE_DEBUG_WARN(...) MBEE_DEBUG(MBEE_DEBUG_WARN, MBEE_DEBUG_PROTOCOL, __VA_ARGS__)
    #define MBEE_DEBUG_VERBOSE(...) MBEE_DEBUG(MBEE_DEBUG_VERBOSE, MBEE_DEBUG_PROTOCOL, __VA_ARGS__)
#endif