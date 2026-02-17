#pragma once
#include "ModBeeGlobal.h"

// =============================================================================
// MODBUS DATA MAP CLASS
// =============================================================================
// Stores and manages local register data with variable binding
class ModbusDataMap {
public:
    // =============================================================================
    // CONSTRUCTOR AND DESTRUCTOR
    // =============================================================================
    ModbusDataMap();
    ~ModbusDataMap();
    
    // =============================================================================
    // INITIALIZATION
    // =============================================================================
    void clearAll();
    
    // =============================================================================
    // REGISTER BINDING - POINTER-BASED ONLY
    // =============================================================================
    void addCoil(uint16_t address, bool* variable);
    void addHreg(uint16_t address, int16_t* variable);
    void addIsts(uint16_t address, bool* variable);
    void addIreg(uint16_t address, int16_t* variable);
    
    // =============================================================================
    // REGISTER EXISTENCE CHECKS
    // =============================================================================
    bool hasCoil(uint16_t address) const;
    bool hasHreg(uint16_t address) const;
    bool hasIsts(uint16_t address) const;
    bool hasIreg(uint16_t address) const;
    
    // =============================================================================
    // REGISTER READ METHODS - READ FROM BOUND VARIABLES
    // =============================================================================
    bool getCoil(uint16_t address) const;
    int16_t getHreg(uint16_t address) const;
    bool getIsts(uint16_t address) const;
    int16_t getIreg(uint16_t address) const;
    
    // =============================================================================
    // REGISTER WRITE METHODS - WRITE TO BOUND VARIABLES
    // =============================================================================
    bool setCoil(uint16_t address, bool value, uint8_t sourceNodeID = 0);
    bool setHreg(uint16_t address, int16_t value, uint8_t sourceNodeID = 0);
    bool setIsts(uint16_t address, bool value);
    bool setIreg(uint16_t address, int16_t value);
    
    // =============================================================================
    // MULTIPLE REGISTER OPERATIONS - OPERATE ON BOUND VARIABLES
    // =============================================================================
    void getCoils(uint16_t address, bool* values, uint16_t quantity) const;
    void getHregs(uint16_t address, int16_t* values, uint16_t quantity) const;
    void getIsts(uint16_t address, bool* values, uint16_t quantity) const;
    void getIregs(uint16_t address, int16_t* values, uint16_t quantity) const;
    
    void setCoils(uint16_t address, const bool* values, uint16_t quantity, uint8_t sourceNodeID = 0);
    void setHregs(uint16_t address, const int16_t* values, uint16_t quantity, uint8_t sourceNodeID = 0);
    
    // =============================================================================
    // REMOVE REGISTER BINDINGS
    // =============================================================================
    void removeCoil(uint16_t address);
    void removeHreg(uint16_t address);
    void removeIsts(uint16_t address);
    void removeIreg(uint16_t address);
    
    // =============================================================================
    // RANGE OPERATIONS USING BOUND VARIABLES
    // =============================================================================
    bool setCoilRange(uint16_t startAddr, const std::vector<bool>& values);
    std::vector<bool> getCoilRange(uint16_t startAddr, uint16_t count) const;
    bool hasCoilRange(uint16_t startAddr, uint16_t count) const;
    
    bool setIstsRange(uint16_t startAddr, const std::vector<bool>& values);
    std::vector<bool> getIstsRange(uint16_t startAddr, uint16_t count) const;
    bool hasIstsRange(uint16_t startAddr, uint16_t count) const;
    
    bool setHregRange(uint16_t startAddr, const std::vector<int16_t>& values);
    std::vector<int16_t> getHregRange(uint16_t startAddr, uint16_t count) const;
    bool hasHregRange(uint16_t startAddr, uint16_t count) const;
    
    bool setIregRange(uint16_t startAddr, const std::vector<int16_t>& values);
    std::vector<int16_t> getIregRange(uint16_t startAddr, uint16_t count) const;
    bool hasIregRange(uint16_t startAddr, uint16_t count) const;
    
    // =============================================================================
    // CLEAR SPECIFIC REGISTER TYPES
    // =============================================================================
    void clearCoils();
    void clearIsts();
    void clearHregs();
    void clearIregs();
    
    // =============================================================================
    // GET COUNTS AND ADDRESSES
    // =============================================================================
    uint16_t getCoilCount() const;
    uint16_t getIstsCount() const;
    uint16_t getHregCount() const;
    uint16_t getIregCount() const;
    
    std::vector<uint16_t> getCoilAddresses() const;
    std::vector<uint16_t> getIstsAddresses() const;
    std::vector<uint16_t> getHregAddresses() const;
    std::vector<uint16_t> getIregAddresses() const;
    
    // =============================================================================
    // VALIDATION METHODS
    // =============================================================================
    bool validateAddress(uint8_t functionCode, uint16_t address) const;
    bool validateAddressRange(uint8_t functionCode, uint16_t startAddr, uint16_t count) const;
    bool isReadOnly(uint8_t functionCode) const;
    
    // =============================================================================
    // CALLBACK SYSTEM
    // =============================================================================
    bool setCoilCallback(uint16_t address, CoilCallback callback);
    bool setHregCallback(uint16_t address, HregCallback callback);
    void removeCoilCallback(uint16_t address);
    void removeHregCallback(uint16_t address);
    bool setCoilWithCallback(uint16_t address, bool value);
    bool setHregWithCallback(uint16_t address, int16_t value);
    void clearAllCallbacks();
    bool hasCoilCallback(uint16_t address) const;
    bool hasHregCallback(uint16_t address) const;
    
    // =============================================================================
    // FAIL-SAFE SUPPORT
    // =============================================================================
    void clearAllLinkedVariables();
    void clearRegistersForNode(uint8_t nodeID);
    
    // =============================================================================
    // STATISTICS AND UTILITY FUNCTIONS
    // =============================================================================
    void getStatistics(DataMapStats& stats) const;
    size_t getMemoryUsage() const;
    bool validate() const;
    void debugPrintDataMap(ModBeeProtocol& protocol) const;

private:
    // =============================================================================
    // REGISTER STORAGE - STORES POINTERS TO BOUND VARIABLES
    // =============================================================================
    std::map<uint16_t, bool*> _coils;
    std::map<uint16_t, int16_t*> _hregs;
    std::map<uint16_t, bool*> _ists;
    std::map<uint16_t, int16_t*> _iregs;

    // =============================================================================
    // FAIL-SAFE STORAGE - TRACKS LAST WRITER FOR REGISTERS
    // =============================================================================
    std::map<uint16_t, uint8_t> _coilLastWriter;
    std::map<uint16_t, uint8_t> _hregLastWriter;
    
    // =============================================================================
    // CALLBACK STORAGE
    // =============================================================================
    std::map<uint16_t, CoilCallback> _coilCallbacks;
    std::map<uint16_t, HregCallback> _hregCallbacks;
};