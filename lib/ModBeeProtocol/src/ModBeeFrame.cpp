#include "ModBeeGlobal.h"

// =============================================================================
// CONTROL FRAME BUILDING
// =============================================================================
uint16_t ModBeeFrame::buildControlFrame(
    uint8_t* buffer,
    uint8_t srcNodeID,
    uint8_t nextMasterID,
    uint8_t addNodeID,
    uint8_t removeNodeID) {
    
    if (!buffer) {
        return 0;
    }
    
    uint16_t pos = 0;
    
    // Start of frame
    buffer[pos++] = MODBEE_SOF;
    
    // Source node ID
    buffer[pos++] = srcNodeID;
    
    // Next master ID (0 if not passing token)
    buffer[pos++] = nextMasterID;
    
    // Add node ID (0 if not adding)
    buffer[pos++] = addNodeID;
    
    // Remove node ID (0 if not removing)
    buffer[pos++] = removeNodeID;
    
    // Calculate and append CRC
    uint16_t crc = calculateCRC(buffer, pos);
    buffer[pos++] = (crc >> 8) & 0xFF;
    buffer[pos++] = crc & 0xFF;
    
    return pos;
}

// =============================================================================
// DATA FRAME BUILDING
// =============================================================================
uint16_t ModBeeFrame::buildDataFrame(
    uint8_t* buffer,
    uint8_t srcNodeID,
    uint8_t nextMasterID,
    uint8_t addNodeID,
    uint8_t removeNodeID,
    const std::vector<PendingModbusOp>& operations,
    ModBeeProtocol& protocol) {
    
    if (!buffer) {
        return 0;
    }
    
    // CORRUPTION DETECTION: Check buffer alignment
    uintptr_t bufferAddr = (uintptr_t)buffer;
    if (bufferAddr == 0 || (bufferAddr & 0x3) != 0) {
        MBEE_DEBUG_IO("FRAME BUILD: Buffer alignment error: 0x%08X", (uint32_t)bufferAddr);
        return 0;
    }
    
    uint16_t pos = 0;
    
    // Build header with overflow protection
    if (pos + 5 > MODBEE_MAX_TX_BUFFER - 10) { // Reserve space for CRC and safety margin
        return 0;
    }
    
    buffer[pos++] = MODBEE_SOF;
    
    // Source node ID
    buffer[pos++] = srcNodeID;
    
    // Next master ID
    buffer[pos++] = nextMasterID;
    
    // Add node ID
    buffer[pos++] = addNodeID;
    
    // Remove node ID
    buffer[pos++] = removeNodeID;
    
    // Add operations with strict validation
    for (const auto& op : operations) {
        // Pre-flight check: ensure we have minimum space
        if (pos + 10 > MODBEE_MAX_TX_BUFFER - 10) {
            MBEE_DEBUG_IO("FRAME BUILD: Stopping - insufficient space at pos %d", pos);
            break;
        }
        
        uint16_t posBeforeSection = pos;
        
        // Add section delimiter
        buffer[pos++] = MODBEE_PACKET_DELIM;
        
        // Add slave ID
        buffer[pos++] = op.destNodeID;
        
        // Build Modbus section
        uint16_t modbusLen = 0;
        if (op.req.isResponse) {
            modbusLen = ModbusFrame::buildModbusResponse(&buffer[pos], op.req);
        } else {
            modbusLen = ModbusFrame::buildModbusRequest(&buffer[pos], &op);
        }
        
        // Validate Modbus build result
        if (modbusLen == 0 || pos + modbusLen >= MODBEE_MAX_TX_BUFFER - 2) {
            MBEE_DEBUG_IO("FRAME BUILD: Modbus build failed or too large (%d bytes)", modbusLen);
            pos = posBeforeSection; // Rollback this section
            break;
        }
        
        pos += modbusLen;
        
        // CORRUPTION DETECTION: Check for buffer overrun
        if (pos >= MODBEE_MAX_TX_BUFFER) {
            MBEE_DEBUG_IO("FRAME BUILD: CRITICAL - Buffer overrun detected! pos=%d", pos);
            return 0; // Abort immediately
        }
    }
    
    // Final space check for CRC
    if (pos + 2 > MODBEE_MAX_TX_BUFFER) {
        MBEE_DEBUG_IO("FRAME BUILD: No space for CRC at pos %d", pos);
        return 0;
    }
    
    // Calculate and add CRC
    uint16_t crc = calculateCRC(buffer, pos);
    buffer[pos++] = (crc >> 8) & 0xFF;
    buffer[pos++] = crc & 0xFF;
    
    return pos;
}

