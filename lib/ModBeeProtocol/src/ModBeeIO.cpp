#include "ModBeeGlobal.h"

// =============================================================================
// CONSTRUCTOR AND DESTRUCTOR
// =============================================================================
ModBeeIO::ModBeeIO(ModBeeProtocol& protocol) 
    : _protocol(protocol), 
      _stream(nullptr), 
      _primaryRxPos(0),
      _processingBufferLen(0),
      _lastBusActivity(0),
    _lastBusActivityMicros(0),
      _rxAvailable(false) {
    
    // Initialize frame queue
    _frameQueue.clear();
    
    // Initialize statistics
    resetStatistics();
}

ModBeeIO::~ModBeeIO() {
    // Clean up any resources if needed
}

// =============================================================================
// INITIALIZATION
// =============================================================================
bool ModBeeIO::begin(Stream* serialStream) {
    if (!serialStream) {
        return false;
    }
    
    _stream = serialStream;
    _primaryRxPos = 0;
    _processingBufferLen = 0;
    _lastBusActivity = 0;
    _lastBusActivityMicros = 0;
    _rxAvailable = false;
    
    // Clear frame queue
    _frameQueue.clear();
    
    // Reset statistics
    resetStatistics();
    
    return true;
}

// =============================================================================
// MAIN PROCESSING LOOP - DOUBLE BUFFER SYSTEM
// =============================================================================
void ModBeeIO::processIncoming() {
    if (!_stream) {
        return;
    }
    
    // Step 1: Continuously fill primary buffer
    bool dataReceived = false;
    while (_stream->available() && _primaryRxPos < MODBEE_MAX_RX_BUFFER - 1) {
        int incomingByte = _stream->read();
        if (incomingByte == -1) break;
        
        uint8_t byte = (uint8_t)incomingByte;
        
        // SOF detection - only restart the frame buffer if we have NOT yet
        // accumulated enough bytes to be mid-frame.  If we already have
        // MODBEE_MIN_FRAME_LEN or more bytes buffered, this 0x7E is almost
        // certainly a payload data byte inside an in-progress data frame
        // (register value 126, 0x7E00, 0x7Exx …).  Resetting here would
        // silently discard a valid frame, the sender would never receive
        // _tokenConfirmed, retry-exhaust, and remove the node from the ring.
        // We rely on CRC validation in findNextCompleteFrame to identify the
        // true frame boundaries regardless of payload content.
        if (byte == MODBEE_SOF && _primaryRxPos < MODBEE_MIN_FRAME_LEN) {
            _primaryRxPos = 0;
        }
        
        _primaryRxBuffer[_primaryRxPos++] = byte;
        _lastBusActivity = millis();
        _lastBusActivityMicros = micros();
        dataReceived = true;
    }
    
    // Update availability flag
    _rxAvailable = dataReceived; //(_stream->available() > 0);
    
    // Step 2: Extract complete frames from primary buffer (if any new data)
    if (dataReceived) {
        extractCompleteFrames();
    }
    
    // Step 3: Process any queued complete frames
    processQueuedFrames();
}

// =============================================================================
// FRAME EXTRACTION FROM PRIMARY BUFFER
// =============================================================================
void ModBeeIO::extractCompleteFrames() {
    uint16_t searchPos = 0;
    
    while (searchPos < _primaryRxPos) {
        uint16_t frameStart, frameEnd;
        
        if (findNextCompleteFrame(frameStart, frameEnd)) {
            // Found a complete frame!
            if (_frameQueue.size() < MAX_FRAME_QUEUE) {
                CompleteFrame frame;
                frame.length = frameEnd - frameStart;
                
                // Copy complete frame to queue
                memcpy(frame.data, &_primaryRxBuffer[frameStart], frame.length);
                _frameQueue.push_back(frame);
                
                //MBEE_DEBUG_IO("EXTRACTED: Complete frame queued (len:%d, queue:%d)", 
                //    frame.length, _frameQueue.size());
            } else {
                incrementBufferOverflow();
            }
            
            // Remove processed frame from primary buffer
            shiftPrimaryBuffer(frameEnd);
            searchPos = 0; // Start over after shift
        } else {
            // No complete frame found.  If the buffer is nearly full and
            // no valid CRC frame can be assembled from it, flush bytes up to
            // the next SOF so the receiver doesn't stall permanently on
            // garbage / partial frames left by noise or collisions.
            if (_primaryRxPos >= (MODBEE_MAX_RX_BUFFER * 3 / 4)) {
                uint16_t skip = 1;
                while (skip < _primaryRxPos && _primaryRxBuffer[skip] != MODBEE_SOF) {
                    skip++;
                }
                shiftPrimaryBuffer(skip);
            }
            break; // No more complete frames
        }
    }
}

