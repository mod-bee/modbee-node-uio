#include "ModBeeGlobal.h"

// =============================================================================
// CONSTRUCTOR AND DESTRUCTOR
// =============================================================================
ModbusDataMap::ModbusDataMap() {
    clearAll();
}

ModbusDataMap::~ModbusDataMap() {
    clearAll();
}

void ModbusDataMap::clearAll() {
    _coils.clear();
    _ists.clear();
    _hregs.clear();
    _iregs.clear();
    _coilCallbacks.clear();
    _hregCallbacks.clear();
    _coilLastWriter.clear();
    _hregLastWriter.clear();
}

// =============================================================================
// REGISTER BINDING METHODS
// =============================================================================
void ModbusDataMap::addCoil(uint16_t address, bool* variable) {
    if (variable) {
        _coils[address] = variable;
    }
}

void ModbusDataMap::addHreg(uint16_t address, int16_t* variable) {
    if (variable) {
        _hregs[address] = variable;
    }
}

void ModbusDataMap::addIsts(uint16_t address, bool* variable) {
    if (variable) {
        _ists[address] = variable;
    }
}

void ModbusDataMap::addIreg(uint16_t address, int16_t* variable) {
    if (variable) {
        _iregs[address] = variable;
    }
}

// =============================================================================
// REGISTER EXISTENCE CHECKS
// =============================================================================
bool ModbusDataMap::hasCoil(uint16_t address) const {
    return _coils.find(address) != _coils.end();
}

bool ModbusDataMap::hasHreg(uint16_t address) const {
    return _hregs.find(address) != _hregs.end();
}

bool ModbusDataMap::hasIsts(uint16_t address) const {
    return _ists.find(address) != _ists.end();
}

bool ModbusDataMap::hasIreg(uint16_t address) const {
    return _iregs.find(address) != _iregs.end();
}

// =============================================================================
// REGISTER READ METHODS
// =============================================================================
bool ModbusDataMap::getCoil(uint16_t address) const {
    auto it = _coils.find(address);
    if (it != _coils.end() && it->second) {
        return *(it->second);
    }
    return false;
}

int16_t ModbusDataMap::getHreg(uint16_t address) const {
    auto it = _hregs.find(address);
    if (it != _hregs.end() && it->second) {
        return *(it->second);
    }
    return 0;
}

bool ModbusDataMap::getIsts(uint16_t address) const {
    auto it = _ists.find(address);
    if (it != _ists.end() && it->second) {
        return *(it->second);
    }
    return false;
}

int16_t ModbusDataMap::getIreg(uint16_t address) const {
    auto it = _iregs.find(address);
    if (it != _iregs.end() && it->second) {
        return *(it->second);
    }
    return 0;
}

// =============================================================================
// REGISTER WRITE METHODS
// =============================================================================
bool ModbusDataMap::setCoil(uint16_t address, bool value, uint8_t sourceNodeID) {
    auto it = _coils.find(address);
    if (it != _coils.end() && it->second) {
        *(it->second) = value;
        if (sourceNodeID != 0) {
            _coilLastWriter[address] = sourceNodeID;
        }
        // NOTE: Do not erase from _coilLastWriter here.
        // The calling function (clearRegistersForNode) is iterating over this map
        // and will handle the erase operation itself to prevent iterator invalidation.
        return true;
    }
    return false;
}

bool ModbusDataMap::setHreg(uint16_t address, int16_t value, uint8_t sourceNodeID) {
    auto it = _hregs.find(address);
    if (it != _hregs.end() && it->second) {
        *(it->second) = value;
        if (sourceNodeID != 0) {
            _hregLastWriter[address] = sourceNodeID;
        }
        // NOTE: Do not erase from _hregLastWriter here.
        // The calling function (clearRegistersForNode) is iterating over this map
        // and will handle the erase operation itself to prevent iterator invalidation.
        return true;
    }
    return false;
}

bool ModbusDataMap::setIsts(uint16_t address, bool value) {
    auto it = _ists.find(address);
    if (it != _ists.end() && it->second) {
        *(it->second) = value;
        return true;
    }
    return false;
}

bool ModbusDataMap::setIreg(uint16_t address, int16_t value) {
    auto it = _iregs.find(address);
    if (it != _iregs.end() && it->second) {
        *(it->second) = value;
        return true;
    }
    return false;
}