// =============================================================================
// FRAME PARSING
// =============================================================================
bool ModBeeFrame::parseHeader(
    const uint8_t* buffer,
    uint16_t length,
    uint8_t& srcNodeID,
    uint8_t& nextMasterID,
    uint8_t& addNodeID,
    uint8_t& removeNodeID) {
    
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return false;
    }
    
    // Check start of frame
    if (buffer[0] != MODBEE_SOF) {
        return false;
    }
    
    // Extract header fields
    srcNodeID = buffer[1];
    nextMasterID = buffer[2];
    addNodeID = buffer[3];
    removeNodeID = buffer[4];
    
    return true;
}

bool ModBeeFrame::isValidFrame(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return false;
    }
    
    // Check start of frame
    if (buffer[0] != MODBEE_SOF) {
        return false;
    }
    
    // Verify CRC
    return verifyCRC(buffer, length);
}

bool ModBeeFrame::verifyCRC(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return false;
    }
    
    // CRITICAL: Frame must start with SOF
    if (buffer[0] != MODBEE_SOF) {
        return false;
    }
    
    // CRITICAL: Frame must have reasonable structure
    // Header: SOF(1) + SrcNode(1) + NextMaster(1) + Add(1) + Remove(1) = 5 bytes minimum
    // Plus at least CRC(2) = 7 bytes minimum total
    if (length < 7) {
        return false;
    }
    
    // Extract and validate CRC
    uint16_t receivedCRC = ((uint16_t)buffer[length - 2] << 8) | buffer[length - 1];
    uint16_t calculatedCRC = calculateCRC(buffer, length - 2);
    
    bool valid = (receivedCRC == calculatedCRC);
    
    // REMOVED: All node ID validation - network supports 1-250 nodes
    // No structure validation needed - let the protocol handle node validation
    
    return valid;
}

// =============================================================================
// MODBUS SECTION DETECTION
// =============================================================================
bool ModBeeFrame::hasModbusData(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN + 1) {
        return false;
    }
    
    // Look for packet delimiter after header
    for (uint16_t i = 5; i < length - 2; i++) {
        if (buffer[i] == MODBEE_PACKET_DELIM) {
            return true;
        }
    }
    
    return false;
}

int ModBeeFrame::findModbusSections(
    const uint8_t* buffer,
    uint16_t length,
    std::vector<std::pair<uint16_t, uint16_t>>& sections) {
    
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return 0;
    }
    
    sections.clear();
    
    // Start searching after header (position 5)
    uint16_t pos = 5;
    uint16_t dataEnd = length - 2; // Exclude CRC
    
    while (pos < dataEnd) {
        // Look for section delimiter
        if (buffer[pos] == MODBEE_PACKET_DELIM) {
            pos++; // Skip delimiter
            
            if (pos >= dataEnd) {
                break; // No more data after delimiter
            }
            
            // Next byte should be destination node ID
            uint16_t sectionStart = pos;
            
            // Find end of this section (next delimiter or end of data)
            uint16_t sectionEnd = dataEnd;
            for (uint16_t i = pos + 1; i < dataEnd; i++) {
                if (buffer[i] == MODBEE_PACKET_DELIM) {
                    sectionEnd = i;
                    break;
                }
            }
            
            // Add section if it has meaningful data (minimum 3 bytes: nodeID + FC + data)
            if (sectionEnd > sectionStart + 2) {
                sections.push_back(std::make_pair(sectionStart, sectionEnd));
                MBEE_DEBUG_IO("SECTION: Found section from %d to %d (length %d)", 
                    sectionStart, sectionEnd, sectionEnd - sectionStart);
            }
            
            pos = sectionEnd;
        } else {
            pos++;
        }
    }
    
    return sections.size();
}