// =============================================================================
// FIND NEXT COMPLETE FRAME IN PRIMARY BUFFER
// =============================================================================
bool ModBeeIO::findNextCompleteFrame(uint16_t& frameStart, uint16_t& frameEnd) {
    // Scan through all SOF positions in the buffer until we find one that
    // produces a CRC-valid frame.  Trying multiple SOF positions is essential
    // because:
    //  a) Genuine noise / partial frames can leave a stale SOF in the buffer
    //     in front of a valid frame.
    //  b) Payload data bytes can equal MODBEE_SOF (0x7E) — with the mid-frame
    //     reset guard in processIncoming these bytes now stay in the buffer,
    //     so we must skip past them if they don't lead to a valid CRC match.
    uint16_t searchFrom = 0;

    while (searchFrom < _primaryRxPos) {
        // Find the next SOF marker from searchFrom
        frameStart = searchFrom;
        while (frameStart < _primaryRxPos && _primaryRxBuffer[frameStart] != MODBEE_SOF) {
            frameStart++;
        }

        if (frameStart >= _primaryRxPos) {
            return false; // No more SOF markers in buffer
        }

        // Try all lengths from this SOF position
        for (uint16_t testEnd = frameStart + MODBEE_MIN_FRAME_LEN; testEnd <= _primaryRxPos; testEnd++) {
            if (ModBeeFrame::isValidFrame(&_primaryRxBuffer[frameStart], testEnd - frameStart)) {
                frameEnd = testEnd;
                return true;
            }
        }

        // No valid frame starting at this SOF; advance past it and try the next one
        searchFrom = frameStart + 1;
    }

    return false; // No complete valid frame found
}

// =============================================================================
// PROCESS ALL QUEUED COMPLETE FRAMES
// =============================================================================
void ModBeeIO::processQueuedFrames() {
    while (!_frameQueue.empty()) {
        CompleteFrame frame = _frameQueue.front();
        _frameQueue.pop_front();  // O(1) operation instead of O(n)!
        
        // Copy to processing buffer
        memcpy(_processingBuffer, frame.data, frame.length);
        _processingBufferLen = frame.length;
        
        // Process this complete frame safely
        processCompleteFrame();
        
        //MBEE_DEBUG_IO("PROCESSED: Frame from queue (len:%d, remaining:%d)", 
        //    frame.length, _frameQueue.size());
    }
}

// =============================================================================
// SHIFT PRIMARY BUFFER TO REMOVE PROCESSED DATA
// =============================================================================
void ModBeeIO::shiftPrimaryBuffer(uint16_t shiftAmount) {
    if (shiftAmount >= _primaryRxPos) {
        _primaryRxPos = 0; // Clear entire buffer
        return;
    }
    
    // Shift remaining data to front
    memmove(_primaryRxBuffer, &_primaryRxBuffer[shiftAmount], _primaryRxPos - shiftAmount);
    _primaryRxPos -= shiftAmount;
}

