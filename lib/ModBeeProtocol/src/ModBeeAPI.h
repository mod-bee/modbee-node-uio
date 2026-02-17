#pragma once
#include "ModBeeGlobal.h"

/**
 * ModBeeAPI - Direct instance class for ModBee protocol
 * Users create instances or use the global 'modbee' instance
 */
class ModBeeAPI {
public:
    ModBeeAPI();
    ~ModBeeAPI();

    // =============================================================================
    // High Level Variables - Static but modifiable
    // =============================================================================
    static unsigned long MODBEE_INTERFRAME_GAP_US;
    static unsigned long MODBEE_OPERATION_TIMEOUT_MS;
    static unsigned long MODBEE_RESPONSE_TIMEOUT_MS;
    static unsigned long MODBEE_READ_TIMEOUT_MS;
    static unsigned long MODBEE_RETRY_DELAY_MS;
    static unsigned long MODBEE_MAX_RETRIES;

    // PROTOCOL TIMING ONLY
    static unsigned long INITIAL_LISTEN_PERIOD_MS;
    static unsigned long TOKEN_RESPONSE_TIMEOUT_MS;
    static unsigned long BASE_TIMEOUT;
    static unsigned long NODE_TIMEOUT_MS;

    static unsigned long MODBEE_TOKEN_RECLAIM_TIMEOUT;
    static unsigned long MODBEE_JOIN_CYCLE_INTERVAL;
    static unsigned long MODBEE_JOIN_RESPONSE_TIMEOUT;

    static int MODBEE_MAX_NODES; 
    static bool enableFailSafe;

    // =============================================================================
    // PROTOCOL MANAGEMENT
    // =============================================================================
    
    bool begin(Stream* serial, uint8_t nodeID = 1);
    void loop();
    void end();
    bool isInitialized();
    
    // Node management
    uint8_t getNodeID();
    bool isConnected();
    bool isNodeKnown(uint8_t nodeID);
    void connect();
    void disconnect();
    
    // =============================================================================
    // DATA MAP MANAGEMENT - POINTER-BASED ONLY
    // =============================================================================
    
    void addCoil(uint16_t address, bool* variable);
    void addHreg(uint16_t address, int16_t* variable);
    void addIsts(uint16_t address, bool* variable);
    void addIreg(uint16_t address, int16_t* variable);
    
    // Update local data map values
    bool setCoil(uint16_t address, bool value);
    bool setHreg(uint16_t address, int16_t value);
    bool setIsts(uint16_t address, bool value);
    bool setIreg(uint16_t address, int16_t value);
    
    // Read local data map values
    bool getCoil(uint16_t address, bool& value);
    bool getHreg(uint16_t address, int16_t& value);
    bool getIsts(uint16_t address, bool& value);
    bool getIreg(uint16_t address, int16_t& value);
    
    // Remove data points
    bool removeCoil(uint16_t address);
    bool removeHreg(uint16_t address);
    bool removeIsts(uint16_t address);
    bool removeIreg(uint16_t address);
    
    // =============================================================================
    // TEMPLATE READ FUNCTIONS - Auto-sizing for arrays
    // =============================================================================
    
    // AUTO-SIZING Read functions (template-based for fixed arrays)
    template<size_t N>
    bool readHreg(uint8_t nodeID, uint16_t offset, int16_t (&values)[N], uint8_t fc = 0) {
        return readHreg_impl(nodeID, offset, values, N, fc);
    }
    
    template<size_t N>
    bool readCoil(uint8_t nodeID, uint16_t offset, bool (&values)[N], uint8_t fc = 0) {
        return readCoil_impl(nodeID, offset, values, N, fc);
    }
    
    template<size_t N>
    bool readIreg(uint8_t nodeID, uint16_t offset, int16_t (&values)[N], uint8_t fc = 0) {
        return readIreg_impl(nodeID, offset, values, N, fc);
    }
    
    template<size_t N>
    bool readIsts(uint8_t nodeID, uint16_t offset, bool (&values)[N], uint8_t fc = 0) {
        return readIsts_impl(nodeID, offset, values, N, fc);
    }
    
    // AUTO-SIZING Write functions (template-based for fixed arrays)
    template<size_t N>
    bool writeHreg(uint8_t nodeID, uint16_t offset, const int16_t (&values)[N], uint8_t fc = 0) {
        return writeHreg_impl(nodeID, offset, values, N, fc);
    }
    
    template<size_t N>
    bool writeCoil(uint8_t nodeID, uint16_t offset, const bool (&values)[N], uint8_t fc = 0) {
        return writeCoil_impl(nodeID, offset, values, N, fc);
    }
    
    // =============================================================================
    // MANUAL FUNCTIONS - Explicit sizing for dynamic arrays
    // =============================================================================
    
    // Manual read functions (pointer-based for dynamic arrays)
    bool readHregManual(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numregs, uint8_t fc = 0);
    bool readCoilManual(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numcoils, uint8_t fc = 0);
    bool readIregManual(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numiregs, uint8_t fc = 0);
    bool readIstsManual(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numists, uint8_t fc = 0);
    
    // Manual write functions (pointer-based for dynamic arrays)
    bool writeHregManual(uint8_t nodeID, uint16_t offset, const int16_t* values, uint16_t numregs, uint8_t fc = 0);
    bool writeCoilManual(uint8_t nodeID, uint16_t offset, const bool* values, uint16_t numcoils, uint8_t fc = 0);
    
    // =============================================================================
    // SINGLE VALUE FUNCTIONS - No conflicts with templates
    // =============================================================================
    
    // Single value read functions (reference-based)
    bool readHreg(uint8_t nodeID, uint16_t offset, int16_t& value, uint8_t fc = 0);
    bool readCoil(uint8_t nodeID, uint16_t offset, bool& value, uint8_t fc = 0);
    bool readIreg(uint8_t nodeID, uint16_t offset, int16_t& value, uint8_t fc = 0);
    bool readIsts(uint8_t nodeID, uint16_t offset, bool& value, uint8_t fc = 0);
    
    // Single value write functions (value-based)
    bool writeHreg(uint8_t nodeID, uint16_t offset, int16_t value, uint8_t fc = 0);
    bool writeCoil(uint8_t nodeID, uint16_t offset, bool value, uint8_t fc = 0);
    
    // =============================================================================
    // UTILITY AND STATUS FUNCTIONS
    // =============================================================================
    
    // Operations status
    uint16_t getPendingOpCount();
    void clearPendingOps();
    
    // Statistics
    void getStatistics(uint16_t& pendingOps, uint16_t& completedOps);
    
    // Error handling
    void onError(void (*errorHandler)(ModBeeError error, const char* message));
    void onDebug(void (*debugHandler)(const char* category, const char* message));

private:
    // Direct protocol instance
    ModBeeProtocol* _protocol;
    void (*_debugHandler)(const char* category, const char* message);

    // Implementation methods for templates
    bool readHreg_impl(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numregs, uint8_t fc);
    bool readCoil_impl(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numcoils, uint8_t fc);
    bool readIreg_impl(uint8_t nodeID, uint16_t offset, int16_t* values, uint16_t numiregs, uint8_t fc);
    bool readIsts_impl(uint8_t nodeID, uint16_t offset, bool* values, uint16_t numists, uint8_t fc);
    bool writeHreg_impl(uint8_t nodeID, uint16_t offset, const int16_t* values, uint16_t numregs, uint8_t fc);
    bool writeCoil_impl(uint8_t nodeID, uint16_t offset, const bool* values, uint16_t numcoils, uint8_t fc);
};