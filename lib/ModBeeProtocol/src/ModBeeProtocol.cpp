#include "ModBeeGlobal.h"

// =============================================================================
// CONSTRUCTOR AND DESTRUCTOR
// =============================================================================
ModBeeProtocol::ModBeeProtocol() 
    : _nodeID(0), 
      _state(MBEE_DISCONNECTED),
      _knownNodeCount(0),
      _packetHandler(nullptr),
      _errorHandler(nullptr),
      _io(nullptr),
      _lastTokenSeen(0),
      _lastTimeAsMaster(0),
      _tokenReceivedForUs(false),     
      _tokenConfirmed(false),         
      _tokenRetryNode(0),
      _tokenRetryCount(0),
      _isCoordinator(false),
      _currentJoinNodeID(1),
      _lastJoinInvitation(0),
      _joinWindowStart(0),
      _invitedNodeID(0),
      _buildingNetwork(false),
      _networkBuildStart(0),
      _lastJoinManagement(0),
      _waitingForInvitation(false),
      _joinWaitStart(0),
      _invitationReceived(false),
      _invitationFromNode(0),
      _randomInitialListenTime(0),
      _initialListenTimeSet(false),
      _networkActivityDetected(false),
      _firstActivityTime(0),
      _stateEntryTime(0),
      _joinResponseReceived(false),
      _lastInvitedNodeID(0)
{
    // Initialize known nodes array
    for (int i = 0; i < ModBeeAPI::MODBEE_MAX_NODES; i++) {
        _knownNodes[i] = 0;
    }
    
    // Initialize last node seen array
    for (int i = 0; i < 256; i++) {
        _lastNodeSeen[i] = 0;
    }
}

ModBeeProtocol::~ModBeeProtocol() {
    if (_io) {
        delete _io;
        _io = nullptr;
    }
}

// =============================================================================
// ERROR HANDLING
// =============================================================================
void ModBeeProtocol::reportError(ModBeeError error, const char* msg) {
    if (_errorHandler) {
        _errorHandler(error, msg);
    }
}

// =============================================================================
// INITIALIZATION
// =============================================================================
void ModBeeProtocol::begin(uint8_t nodeID, Stream* serialPort) {
    _nodeID = nodeID;

    // Add ourselves to known nodes
    _knownNodes[0] = _nodeID;
    _knownNodeCount = 1;
    _lastNodeSeen[_nodeID] = millis();
    
    // Properly initialize timing variables
    unsigned long now = millis();
    _lastNodeSeen[_nodeID] = now;
    _lastTokenSeen = now;         
    _lastTimeAsMaster = now;
    
    // Initialize IO manager
    if (!_io) {
        _io = new ModBeeIO(*this);
    }
    
    if (!_io->begin(serialPort)) {
        reportError(MBEE_UNKNOWN_ERROR, "Failed to initialize IO");
        return;
    }
    
    // Clear all pending operations
    _operations.clearPendingOperations();
    _operations.clearPendingResponses();
    
    reportError(MBEE_STATE_CHANGE, "Protocol started");
}

// =============================================================================
// JOIN PROTOCOL TIMING CALCULATIONS
// =============================================================================
unsigned long ModBeeProtocol::getNetworkBuildTimeout() {
    return ModBeeAPI::MODBEE_MAX_NODES * (ModBeeAPI::MODBEE_JOIN_CYCLE_INTERVAL + ModBeeAPI::MODBEE_JOIN_RESPONSE_TIMEOUT) * 1.5;
}

unsigned long ModBeeProtocol::getJoinWaitTimeout() {
    return ModBeeAPI::MODBEE_MAX_NODES * (ModBeeAPI::MODBEE_INTERFRAME_GAP_US / 1000) * 1.5;
}

unsigned long ModBeeProtocol::getRandomInitialListen() {
    if (!_initialListenTimeSet) {
        unsigned long baseTime = ModBeeAPI::INITIAL_LISTEN_PERIOD_MS;
        unsigned long nodeOffset = (_nodeID % 10) * 100; // 100ms separation between nodes
        _randomInitialListenTime = baseTime + nodeOffset;
        _initialListenTimeSet = true;
    }
    return _randomInitialListenTime;
}

