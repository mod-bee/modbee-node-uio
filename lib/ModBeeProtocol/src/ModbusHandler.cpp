#include "ModBeeGlobal.h"

ModbusHandler::ModbusHandler(ModbusDataMap& dataMap) : _dataMap(dataMap) {
    // Constructor - initialize with data map reference
}

ModbusHandler::~ModbusHandler() {
    // Destructor - nothing to clean up
}

// =============================================================================
// MAIN REQUEST PROCESSING
// =============================================================================

bool ModbusHandler::processRequest(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID) {
    //MBEE_DEBUG_MODBUS_INFO("PROCESS REQUEST: FC:%02X Addr:%d Qty:%d", 
    //    request.function, request.startAddr, request.quantity);
    
    // Validate the request first
    if (!ModbusFrame::validateRequest(request)) {
        MBEE_DEBUG_MODBUS_INFO("REQUEST VALIDATION FAILED: FC:%02X", request.function);
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    // Initialize response
    response.function = request.function;
    response.startAddr = request.startAddr;
    response.quantity = request.quantity;
    response.isResponse = true;
    response.data.clear();
    
    // Process based on function code
    bool result = false;
    switch (request.function) {
        case MB_FC_READ_COILS:
            result = processReadCoils(request, response);
            break;
            
        case MB_FC_READ_DISCRETE_INPUTS:
            result = processReadDiscreteInputs(request, response);
            break;
            
        case MB_FC_READ_HOLDING_REGISTERS:
            result = processReadHoldingRegisters(request, response);
            break;
            
        case MB_FC_READ_INPUT_REGISTERS:
            result = processReadInputRegisters(request, response);
            break;
            
        case MB_FC_WRITE_SINGLE_COIL:
            result = processWriteSingleCoil(request, response, sourceNodeID);
            break;
            
        case MB_FC_WRITE_SINGLE_REGISTER:
            result = processWriteSingleRegister(request, response, sourceNodeID);
            break;
            
        case MB_FC_WRITE_MULTIPLE_COILS:
            result = processWriteMultipleCoils(request, response, sourceNodeID);
            break;
            
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            result = processWriteMultipleRegisters(request, response, sourceNodeID);
            break;
            
        default:
            MBEE_DEBUG_MODBUS_INFO("UNSUPPORTED FUNCTION: FC:%02X", request.function);
            result = buildErrorResponse(request, MB_EX_ILLEGAL_FUNCTION, response);
            break;
    }
    
    //MBEE_DEBUG_MODBUS_INFO("REQUEST PROCESSED: FC:%02X %s", request.function, result ? "SUCCESS" : "FAILED");
    return result;
}

// =============================================================================
// READ FUNCTION IMPLEMENTATIONS
// =============================================================================

bool ModbusHandler::processReadCoils(const ModbusRequest& request, ModbusRequest& response) {
    // Check if all requested coils exist
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.hasCoil(request.startAddr + i)) {
            return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
        }
    }
    
    // Calculate byte count
    uint8_t byteCount = ModbusFrame::getBitPackedBytes(request.quantity);
    
    // Build response data
    response.data.resize(1 + byteCount);
    response.data[0] = byteCount;
    
    // Read coil values
    std::vector<bool> coilValues(request.quantity);
    for (uint16_t i = 0; i < request.quantity; i++) {
        coilValues[i] = _dataMap.getCoil(request.startAddr + i);
    }
    
    // Pack bits into response
    bool* coilArray = new bool[request.quantity];
    for (uint16_t i = 0; i < request.quantity; i++) {
        coilArray[i] = coilValues[i];
    }
    ModbusFrame::packBits(coilArray, &response.data[1], request.quantity);
    delete[] coilArray;
    
    return true;
}

bool ModbusHandler::processReadDiscreteInputs(const ModbusRequest& request, ModbusRequest& response) {
    MBEE_DEBUG_MODBUS_INFO("READ DISCRETE INPUTS: Addr:%d Qty:%d", request.startAddr, request.quantity);
    
    // Check if all requested inputs exist
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.hasIsts(request.startAddr + i)) {
            MBEE_DEBUG_MODBUS_INFO("DISCRETE INPUT NOT FOUND: Addr:%d", request.startAddr + i);
            return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
        }
    }
    
    // Set response start address from request
    response.startAddr = request.startAddr;
    response.quantity = request.quantity;
    
    // Calculate byte count
    uint8_t byteCount = ModbusFrame::getBitPackedBytes(request.quantity);
    
    // Build response data: ByteCount + PackedBits (NO address in data!)
    response.data.resize(1 + byteCount);
    response.data[0] = byteCount;
    
    // Read input values and pack into bits
    bool* inputArray = new bool[request.quantity];
    for (uint16_t i = 0; i < request.quantity; i++) {
        inputArray[i] = _dataMap.getIsts(request.startAddr + i);
        MBEE_DEBUG_MODBUS_INFO("ISTS[%d] = %d", request.startAddr + i, inputArray[i]);
    }
    
    // Pack bits into response
    ModbusFrame::packBits(inputArray, &response.data[1], request.quantity);
    delete[] inputArray;
    
    MBEE_DEBUG_MODBUS_INFO("READ DISCRETE INPUTS: Built response addr:%d with %d data bytes (byteCount:%d)", 
        response.startAddr, response.data.size(), byteCount);
    return true;
}