// =============================================================================
// SAFE FRAME PROCESSING (ISOLATED PROCESSING BUFFER)
// =============================================================================
void ModBeeIO::processCompleteFrame() {
    if (_processingBufferLen < MODBEE_MIN_FRAME_LEN) {
        return;
    }
    
    // Verify CRC on isolated processing buffer
    if (!ModBeeFrame::verifyCRC(_processingBuffer, _processingBufferLen)) {
        incrementCrcError();
        _protocol.reportError(MBEE_CRC_ERROR, "CRC verification failed");
        return;
    }
    
    incrementFrameReceived();
    
    // Parse header from processing buffer
    uint8_t srcNodeID, nextMasterID, addNodeID, removeNodeID;
    if (!ModBeeFrame::parseHeader(_processingBuffer, _processingBufferLen, srcNodeID, nextMasterID, addNodeID, removeNodeID)) {
        incrementFramingError();
        _protocol.reportError(MBEE_FRAME_ERROR, "Header parsing failed");
        return;
    }

    // Inform protocol of control traffic for state-machine safety decisions.
    _protocol.noteControlFrameRx(srcNodeID, nextMasterID, addNodeID, removeNodeID);
    
    // Update node seen
    _protocol.updateNodeSeen(srcNodeID);
    
    // PRIORITY 1: Process any Modbus data FIRST (time-critical for synchronized outputs)
    if (ModBeeFrame::hasModbusData(_processingBuffer, _processingBufferLen)) {
        processModbusData(srcNodeID);
    }
    
    // PRIORITY 2: Handle control frame aspects (less time-critical)
    handleControlFrame(srcNodeID, nextMasterID, addNodeID, removeNodeID);
    
    /*

    // DEBUG OUTPUT MOVED TO END (after time-critical processing)
    char hexDump[1024] = "";
    char* p = hexDump;
    for (int i = 0; i < _processingBufferLen; i++) {
        sprintf(p, "%02X ", _processingBuffer[i]);
        p += 3;
        if (p - hexDump > 1000) break;
    }
    MBEE_DEBUG_IO("PROCESSED FRAME (%d bytes): %s", _processingBufferLen, hexDump);
    MBEE_DEBUG_FRAME(MBEE_FRAME_RX, _processingBuffer, _processingBufferLen);

    */
}

// =============================================================================
// CONTROL FRAME HANDLING
// =============================================================================
void ModBeeIO::handleControlFrame(uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID) {

    // Check for join invitation (coordinator sending invitation)
    if (removeNodeID == MODBEE_JOIN_TOKEN && addNodeID != 0) {
        //MBEE_DEBUG_PROTOCOL("JOIN INVITATION: For Node %d from Node %d", addNodeID, srcNodeID);
        _protocol.handleJoinInvitation(addNodeID, srcNodeID);
    }

    // Check for join response (node responding to invitation)
    if (nextMasterID == 0 && removeNodeID == 0 && addNodeID != 0) {
        //MBEE_DEBUG_PROTOCOL("JOIN RESPONSE: From Node %d to Node %d", srcNodeID, addNodeID);
        _protocol.handleJoinResponse(addNodeID, srcNodeID);
    }       
    
    // Check if token is being passed to us
    if (nextMasterID == _protocol.getNodeID()) {
        //MBEE_DEBUG_PROTOCOL("TOKEN: Received from Node %d (state: %s)", srcNodeID, _protocol.getStateName(_protocol.getState()));
        // Pass isDirected=true: the sender explicitly targeted us, so they are
        // a confirmed ring member regardless of our current state.
        _protocol.handleTokenReceived(srcNodeID, true);
        _protocol.setTokenReceivedForUs();
    } else if (nextMasterID != 0) {
        //MBEE_DEBUG_PROTOCOL("TOKEN: Passed from Node %d to Node %d", srcNodeID, nextMasterID);
        _protocol.handleTokenReceived(srcNodeID, false);
    }
    
    // Handle Node Adds - ONLY if it's a real join response (not invitation)
    if (addNodeID != 0 && removeNodeID != MODBEE_JOIN_TOKEN) {
        MBEE_DEBUG_PROTOCOL("NODE ADD: Request to add Node %d from Node %d", addNodeID, srcNodeID);
        _protocol.handleNodeAdd(addNodeID, srcNodeID);
    }
    
    // Handle node removal requests (but not join tokens)
    if (removeNodeID != 0 && removeNodeID != MODBEE_JOIN_TOKEN) {
        MBEE_DEBUG_PROTOCOL("NODE REMOVE: Request to remove Node %d from Node %d", removeNodeID, srcNodeID);
        _protocol.handleNodeRemove(removeNodeID, srcNodeID);
    }
}

