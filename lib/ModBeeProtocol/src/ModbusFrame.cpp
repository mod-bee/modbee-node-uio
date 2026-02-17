#include "ModBeeGlobal.h"

// =============================================================================
// MODBUS REQUEST BUILDING
// =============================================================================
uint16_t ModbusFrame::buildModbusRequest(uint8_t* buffer, const PendingModbusOp* op) {
    if (!buffer) {
        return 0;
    }
    
    // Get request from operation
    const ModbusRequest* request = op ? &(op->req) : nullptr;
    if (!request) {
        return 0; // No request to build
    }
    
    uint16_t pos = 0;
    
    // Function code
    buffer[pos++] = request->function;
    
    // Starting address (2 bytes, big endian)
    buffer[pos++] = (request->startAddr >> 8) & 0xFF;
    buffer[pos++] = request->startAddr & 0xFF;
    
    // Handle different function codes
    switch (request->function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            // Quantity (2 bytes, big endian)
            buffer[pos++] = (request->quantity >> 8) & 0xFF;
            buffer[pos++] = request->quantity & 0xFF;
            break;
            
        case MB_FC_WRITE_SINGLE_COIL: {
            // Check if we have direct pointer access
            if (op && op->resultPtr && !op->isArray) {
                // Read directly from user's variable NOW
                bool* userBool = static_cast<bool*>(op->resultPtr);
                bool currentValue = *userBool;  // Read current value at send time
                
                if (currentValue) {
                    buffer[pos++] = 0xFF;
                    buffer[pos++] = 0x00;
                } else {
                    buffer[pos++] = 0x00;
                    buffer[pos++] = 0x00;
                }
                
            } else {
                // Fallback to existing data
                if (request->data.size() >= 2) {
                    buffer[pos++] = request->data[0];
                    buffer[pos++] = request->data[1];
                } else {
                    buffer[pos++] = 0x00;
                    buffer[pos++] = 0x00;
                }
            }
            break;
        }
            
        case MB_FC_WRITE_SINGLE_REGISTER: {
            // Check if we have direct pointer access
            if (op && op->resultPtr && !op->isArray) {
                // Read directly from user's variable NOW
                int16_t* userReg = static_cast<int16_t*>(op->resultPtr);
                int16_t currentValue = *userReg;  // Read current value at send time
                
                buffer[pos++] = (currentValue >> 8) & 0xFF;
                buffer[pos++] = currentValue & 0xFF;
                
            } else {
                // Fallback to existing data
                if (request->data.size() >= 2) {
                    buffer[pos++] = request->data[0];
                    buffer[pos++] = request->data[1];
                } else {
                    buffer[pos++] = 0x00;
                    buffer[pos++] = 0x00;
                }
            }
            break;
        }
            
        case MB_FC_WRITE_MULTIPLE_COILS: {
            // Quantity (2 bytes, big endian)
            buffer[pos++] = (request->quantity >> 8) & 0xFF;
            buffer[pos++] = request->quantity & 0xFF;
            
            // Check if we have direct pointer access for arrays
            if (op && op->resultPtr && op->isArray) {
                bool* userCoils = static_cast<bool*>(op->resultPtr);
                uint8_t byteCount = (request->quantity + 7) / 8;
                
                buffer[pos++] = byteCount;  // Byte count
                
                // Clear bytes
                for (uint8_t i = 0; i < byteCount; i++) {
                    buffer[pos + i] = 0;
                }
                
                // Pack current coil values from user's array
                for (uint16_t i = 0; i < request->quantity; i++) {
                    bool currentValue = userCoils[i];  // Read current value now
                    if (currentValue) {
                        uint8_t byteIndex = i / 8;
                        uint8_t bitIndex = i % 8;
                        buffer[pos + byteIndex] |= (1 << bitIndex);
                    }
                }
                
                pos += byteCount;
                
            } else {
                // Fallback to existing data
                for (size_t i = 0; i < request->data.size() && pos < MODBEE_MAX_TX_BUFFER; i++) {
                    buffer[pos++] = request->data[i];
                }
            }
            break;
        }
            
        case MB_FC_WRITE_MULTIPLE_REGISTERS: {
            // Quantity (2 bytes, big endian)
            buffer[pos++] = (request->quantity >> 8) & 0xFF;
            buffer[pos++] = request->quantity & 0xFF;
            
            // Check if we have direct pointer access for arrays
            if (op && op->resultPtr && op->isArray) {
                int16_t* userRegs = static_cast<int16_t*>(op->resultPtr);
                uint8_t byteCount = request->quantity * 2;
                
                buffer[pos++] = byteCount;  // Byte count
                
                // Pack current register values from user's array
                for (uint16_t i = 0; i < request->quantity; i++) {
                    int16_t currentValue = userRegs[i];  // Read current value now
                    buffer[pos++] = (currentValue >> 8) & 0xFF;
                    buffer[pos++] = currentValue & 0xFF;
                }
                
            } else {
                // Fallback to existing data
                for (size_t i = 0; i < request->data.size() && pos < MODBEE_MAX_TX_BUFFER; i++) {
                    buffer[pos++] = request->data[i];
                }
            }
            break;
        }
            
        default:
            // Unknown function code
            return 0;
    }
    
    return pos;
}