bool ModbusHandler::processReadHoldingRegisters(const ModbusRequest& request, ModbusRequest& response) {
    MBEE_DEBUG_MODBUS_INFO("READ HOLDING REGS: Addr:%d Qty:%d", request.startAddr, request.quantity);
    
    // Check if all requested registers exist
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.hasHreg(request.startAddr + i)) {
            MBEE_DEBUG_MODBUS_INFO("MISSING REGISTER: Addr:%d", request.startAddr + i);
            return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
        }
    }
    
    // Calculate byte count
    uint8_t byteCount = request.quantity * 2;
    
    // Build response data
    response.data.resize(1 + byteCount);
    response.data[0] = byteCount;
    
    // Read register values
    uint16_t dataIndex = 1;
    for (uint16_t i = 0; i < request.quantity; i++) {
        int16_t regValue = _dataMap.getHreg(request.startAddr + i);
        response.data[dataIndex++] = (regValue >> 8) & 0xFF;
        response.data[dataIndex++] = regValue & 0xFF;
        MBEE_DEBUG_MODBUS_INFO("READ REG[%d] = %d", request.startAddr + i, regValue);
    }
    
    return true;
}

bool ModbusHandler::processReadInputRegisters(const ModbusRequest& request, ModbusRequest& response) {
    MBEE_DEBUG_MODBUS_INFO("READ INPUT REGS: Addr:%d Qty:%d", request.startAddr, request.quantity);
    
    // Check if all requested registers exist
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.hasIreg(request.startAddr + i)) {
            return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
        }
    }
    
    // Calculate byte count
    uint8_t byteCount = request.quantity * 2;
    
    // Build response data
    response.data.resize(1 + byteCount);
    response.data[0] = byteCount;
    
    // Read register values
    uint16_t dataIndex = 1;
    for (uint16_t i = 0; i < request.quantity; i++) {
        int16_t value = _dataMap.getIreg(request.startAddr + i);
        
        // Convert to big-endian
        response.data[dataIndex++] = (value >> 8) & 0xFF;
        response.data[dataIndex++] = value & 0xFF;
    }
    
    return true;
}

// =============================================================================
// WRITE FUNCTION IMPLEMENTATIONS
// =============================================================================

bool ModbusHandler::processWriteSingleCoil(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID) {
    if (request.data.size() < 2) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    // Check if coil exists
    if (!_dataMap.hasCoil(request.startAddr)) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
    }
    
    // Extract value (0xFF00 = true, 0x0000 = false)
    uint16_t value = ((uint16_t)request.data[0] << 8) | request.data[1];
    bool coilValue = (value == 0xFF00);
    
    // Write coil
    if (!_dataMap.setCoil(request.startAddr, coilValue, sourceNodeID)) {
        return buildErrorResponse(request, MB_EX_SLAVE_DEVICE_FAILURE, response);
    }
    
    // NO ECHO RESPONSE - just return success with empty response
    response.data.clear();
    
    return true;
}

bool ModbusHandler::processWriteSingleRegister(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID) {
    if (request.data.size() < 2) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    // Check if register exists
    if (!_dataMap.hasHreg(request.startAddr)) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
    }
    
    // Extract value
    int16_t value = ((int16_t)request.data[0] << 8) | request.data[1];
    
    // Write register
    if (!_dataMap.setHreg(request.startAddr, value, sourceNodeID)) {
        return buildErrorResponse(request, MB_EX_SLAVE_DEVICE_FAILURE, response);
    }
    
    // NO ECHO RESPONSE - just return success with empty response
    response.data.clear();
    
    return true;
}

bool ModbusHandler::processWriteMultipleCoils(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID) {
    if (request.data.size() < 1) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    uint8_t byteCount = request.data[0];
    if (request.data.size() < (1 + byteCount)) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    // Check if all coils exist
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.hasCoil(request.startAddr + i)) {
            return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
        }
    }
    
    // Unpack and write coils
    bool* coilValues = new bool[request.quantity];
    ModbusFrame::unpackBits(&request.data[1], coilValues, request.quantity);
    
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.setCoil(request.startAddr + i, coilValues[i], sourceNodeID)) {
            delete[] coilValues;
            return buildErrorResponse(request, MB_EX_SLAVE_DEVICE_FAILURE, response);
        }
    }
    
    delete[] coilValues;
    
    // NO ECHO RESPONSE - just return success with empty response
    response.data.clear();
    
    return true;
}

