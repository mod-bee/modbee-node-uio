#pragma once
#include "ModBeeGlobal.h"

// Forward declaration
class ModBeeIO;

/**
 * ModBeeProtocol - NEW JOIN PROTOCOL ONLY
 * Handles: coordinator-driven joining, token passing, node management
 */
class ModBeeProtocol {
public:
    friend class ModBeeAPI;
    friend class ModbusHandler;
    friend class ModBeeIO;

    // =============================================================================
    // CONSTRUCTOR AND DESTRUCTOR
    // =============================================================================
    ModBeeProtocol();
    ~ModBeeProtocol();

    // =============================================================================
    // INITIALIZATION AND MAIN LOOP
    // =============================================================================
    void begin(uint8_t nodeID, Stream* serialPort);
    void loop();
    
    // =============================================================================
    // EVENT CALLBACKS
    // =============================================================================
    void onPacket(void (*handler)(const ModBeePacket&));
    void onError(ModBeeErrorHandler handler);

    // =============================================================================
    // CONNECTION MANAGEMENT
    // =============================================================================
    void nodeConnect();
    void nodeDisconnect();
    bool isConnected() const;
    bool isNodeKnown(uint8_t nodeID) const;

    // =============================================================================
    // UTILITY METHODS
    // =============================================================================
    void reportError(ModBeeError error, const char* msg);
    uint8_t getNodeID() const { return _nodeID; }
    ModBeeProtocolState getState() const { return _state; }

    // =============================================================================
    // NEW JOIN PROTOCOL - COORDINATOR METHODS
    // =============================================================================
    void handleJoinInvitation(uint8_t invitedNodeID, uint8_t fromNodeID);
    void handleJoinResponse(uint8_t joiningNodeID, uint8_t fromNodeID);
    bool isCoordinator() const;
    uint8_t getNextJoinInvitation();
    bool processJoinManagement();

    // =============================================================================
    // TOKEN RING METHODS
    // =============================================================================
    void updateNodeSeen(uint8_t nodeID);
    void handleTokenReceived(uint8_t fromNodeID);
    void handleNodeAdd(uint8_t nodeID, uint8_t fromNodeID);
    void handleNodeRemove(uint8_t nodeID, uint8_t fromNodeID);
    uint8_t getNextNodeID();

    // =============================================================================
    // DATA ACCESS FOR MODBEEAPI AND MODBUSHANDLER
    // =============================================================================
    ModbusDataMap& getDataMap() { return _dataMap; }
    ModBeeOperations& getOperations() { return _operations; }

    // =============================================================================
    // TOKEN CONTROL METHODS
    // =============================================================================
    void setTokenReceivedForUs() { _tokenReceivedForUs = true; }

    // =============================================================================
    // NEW JOIN PROTOCOL TIMING CALCULATIONS
    // =============================================================================
    unsigned long getNetworkBuildTimeout();
    unsigned long getJoinWaitTimeout();
    unsigned long getRandomInitialListen();
    void setWaitingForJoinResponse(bool waiting);
    void setJoinResponseReceived(bool received);

private:
    // =============================================================================
    // BASIC NETWORK STATE
    // =============================================================================
    uint8_t _nodeID;
    ModBeeProtocolState _state;
    uint8_t _knownNodes[254];
    uint8_t _knownNodeCount;
    
    // =============================================================================
    // CALLBACKS
    // =============================================================================
    void (*_packetHandler)(const ModBeePacket&);
    ModBeeErrorHandler _errorHandler;
    
    // =============================================================================
    // IO MANAGER
    // =============================================================================
    ModBeeIO* _io;
    
    // =============================================================================
    // DATA STORAGE
    // =============================================================================
    ModbusDataMap _dataMap;
    ModBeeOperations _operations;
    
    // =============================================================================
    // TOKEN PASSING STATE
    // =============================================================================
    bool isLowestNodeID() const;
    unsigned long _lastTokenSeen;
    unsigned long _lastTimeAsMaster;
    unsigned long _lastNodeSeen[256];
    bool _tokenReceivedForUs;
    bool _tokenConfirmed;
    uint8_t _tokenRetryNode;
    uint8_t _tokenRetryCount;
    
    // =============================================================================
    // NEW JOIN PROTOCOL STATE VARIABLES
    // =============================================================================
    
    // Coordinator state
    bool _isCoordinator;
    uint8_t _currentJoinNodeID;
    unsigned long _lastJoinInvitation;
    unsigned long _joinWindowStart;
    uint8_t _invitedNodeID;
    bool _buildingNetwork;
    unsigned long _networkBuildStart;
    
    // Join management timing
    unsigned long _lastJoinManagement;
    
    // Node joining state
    bool _waitingForInvitation;
    unsigned long _joinWaitStart;
    bool _invitationReceived;
    uint8_t _invitationFromNode;
    
    // Random timing for collision avoidance
    unsigned long _randomInitialListenTime;
    bool _initialListenTimeSet;
    
    // Network activity detection
    bool _networkActivityDetected;
    unsigned long _firstActivityTime;
    
    // State management
    unsigned long _stateEntryTime;

    // Join invitation tracking
    bool _lastJoinInvitationSent;
    bool _waitingForJoinResponse;
    unsigned long _joinResponseStartTime;
    bool _joinResponseReceived;

    // Add a new member variable to track if we got a response
    uint8_t _lastInvitedNodeID;

    // Join response waiting state (for nodes that receive token with join invitation)
    unsigned long _joinResponseWaitStart;
    
    // =============================================================================
    // HELPER METHODS
    // =============================================================================
    void checkNodeTimeouts();
    void transitionToState(ModBeeProtocolState newState);
    void resetCoordinatorState();
    void resetJoiningState();
    bool isJoinInvitationForUs(uint8_t invitedNodeID);
    bool hasNetworkBuildTimedOut();
    bool hasJoinWaitTimedOut();
    void incrementJoinCycle();
    bool shouldSendJoinInvitation();
    void startNetworkBuilding();
    void completeNetworkBuilding();
    uint8_t findNextUnknownNode(uint8_t startFrom);
    const char* getStateName(ModBeeProtocolState state);
};