// =============================================================================
// MULTIPLE REGISTER OPERATIONS
// =============================================================================
void ModbusDataMap::getCoils(uint16_t address, bool* values, uint16_t quantity) const {
    if (!values) return;
    
    for (uint16_t i = 0; i < quantity; i++) {
        values[i] = getCoil(address + i);
    }
}

void ModbusDataMap::getHregs(uint16_t address, int16_t* values, uint16_t quantity) const {
    if (!values) return;
    
    for (uint16_t i = 0; i < quantity; i++) {
        values[i] = getHreg(address + i);
    }
}

void ModbusDataMap::getIsts(uint16_t address, bool* values, uint16_t quantity) const {
    if (!values) return;
    
    for (uint16_t i = 0; i < quantity; i++) {
        values[i] = getIsts(address + i);
    }
}

void ModbusDataMap::getIregs(uint16_t address, int16_t* values, uint16_t quantity) const {
    if (!values) return;
    
    for (uint16_t i = 0; i < quantity; i++) {
        values[i] = getIreg(address + i);
    }
}

void ModbusDataMap::setCoils(uint16_t address, const bool* values, uint16_t quantity, uint8_t sourceNodeID) {
    if (!values) return;
    
    for (uint16_t i = 0; i < quantity; i++) {
        setCoil(address + i, values[i], sourceNodeID);
    }
}

void ModbusDataMap::setHregs(uint16_t address, const int16_t* values, uint16_t quantity, uint8_t sourceNodeID) {
    if (!values) return;
    
    for (uint16_t i = 0; i < quantity; i++) {
        setHreg(address + i, values[i], sourceNodeID);
    }
}

// =============================================================================
// REMOVE REGISTER BINDINGS
// =============================================================================
void ModbusDataMap::removeCoil(uint16_t address) {
    auto it = _coils.find(address);
    if (it != _coils.end()) {
        _coils.erase(it);
    }
}

void ModbusDataMap::removeHreg(uint16_t address) {
    auto it = _hregs.find(address);
    if (it != _hregs.end()) {
        _hregs.erase(it);
    }
}

void ModbusDataMap::removeIsts(uint16_t address) {
    auto it = _ists.find(address);
    if (it != _ists.end()) {
        _ists.erase(it);
    }
}

void ModbusDataMap::removeIreg(uint16_t address) {
    auto it = _iregs.find(address);
    if (it != _iregs.end()) {
        _iregs.erase(it);
    }
}

// =============================================================================
// RANGE OPERATIONS
// =============================================================================
bool ModbusDataMap::setCoilRange(uint16_t startAddr, const std::vector<bool>& values) {
    for (size_t i = 0; i < values.size(); i++) {
        if (!setCoil(startAddr + i, values[i])) {
            return false;
        }
    }
    return true;
}

std::vector<bool> ModbusDataMap::getCoilRange(uint16_t startAddr, uint16_t count) const {
    std::vector<bool> values;
    values.reserve(count);
    
    for (uint16_t i = 0; i < count; i++) {
        values.push_back(getCoil(startAddr + i));
    }
    
    return values;
}

bool ModbusDataMap::hasCoilRange(uint16_t startAddr, uint16_t count) const {
    for (uint16_t i = 0; i < count; i++) {
        if (!hasCoil(startAddr + i)) {
            return false;
        }
    }
    return true;
}

bool ModbusDataMap::setIstsRange(uint16_t startAddr, const std::vector<bool>& values) {
    for (size_t i = 0; i < values.size(); i++) {
        if (!setIsts(startAddr + i, values[i])) {
            return false;
        }
    }
    return true;
}

std::vector<bool> ModbusDataMap::getIstsRange(uint16_t startAddr, uint16_t count) const {
    std::vector<bool> values;
    values.reserve(count);
    
    for (uint16_t i = 0; i < count; i++) {
        values.push_back(getIsts(startAddr + i));
    }
    
    return values;
}

bool ModbusDataMap::hasIstsRange(uint16_t startAddr, uint16_t count) const {
    for (uint16_t i = 0; i < count; i++) {
        if (!hasIsts(startAddr + i)) {
            return false;
        }
    }
    return true;
}

bool ModbusDataMap::setHregRange(uint16_t startAddr, const std::vector<int16_t>& values) {
    for (size_t i = 0; i < values.size(); i++) {
        if (!setHreg(startAddr + i, values[i])) {
            return false;
        }
    }
    return true;
}