// =============================================================================
// MODBUS DATA PROCESSING
// =============================================================================
void ModBeeIO::processModbusData(uint8_t srcNodeID) {
    // Find Modbus sections in PROCESSING buffer
    std::vector<std::pair<uint16_t, uint16_t>> sections;
    int sectionCount = ModBeeFrame::findModbusSections(_processingBuffer, _processingBufferLen, sections);
    
    if (sectionCount <= 0) {
        return;
    }
    
    // Process each section from processing buffer
    for (const auto& section : sections) {
        processModbusSection(_processingBuffer, section.first, section.second, srcNodeID);
    }
}

void ModBeeIO::processModbusSection(const uint8_t* buffer, uint16_t start, uint16_t end, uint8_t srcNodeID) {
    if (start >= end || end > _processingBufferLen) {
        return;
    }
    
    uint16_t pos = start;
    
    // First byte: destination (slave) node ID
    uint8_t targetSlaveID = buffer[pos];
    pos++;
    
    // Next 2 bytes: Modbus data length (length-prefixed section format).
    // This guards against payload bytes equal to MODBEE_PACKET_DELIM (0x7C)
    // being misidentified as section delimiters by the scanner.
    if (pos + 2 > end) {
        return; // Not enough bytes for length field
    }
    uint16_t declaredLen = ((uint16_t)buffer[pos] << 8) | buffer[pos + 1];
    pos += 2;
    
    // Clamp to the actual section bounds for safety
    uint16_t modbusEnd = pos + declaredLen;
    if (modbusEnd > end) {
        modbusEnd = end;
    }
    
    // Only process if this section is meant for us
    if (targetSlaveID != _protocol.getNodeID()) {
        //MBEE_DEBUG_IO("MODBUS: Section not for us (SlaveID:%d), ignoring", targetSlaveID);
        return;
    }
    
    uint16_t modbusLen = modbusEnd - pos;
    if (modbusLen < 2) {
        MBEE_DEBUG_IO("MODBUS: Frame too short (%d bytes)", modbusLen);
        return;
    }
    
    // Determine if this is a response by analyzing the frame structure
    bool isResponse = false;
    uint8_t functionCode = buffer[pos];
    
    // Check if it's an error response (function code with 0x80 bit set)
    if (functionCode & 0x80) {
        isResponse = true;
        MBEE_DEBUG_IO("MODBUS: Detected ERROR RESPONSE FC:%02X", functionCode);
    }
    // Check for valid READ response patterns ONLY
    else if (functionCode >= 0x01 && functionCode <= 0x04) {
        // Check if this looks like a response (has address + byte count structure)
        if (modbusLen >= 5) { // FC + Addr(2) + ByteCount + Data(min 1)
            uint8_t byteCount = buffer[pos + 3]; // After FC + Addr(2)
            if (modbusLen == (4 + byteCount)) { // FC + Addr(2) + ByteCount + Data = exact match
                isResponse = true;
                //MBEE_DEBUG_IO("MODBUS: Detected read response FC:%02X with %d data bytes", functionCode, byteCount);
            } else {
                //MBEE_DEBUG_IO("MODBUS: Detected read request FC:%02X", functionCode);
            }
        }
    }
    
    ModbusRequest modbusFrame;
    bool parseSuccess = false;
    
    if (isResponse) {
        parseSuccess = ModbusFrame::parseModbusResponse(&buffer[pos], modbusLen, modbusFrame);
        if (parseSuccess) {
            handleModbusResponse(modbusFrame, srcNodeID);
        } else {
            MBEE_DEBUG_IO("MODBUS: Failed to parse response");
        }
    } else {
        parseSuccess = ModbusFrame::parseModbusRequest(&buffer[pos], modbusLen, modbusFrame);
        if (parseSuccess) {
            handleModbusRequest(modbusFrame, srcNodeID);
        } else {
            MBEE_DEBUG_IO("MODBUS: Failed to parse request");
        }
    }
    
    if (!parseSuccess) {
        MBEE_DEBUG_IO("MODBUS: Failed to parse frame - dumping raw data:");
        char hexDump[256] = "";
        char* p = hexDump;
        for (uint16_t i = pos; i < end && i < pos + 32; i++) {
            sprintf(p, "%02X ", buffer[i]);
            p += 3;
        }
        MBEE_DEBUG_IO("MODBUS: Raw data: %s", hexDump);
    }
}