// =============================================================================
// MODBUS RESPONSE BUILDING
// =============================================================================
uint16_t ModbusFrame::buildModbusResponse(uint8_t* buffer, const ModbusRequest& response) {
    uint16_t pos = 0;
    
    // Function code
    buffer[pos++] = response.function;
    
    switch (response.function) {
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS: {
            // Add start address to response (for token ring matching)
            buffer[pos++] = (response.startAddr >> 8) & 0xFF;
            buffer[pos++] = response.startAddr & 0xFF;
            
            // Byte count
            if (response.data.size() == 0) {
                return 0;
            }
            
            uint8_t byteCount = response.data[0];
            buffer[pos++] = byteCount;
            
            // Copy register data (skip byte count)
            for (uint8_t i = 1; i <= byteCount && i < response.data.size(); i++) {
                buffer[pos++] = response.data[i];
            }
            break;
        }
        
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS: {
            // Add start address to response (for token ring matching)
            buffer[pos++] = (response.startAddr >> 8) & 0xFF;
            buffer[pos++] = response.startAddr & 0xFF;
            
            // Byte count
            if (response.data.size() == 0) {
                return 0;
            }
            
            uint8_t byteCount = response.data[0];
            buffer[pos++] = byteCount;
            
            // Copy coil/discrete data (skip byte count)
            for (uint8_t i = 1; i <= byteCount && i < response.data.size(); i++) {
                buffer[pos++] = response.data[i];
            }
            break;
        }
        
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS: {
            // No echo responses for writes - completely eliminate response frames
            // Write operations return nothing to prevent collisions
            return 0;  // Return 0 length = no frame built
        }
        
        default: {
            // Error response
            buffer[pos++] = response.function | 0x80;
            if (response.data.size() > 0) {
                buffer[pos++] = response.data[0]; // Exception code
            } else {
                buffer[pos++] = MB_EX_SLAVE_DEVICE_FAILURE;
            }
            break;
        }
    }
    
    return pos;
}

// =============================================================================
// MODBUS REQUEST PARSING
// =============================================================================
bool ModbusFrame::parseModbusRequest(const uint8_t* buffer, uint16_t length, ModbusRequest& request) {
    if (!buffer || length < 2) {
        return false;
    }
    
    uint16_t pos = 0;
    
    // Function code
    request.function = buffer[pos++];
    request.isResponse = false;
    request.data.clear();
    
    switch (request.function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS: {
            if (length < 5) return false;
            
            // Starting address
            request.startAddr = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
            pos += 2;
            
            // Quantity
            request.quantity = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
            pos += 2;
            break;
        }
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER: {
            if (length < 5) return false;
            
            // Starting address
            request.startAddr = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
            pos += 2;
            
            // Value
            request.quantity = 1;
            request.data.resize(2);
            request.data[0] = buffer[pos++];
            request.data[1] = buffer[pos++];
            break;
        }
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS: {
            if (length < 6) return false;
            
            // Starting address
            request.startAddr = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
            pos += 2;
            
            // Quantity
            request.quantity = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
            pos += 2;
            
            // Byte count
            if (pos >= length) return false;
            uint8_t byteCount = buffer[pos++];
            
            // Data
            if (pos + byteCount > length) return false;
            request.data.resize(byteCount + 1);
            request.data[0] = byteCount;
            for (uint8_t i = 0; i < byteCount; i++) {
                request.data[i + 1] = buffer[pos++];
            }
            break;
        }
        default:
            return false;
    }
    
    return true;
}