std::vector<int16_t> ModbusDataMap::getHregRange(uint16_t startAddr, uint16_t count) const {
    std::vector<int16_t> values;
    values.reserve(count);
    
    for (uint16_t i = 0; i < count; i++) {
        values.push_back(getHreg(startAddr + i));
    }
    
    return values;
}

bool ModbusDataMap::hasHregRange(uint16_t startAddr, uint16_t count) const {
    for (uint16_t i = 0; i < count; i++) {
        if (!hasHreg(startAddr + i)) {
            return false;
        }
    }
    return true;
}

bool ModbusDataMap::setIregRange(uint16_t startAddr, const std::vector<int16_t>& values) {
    for (size_t i = 0; i < values.size(); i++) {
        if (!setIreg(startAddr + i, values[i])) {
            return false;
        }
    }
    return true;
}

std::vector<int16_t> ModbusDataMap::getIregRange(uint16_t startAddr, uint16_t count) const {
    std::vector<int16_t> values;
    values.reserve(count);
    
    for (uint16_t i = 0; i < count; i++) {
        values.push_back(getIreg(startAddr + i));
    }
    
    return values;
}

bool ModbusDataMap::hasIregRange(uint16_t startAddr, uint16_t count) const {
    for (uint16_t i = 0; i < count; i++) {
        if (!hasIreg(startAddr + i)) {
            return false;
        }
    }
    return true;
}

// =============================================================================
// CLEAR SPECIFIC REGISTER TYPES
// =============================================================================
void ModbusDataMap::clearCoils() {
    _coils.clear();
}

void ModbusDataMap::clearIsts() {
    _ists.clear();
}

void ModbusDataMap::clearHregs() {
    _hregs.clear();
}

void ModbusDataMap::clearIregs() {
    _iregs.clear();
}

// =============================================================================
// GET COUNTS AND ADDRESSES
// =============================================================================
uint16_t ModbusDataMap::getCoilCount() const {
    return _coils.size();
}

uint16_t ModbusDataMap::getIstsCount() const {
    return _ists.size();
}

uint16_t ModbusDataMap::getHregCount() const {
    return _hregs.size();
}

uint16_t ModbusDataMap::getIregCount() const {
    return _iregs.size();
}

std::vector<uint16_t> ModbusDataMap::getCoilAddresses() const {
    std::vector<uint16_t> addresses;
    addresses.reserve(_coils.size());
    
    for (const auto& coil : _coils) {
        addresses.push_back(coil.first);
    }
    
    std::sort(addresses.begin(), addresses.end());
    return addresses;
}

std::vector<uint16_t> ModbusDataMap::getIstsAddresses() const {
    std::vector<uint16_t> addresses;
    addresses.reserve(_ists.size());
    
    for (const auto& ists : _ists) {
        addresses.push_back(ists.first);
    }
    
    std::sort(addresses.begin(), addresses.end());
    return addresses;
}

std::vector<uint16_t> ModbusDataMap::getHregAddresses() const {
    std::vector<uint16_t> addresses;
    addresses.reserve(_hregs.size());
    
    for (const auto& hreg : _hregs) {
        addresses.push_back(hreg.first);
    }
    
    std::sort(addresses.begin(), addresses.end());
    return addresses;
}

std::vector<uint16_t> ModbusDataMap::getIregAddresses() const {
    std::vector<uint16_t> addresses;
    addresses.reserve(_iregs.size());
    
    for (const auto& ireg : _iregs) {
        addresses.push_back(ireg.first);
    }
    
    std::sort(addresses.begin(), addresses.end());
    return addresses;
}

// =============================================================================
// VALIDATION METHODS
// =============================================================================
bool ModbusDataMap::validateAddress(uint8_t functionCode, uint16_t address) const {
    switch (functionCode) {
        case MB_FC_READ_COILS:
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_MULTIPLE_COILS:
            return hasCoil(address);
            
        case MB_FC_READ_DISCRETE_INPUTS:
            return hasIsts(address);
            
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return hasHreg(address);
            
        case MB_FC_READ_INPUT_REGISTERS:
            return hasIreg(address);
            
        default:
            return false;
    }
}