// =============================================================================
// MODBUS REQUEST AND RESPONSE HANDLING
// =============================================================================
void ModBeeIO::handleModbusRequest(const ModbusRequest& request, uint8_t srcNodeID) {
    MBEE_DEBUG_MODBUS(MBEE_MODBUS_REQUEST, srcNodeID, request);
    
    // Process the request using ModbusHandler
    ModbusHandler handler(_protocol.getDataMap());
    ModbusRequest response;
    
    // Pass the sourceNodeID to the handler so it can be recorded for failsafe purposes
    if (handler.processRequest(request, response, srcNodeID)) {
        // Only queue response if it's a read operation
        if (ModbusFrame::isReadFunction(request.function)) {
            PendingResponse pendingResponse;
            pendingResponse.response = response;
            pendingResponse.destNodeID = srcNodeID;
            pendingResponse.sourceNodeID = _protocol.getNodeID();
            pendingResponse.timestamp = millis();
            
            _protocol.getOperations().addPendingResponse(pendingResponse);
            //MBEE_DEBUG_IO("REQUEST: Queued read response FC:%02X to Node:%d", request.function, srcNodeID);
        } else {
            //MBEE_DEBUG_IO("REQUEST: Write operation FC:%02X completed (no response)", request.function);
        }
    } else {
        // Error occurred - only send error response for read operations
        if (ModbusFrame::isReadFunction(request.function)) {
            PendingResponse errorResponse;
            errorResponse.response = response; // Contains error
            errorResponse.destNodeID = srcNodeID;
            errorResponse.sourceNodeID = _protocol.getNodeID();
            errorResponse.timestamp = millis();
            
            _protocol.getOperations().addPendingResponse(errorResponse);
            MBEE_DEBUG_IO("REQUEST: Queued error response to Node:%d", srcNodeID);
        } else {
            MBEE_DEBUG_IO("REQUEST: Write operation failed, no error response");
        }
    }
}

void ModBeeIO::handleModbusResponse(const ModbusRequest& response, uint8_t srcNodeID) {
    //MBEE_DEBUG_IO("RESPONSE: Processing FC:%02X from Node:%d addr:%d with %d bytes data", 
    //    response.function, srcNodeID, response.startAddr, response.data.size());
    
    // Try to match and fulfill pending request
    bool fulfilled = _protocol.getOperations().matchAndFulfillResponse(response, srcNodeID);
    
    if (fulfilled) {
        //MBEE_DEBUG_IO("RESPONSE: Direct fulfillment successful for Node:%d FC:%02X Addr:%d", 
        //    srcNodeID, response.function, response.startAddr);
    } else {
        MBEE_DEBUG_IO("RESPONSE: No matching request found for Node:%d FC:%02X Addr:%d", 
            srcNodeID, response.function, response.startAddr);
    }
}

// =============================================================================
// FRAME TRANSMISSION
// =============================================================================
bool ModBeeIO::sendTokenFrame(uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID) {
    if (!isTransmissionReady()) {
        return false;
    }
    
    uint8_t buffer[MODBEE_MAX_TX_BUFFER];
    
    uint16_t frameLen = ModBeeFrame::buildControlFrame(
        buffer, srcNodeID, nextMasterID, addNodeID, removeNodeID
    );
    
    if (frameLen == 0) {
        MBEE_DEBUG_IO("TOKEN: Failed to build frame");
        return false;
    }
    
    bool sent = sendFrame(buffer, frameLen);
    if (sent) {
        //MBEE_DEBUG_IO("TOKEN: Sent to Node %d", nextMasterID);
    } else {
        MBEE_DEBUG_IO("TOKEN: Send failed to Node %d", nextMasterID);
    }
    return sent;
}