// =============================================================================
// MODBUS RESPONSE PARSING
// =============================================================================
bool ModbusFrame::parseModbusResponse(const uint8_t* buffer, uint16_t length, ModbusRequest& response) {
    if (!buffer || length < 2) {
        return false;
    }
    
    uint16_t pos = 0;
    
    // Function code
    response.function = buffer[pos++];
    response.isResponse = true;
    response.data.clear();
    
    // Handle error responses
    if (response.function & 0x80) {
        if (length < 2) return false;
        response.data.push_back(buffer[pos++]);
        return true;
    }
    
    switch (response.function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS: {
            // Parse custom response format with address
            if (length < 5) return false; // FC + Addr(2) + ByteCount + Data(min 1)
            
            // Extract address (custom ModBee format)
            response.startAddr = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
            pos += 2;
            
            // Byte count
            uint8_t byteCount = buffer[pos++];
            
            if (length < (4 + byteCount)) return false; // FC + Addr(2) + ByteCount + Data
            
            // Store response data properly
            response.data.resize(1 + byteCount);
            response.data[0] = byteCount;
            
            for (uint8_t i = 0; i < byteCount; i++) {
                response.data[1 + i] = buffer[pos++];
            }
            
            // Calculate quantity from byte count
            if (response.function == MB_FC_READ_HOLDING_REGISTERS || 
                response.function == MB_FC_READ_INPUT_REGISTERS) {
                response.quantity = byteCount / 2; // Register responses: 2 bytes per register
            } else {
                response.quantity = byteCount * 8; // Bit responses: 8 bits per byte (approximate)
            }
            break;
        }
        
        // No write response parsing - Writes don't generate responses in token ring
        
        default:
            return false;
    }
    
    return true;
}

// =============================================================================
// CRC CALCULATION
// =============================================================================
uint16_t ModbusFrame::calculateCRC16(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length == 0) {
        return 0;
    }
    
    uint16_t crc = 0xFFFF;
    
    for (uint16_t i = 0; i < length; i++) {
        crc ^= buffer[i];
        for (uint8_t j = 0; j < 8; j++) {
            if (crc & 0x0001) {
                crc >>= 1;
                crc ^= 0xA001;
            } else {
                crc >>= 1;
            }
        }
    }
    
    return crc;
}

// =============================================================================
// BIT PACKING UTILITIES
// =============================================================================
void ModbusFrame::packBits(const bool* bits, uint8_t* buffer, uint16_t numBits) {
    if (!bits || !buffer || numBits == 0) {
        return;
    }
    
    uint16_t numBytes = (numBits + 7) / 8;
    
    // Clear buffer
    for (uint16_t i = 0; i < numBytes; i++) {
        buffer[i] = 0;
    }
    
    // Pack bits
    for (uint16_t i = 0; i < numBits; i++) {
        if (bits[i]) {
            uint16_t byteIndex = i / 8;
            uint8_t bitIndex = i % 8;
            buffer[byteIndex] |= (1 << bitIndex);
        }
    }
}

void ModbusFrame::unpackBits(const uint8_t* buffer, bool* bits, uint16_t numBits) {
    if (!buffer || !bits || numBits == 0) {
        return;
    }
    
    for (uint16_t i = 0; i < numBits; i++) {
        uint16_t byteIndex = i / 8;
        uint8_t bitIndex = i % 8;
        bits[i] = (buffer[byteIndex] & (1 << bitIndex)) != 0;
    }
}

uint8_t ModbusFrame::getBitPackedBytes(uint16_t numBits) {
    return (numBits + 7) / 8;
}

// =============================================================================
// SIZE ESTIMATION
// =============================================================================
uint16_t ModbusFrame::estimateRequestSize(const ModbusRequest& request) {
    uint16_t size = 2; // Function code + address
    
    switch (request.function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            size += 2; // Quantity
            break;
            
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
            size += 2; // Value
            break;
            
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            size += 3 + request.data.size(); // Quantity + byte count + data
            break;
            
        default:
            break;
    }
    
    return size;
}