bool ModbusDataMap::validateAddressRange(uint8_t functionCode, uint16_t startAddr, uint16_t count) const {
    switch (functionCode) {
        case MB_FC_READ_COILS:
        case MB_FC_WRITE_MULTIPLE_COILS:
            return hasCoilRange(startAddr, count);
            
        case MB_FC_READ_DISCRETE_INPUTS:
            return hasIstsRange(startAddr, count);
            
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return hasHregRange(startAddr, count);
            
        case MB_FC_READ_INPUT_REGISTERS:
            return hasIregRange(startAddr, count);
            
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
            return validateAddress(functionCode, startAddr);
            
        default:
            return false;
    }
}

bool ModbusDataMap::isReadOnly(uint8_t functionCode) const {
    switch (functionCode) {
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_INPUT_REGISTERS:
            return true;
            
        case MB_FC_READ_COILS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return false;
            
        default:
            return true;
    }
}

// =============================================================================
// CALLBACK SYSTEM
// =============================================================================
bool ModbusDataMap::setCoilCallback(uint16_t address, CoilCallback callback) {
    if (!callback) {
        return false;
    }
    
    _coilCallbacks[address] = callback;
    return true;
}

bool ModbusDataMap::setHregCallback(uint16_t address, HregCallback callback) {
    if (!callback) {
        return false;
    }
    
    _hregCallbacks[address] = callback;
    return true;
}

void ModbusDataMap::removeCoilCallback(uint16_t address) {
    auto it = _coilCallbacks.find(address);
    if (it != _coilCallbacks.end()) {
        _coilCallbacks.erase(it);
    }
}

void ModbusDataMap::removeHregCallback(uint16_t address) {
    auto it = _hregCallbacks.find(address);
    if (it != _hregCallbacks.end()) {
        _hregCallbacks.erase(it);
    }
}

bool ModbusDataMap::setCoilWithCallback(uint16_t address, bool value) {
    auto it = _coilCallbacks.find(address);
    if (it != _coilCallbacks.end()) {
        if (!it->second(address, value)) {
            return false;
        }
    }
    
    return setCoil(address, value);
}

bool ModbusDataMap::setHregWithCallback(uint16_t address, int16_t value) {
    auto it = _hregCallbacks.find(address);
    if (it != _hregCallbacks.end()) {
        if (!it->second(address, value)) {
            return false;
        }
    }
    
    return setHreg(address, value);
}

void ModbusDataMap::clearAllCallbacks() {
    _coilCallbacks.clear();
    _hregCallbacks.clear();
}

bool ModbusDataMap::hasCoilCallback(uint16_t address) const {
    return _coilCallbacks.count(address) > 0;
}

bool ModbusDataMap::hasHregCallback(uint16_t address) const {
    return _hregCallbacks.count(address) > 0;
}

// =============================================================================
// FAIL-SAFE SUPPORT
// =============================================================================

void ModbusDataMap::clearRegistersForNode(uint8_t nodeID) {
    int cleared_count = 0;

    // Clear coils written by the lost node
    for (auto it = _coilLastWriter.begin(); it != _coilLastWriter.end(); ) {
        if (it->second == nodeID) {
            setCoil(it->first, false, 0); // Reset to false, clear writer
            it = _coilLastWriter.erase(it);
            cleared_count++;
        } else {
            ++it;
        }
    }

    // Clear holding registers written by the lost node
    for (auto it = _hregLastWriter.begin(); it != _hregLastWriter.end(); ) {
        if (it->second == nodeID) {
            setHreg(it->first, 0, 0); // Reset to 0, clear writer
            it = _hregLastWriter.erase(it);
            cleared_count++;
        } else {
            ++it;
        }
    }

    if (cleared_count > 0) {
        MBEE_DEBUG_OPERATIONS("FAILSAFE: Cleared %d registers written by lost Node %d", cleared_count, nodeID);
    }
}

// =============================================================================
// FAIL-SAFE SUPPORT - CLEAR ALL LINKED VARIABLES
// =============================================================================
void ModbusDataMap::clearAllLinkedVariables() {
    // Clear all coil linked variables to false
    for (auto& pair : _coils) {
        if (pair.second) {
            *(pair.second) = false;
        }
    }
    
    // Clear all hreg linked variables to 0
    for (auto& pair : _hregs) {
        if (pair.second) {
            *(pair.second) = 0;
        }
    }
    
    // Clear all discrete input linked variables to false
    for (auto& pair : _ists) {
        if (pair.second) {
            *(pair.second) = false;
        }
    }
    
    // Clear all input register linked variables to 0
    for (auto& pair : _iregs) {
        if (pair.second) {
            *(pair.second) = 0;
        }
    }
}