bool ModBeeIO::sendConnectionFrame(uint8_t srcNodeID, uint8_t addNodeID) {
    if (!isTransmissionReady()) {
        return false;
    }

    uint8_t buffer[MODBEE_MAX_TX_BUFFER];
    
    uint16_t frameLen = ModBeeFrame::buildControlFrame(
        buffer, srcNodeID, 0, addNodeID, 0
    );
    
    if (frameLen == 0) {
        MBEE_DEBUG_IO("CONNECTION: Failed to build frame");
        return false;
    }

    bool sent = sendFrame(buffer, frameLen);
    
    if (sent) {
        MBEE_DEBUG_IO("CONNECTION: Sent for Node %d", addNodeID);
    } else {
        MBEE_DEBUG_IO("CONNECTION: Send failed for Node %d", addNodeID);
    }
    return sent;
}

bool ModBeeIO::sendDisconnectionFrame(uint8_t srcNodeID, uint8_t removeNodeID) {
    if (!isTransmissionReady()) {
        return false;
    }

    uint8_t buffer[MODBEE_MAX_TX_BUFFER];
    
    uint16_t frameLen = ModBeeFrame::buildControlFrame(
        buffer, srcNodeID, 0, 0, removeNodeID
    );
    
    if (frameLen == 0) {
        MBEE_DEBUG_IO("DISCONNECTION: Failed to build frame");
        return false;
    }
    
    bool sent = sendFrame(buffer, frameLen);

    if (sent) {
        MBEE_DEBUG_IO("DISCONNECTION: Sent for Node %d", removeNodeID);
    } else {
        MBEE_DEBUG_IO("DISCONNECTION: Send failed for Node %d", removeNodeID);
    }
    return sent;
}

bool ModBeeIO::sendJoinInvitationFrame(uint8_t srcNodeID, uint8_t invitedNodeID) {
    if (!isTransmissionReady()) {
        return false;
    }

    uint8_t buffer[MODBEE_MAX_TX_BUFFER];
    
    uint16_t frameLen = ModBeeFrame::buildControlFrame(
        buffer, srcNodeID, 0, invitedNodeID, MODBEE_JOIN_TOKEN
    );
    
    if (frameLen == 0) {
        MBEE_DEBUG_IO("JOIN_INVITATION: Failed to build frame");
        return false;
    }
    
    bool sent = sendFrame(buffer, frameLen);
    if (sent) {
        //MBEE_DEBUG_IO("JOIN_INVITATION: Sent to invite Node %d", invitedNodeID);
    } else {
        MBEE_DEBUG_IO("JOIN_INVITATION: Send failed for Node %d", invitedNodeID);
    }
    return sent;
}

bool ModBeeIO::sendJoinResponseFrame(uint8_t srcNodeID) {
    if (!isTransmissionReady()) {
        return false;
    }

    uint8_t buffer[MODBEE_MAX_TX_BUFFER];
    
    uint16_t frameLen = ModBeeFrame::buildControlFrame(
        buffer, srcNodeID, 0, srcNodeID, 0
    );
    
    if (frameLen == 0) {
        MBEE_DEBUG_IO("JOIN_RESPONSE: Failed to build frame");
        return false;
    }
    
    bool sent = sendFrame(buffer, frameLen);
    if (sent) {
        //MBEE_DEBUG_IO("JOIN_RESPONSE: Sent from Node %d", srcNodeID);
    } else {
        MBEE_DEBUG_IO("JOIN_RESPONSE: Send failed from Node %d", srcNodeID);
    }
    return sent;
}