uint8_t ModBeeFrame::extractTargetNodeID(const uint8_t* buffer, uint16_t length, uint16_t sectionStart) {
    if (!buffer || sectionStart >= length - 1) {
        return 0;
    }
    
    // Target node ID is the first byte of the section
    return buffer[sectionStart];
}

// =============================================================================
// CRC CALCULATION
// =============================================================================
uint16_t ModBeeFrame::calculateCRC(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length == 0) {
        return 0;
    }
    
    uint16_t crc = 0xFFFF;
    
    for (uint16_t i = 0; i < length; i++) {
        crc ^= (uint16_t)buffer[i];
        
        for (uint8_t j = 0; j < 8; j++) {
            if (crc & 0x0001) {
                crc = (crc >> 1) ^ 0xA001;
            } else {
                crc = crc >> 1;
            }
        }
    }
    
    return crc;
}

// =============================================================================
// FRAME VALIDATION
// =============================================================================
bool ModBeeFrame::validateFrameLength(uint16_t length) {
    return (length >= MODBEE_MIN_FRAME_LEN && length <= MODBEE_MAX_TX_BUFFER);
}

uint16_t ModBeeFrame::getMaxDataPayload() {
    // Max frame size minus: SOF(1) + Header(4) + CRC(2)
    return MODBEE_MAX_TX_BUFFER - 7;
}

bool ModBeeFrame::canFitInFrame(uint16_t currentSize, uint16_t additionalSize) {
    return (currentSize + additionalSize + 2) <= MODBEE_MAX_TX_BUFFER; // +2 for CRC
}

// =============================================================================
// SPECIALIZED FRAME BUILDERS
// =============================================================================
uint16_t ModBeeFrame::buildPresenceFrame(uint8_t* buffer, uint8_t srcNodeID) {
    return buildControlFrame(buffer, srcNodeID, 0, 0, 0);
}

uint16_t ModBeeFrame::buildTokenFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t nextMasterID) {
    return buildControlFrame(buffer, srcNodeID, nextMasterID, 0, 0);
}

uint16_t ModBeeFrame::buildConnectionFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t addNodeID) {
    return buildControlFrame(buffer, srcNodeID, 0, addNodeID, 0);
}

uint16_t ModBeeFrame::buildDisconnectionFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t removeNodeID) {
    return buildControlFrame(buffer, srcNodeID, 0, 0, removeNodeID);
}

// =============================================================================
// FRAME CLASSIFICATION
// =============================================================================
bool ModBeeFrame::isTokenFrame(const uint8_t* buffer, uint16_t length) {
    if (!isValidFrame(buffer, length)) {
        return false;
    }
    
    // Token frame has next master ID set and is a control-only frame
    return (buffer[2] != 0 && !hasModbusData(buffer, length));
}

bool ModBeeFrame::isPresenceFrame(const uint8_t* buffer, uint16_t length) {
    if (!isValidFrame(buffer, length)) {
        return false;
    }
    
    // Presence frame has all control fields zero and no Modbus data
    return (buffer[2] == 0 && buffer[3] == 0 && buffer[4] == 0 && !hasModbusData(buffer, length));
}

bool ModBeeFrame::isConnectionFrame(const uint8_t* buffer, uint16_t length) {
    if (!isValidFrame(buffer, length)) {
        return false;
    }
    
    // Connection frame has add node ID set
    return (buffer[3] != 0);
}

bool ModBeeFrame::isDisconnectionFrame(const uint8_t* buffer, uint16_t length) {
    if (!isValidFrame(buffer, length)) {
        return false;
    }
    
    // Disconnection frame has remove node ID set
    return (buffer[4] != 0);
}