// =============================================================================
// STATISTICS AND UTILITY FUNCTIONS
// =============================================================================
void ModbusDataMap::getStatistics(DataMapStats& stats) const {
    stats.coilCount = _coils.size();
    stats.istsCount = _ists.size();
    stats.hregCount = _hregs.size();
    stats.iregCount = _iregs.size();
    
    stats.coilMinAddr = 0xFFFF;
    stats.coilMaxAddr = 0;
    stats.istsMinAddr = 0xFFFF;
    stats.istsMaxAddr = 0;
    stats.hregMinAddr = 0xFFFF;
    stats.hregMaxAddr = 0;
    stats.iregMinAddr = 0xFFFF;
    stats.iregMaxAddr = 0;
    
    if (!_coils.empty()) {
        for (const auto& coil : _coils) {
            if (coil.first < stats.coilMinAddr) {
                stats.coilMinAddr = coil.first;
            }
            if (coil.first > stats.coilMaxAddr) {
                stats.coilMaxAddr = coil.first;
            }
        }
    } else {
        stats.coilMinAddr = 0;
    }
    
    if (!_ists.empty()) {
        for (const auto& ist : _ists) {
            if (ist.first < stats.istsMinAddr) {
                stats.istsMinAddr = ist.first;
            }
            if (ist.first > stats.istsMaxAddr) {
                stats.istsMaxAddr = ist.first;
            }
        }
    } else {
        stats.istsMinAddr = 0;
    }
    
    if (!_hregs.empty()) {
        for (const auto& hreg : _hregs) {
            if (hreg.first < stats.hregMinAddr) {
                stats.hregMinAddr = hreg.first;
            }
            if (hreg.first > stats.hregMaxAddr) {
                stats.hregMaxAddr = hreg.first;
            }
        }
    } else {
        stats.hregMinAddr = 0;
    }
    
    if (!_iregs.empty()) {
        for (const auto& ireg : _iregs) {
            if (ireg.first < stats.iregMinAddr) {
                stats.iregMinAddr = ireg.first;
            }
            if (ireg.first > stats.iregMaxAddr) {
                stats.iregMaxAddr = ireg.first;
            }
        }
    } else {
        stats.iregMinAddr = 0;
    }
}

size_t ModbusDataMap::getMemoryUsage() const {
    size_t usage = sizeof(ModbusDataMap);
    
    usage += _coils.size() * (sizeof(uint16_t) + sizeof(bool*));
    usage += _ists.size() * (sizeof(uint16_t) + sizeof(bool*));
    usage += _hregs.size() * (sizeof(uint16_t) + sizeof(int16_t*));
    usage += _iregs.size() * (sizeof(uint16_t) + sizeof(int16_t*));
    usage += _coilCallbacks.size() * (sizeof(uint16_t) + sizeof(CoilCallback));
    usage += _hregCallbacks.size() * (sizeof(uint16_t) + sizeof(HregCallback));
    
    return usage;
}

bool ModbusDataMap::validate() const {
    if (_coils.size() > MODBEE_MAX_DATA_POINTS ||
        _ists.size() > MODBEE_MAX_DATA_POINTS ||
        _hregs.size() > MODBEE_MAX_DATA_POINTS ||
        _iregs.size() > MODBEE_MAX_DATA_POINTS) {
        return false;
    }
    
    for (const auto& coil : _coils) {
        if (!coil.second) {
            return false;
        }
    }
    
    for (const auto& ist : _ists) {
        if (!ist.second) {
            return false;
        }
    }
    
    for (const auto& hreg : _hregs) {
        if (!hreg.second) {
            return false;
        }
    }
    
    for (const auto& ireg : _iregs) {
        if (!ireg.second) {
            return false;
        }
    }
    
    return true;
}

void ModbusDataMap::debugPrintDataMap(ModBeeProtocol& protocol) const {
    #ifdef DEBUG_MODBEE_DATAMAP
    protocol.reportError(MBEE_DEBUG_INFO, "DataMap debug data available");
    #endif
}