uint16_t ModbusFrame::estimateResponseSize(const ModbusRequest& request) {
    uint16_t size = 1; // Function code
    
    switch (request.function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
            size += 1 + getBitPackedBytes(request.quantity); // Byte count + data
            break;
            
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            size += 1 + (request.quantity * 2); // Byte count + data
            break;
            
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
            size += 4; // Address + value
            break;
            
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            size += 4; // Address + quantity
            break;
            
        default:
            size += 1; // Exception code
            break;
    }
    
    return size;
}

// =============================================================================
// FUNCTION CODE UTILITIES
// =============================================================================
bool ModbusFrame::isValidFunctionCode(uint8_t functionCode) {
    uint8_t fc = functionCode & 0x7F; // Remove error bit
    
    switch (fc) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return true;
        default:
            return false;
    }
}

bool ModbusFrame::isReadFunction(uint8_t functionCode) {
    switch (functionCode) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            return true;
        default:
            return false;
    }
}

bool ModbusFrame::isWriteFunction(uint8_t functionCode) {
    switch (functionCode) {
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return true;
        default:
            return false;
    }
}

bool ModbusFrame::isErrorResponse(uint8_t functionCode) {
    return (functionCode & 0x80) != 0;
}

uint8_t ModbusFrame::makeErrorResponse(uint8_t functionCode) {
    return functionCode | 0x80;
}

uint8_t ModbusFrame::getBaseFunctionCode(uint8_t functionCode) {
    return functionCode & 0x7F;
}

// =============================================================================
// VALIDATION
// =============================================================================
bool ModbusFrame::validateRequest(const ModbusRequest& request) {
    switch (request.function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
            return request.quantity > 0 && request.quantity <= 2000;
            
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            return request.quantity > 0 && request.quantity <= 125;
            
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
            return request.data.size() >= 2;
            
        case MB_FC_WRITE_MULTIPLE_COILS:
            return request.quantity > 0 && request.quantity <= 1968 && request.data.size() > 0;
            
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return request.quantity > 0 && request.quantity <= 123 && request.data.size() > 0;
            
        default:
            return false;
    }
}

bool ModbusFrame::validateResponse(const ModbusRequest& response) {
    switch (response.function) {
        case MB_FC_READ_COILS:
        case MB_FC_READ_DISCRETE_INPUTS:
            return response.data.size() > 0;
            
        case MB_FC_READ_HOLDING_REGISTERS:
        case MB_FC_READ_INPUT_REGISTERS:
            return response.data.size() > 0;
            
        case MB_FC_WRITE_SINGLE_COIL:
        case MB_FC_WRITE_SINGLE_REGISTER:
        case MB_FC_WRITE_MULTIPLE_COILS:
        case MB_FC_WRITE_MULTIPLE_REGISTERS:
            return true;
            
        default:
            return false;
    }
}

// =============================================================================
// DEBUG FUNCTIONS
// =============================================================================
void ModbusFrame::debugPrintRequest(const ModbusRequest& request) {
    // Debug implementation would go here
}

void ModbusFrame::debugPrintResponse(const ModbusRequest& response) {
    // Debug implementation would go here
}

// =============================================================================
// REQUEST OPTIMIZATION
// =============================================================================
bool ModbusFrame::canCombineRequests(const ModbusRequest& req1, const ModbusRequest& req2) {
    // Check if requests can be combined (same function, contiguous addresses)
    if (req1.function != req2.function) return false;
    if (!isReadFunction(req1.function)) return false;
    
    uint16_t end1 = req1.startAddr + req1.quantity;
    uint16_t start2 = req2.startAddr;
    
    return end1 == start2;
}

ModbusRequest ModbusFrame::combineRequests(const ModbusRequest& req1, const ModbusRequest& req2) {
    ModbusRequest combined = req1;
    combined.quantity = req1.quantity + req2.quantity;
    return combined;
}

std::vector<ModbusRequest> ModbusFrame::optimizeRequests(const std::vector<ModbusRequest>& requests) {
    // Simple optimization - could be enhanced
    return requests;
}