// =============================================================================
// MAIN PROTOCOL LOOP
// =============================================================================
void ModBeeProtocol::loop() {
    if (!_io) {
        return;
    }
    
    static unsigned long lastNodeTimeoutCheck = 0;
    unsigned long now = millis();
    
    // Always process incoming data first - CRITICAL for activity detection
    _io->processIncoming();
    
    // Process pending operations
    _operations.processPendingOperations(*this);
    _operations.cleanupTimedOutOperations(*this);
    
    // Only check timeouts for connected states, not during join process
    if (_state == MBEE_IDLE || _state == MBEE_HAVE_TOKEN || _state == MBEE_PASSING_TOKEN) {
        if (now - lastNodeTimeoutCheck >= (ModBeeAPI::NODE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES) {
            checkNodeTimeouts();
            lastNodeTimeoutCheck = now;
        }
    }
    
    switch (_state) {
        case MBEE_INITIAL_LISTEN:
            {
                if (_io->_rxAvailable) {
                    MBEE_DEBUG_PROTOCOL("INITIAL_LISTEN: RX detected, network busy or exists!");
                    _networkActivityDetected = true;
                    resetJoiningState();
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                    break;
                }
                
                // Calculate listen time: base time + node offset
                unsigned long listenTime = getRandomInitialListen();
                unsigned long elapsed = now - _stateEntryTime;
                
                if (elapsed >= listenTime) {
                    // Timeout reached - become coordinator
                    MBEE_DEBUG_PROTOCOL("STATE: INITIAL_LISTEN -> COORDINATOR_BUILDING (Node %d timeout)", _nodeID);
                    startNetworkBuilding();
                    transitionToState(MBEE_COORDINATOR_BUILDING);
                }
            }
            break;
            
        case MBEE_COORDINATOR_BUILDING:
            {
                // COLLISION DETECTION: Check if any frames are queued that aren't join responses
                if (_io->hasQueuedFrames() && !_joinResponseReceived) {
                    MBEE_DEBUG_PROTOCOL("COORDINATOR_BUILDING: COLLISION! Non-join-response traffic detected - aborting");
                    resetCoordinatorState();
                    resetJoiningState();
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                    break;
                }
                
                // Check for timeout
                if (hasNetworkBuildTimedOut()) {
                    MBEE_DEBUG_PROTOCOL("COORDINATOR_BUILDING: Timeout reached, completing network build");
                    completeNetworkBuilding();
                    transitionToState(MBEE_HAVE_TOKEN);
                    break;
                }
                
                // Send join invitations every
                if (shouldSendJoinInvitation()) {
                    uint8_t nextNode = getNextJoinInvitation();

                    if (nextNode <= ModBeeAPI::MODBEE_MAX_NODES) {
                        // Send join invitation using the correct frame function
                        bool sent = _io->sendJoinInvitationFrame(_nodeID, nextNode);
                        if (sent) {
                            _lastJoinInvitation = now;
                            _joinWindowStart = now;
                            _invitedNodeID = nextNode;
                            
                            MBEE_DEBUG_PROTOCOL("COORDINATOR: Sent join invitation to Node %d", nextNode);
                        }
                        
                        // Always increment cycle regardless of send success
                        incrementJoinCycle();
                    } else {
                        // Join cycle complete - start token ring
                        MBEE_DEBUG_PROTOCOL("COORDINATOR: Join cycle complete, starting token ring");
                        completeNetworkBuilding();
                        transitionToState(MBEE_HAVE_TOKEN);
                    }
                }
            }
            break;
            
        case MBEE_WAITING_FOR_JOIN_INVITATION:
            {
                // Check for timeout
                if (hasJoinWaitTimedOut()) {
                    MBEE_DEBUG_PROTOCOL("JOIN_WAIT: Timeout reached, returning to INITIAL_LISTEN");
                    transitionToState(MBEE_INITIAL_LISTEN);
                    break;
                }
                
                // Check if we received invitation
                if (_invitationReceived) {
                    MBEE_DEBUG_PROTOCOL("JOIN_WAIT: Invitation received from Node %d", _invitationFromNode);
                    transitionToState(MBEE_CONNECTING);
                }
            }
            break;
            
        case MBEE_CONNECTING:
            {
                // Send connection response immediately using the correct frame function
                bool sent = _io->sendJoinResponseFrame(_nodeID);
                if (sent) {
                    MBEE_DEBUG_PROTOCOL("STATE: CONNECTING -> IDLE (join response sent)");
                    resetJoiningState();
                    transitionToState(MBEE_IDLE);
                } else {
                    MBEE_DEBUG_PROTOCOL("CONNECTING: Failed to send join response, retrying");
                }
            }
            break;
            
        case MBEE_DISCONNECTING:
            {
                // Send disconnection frame
                if (_tokenReceivedForUs) {
                    bool sent = _io->sendDisconnectionFrame(_nodeID, _nodeID);
                    if (sent) {
                        MBEE_DEBUG_PROTOCOL("STATE: DISCONNECTING -> DISCONNECTED");
                        transitionToState(MBEE_DISCONNECTED);
                    }
                }
            }
            break;
            
        case MBEE_IDLE:
            {   
                // If we've become the only node, restart network building
                if (_knownNodeCount <= 1) {
                    MBEE_DEBUG_PROTOCOL("IDLE: Network lost, returning to MBEE_WAITING_FOR_JOIN_INVITATION");
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                }

                // Check if token was passed to us
                if (_tokenReceivedForUs) {
                    MBEE_DEBUG_PROTOCOL("IDLE: Token received, checking for join invitation");
                    _tokenReceivedForUs = false;
                    
                    // Check if this token contains a join invitation we sent
                    if (_lastJoinInvitationSent && !_joinResponseReceived) {
                        MBEE_DEBUG_PROTOCOL("IDLE: Token contains pending join invitation, waiting for response");
                        _waitingForJoinResponse = true;
                        _joinResponseStartTime = now;
                        // Stay in IDLE and wait for join response timeout
                    } else {
                        MBEE_DEBUG_PROTOCOL("IDLE: Token received, transitioning to HAVE_TOKEN");
                        transitionToState(MBEE_HAVE_TOKEN);
                    }
                    break;
                }
                
                // If waiting for join response, check timeout
                if (_waitingForJoinResponse) {
                    unsigned long joinResponseWaitTime = now - _joinResponseStartTime;
                    if (joinResponseWaitTime >= ModBeeAPI::MODBEE_JOIN_RESPONSE_TIMEOUT) {
                        MBEE_DEBUG_PROTOCOL("IDLE: Join response timeout (%lu ms), proceeding with token", joinResponseWaitTime);
                        _waitingForJoinResponse = false;
                        _lastJoinInvitationSent = false;
                        _joinResponseReceived = false;
                        transitionToState(MBEE_HAVE_TOKEN);
                        break;
                    }
                    // If join response received while waiting
                    if (_joinResponseReceived) {
                        MBEE_DEBUG_PROTOCOL("IDLE: Join response received, proceeding with token");
                        _waitingForJoinResponse = false;
                        _lastJoinInvitationSent = false;
                        _joinResponseReceived = false;
                        transitionToState(MBEE_HAVE_TOKEN);
                        break;
                    }
                    // Still waiting for join response, don't proceed yet
                    break;
                }
                
                // Token reclaim timeout - only lowest node can reclaim
                unsigned long timeSinceEnteringIdle = now - _stateEntryTime;
                if (timeSinceEnteringIdle > (ModBeeAPI::MODBEE_TOKEN_RECLAIM_TIMEOUT + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES) {
                    if (isLowestNodeID()) {
                        MBEE_DEBUG_PROTOCOL("TOKEN: Reclaimed as lowest node (idle timeout:%lu ms)", timeSinceEnteringIdle);
                        transitionToState(MBEE_HAVE_TOKEN);
                    } else {
                        MBEE_DEBUG_PROTOCOL("TOKEN: Reclaim failed, not lowest node returning to MBEE_WAITING_FOR_JOIN_INVITATION");
                        transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                        _stateEntryTime = now; // Reset timer
                    }
                    break;
                }
            }
            break;
            
        case MBEE_HAVE_TOKEN:
            {
                // Handle pending responses and requests
                bool hasPendingResponses = (_operations.getPendingResponseCount() > 0);
                bool hasPendingOps = (_operations.getPendingOpCount() > 0);
                
                bool tokenSent = false;
                uint8_t nextNodeID = getNextNodeID();
                
                uint8_t joinInviteNodeID = 0;
                if (isCoordinator()) {
                    joinInviteNodeID = getNextJoinInvitation();
                }
                
                // Send appropriate frame type
                if (hasPendingResponses || hasPendingOps) {
                    if (joinInviteNodeID > 0) {
                        tokenSent = _io->sendDataFrame(nextNodeID, joinInviteNodeID, MODBEE_JOIN_TOKEN);
                    } else {
                        tokenSent = _io->sendDataFrame(nextNodeID, 0, 0);
                    }
                } else {
                    if (joinInviteNodeID > 0) {
                        tokenSent = _io->sendTokenFrame(_nodeID, nextNodeID, joinInviteNodeID, MODBEE_JOIN_TOKEN);
                    } else {
                        tokenSent = _io->sendTokenFrame(_nodeID, nextNodeID, 0, 0);
                    }
                }
                
                if (tokenSent) {
                    _tokenRetryNode = nextNodeID;
                    
                    if (joinInviteNodeID > 0) {
                        incrementJoinCycle();
                    }
                    
                    transitionToState(MBEE_PASSING_TOKEN);
                }
            }
            break;           
            
        case MBEE_PASSING_TOKEN:
            {

                // If we've become the only node, restart network building
                if (_knownNodeCount <= 1) {
                    MBEE_DEBUG_PROTOCOL("PASSING_TOKEN: Network lost, returning to MBEE_WAITING_FOR_JOIN_INVITATION");
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                    break;
                }

                // Check if token passing was confirmed
                if (_tokenConfirmed) {
                    transitionToState(MBEE_IDLE);
                    _tokenConfirmed = false;
                    //MBEE_DEBUG_PROTOCOL("STATE: PASSING_TOKEN -> IDLE (confirmed by Node %d)", _tokenRetryNode);
                    break;
                }
                
                // Token passing timeout
                if (now - _stateEntryTime > ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT + (ModBeeAPI::MODBEE_INTERFRAME_GAP_US / 1000)) {
                    _tokenRetryCount++;
                    
                    if (_tokenRetryCount < ModBeeAPI::MODBEE_MAX_RETRIES) {
                        // Retry with same node_lastJoinInvitationSent
                        transitionToState(MBEE_HAVE_TOKEN);
                        MBEE_DEBUG_PROTOCOL("TOKEN: Retry passing to Node %d (attempt %d)", _tokenRetryNode, _tokenRetryCount);
                    } else {
                        // Max retries - remove the problematic node
                        MBEE_DEBUG_PROTOCOL("TOKEN: Node %d not responding, removing from network", _tokenRetryNode);
                        uint8_t removedNode = _tokenRetryNode;
                        handleNodeRemove(removedNode, _nodeID);
                        
                        // Pass token to next node and remove the problematic node
                        uint8_t nextNodeID = getNextNodeID();

                        if (nextNodeID == _nodeID) {
                            MBEE_DEBUG_PROTOCOL("TOKEN: Removed last other node, becoming master.");
                            transitionToState(MBEE_HAVE_TOKEN);
                        } else {
                            bool tokenSent = _io->sendTokenFrame(_nodeID, nextNodeID, 0, removedNode);
                            if (tokenSent) {
                                MBEE_DEBUG_PROTOCOL("TOKEN: Removed Node %d, passed to new Node %d. Waiting for confirmation.", removedNode, nextNodeID);
                                _tokenRetryNode = nextNodeID; // Update who we are waiting for
                                _tokenRetryCount = 0;
                                _stateEntryTime = millis();   // Reset timeout for the new pass
                                // Stay in MBEE_PASSING_TOKEN to wait for confirmation
                            } 
                            else {
                                MBEE_DEBUG_PROTOCOL("TOKEN: Failed to send token remove node frame after removing Node %d", removedNode);
                                // Stay in PASSING_TOKEN state, will retry next loop
                            }
                        }
                    }
                }
            }
            break;
            
        case MBEE_DISCONNECTED:
            {
                // Stay disconnected until explicitly reconnected
            }
            break;
    }
}

// =============================================================================
// PROTOCOL HELPER METHODS
// =============================================================================
void ModBeeProtocol::transitionToState(ModBeeProtocolState newState) {
    if (_state != newState) {
        ModBeeProtocolState oldState = _state;
        _state = newState;
        _stateEntryTime = millis();
        
        MBEE_DEBUG_PROTOCOL("STATE CHANGE: %s -> %s", 
            getStateName(oldState), getStateName(newState));
        
        // State-specific initialization
        switch (newState) {
            case MBEE_INITIAL_LISTEN:
                _networkActivityDetected = false;
                _initialListenTimeSet = false;
                _randomInitialListenTime = 0;
                break;
                
            case MBEE_COORDINATOR_BUILDING:
                _isCoordinator = true;
                _buildingNetwork = true;
                break;
                
            case MBEE_WAITING_FOR_JOIN_INVITATION:
                _waitingForInvitation = true;
                _invitationReceived = false;
                _lastJoinInvitationSent = false;
                break;
                
            case MBEE_HAVE_TOKEN:
                _lastTimeAsMaster = millis();
                if (!_isCoordinator) {
                    _isCoordinator = isLowestNodeID();
                }
                break;
                
            default:
                break;
        }
    }
}

void ModBeeProtocol::startNetworkBuilding() {
    resetCoordinatorState();
    _isCoordinator = true;
    _buildingNetwork = true;
    _networkBuildStart = millis();
    _currentJoinNodeID = 1; 

    MBEE_DEBUG_PROTOCOL("COORDINATOR: Starting network building from Node 1 to %d", ModBeeAPI::MODBEE_MAX_NODES);
}

void ModBeeProtocol::completeNetworkBuilding() {
    _buildingNetwork = false;
    _isCoordinator = true; // Remain coordinator for ongoing join management
    
    MBEE_DEBUG_PROTOCOL("COORDINATOR: Network building complete, %d nodes in network", _knownNodeCount);
}

void ModBeeProtocol::resetCoordinatorState() {
    _isCoordinator = false;
    _currentJoinNodeID = 1; 
    _lastJoinInvitation = 0;
    _joinWindowStart = 0;
    _invitedNodeID = 0;
    _buildingNetwork = false;
    _networkBuildStart = 0;
    _lastJoinManagement = 0;
    _lastInvitedNodeID = 0;
    _joinResponseReceived = false;
    
    MBEE_DEBUG_PROTOCOL("COORDINATOR: State reset, _currentJoinNodeID = %d", _currentJoinNodeID);
}

void ModBeeProtocol::resetJoiningState() {
    _waitingForInvitation = true;
    _joinWaitStart = millis();
    _invitationReceived = false;
    _lastJoinInvitationSent = false;
    _waitingForJoinResponse = false;
    _invitationFromNode = 0;
}

uint8_t ModBeeProtocol::getNextJoinInvitation() {
    // Start from current position and find next unknown node
    for (uint8_t attempts = 0; attempts < ModBeeAPI::MODBEE_MAX_NODES; attempts++) {
        // Ensure we're in valid range
        if (_currentJoinNodeID > ModBeeAPI::MODBEE_MAX_NODES || _currentJoinNodeID < 1) {
            _currentJoinNodeID = 1;
        }
        
        // Skip our own node
        if (_currentJoinNodeID == _nodeID) {
            _currentJoinNodeID++;
            if (_currentJoinNodeID > ModBeeAPI::MODBEE_MAX_NODES) {
                _currentJoinNodeID = 1;
            }
            continue; // Try next node
        }
        
        // Check if this node is already known
        bool isKnown = false;
        for (uint8_t i = 0; i < _knownNodeCount; i++) {
            if (_knownNodes[i] == _currentJoinNodeID) {
                isKnown = true;
                break;
            }
        }
        
        // If node is unknown, invite it
        if (!isKnown) {
            //MBEE_DEBUG_PROTOCOL("JOIN: Next invitation for unknown Node %d", _currentJoinNodeID);
            return _currentJoinNodeID;
        }
        
        // Node is known, move to next and continue searching
        _currentJoinNodeID++;
        if (_currentJoinNodeID > ModBeeAPI::MODBEE_MAX_NODES) {
            _currentJoinNodeID = 1;
        }
        // Continue loop to check next node
    }
    
    // Still return current node - maybe a known node left the network
    MBEE_DEBUG_PROTOCOL("JOIN: All nodes appear known, inviting Node %d anyway", _currentJoinNodeID);
    return _currentJoinNodeID;
}

void ModBeeProtocol::incrementJoinCycle() {
    _currentJoinNodeID++;
    if (_currentJoinNodeID > ModBeeAPI::MODBEE_MAX_NODES) {
        _currentJoinNodeID = 1; 
    }
    
    // Skip our own node
    if (_currentJoinNodeID == _nodeID) {
        _currentJoinNodeID++;
        if (_currentJoinNodeID > ModBeeAPI::MODBEE_MAX_NODES) {
            _currentJoinNodeID = 1;
        }
    }
    
    MBEE_DEBUG_PROTOCOL("JOIN: Advanced to Node %d", _currentJoinNodeID);
}

bool ModBeeProtocol::shouldSendJoinInvitation() {
    unsigned long now = millis();
    return (now - _lastJoinInvitation >= ModBeeAPI::MODBEE_JOIN_CYCLE_INTERVAL);
}

bool ModBeeProtocol::hasNetworkBuildTimedOut() {
    unsigned long elapsed = millis() - _networkBuildStart;
    return elapsed >= getNetworkBuildTimeout();
}

bool ModBeeProtocol::hasJoinWaitTimedOut() {
    unsigned long elapsed = millis() - _joinWaitStart;
    return elapsed >= getJoinWaitTimeout();
}

bool ModBeeProtocol::isJoinInvitationForUs(uint8_t invitedNodeID) {
    return invitedNodeID == _nodeID;
}

bool ModBeeProtocol::isCoordinator() const {
    return _isCoordinator && isLowestNodeID();
}

// =============================================================================
// JOIN PROTOCOL EVENT HANDLERS
// =============================================================================
void ModBeeProtocol::handleJoinInvitation(uint8_t invitedNodeID, uint8_t fromNodeID) {
    if (isJoinInvitationForUs(invitedNodeID)) {
        if (_state == MBEE_WAITING_FOR_JOIN_INVITATION || _state == MBEE_INITIAL_LISTEN) {
            MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Accepted invitation for Node %d from Node %d", invitedNodeID, fromNodeID);
            _invitationReceived = true;
            _invitationFromNode = fromNodeID;
            transitionToState(MBEE_CONNECTING);
        } else {
            MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Received invitation but not ready (state: %s)", getStateName(_state));
        }
    } else {
        MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Invitation for Node %d, not for us", invitedNodeID);
        // DO NOT ADD INVITED NODE TO NETWORK - WAIT FOR ACTUAL RESPONSE!
    }

    _lastJoinInvitationSent = true;
}

void ModBeeProtocol::handleJoinResponse(uint8_t joiningNodeID, uint8_t fromNodeID) {
    MBEE_DEBUG_PROTOCOL("JOIN RESPONSE: Node %d wants to join from Node %d", joiningNodeID, fromNodeID);
    
    // Only coordinators handle join responses
    //if (!_isCoordinator) {
    //    MBEE_DEBUG_PROTOCOL("JOIN RESPONSE: Not coordinator, ignoring");
    //    return;
    //}
    
    // Add the node that actually responded
    handleNodeAdd(joiningNodeID, fromNodeID);
    _joinResponseReceived = true;
}

// =============================================================================
// CALLBACK HANDLERS
// =============================================================================
void ModBeeProtocol::onPacket(void (*handler)(const ModBeePacket&)) {
    _packetHandler = handler;
}

void ModBeeProtocol::onError(ModBeeErrorHandler handler) {
    _errorHandler = handler;
}

// =============================================================================
// CONNECTION MANAGEMENT
// =============================================================================
void ModBeeProtocol::nodeConnect() {
    if (_state == MBEE_DISCONNECTED) {
        transitionToState(MBEE_INITIAL_LISTEN);
        MBEE_DEBUG_PROTOCOL("CONNECT: Starting new join protocol");
    }
}

void ModBeeProtocol::nodeDisconnect() {
    if (_state != MBEE_DISCONNECTED && _state != MBEE_DISCONNECTING) {
        transitionToState(MBEE_DISCONNECTING);
        _operations.clearPendingOps();
        MBEE_DEBUG_PROTOCOL("DISCONNECT: Gracefully leaving network");
    }
}

bool ModBeeProtocol::isConnected() const {
    return (_state != MBEE_DISCONNECTED && 
            //_state != MBEE_DISCONNECTING && 
            _state != MBEE_INITIAL_LISTEN &&
            _state != MBEE_COORDINATOR_BUILDING &&
            _state != MBEE_WAITING_FOR_JOIN_INVITATION &&
            _state != MBEE_CONNECTING);
}

bool ModBeeProtocol::isNodeKnown(uint8_t nodeID) const {
    for (uint8_t i = 0; i < _knownNodeCount; i++) {
        if (_knownNodes[i] == nodeID) {
            return true;
        }
    }
    return false;
}

// =============================================================================
// NODE MANAGEMENT
// =============================================================================
void ModBeeProtocol::updateNodeSeen(uint8_t nodeID) {
    if (nodeID == 0 || nodeID == _nodeID) {
        return; // Invalid or self
    }
    
    unsigned long now = millis();
    _lastNodeSeen[nodeID] = now;
    
    // Add new node to known nodes list
    bool found = false;
    for (int i = 0; i < _knownNodeCount; i++) {
        if (_knownNodes[i] == nodeID) {
            found = true;
            break;
        }
    }
    
    if (!found && _knownNodeCount < ModBeeAPI::MODBEE_MAX_NODES) {
        _knownNodes[_knownNodeCount] = nodeID;
        _knownNodeCount++;
        
        MBEE_DEBUG_PROTOCOL("NODE ADDED: Node %d added to network (%d total nodes)", nodeID, _knownNodeCount);
    }
}

// =============================================================================
// TOKEN HANDLING
// =============================================================================
void ModBeeProtocol::handleTokenReceived(uint8_t fromNodeID) {
    
    // Set appropriate event flags based on current state
    if (_state == MBEE_PASSING_TOKEN){ // && fromNodeID == _tokenRetryNode) {
        _tokenConfirmed = true;
        _tokenRetryCount = 0;
    }

    updateNodeSeen(fromNodeID);
    
    MBEE_DEBUG_PROTOCOL("TOKEN: Received from Node %d (state: %s)", fromNodeID, getStateName(_state));
}

// =============================================================================
// NODE ADDITION AND REMOVAL
// =============================================================================
void ModBeeProtocol::handleNodeAdd(uint8_t nodeID, uint8_t fromNodeID) {
    MBEE_DEBUG_PROTOCOL("NODE ADD: Request to add Node %d from Node %d", nodeID, fromNodeID);    
    
    updateNodeSeen(nodeID);
}

void ModBeeProtocol::handleNodeRemove(uint8_t nodeID, uint8_t fromNodeID) {
    if (nodeID == _nodeID) {
        MBEE_DEBUG_PROTOCOL("NODE REMOVE: Attempted to remove ourselves (Node %d) - BLOCKED!", nodeID);
        return;
    }

    MBEE_DEBUG_PROTOCOL("NODE REMOVE: Request to remove Node %d from Node %d", nodeID, fromNodeID);
    
    updateNodeSeen(fromNodeID);
    
    // Find the index of the node to remove first to avoid modifying the array while iterating.
    int removeIndex = -1;
    for (uint8_t i = 0; i < _knownNodeCount; i++) {
        if (_knownNodes[i] == nodeID) {
            removeIndex = i;
            break;
        }
    }
    
    // If the node was found, remove it safely.
    if (removeIndex != -1) {
        // Shift remaining nodes down
        for (uint8_t i = removeIndex; i < _knownNodeCount - 1; i++) {
            _knownNodes[i] = _knownNodes[i + 1];
        }
        _knownNodeCount--;

        // If failsafe is enabled, clear any registers that were last written by the lost node.
        if (ModBeeAPI::enableFailSafe) {
            _dataMap.clearRegistersForNode(nodeID);
            _operations.applyFailsafeForNode(nodeID);
        }
        
        // Clear any pending operations that were targeting the lost node.
        _operations.clearNodeOperations(nodeID);

        MBEE_DEBUG_PROTOCOL("NODE REMOVE: Node %d removed from network (%d remaining)", nodeID, _knownNodeCount);
    }
}

// =============================================================================
// NETWORK UTILITIES
// =============================================================================
uint8_t ModBeeProtocol::getNextNodeID() {
    if (_knownNodeCount <= 1) {
        return _nodeID; // Only we exist, pass to ourselves
    }
    
    // Create a sorted list of known nodes
    uint8_t sortedNodes[ModBeeAPI::MODBEE_MAX_NODES];
    uint8_t sortedCount = 0;
    
    // Copy and sort known nodes
    for (uint8_t i = 0; i < _knownNodeCount; i++) {
        sortedNodes[sortedCount++] = _knownNodes[i];
    }
    
    // Simple bubble sort
    for (uint8_t i = 0; i < sortedCount - 1; i++) {
        for (uint8_t j = i + 1; j < sortedCount; j++) {
            if (sortedNodes[i] > sortedNodes[j]) {
                uint8_t temp = sortedNodes[i];
                sortedNodes[i] = sortedNodes[j];
                sortedNodes[j] = temp;
            }
        }
    }
    
    // Find our position
    int ourPos = -1;
    for (uint8_t i = 0; i < sortedCount; i++) {
        if (sortedNodes[i] == _nodeID) {
            ourPos = i;
            break;
        }
    }
    
    if (ourPos == -1) {
        MBEE_DEBUG_PROTOCOL("ERROR: We're not in our own known nodes list!");
        return _nodeID;
    }
    
    // Return next node in sequence (wrap around)
    uint8_t nextPos = (ourPos + 1) % sortedCount;
    return sortedNodes[nextPos];
}

bool ModBeeProtocol::isLowestNodeID() const {
    if (_knownNodeCount == 0) {
        return true;
    }
    
    for (int i = 0; i < _knownNodeCount; i++) {
        if (_knownNodes[i] < _nodeID) {
            return false;
        }
    }
    
    return true;
}

// =============================================================================
// TIMEOUT HANDLING
// =============================================================================
void ModBeeProtocol::checkNodeTimeouts() {
    unsigned long now = millis();
    
    // Only check timeouts when we're actually connected
    if (_state != MBEE_IDLE && _state != MBEE_HAVE_TOKEN && _state != MBEE_PASSING_TOKEN) {
        return;
    }
    
    // Check for nodes that haven't been seen recently
    for (uint8_t i = 0; i < _knownNodeCount; i++) {
        uint8_t nodeID = _knownNodes[i];
        
        // Never timeout ourselves!
        if (nodeID == _nodeID) {
            continue; // Skip our own node completely
        }
        
        unsigned long timeSinceLastSeen = now - _lastNodeSeen[nodeID];
        
        if (timeSinceLastSeen > (ModBeeAPI::NODE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT) * ModBeeAPI::MODBEE_MAX_NODES) {
            MBEE_DEBUG_PROTOCOL("NODE TIMEOUT: Node %d not seen for too long, removing", nodeID);
            handleNodeRemove(nodeID, _nodeID);
            
            // Restart the loop since the array has changed
            i--;
        }
    }
}

// =============================================================================
// UTILITY HELPER METHODS
// =============================================================================
const char* ModBeeProtocol::getStateName(ModBeeProtocolState state) {
    switch (state) {
        case MBEE_INITIAL_LISTEN: return "INITIAL_LISTEN";
        case MBEE_COORDINATOR_BUILDING: return "COORDINATOR_BUILDING";
        case MBEE_WAITING_FOR_JOIN_INVITATION: return "WAITING_FOR_JOIN_INVITATION";
        case MBEE_CONNECTING: return "CONNECTING";
        case MBEE_DISCONNECTING: return "DISCONNECTING";
        case MBEE_IDLE: return "IDLE";
        case MBEE_HAVE_TOKEN: return "HAVE_TOKEN";
        case MBEE_PASSING_TOKEN: return "PASSING_TOKEN";
        case MBEE_DISCONNECTED: return "DISCONNECTED";
        default: return "UNKNOWN";
    }
}