bool ModBeeIO::sendDataFrame(uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID) {
    if (!isTransmissionReady()) {
        return false;
    }
    
    uint8_t* buffer = new uint8_t[MODBEE_MAX_TX_BUFFER];
    if (!buffer) {
        MBEE_DEBUG_IO("FRAME BUILD: Failed to allocate buffer");
        return false;
    }
    
    memset(buffer, 0xAA, MODBEE_MAX_TX_BUFFER);
    
    std::vector<PendingModbusOp> pendingOpsCopy;
    std::vector<PendingResponse> pendingResponsesCopy;
    
    {
        auto& pendingOps = _protocol.getOperations().getPendingOps();
        auto& pendingResponses = _protocol.getOperations().getPendingResponses();
        
        pendingOpsCopy.reserve(pendingOps.size());
        pendingResponsesCopy.reserve(pendingResponses.size());
        
        for (const auto& op : pendingOps) {
            // Only send operations when they're ready (first attempt or retry delay elapsed)
            if (_protocol.getOperations().isOperationReady(op)) {
                pendingOpsCopy.push_back(op);
            }
        }
        
        for (const auto& resp : pendingResponses) {
            pendingResponsesCopy.push_back(resp);
        }
    }
    
    //MBEE_DEBUG_IO("FRAME BUILD: Starting with %d pending ops, %d pending responses", 
    //    pendingOpsCopy.size(), pendingResponsesCopy.size());
    
    std::vector<PendingModbusOp> allOperations;
    allOperations.reserve(pendingOpsCopy.size() + pendingResponsesCopy.size());
    
    for (const auto& op : pendingOpsCopy) {
        allOperations.push_back(op);
    }
    
    for (const auto& resp : pendingResponsesCopy) {
        PendingModbusOp responseOp;
        responseOp.destNodeID = resp.destNodeID;
        responseOp.sourceNodeID = resp.sourceNodeID;
        responseOp.req = resp.response;
        responseOp.timestamp = resp.timestamp;
        responseOp.retryCount = 0;
        responseOp.resultPtr = nullptr;
        responseOp.isArray = false;
        responseOp.arraySize = 0;
        allOperations.push_back(responseOp);
    }
    
    uint16_t frameLen = 0;
    uint16_t pos = 0;
    
    if (pos + 5 >= MODBEE_MAX_TX_BUFFER) {
        delete[] buffer;
        return false;
    }
    
    buffer[pos++] = MODBEE_SOF;
    buffer[pos++] = _protocol.getNodeID();
    buffer[pos++] = nextMasterID;
    buffer[pos++] = addNodeID;
    buffer[pos++] = removeNodeID;
    
    uint16_t operationsAdded = 0;
    for (const auto& op : allOperations) {
        if (pos + 20 > MODBEE_MAX_TX_BUFFER - 10) {
            MBEE_DEBUG_IO("FRAME BUILD: Stopping - insufficient space at pos %d", pos);
            break;
        }
        
        uint16_t posBeforeSection = pos;
        
        buffer[pos++] = MODBEE_PACKET_DELIM;
        buffer[pos++] = op.destNodeID;
        
        // Reserve 2 bytes for the section length field.  The actual length is
        // filled in after building the Modbus data.  This makes section
        // boundaries length-based rather than delimiter-scanned, so payload
        // data bytes that happen to equal MODBEE_PACKET_DELIM (0x7C = 124)
        // are never misidentified as section starts.
        uint16_t lenFieldPos = pos;
        pos += 2; // Reserve for [len_H][len_L]
        
        uint16_t modbusLen = 0;
        if (op.req.isResponse) {
            modbusLen = ModbusFrame::buildModbusResponse(&buffer[pos], op.req);
        } else {
            modbusLen = ModbusFrame::buildModbusRequest(&buffer[pos], &op);
        }
        
        if (modbusLen == 0 || pos + modbusLen >= MODBEE_MAX_TX_BUFFER - 2) {
            pos = posBeforeSection;
            break;
        }
        
        // Write actual Modbus data length into the reserved field
        buffer[lenFieldPos]     = (modbusLen >> 8) & 0xFF;
        buffer[lenFieldPos + 1] = modbusLen & 0xFF;
        
        pos += modbusLen;
        operationsAdded++;
        
        if (pos >= MODBEE_MAX_TX_BUFFER) {
            delete[] buffer;
            return false;
        }
    }
    
    if (pos + 2 > MODBEE_MAX_TX_BUFFER) {
        delete[] buffer;
        return false;
    }
    
    uint16_t crc = ModBeeFrame::calculateCRC(buffer, pos);
    buffer[pos++] = (crc >> 8) & 0xFF;
    buffer[pos++] = crc & 0xFF;
    
    frameLen = pos;
    
    if (!ModBeeFrame::isValidFrame(buffer, frameLen)) {
        //MBEE_DEBUG_IO("FRAME BUILD: Built frame failed validation!");
        delete[] buffer;
        return false;
    }
    
    bool sent = sendFrame(buffer, frameLen);
    
    delete[] buffer;
    
    if (sent) {
        //MBEE_DEBUG_IO("DATA FRAME: Sent with %d operations to Node %d", operationsAdded, nextMasterID);

        // Mark sent operations as in-flight, but only remove writes (writes have no response).
        // Reads must remain pending so incoming responses can be matched and written to resultPtr.
        const unsigned long now = millis();
        std::vector<uint32_t> writeOpsToRemove;
        writeOpsToRemove.reserve(pendingOpsCopy.size());

        auto& pendingOps = _protocol.getOperations().getPendingOps();
        for (const auto& sentOp : pendingOpsCopy) {
            for (auto& liveOp : pendingOps) {
                if (liveOp.operationId != sentOp.operationId) {
                    continue;
                }

                // Update send timestamp for timeout/retry tracking
                liveOp.timestamp = now;

                // Prevent re-sending every token pass for the initial attempt
                if (liveOp.retryCount == 0) {
                    liveOp.retryCount = 1;
                }

                if (ModbusFrame::isWriteFunction(liveOp.req.function)) {
                    if (liveOp.onComplete) {
                        liveOp.onComplete(liveOp.operationId);
                    }
                    writeOpsToRemove.push_back(liveOp.operationId);
                }
                break;
            }
        }

        if (!writeOpsToRemove.empty()) {
            pendingOps.erase(
                std::remove_if(
                    pendingOps.begin(),
                    pendingOps.end(),
                    [&writeOpsToRemove](const PendingModbusOp& op) {
                        return std::find(writeOpsToRemove.begin(), writeOpsToRemove.end(), op.operationId) != writeOpsToRemove.end();
                    }),
                pendingOps.end());
        }
        
        for (const auto& resp : pendingResponsesCopy) {
            _protocol.getOperations().removePendingResponse(resp.response);
        }
    }
    
    return sent;
}