bool ModBeeFrame::isDataFrame(const uint8_t* buffer, uint16_t length) {
    if (!isValidFrame(buffer, length)) {
        return false;
    }
    
    // Data frame has Modbus data sections
    return hasModbusData(buffer, length);
}

// =============================================================================
// FIELD EXTRACTION
// =============================================================================
uint8_t ModBeeFrame::getSourceNodeID(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return 0;
    }
    
    return buffer[1];
}

uint8_t ModBeeFrame::getNextMasterID(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return 0;
    }
    
    return buffer[2];
}

uint8_t ModBeeFrame::getAddNodeID(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return 0;
    }
    
    return buffer[3];
}

uint8_t ModBeeFrame::getRemoveNodeID(const uint8_t* buffer, uint16_t length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return 0;
    }
    
    return buffer[4];
}

// =============================================================================
// MODBUS SECTION EXTRACTION
// =============================================================================
bool ModBeeFrame::extractModbusSection(
    const uint8_t* buffer,
    uint16_t length,
    uint16_t sectionStart,
    uint16_t sectionEnd,
    uint8_t& targetNodeID,
    std::vector<uint8_t>& modbusData) {
    
    if (!buffer || sectionStart >= sectionEnd || sectionEnd > length) {
        return false;
    }
    
    if (sectionStart >= length - 1) {
        return false;
    }
    
    // Extract target node ID
    targetNodeID = buffer[sectionStart];
    
    // Extract Modbus data (skip the target node ID)
    modbusData.clear();
    for (uint16_t i = sectionStart + 1; i < sectionEnd; i++) {
        modbusData.push_back(buffer[i]);
    }
    
    return !modbusData.empty();
}

uint16_t ModBeeFrame::addModbusSection(
    uint8_t* buffer,
    uint16_t currentPos,
    uint8_t targetNodeID,
    const std::vector<uint8_t>& modbusData) {
    
    if (!buffer || modbusData.empty()) {
        return currentPos;
    }
    
    // Check if we have space for delimiter + target ID + data
    if (currentPos + 2 + modbusData.size() >= MODBEE_MAX_TX_BUFFER - 2) {
        return currentPos; // Not enough space
    }
    
    // Add section delimiter
    buffer[currentPos++] = MODBEE_PACKET_DELIM;
    
    // Add target node ID
    buffer[currentPos++] = targetNodeID;
    
    // Add Modbus data
    for (uint8_t byte : modbusData) {
        buffer[currentPos++] = byte;
    }
    
    return currentPos;
}

// =============================================================================
// FRAME SIZE ESTIMATION
// =============================================================================
uint16_t ModBeeFrame::estimateFrameSize(const std::vector<PendingModbusOp>& operations) {
    uint16_t size = MODBEE_MIN_FRAME_LEN; // Header + CRC
    
    if (!operations.empty()) {
        // Group by destination node to estimate sections
        std::map<uint8_t, uint16_t> nodeSizes;
        
        for (const auto& op : operations) {
            uint16_t reqSize = ModbusFrame::estimateRequestSize(op.req);
            nodeSizes[op.destNodeID] += reqSize;
        }
        
        // Add section overhead for each destination node
        for (const auto& nodeSize : nodeSizes) {
            size += 2; // Delimiter + target node ID
            size += nodeSize.second;
        }
    }
    
    return size;
}

// =============================================================================
// DEBUG AND UTILITY FUNCTIONS
// =============================================================================
void ModBeeFrame::debugPrintFrame(const uint8_t* buffer, uint16_t length, ModBeeProtocol& protocol) {
    #ifdef DEBUG_MODBEE_FRAMES
    protocol.reportError(MBEE_DEBUG_INFO, "Frame debug data available");
    // Frame data would be formatted and passed through error callback if needed
    #endif
}

bool ModBeeFrame::compactFrame(uint8_t* buffer, uint16_t& length) {
    if (!buffer || length < MODBEE_MIN_FRAME_LEN) {
        return false;
    }
    
    // This could implement frame compression/compaction if needed
    // For now, just validate the frame is properly formatted
    return isValidFrame(buffer, length);
}