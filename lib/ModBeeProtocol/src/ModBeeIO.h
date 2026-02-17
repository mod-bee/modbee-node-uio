#pragma once
#include "ModBeeGlobal.h"
#include <deque>

// Forward declarations
class ModBeeProtocol;

// =============================================================================
// STATISTICS STRUCTURE
// =============================================================================
struct ModBeeIOStats {
    uint32_t framesReceived = 0;
    uint32_t framesSent = 0;
    uint32_t crcErrors = 0;
    uint32_t framingErrors = 0;
    uint32_t bufferOverflows = 0;
};

/**
 * ModBee IO Manager with Double-Buffer System
 * Handles all protocol input/output operations safely
 */
class ModBeeIO {
public:
    // =============================================================================
    // CONSTRUCTOR AND DESTRUCTOR
    // =============================================================================
    ModBeeIO(ModBeeProtocol& protocol);
    ~ModBeeIO();
    
    // =============================================================================
    // INITIALIZATION
    // =============================================================================
    bool begin(Stream* serialStream);
    
    // =============================================================================
    // MAIN PROCESSING
    // =============================================================================
    void processIncoming();

    // =============================================================================
    // FRAME TRANSMISSION
    // =============================================================================
    bool sendTokenFrame(uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID);
    bool sendJoinInvitationFrame(uint8_t srcNodeID, uint8_t invitedNodeID);
    bool sendJoinResponseFrame(uint8_t srcNodeID);
    bool sendDisconnectionFrame(uint8_t srcNodeID, uint8_t removeNodeID);
    bool sendDataFrame(uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID);
    bool sendConnectionFrame(uint8_t srcNodeID, uint8_t addNodeID);
    bool sendMasterFrame(uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID);

    // =============================================================================
    // STATUS AND MONITORING
    // =============================================================================
    unsigned long getLastActivityTime() const { return _lastBusActivity; }
    uint16_t getRxBufferLevel() { return _primaryRxPos; }
    bool isCompleteFrame() { return !_frameQueue.empty(); }
    bool isRxBufferEmpty() { return _primaryRxPos == 0; }
    
    // =============================================================================
    // STATISTICS
    // =============================================================================
    void resetStatistics();
    ModBeeIOStats getStatistics();
    void incrementFrameReceived();
    void incrementFrameSent();
    void incrementCrcError();
    void incrementFramingError();
    void incrementBufferOverflow();

    // =============================================================================
    // PUBLIC BUFFER ACCESS FOR ACTIVITY DETECTION
    // =============================================================================
    bool _rxAvailable;
    unsigned long _lastBusActivity;

private:
    ModBeeProtocol& _protocol;
    Stream* _stream;
    
    // =============================================================================
    // DOUBLE BUFFER SYSTEM FOR SAFE FRAME PROCESSING
    // =============================================================================
    
    // Primary receive buffer (continuously filled)
    uint8_t _primaryRxBuffer[MODBEE_MAX_RX_BUFFER];
    uint16_t _primaryRxPos;
    
    // Processing buffer (contains complete frames for processing)
    uint8_t _processingBuffer[MODBEE_MAX_RX_BUFFER];
    uint16_t _processingBufferLen;
    
    // Frame extraction queue
    struct CompleteFrame {
        uint8_t data[MODBEE_MAX_RX_BUFFER];
        uint16_t length;
    };
    
    std::deque<CompleteFrame> _frameQueue;
    static constexpr uint8_t MAX_FRAME_QUEUE = 5;
    
    // =============================================================================
    // STATISTICS
    // =============================================================================
    ModBeeIOStats _stats;
    
    // =============================================================================
    // DOUBLE BUFFER METHODS
    // =============================================================================
    void extractCompleteFrames();
    bool findNextCompleteFrame(uint16_t& frameStart, uint16_t& frameEnd);
    void processQueuedFrames();
    void shiftPrimaryBuffer(uint16_t shiftAmount);
    
    // =============================================================================
    // FRAME PROCESSING
    // =============================================================================
    void processCompleteFrame();
    void handleControlFrame(uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID);
    void processModbusData(uint8_t srcNodeID);
    void processModbusSection(const uint8_t* buffer, uint16_t start, uint16_t end, uint8_t srcNodeID);
    void handleModbusRequest(const ModbusRequest& request, uint8_t srcNodeID);
    void handleModbusResponse(const ModbusRequest& response, uint8_t srcNodeID);
    
    // =============================================================================
    // TRANSMISSION UTILITIES
    // =============================================================================
    bool sendFrame(const uint8_t* buffer, uint16_t length);
    bool isTransmissionReady();

public:
    // Add this method for collision detection
    bool hasQueuedFrames() const { return !_frameQueue.empty(); }
};