bool ModbusHandler::processWriteMultipleRegisters(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID) {
    if (request.data.size() < 1) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    uint8_t byteCount = request.data[0];
    if (request.data.size() < (1 + byteCount) || byteCount != (request.quantity * 2)) {
        return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_VALUE, response);
    }
    
    // Check if all registers exist
    for (uint16_t i = 0; i < request.quantity; i++) {
        if (!_dataMap.hasHreg(request.startAddr + i)) {
            return buildErrorResponse(request, MB_EX_ILLEGAL_DATA_ADDRESS, response);
        }
    }
    
    // Write registers
    uint16_t dataIndex = 1;
    for (uint16_t i = 0; i < request.quantity; i++) {
        int16_t value = ((int16_t)request.data[dataIndex] << 8) | request.data[dataIndex + 1];
        dataIndex += 2;
        
        if (!_dataMap.setHreg(request.startAddr + i, value, sourceNodeID)) {
            return buildErrorResponse(request, MB_EX_SLAVE_DEVICE_FAILURE, response);
        }
    }
    
    // NO ECHO RESPONSE - just return success with empty response
    response.data.clear();
    
    return true;
}

// =============================================================================
// HELPER METHODS
// =============================================================================

bool ModbusHandler::buildErrorResponse(const ModbusRequest& request, uint8_t exceptionCode, ModbusRequest& response) {
    response.function = ModbusFrame::makeErrorResponse(request.function);
    response.isResponse = true;
    response.startAddr = request.startAddr;
    response.quantity = 0;
    response.data.clear();
    response.data.push_back(exceptionCode);
    
    return true;
}

// =============================================================================
// STATIC RESPONSE PROCESSING METHODS
// =============================================================================

bool ModbusHandler::processResponse(ModBeeProtocol& protocol, const ModbusRequest& response, uint8_t srcNodeID) {
    uint8_t baseFunction = ModbusFrame::getBaseFunctionCode(response.function);
    
    switch (baseFunction) {
        case MB_FC_READ_COILS: {
            // Create handler instance to call non-static methods
            ModbusHandler handler(protocol.getDataMap());
            return handler.processReadCoilsResponse(protocol, response, srcNodeID);
        }
        case MB_FC_READ_DISCRETE_INPUTS: {
            ModbusHandler handler(protocol.getDataMap());
            return handler.processReadDiscreteInputsResponse(protocol, response, srcNodeID);
        }
        case MB_FC_READ_HOLDING_REGISTERS: {
            ModbusHandler handler(protocol.getDataMap());
            return handler.processReadHoldingRegistersResponse(protocol, response, srcNodeID);
        }
        case MB_FC_READ_INPUT_REGISTERS: {
            ModbusHandler handler(protocol.getDataMap());
            return handler.processReadInputRegistersResponse(protocol, response, srcNodeID);
        }
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            // Write confirmations - just remove from pending operations
            return true;
            
        default:
            return false;
    }
}

bool ModbusHandler::matchesRequest(const ModbusRequest& request, const ModbusRequest& response) {
    uint8_t baseFunction = ModbusFrame::getBaseFunctionCode(response.function);
    
    switch (baseFunction) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            return request.function == baseFunction && 
                   request.startAddr == response.startAddr &&
                   request.quantity == response.quantity;
            
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return request.function == baseFunction && 
                   request.startAddr == response.startAddr;
            
        default:
            return false;
    }
}

uint8_t ModbusHandler::getExceptionCode(const ModbusRequest& request) {
    if (!ModbusFrame::isValidFunctionCode(request.function)) {
        return MB_EX_ILLEGAL_FUNCTION;
    }
    
    // Create temporary handler instance for validation
    ModbusDataMap tempMap;
    ModbusHandler tempHandler(tempMap);
    
    if (!tempHandler.validateQuantity(request.function, request.quantity)) {
        return MB_EX_ILLEGAL_DATA_VALUE;
    }
    
    if (!tempHandler.validateAddress(request.function, request.startAddr, request.quantity)) {
        return MB_EX_ILLEGAL_DATA_ADDRESS;
    }
    
    return MB_EX_SLAVE_DEVICE_FAILURE;
}

// =============================================================================
// DEBUG AND UTILITY METHODS
// =============================================================================

void ModbusHandler::debugPrintRequest(const ModbusRequest& request) {
    // Debug implementation
}

void ModbusHandler::debugPrintResponse(const ModbusRequest& response) {
    // Debug implementation
}