bool ModBeeIO::sendMasterFrame(uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID) {
    return sendDataFrame(nextMasterID, addNodeID, removeNodeID);
}

bool ModBeeIO::sendFrame(const uint8_t* buffer, uint16_t length) {
    if (!_stream || length == 0) {
        return false;
    }
    
    /*

    char hexDump[1024] = "";
    char* p = hexDump;
    for (int i = 0; i < length; i++) {
        sprintf(p, "%02X ", buffer[i]);
        p += 3;
        if (p - hexDump > 1000) break;
    }
    MBEE_DEBUG_IO("TX RAW (%d bytes): %s", length, hexDump);

    */
    
    if (length > MODBEE_MAX_TX_BUFFER) {
        return false;
    }
    
    size_t bytesWritten = _stream->write(buffer, length);
    
    if (bytesWritten == length) {
        // Treat TX as bus activity so subsequent transmissions obey inter-frame gap.
        _lastBusActivity = millis();
        _lastBusActivityMicros = micros();
        incrementFrameSent();
        MBEE_DEBUG_FRAME(MBEE_FRAME_TX, buffer, length);
        return true;
    } else {
        MBEE_DEBUG_IO("TX: Failed to send frame, only %d of %d bytes written", bytesWritten, length);
        return false;
    }
}

// =============================================================================
// TRANSMISSION UTILITIES
// =============================================================================
bool ModBeeIO::isTransmissionReady() {
    if (!_stream) {
        return false;
    }
    
    const uint32_t now = (uint32_t)micros();
    return (uint32_t)(now - _lastBusActivityMicros) >= (uint32_t)ModBeeAPI::MODBEE_INTERFRAME_GAP_US;
}

// =============================================================================
// STATISTICS AND MONITORING
// =============================================================================
void ModBeeIO::resetStatistics() {
    _stats.framesReceived = 0;
    _stats.framesSent = 0;
    _stats.crcErrors = 0;
    _stats.framingErrors = 0;
    _stats.bufferOverflows = 0;
}

ModBeeIOStats ModBeeIO::getStatistics() {
    return _stats;
}

void ModBeeIO::incrementFrameReceived() {
    _stats.framesReceived++;
}

void ModBeeIO::incrementFrameSent() {
    _stats.framesSent++;
}

void ModBeeIO::incrementCrcError() {
    _stats.crcErrors++;
}

void ModBeeIO::incrementFramingError() {
    _stats.framingErrors++;
}

void ModBeeIO::incrementBufferOverflow() {
    _stats.bufferOverflows++;
}