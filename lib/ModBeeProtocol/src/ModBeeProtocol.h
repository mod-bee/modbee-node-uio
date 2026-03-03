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
    void handleTokenReceived(uint8_t fromNodeID, bool isDirected = false);
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

    // Internal hook for IO to inform protocol of control traffic.
    void noteControlFrameRx(uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID);

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
    // Timestamp of the last token pass that was confirmed by the recipient.
    // Used to determine ring health: if recent, the ring is running fine and
    // stale join invitations from reconnecting nodes should be ignored rather
    // than triggering a COORD_YIELD that collapses the active ring.
    unsigned long _lastSuccessfulTokenConfirm;
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

    // Reconnect/backoff tracking
    uint8_t _joinFailureCount;

    // CONNECTING join-response retry backoff (prevents bus/CPU spam on reconnect)
    unsigned long _nextJoinResponseAttemptMs;
    unsigned long _joinResponseRetryIntervalMs;
    uint16_t _joinResponseAttemptCount;

    // How many join invitations were sent in the current COORDINATOR_BUILDING scan cycle.
    // Used to detect completion of one full scan (all MAX_NODES slots attempted once).
    uint8_t _joinInvitationsSent;
    
    // Network activity detection
    bool _networkActivityDetected;
    unsigned long _firstActivityTime;

    // Traffic detection since state entry (used to avoid coordinator flooding)
    bool _sawNonJoinTrafficInState;
    bool _sawJoinResponseInState;
    bool _sawAnyControlFrameInState;
    
    // State management
    unsigned long _stateEntryTime;

    // Join invitation tracking
    bool _lastJoinInvitationSent;
    bool _joinResponseReceived;

    // Add a new member variable to track if we got a response
    uint8_t _lastInvitedNodeID;

    // When a node joins, broadcast the add event in normal token frames for a
    // while so ALL nodes learn the updated ring membership even if they miss
    // the single join-response frame on a noisy link.
    uint8_t _pendingAddNodeID;
    uint8_t _pendingAddBroadcastRemaining;

    // When a node is removed (timeout / retries), repeat the remove announcement
    // in normal token frames for a while so nodes that missed the original remove
    // frame converge quickly and stop passing tokens to dead nodes.
    uint8_t _pendingRemoveNodeID;
    uint8_t _pendingRemoveBroadcastRemaining;

    // Membership convergence helper: periodically piggyback one known node ID
    // in normal token/data frames (as an add-node hint) so nodes that reboot or
    // rejoin with an incomplete membership list quickly learn about existing
    // ring members.
    uint8_t _membershipGossipIndex;
    unsigned long _lastMembershipGossipMs;

    // Join response waiting state (for nodes that receive token with join invitation)
    unsigned long _joinResponseWaitStart;
    
    // =============================================================================
    // HELPER METHODS
    // =============================================================================
    void forceRejoin(const char* reason);
    uint8_t getRingSizeForTimeouts() const;
    void addNodeToRing(uint8_t nodeID);   // Explicit add to _knownNodes (join protocol or active token receipt)
    void checkNodeTimeouts();
    void transitionToState(ModBeeProtocolState newState);
    void resetCoordinatorState();
    void resetJoiningState();
    bool isJoinInvitationForUs(uint8_t invitedNodeID);
    bool hasNetworkBuildTimedOut();
    bool hasJoinWaitTimedOut();
    void incrementJoinCycle();
    bool shouldSendJoinInvitation();
    bool isLowestNodeIDAmongRecentlySeen(unsigned long now, unsigned long windowMs) const;
    void startNetworkBuilding();
    void completeNetworkBuilding();
    uint8_t findNextUnknownNode(uint8_t startFrom);
    const char* getStateName(ModBeeProtocolState state);
};



