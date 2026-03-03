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
      _joinFailureCount(0),
      _nextJoinResponseAttemptMs(0),
      _joinResponseRetryIntervalMs(0),
      _joinResponseAttemptCount(0),
      _joinInvitationsSent(0),
      _networkActivityDetected(false),
      _firstActivityTime(0),
      _sawNonJoinTrafficInState(false),
      _sawJoinResponseInState(false),
      _sawAnyControlFrameInState(false),
      _stateEntryTime(0),
      _lastJoinInvitationSent(false),
      _joinResponseReceived(false),
      _lastInvitedNodeID(0),
      _pendingAddNodeID(0),
      _pendingAddBroadcastRemaining(0),
      _pendingRemoveNodeID(0),
      _pendingRemoveBroadcastRemaining(0),
      _membershipGossipIndex(0),
      _lastMembershipGossipMs(0),
      _joinResponseWaitStart(0),
      _lastSuccessfulTokenConfirm(0)
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
    // Waiting for an invitation is a macro-level event and must not be tied to
    // inter-frame gaps (microseconds). Use a conservative timeout based on the
    // expected coordinator join cycle time.
    unsigned long waitMs = getNetworkBuildTimeout() + ModBeeAPI::INITIAL_LISTEN_PERIOD_MS;
    if (waitMs < 2000UL) {
        waitMs = 2000UL;
    }
    return waitMs;
}

unsigned long ModBeeProtocol::getRandomInitialListen() {
    if (!_initialListenTimeSet) {
        unsigned long baseTime = ModBeeAPI::INITIAL_LISTEN_PERIOD_MS;
        unsigned long nodeOffset = (unsigned long)_nodeID * 100UL; // 100ms separation between node IDs
        unsigned long backoff = (unsigned long)_joinFailureCount * 250UL; // 250ms per failed attempt
        if (backoff > 5000UL) {
            backoff = 5000UL;
        }
        _randomInitialListenTime = baseTime + nodeOffset + backoff;
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

    now = millis();

    // =========================
    // WATCHDOG / RECOVERY
    // =========================
    // If we end up in a bad state (race, stuck TX, noise), force a clean rejoin.
    const unsigned long stateAge = now - _stateEntryTime;
    switch (_state) {
        case MBEE_COORDINATOR_BUILDING:
            // Hard cap: never remain coordinating forever.
            // NOTE: We deliberately do NOT abort on _sawNonJoinTrafficInState here.
            // When the lowest-ID node reclaims coordination from a ring that was running
            // without it, it WILL see existing token traffic. The isLowestNodeID() check
            // inside the COORDINATOR_BUILDING state body handles correct coordinator
            // election — yielding to a lower node if one replies. Let the build proceed.
            if (stateAge > (getNetworkBuildTimeout() * 3UL)) {
                forceRejoin("Coordinator build watchdog");
                return;
            }
            break;

        case MBEE_CONNECTING:
            if (stateAge > (getJoinWaitTimeout() * 2UL)) {
                forceRejoin("Connecting watchdog");
                return;
            }
            break;

        case MBEE_PASSING_TOKEN:
            if (stateAge > 5000UL) {
                forceRejoin("Passing token watchdog");
                return;
            }
            break;

        default:
            break;
    }
    
    // Process pending operations
    _operations.processPendingOperations(*this);
    _operations.cleanupTimedOutOperations(*this);
    
    // Only check timeouts for connected states, not during join process
    if (_state == MBEE_IDLE || _state == MBEE_HAVE_TOKEN || _state == MBEE_PASSING_TOKEN) {
        const uint8_t ringSize = getRingSizeForTimeouts();
        if (now - lastNodeTimeoutCheck >= (ModBeeAPI::NODE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT) * (unsigned long)ringSize) {

            const unsigned long livenessWindow =
                (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
                * (unsigned long)ringSize
                * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
                * 2UL;
            if (isLowestNodeIDAmongRecentlySeen(now, livenessWindow)) {
                checkNodeTimeouts();
            }
            lastNodeTimeoutCheck = now;
        }
    }
    
    switch (_state) {
        case MBEE_INITIAL_LISTEN:
            {
                if (_sawAnyControlFrameInState) {
                    MBEE_DEBUG_PROTOCOL("INITIAL_LISTEN: Valid frame activity detected, network busy or exists!");
                    _networkActivityDetected = true;
                    resetJoiningState();
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                    break;
                }
                
                // Calculate listen time: base time + node offset
                unsigned long listenTime = getRandomInitialListen();
                unsigned long elapsed = now - _stateEntryTime;
                
                if (elapsed >= listenTime) {

                    const unsigned long lastBusActivity = _io ? _io->getLastActivityTime() : 0;
                    const unsigned long rawTrafficAge = (lastBusActivity != 0 && now >= lastBusActivity) ? (now - lastBusActivity) : ~0UL;
                    const unsigned long requiredQuietMs = (ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT);
                    const unsigned long maxDeferMs = 5000UL;

                    if (rawTrafficAge < requiredQuietMs && elapsed < (listenTime + maxDeferMs)) {
                        // Stay in listen a bit longer; we'll either decode a valid frame
                        // and join normally, or the bus will go quiet if no ring exists.
                        break;
                    }

                    // Timeout reached - become coordinator
                    MBEE_DEBUG_PROTOCOL("STATE: INITIAL_LISTEN -> COORDINATOR_BUILDING (Node %d timeout)", _nodeID);
                    startNetworkBuilding();
                    transitionToState(MBEE_COORDINATOR_BUILDING);
                }
            }
            break;
            
        case MBEE_COORDINATOR_BUILDING:
            {

                if (_sawNonJoinTrafficInState) {
                    MBEE_DEBUG_PROTOCOL("COORDINATOR_BUILDING: Detected existing ring traffic — yielding to avoid collision");
                    resetCoordinatorState();
                    resetJoiningState();
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                    break;
                }

                // Coordinator election: if we discover a lower node ID, yield deterministically.
                if (_knownNodeCount > 1 && !isLowestNodeID()) {
                    MBEE_DEBUG_PROTOCOL("COORDINATOR_BUILDING: Lower node detected, yielding to coordinator election");
                    resetCoordinatorState();
                    resetJoiningState();
                    transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                    break;
                }

                if (_joinInvitationsSent >= (uint8_t)(ModBeeAPI::MODBEE_MAX_NODES - 1)) {
                    // Give the last invited node its full response window before starting the ring.
                    if ((now - _lastJoinInvitation) >= (unsigned long)ModBeeAPI::MODBEE_JOIN_CYCLE_INTERVAL) {
                        MBEE_DEBUG_PROTOCOL("COORDINATOR: Full scan complete (%d invitations), starting token ring", _joinInvitationsSent);
                        completeNetworkBuilding();
                        transitionToState(MBEE_HAVE_TOKEN);
                    }
                    // else: still in last response window, stay here
                    break;
                }

                // Safety-net hard timeout (keeps watchdog from firing, and handles miscounts).
                if (hasNetworkBuildTimedOut()) {
                    MBEE_DEBUG_PROTOCOL("COORDINATOR_BUILDING: Timeout reached, completing network build");
                    completeNetworkBuilding();
                    transitionToState(MBEE_HAVE_TOKEN);
                    break;
                }
                
                // Send one join invitation per interval
                if (shouldSendJoinInvitation()) {
                    uint8_t nextNode = getNextJoinInvitation();

                    // All slots known — no need to continue scanning
                    if (nextNode == 0) {
                        MBEE_DEBUG_PROTOCOL("COORDINATOR: All max-nodes known, starting token ring early");
                        completeNetworkBuilding();
                        transitionToState(MBEE_HAVE_TOKEN);
                        break;
                    }

                    if (nextNode <= ModBeeAPI::MODBEE_MAX_NODES) {
                        bool sent = _io->sendJoinInvitationFrame(_nodeID, nextNode);
                        if (sent) {
                            _lastJoinInvitation = now;
                            _joinWindowStart = now;
                            _invitedNodeID = nextNode;
                            _lastJoinInvitationSent = true;
                            _lastInvitedNodeID = nextNode;
                            _joinResponseReceived = false;

                            MBEE_DEBUG_PROTOCOL("COORDINATOR: Sent join invitation to Node %d (%d/%d)", nextNode, _joinInvitationsSent + 1, ModBeeAPI::MODBEE_MAX_NODES - 1);

                            // Advance the cycle AFTER recording the send.
                            incrementJoinCycle();
                            _joinInvitationsSent++;
                        }
                    }
                }
            }
            break;
            
        case MBEE_WAITING_FOR_JOIN_INVITATION:
            {

                _tokenReceivedForUs = false;

                // Check for timeout
                if (hasJoinWaitTimedOut()) {
                    if (_joinFailureCount < 20) {
                        _joinFailureCount++;
                    }
 
                    const uint8_t ringSize = getRingSizeForTimeouts();
                    const unsigned long livenessWindow =
                        (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
                        * (unsigned long)ringSize
                        * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
                        * 2UL;

                    const bool lowestByID = isLowestNodeID();
                    const bool lowestByRecent = isLowestNodeIDAmongRecentlySeen(now, livenessWindow);

                    if (!_sawNonJoinTrafficInState && (lowestByID || lowestByRecent)) {
                        MBEE_DEBUG_PROTOCOL("JOIN_WAIT: Timeout - asserting coordinator role (lowestByID=%s lowestByRecent=%s)",
                                           lowestByID ? "YES" : "NO",
                                           lowestByRecent ? "YES" : "NO");
                        startNetworkBuilding();
                        transitionToState(MBEE_COORDINATOR_BUILDING);
                    } else {
                        MBEE_DEBUG_PROTOCOL("JOIN_WAIT: Timeout - returning to INITIAL_LISTEN to retry");
                        transitionToState(MBEE_INITIAL_LISTEN);
                    }
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
                // If we can't get a join response out for an extended period, restart.
                if (now - _stateEntryTime > getJoinWaitTimeout()) {
                    MBEE_DEBUG_PROTOCOL("CONNECTING: Timeout, restarting join process");
                    resetJoiningState();
                    transitionToState(MBEE_INITIAL_LISTEN);
                    break;
                }

                if (_nextJoinResponseAttemptMs != 0 && now < _nextJoinResponseAttemptMs) {
                    break;
                }

                _joinResponseAttemptCount++;
                bool sent = _io->sendJoinResponseFrame(_nodeID);
                if (sent) {

                    uint8_t coordinatorNode = _invitationFromNode;
                    MBEE_DEBUG_PROTOCOL("STATE: CONNECTING -> IDLE (join response sent, coordinator Node %d)", coordinatorNode);
                    resetJoiningState();
                    if (coordinatorNode != 0) {
                        addNodeToRing(coordinatorNode);
                    }

                    transitionToState(MBEE_IDLE);
                } else {

                    if (_joinResponseRetryIntervalMs < 200UL) {
                        _joinResponseRetryIntervalMs *= 2UL;
                        if (_joinResponseRetryIntervalMs > 200UL) {
                            _joinResponseRetryIntervalMs = 200UL;
                        }
                    }
                    const unsigned long jitterRange = (_joinResponseRetryIntervalMs / 2UL) + 1UL;
                    const unsigned long jitter = ((now ^ ((unsigned long)_nodeID << 8) ^ (unsigned long)_joinResponseAttemptCount * 17UL) % jitterRange);
                    _nextJoinResponseAttemptMs = now + _joinResponseRetryIntervalMs + jitter;

                    if ((_joinResponseAttemptCount % 10U) == 0U) {
                        MBEE_DEBUG_PROTOCOL(
                            "CONNECTING: Join response not sent yet (attempts=%u, next in ~%lu ms)",
                            (unsigned)_joinResponseAttemptCount,
                            (unsigned long)(_nextJoinResponseAttemptMs - now));
                    }
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
                // If we're the only remaining node, reclaim the token and use
                // HAVE_TOKEN's built-in solo-coordinator invitation logic.
                if (_knownNodeCount <= 1) {
                    _isCoordinator = true;
                    transitionToState(MBEE_HAVE_TOKEN);
                    break;
                }

                // Check if token was passed to us
                if (_tokenReceivedForUs) {
                    MBEE_DEBUG_PROTOCOL("IDLE: Token received, checking for join invitation");
                    _tokenReceivedForUs = false;

                    _lastJoinInvitationSent = false;
                    _joinResponseReceived = false;
                    MBEE_DEBUG_PROTOCOL("IDLE: Token received, transitioning to HAVE_TOKEN");
                    transitionToState(MBEE_HAVE_TOKEN);
                    break;
                }
                
                // Token reclaim timeout - only lowest node can reclaim
                unsigned long timeSinceEnteringIdle = now - _stateEntryTime;
                const uint8_t ringSize = getRingSizeForTimeouts();
                if (timeSinceEnteringIdle > (ModBeeAPI::MODBEE_TOKEN_RECLAIM_TIMEOUT + ModBeeAPI::BASE_TIMEOUT) * (unsigned long)ringSize) {
                    if (isLowestNodeID()) {

                        const unsigned long trafficAge = (now > _lastTokenSeen) ? (now - _lastTokenSeen) : 0;
                        const unsigned long lastBusActivity = _io ? _io->getLastActivityTime() : 0;
                        const unsigned long rawTrafficAge = (lastBusActivity != 0 && now >= lastBusActivity) ? (now - lastBusActivity) : ~0UL;
                        const unsigned long ringCycleWindow =
                            (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
                            * (unsigned long)ringSize * 2UL;
                        // If we see raw bus activity but can't decode valid token traffic (CRC noise,
                        // transient unplug effects), treat the ring as active and do NOT reclaim.
                        const bool ringIsActive = (trafficAge < ringCycleWindow) || (rawTrafficAge < ringCycleWindow);

                        if (ringIsActive) {
                            MBEE_DEBUG_PROTOCOL("TOKEN: Orphaned from active ring — last bus traffic %lu ms ago (window %lu ms), forcing rejoin", trafficAge, ringCycleWindow);
                            forceRejoin("idle-lowest-orphaned-with-traffic");
                        } else {
                            MBEE_DEBUG_PROTOCOL("TOKEN: Reclaimed as lowest node (idle timeout:%lu ms, last traffic:%lu ms ago)", timeSinceEnteringIdle, trafficAge);
                            transitionToState(MBEE_HAVE_TOKEN);
                        }
                    } else {

                        unsigned long timeSinceLastMaster = now - _lastTimeAsMaster;

                        const unsigned long orphanThreshold =
                            (ModBeeAPI::NODE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
                            * (unsigned long)ModBeeAPI::MODBEE_MAX_NODES;
                        if (timeSinceLastMaster > orphanThreshold) {
                            MBEE_DEBUG_PROTOCOL(
                                "TOKEN: IDLE orphan detected — %lu ms since last master, forcing rejoin",
                                timeSinceLastMaster);
                            forceRejoin("idle-orphan");
                        } else {
                            // Not yet past the orphan threshold — keep waiting.
                            MBEE_DEBUG_PROTOCOL("TOKEN: Idle timeout but not lowest; staying IDLE and waiting for token (%lu ms since last master)", timeSinceLastMaster);
                            _stateEntryTime = now;
                        }
                    }
                    break;
                }
            }
            break;
            
        case MBEE_HAVE_TOKEN:
            {

                if (_knownNodeCount <= 1) {

                    if (_sawNonJoinTrafficInState) {
                        MBEE_DEBUG_PROTOCOL("SOLO COORD: Detected existing ring traffic — yielding to avoid collision");
                        resetCoordinatorState();
                        resetJoiningState();
                        transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
                        break;
                    }

                    _isCoordinator = true;
                    uint8_t nextUnknown = getNextJoinInvitation();
                    if (nextUnknown == 0) {
                        // Wrapped all slots — reset scan so we keep trying.
                        _currentJoinNodeID = 1;
                    } else {

                        const unsigned long soloInterval =
                            ModBeeAPI::MODBEE_JOIN_CYCLE_INTERVAL
                            + (unsigned long)_nodeID * 7UL;
                        if ((now - _lastJoinInvitation) >= soloInterval) {
                            if (_io->sendJoinInvitationFrame(_nodeID, nextUnknown)) {
                                _lastJoinInvitation   = now;
                                _lastJoinInvitationSent = true;
                                _lastInvitedNodeID    = nextUnknown;
                                _joinResponseReceived = false;
                                MBEE_DEBUG_PROTOCOL("SOLO COORD: Invited Node %d", nextUnknown);
                                incrementJoinCycle();
                            }
                        }
                    }
                    break;
                }

                // Handle pending responses and requests
                bool hasPendingResponses = (_operations.getPendingResponseCount() > 0);
                bool hasPendingOps = (_operations.getPendingOpCount() > 0);
                
                bool tokenSent = false;
                uint8_t nextNodeID = getNextNodeID();
                
                uint8_t joinInviteNodeID = 0;

                const uint8_t ringSize = getRingSizeForTimeouts();
                const unsigned long livenessWindow =
                    (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
                    * (unsigned long)ringSize
                    * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
                    * 2UL;
                const bool isEffectiveLowest = isLowestNodeIDAmongRecentlySeen(now, livenessWindow);

                if (_isCoordinator || isLowestNodeID() || isEffectiveLowest) {
                    if (shouldSendJoinInvitation()) {
                        joinInviteNodeID = getNextJoinInvitation();
                        // Don't re-invite a node that is already in the ring.
                        if (joinInviteNodeID != 0 && isNodeKnown(joinInviteNodeID)) {
                            joinInviteNodeID = 0;
                        }
                    }
                }
                
                // Send appropriate frame type
                uint8_t addNodeID = 0;
                uint8_t removeNodeID = 0;
                const bool shouldBroadcastPendingAdd = (joinInviteNodeID == 0 && _pendingAddBroadcastRemaining > 0 && _pendingAddNodeID != 0);
                const bool shouldBroadcastPendingRemove = (joinInviteNodeID == 0 && _pendingRemoveBroadcastRemaining > 0 && _pendingRemoveNodeID != 0);

                if (shouldBroadcastPendingAdd) {
                    addNodeID = _pendingAddNodeID;
                }
                if (shouldBroadcastPendingRemove) {
                    removeNodeID = _pendingRemoveNodeID;
                }

                if (joinInviteNodeID == 0 && addNodeID == 0 && removeNodeID == 0) {
                    const bool ringHealthy = (_lastSuccessfulTokenConfirm != 0) && ((now - _lastSuccessfulTokenConfirm) <= livenessWindow);
                    const bool gossipDue = (now - _lastMembershipGossipMs) >= ModBeeAPI::MODBEE_JOIN_CYCLE_INTERVAL;

                    if (ringHealthy && gossipDue && _knownNodeCount > 1) {
                        uint8_t gossipNodeID = 0;

                        // Rotate through the known node list (skip index 0 = self).
                        for (uint8_t attempts = 0; attempts < _knownNodeCount; attempts++) {
                            if (_membershipGossipIndex < 1 || _membershipGossipIndex >= _knownNodeCount) {
                                _membershipGossipIndex = 1;
                            } else {
                                _membershipGossipIndex++;
                                if (_membershipGossipIndex >= _knownNodeCount) {
                                    _membershipGossipIndex = 1;
                                }
                            }

                            const uint8_t candidate = _knownNodes[_membershipGossipIndex];
                            if (candidate == 0 || candidate == _nodeID) {
                                continue;
                            }

                            if (candidate == nextNodeID) {
                                continue;
                            }

                            const unsigned long last = _lastNodeSeen[candidate];
                            if (last != 0 && (now - last) <= livenessWindow) {
                                gossipNodeID = candidate;
                                break;
                            }
                        }

                        if (gossipNodeID != 0) {
                            addNodeID = gossipNodeID;
                            _lastMembershipGossipMs = now;
                        }
                    }
                }

                if (addNodeID != 0 && removeNodeID != 0 && addNodeID == removeNodeID) {
                    removeNodeID = 0;
                    if (_pendingRemoveNodeID == addNodeID) {
                        _pendingRemoveNodeID = 0;
                        _pendingRemoveBroadcastRemaining = 0;
                    }
                }

                if (hasPendingResponses || hasPendingOps) {
                    if (joinInviteNodeID > 0) {
                        tokenSent = _io->sendDataFrame(nextNodeID, joinInviteNodeID, MODBEE_JOIN_TOKEN);
                    } else {
                        tokenSent = _io->sendDataFrame(nextNodeID, addNodeID, removeNodeID);
                    }
                } else {
                    if (joinInviteNodeID > 0) {
                        tokenSent = _io->sendTokenFrame(_nodeID, nextNodeID, joinInviteNodeID, MODBEE_JOIN_TOKEN);
                    } else {
                        tokenSent = _io->sendTokenFrame(_nodeID, nextNodeID, addNodeID, removeNodeID);
                    }
                }
                
                if (tokenSent) {
                    if (nextNodeID != _tokenRetryNode) {
                        _tokenRetryCount = 0;
                    }
                    _tokenRetryNode = nextNodeID;
                    _tokenConfirmed = false;
                    
                    if (joinInviteNodeID > 0) {
                        _lastJoinInvitationSent = true;
                        _lastInvitedNodeID = joinInviteNodeID;
                        _joinResponseReceived = false;
                        incrementJoinCycle();
                    } else {
                        _lastJoinInvitationSent = false;
                        _lastInvitedNodeID = 0;

                        if (shouldBroadcastPendingAdd) {
                            if (_pendingAddBroadcastRemaining > 0) {
                                _pendingAddBroadcastRemaining--;
                            }
                            if (_pendingAddBroadcastRemaining == 0) {
                                _pendingAddNodeID = 0;
                            }
                        }

                        if (shouldBroadcastPendingRemove) {
                            if (_pendingRemoveBroadcastRemaining > 0) {
                                _pendingRemoveBroadcastRemaining--;
                            }
                            if (_pendingRemoveBroadcastRemaining == 0) {
                                _pendingRemoveNodeID = 0;
                            }
                        }
                    }
                    
                    transitionToState(MBEE_PASSING_TOKEN);
                }
            }
            break;           
            
        case MBEE_PASSING_TOKEN:
            {
                // If we're the only node, go back to HAVE_TOKEN (solo coordinator).
                if (_knownNodeCount <= 1) {
                    _isCoordinator = true;
                    transitionToState(MBEE_HAVE_TOKEN);
                    break;
                }

                // Check if token passing was confirmed
                if (_tokenConfirmed) {
                    _lastSuccessfulTokenConfirm = millis(); // Ring is healthy
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
                _sawNonJoinTrafficInState = false;
                _sawJoinResponseInState = false;
                _sawAnyControlFrameInState = false;
                break;
                
            case MBEE_COORDINATOR_BUILDING:
                _isCoordinator = true;
                _buildingNetwork = true;
                _sawNonJoinTrafficInState = false;
                _sawJoinResponseInState = false;
                _sawAnyControlFrameInState = false;
                break;
                
            case MBEE_WAITING_FOR_JOIN_INVITATION:
                _waitingForInvitation = true;
                _invitationReceived = false;
                _lastJoinInvitationSent = false;
                _joinResponseReceived = false;
                _lastInvitedNodeID = 0;
                _sawNonJoinTrafficInState = false;
                _sawJoinResponseInState = false;
                _sawAnyControlFrameInState = false;
                break;

            case MBEE_CONNECTING:
                _nextJoinResponseAttemptMs = millis();
                {
                    const unsigned long gapMs = (ModBeeAPI::MODBEE_INTERFRAME_GAP_US + 999UL) / 1000UL;
                    _joinResponseRetryIntervalMs = (gapMs < 5UL) ? 5UL : gapMs;
                }
                _joinResponseAttemptCount = 0;
                break;

            case MBEE_IDLE:
                // Successful join/token progress - clear backoff.
                _joinFailureCount = 0;
                _sawNonJoinTrafficInState = false;
                _sawAnyControlFrameInState = false;
                break;
                
            case MBEE_HAVE_TOKEN:
                _lastTimeAsMaster = millis();
                if (!_isCoordinator) {
                    _isCoordinator = isLowestNodeID();
                }
                // Connected/active - clear backoff.
                _joinFailureCount = 0;
                _sawNonJoinTrafficInState = false;
                _sawAnyControlFrameInState = false;
                break;
                
            default:
                break;
        }
    }
}

uint8_t ModBeeProtocol::getRingSizeForTimeouts() const {
    // Use the current known ring size to keep timeouts correct for large networks
    // and fast recovery for small networks. Always clamp to [1, MODBEE_MAX_NODES].
    uint8_t ringSize = _knownNodeCount;
    if (ringSize < 1) {
        ringSize = 1;
    }
    if (ringSize > (uint8_t)ModBeeAPI::MODBEE_MAX_NODES) {
        ringSize = (uint8_t)ModBeeAPI::MODBEE_MAX_NODES;
    }
    return ringSize;
}

void ModBeeProtocol::forceRejoin(const char* reason) {
    MBEE_DEBUG_PROTOCOL("WATCHDOG: Force rejoin (%s)", reason ? reason : "unknown");

    if (_joinFailureCount < 20) {
        _joinFailureCount++;
    }

    // Clear protocol runtime state
    _operations.clearPendingOperations();
    _operations.clearPendingResponses();
    resetCoordinatorState();
    resetJoiningState();

    // Reset token-related state
    _tokenReceivedForUs = false;
    _tokenConfirmed = false;
    _tokenRetryNode = 0;
    _tokenRetryCount = 0;
    _lastTokenSeen = millis();
    _lastTimeAsMaster = millis();
    _lastSuccessfulTokenConfirm = 0; // Ring is no longer known-healthy after rejoin

    // Rebuild known-node list to self only
    for (int i = 0; i < 254; i++) {
        _knownNodes[i] = 0;
    }
    _knownNodes[0] = _nodeID;
    _knownNodeCount = 1;
    for (int i = 0; i < 256; i++) {
        _lastNodeSeen[i] = 0;
    }
    _lastNodeSeen[_nodeID] = millis();

    transitionToState(MBEE_INITIAL_LISTEN);
}

void ModBeeProtocol::startNetworkBuilding() {
    resetCoordinatorState();
    _isCoordinator = true;
    _buildingNetwork = true;
    _networkBuildStart = millis();
    _currentJoinNodeID = 1;
    _joinInvitationsSent = 0;  // Reset scan counter for a fresh sweep

    MBEE_DEBUG_PROTOCOL("COORDINATOR: Starting network building, will invite all %d slots", ModBeeAPI::MODBEE_MAX_NODES - 1);
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
    _lastJoinInvitationSent = false;
    _pendingAddNodeID = 0;
    _pendingAddBroadcastRemaining = 0;
    _pendingRemoveNodeID = 0;
    _pendingRemoveBroadcastRemaining = 0;
    _membershipGossipIndex = 0;
    _lastMembershipGossipMs = 0;
    
    MBEE_DEBUG_PROTOCOL("COORDINATOR: State reset, _currentJoinNodeID = %d", _currentJoinNodeID);
}

void ModBeeProtocol::resetJoiningState() {
    _waitingForInvitation = true;
    _joinWaitStart = millis();
    _invitationReceived = false;
    _lastJoinInvitationSent = false;
    _invitationFromNode = 0;
    _lastInvitedNodeID = 0;
    _joinResponseReceived = false;
    _pendingAddNodeID = 0;
    _pendingAddBroadcastRemaining = 0;
    _pendingRemoveNodeID = 0;
    _pendingRemoveBroadcastRemaining = 0;
    _membershipGossipIndex = 0;
    _lastMembershipGossipMs = 0;
    _nextJoinResponseAttemptMs = 0;
    _joinResponseRetryIntervalMs = 0;
    _joinResponseAttemptCount = 0;
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
    
    // All nodes appear known
    return 0;
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
    const unsigned long now = millis();

    if (fromNodeID != 0 &&
        fromNodeID < _nodeID &&
        !isNodeKnown(fromNodeID) &&
        (_state == MBEE_HAVE_TOKEN ||
         _state == MBEE_PASSING_TOKEN ||
         _state == MBEE_IDLE)) {

        const uint8_t ringSize = getRingSizeForTimeouts();
        const unsigned long healthyWindow =
            (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
            * (unsigned long)ringSize
            * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
            * 2UL;
        const bool ringHealthy = (_knownNodeCount > 1) && (_lastSuccessfulTokenConfirm != 0) && ((now - _lastSuccessfulTokenConfirm) < healthyWindow);

        if (ringHealthy) {
            MBEE_DEBUG_PROTOCOL("COORD YIELD: Lower-ID Node %d coordinating but ring healthy — ignoring yield; will prioritize inviting it", fromNodeID);
            _currentJoinNodeID = fromNodeID;
            _lastJoinInvitation = 0;
        } else {
            MBEE_DEBUG_PROTOCOL("COORD YIELD: Node %d (lower ID, unknown) is coordinating — yielding from %s",
                                 fromNodeID, getStateName(_state));
            resetCoordinatorState();
            resetJoiningState();
            transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
            return;
        }
    }

    // If we're trying to coordinate but we see a lower node active, yield.
    if (_state == MBEE_COORDINATOR_BUILDING && fromNodeID != 0 && fromNodeID < _nodeID) {
        MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Lower node %d detected while coordinating, yielding", fromNodeID);
        resetCoordinatorState();
        resetJoiningState();
        transitionToState(MBEE_WAITING_FOR_JOIN_INVITATION);
        // Continue handling in case the invitation is for us.
    }

    if (isJoinInvitationForUs(invitedNodeID)) {

        bool idleTokenIsStale = false;
        if (_state == MBEE_IDLE) {
            const unsigned long staleMs =
                (ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
                * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
                * (unsigned long)(_knownNodeCount > 0 ? _knownNodeCount : 1)
                * 2UL;
            idleTokenIsStale = (millis() - _lastTimeAsMaster) >= staleMs;
            MBEE_DEBUG_PROTOCOL("JOIN INVITATION: IDLE stale check: %lu ms since last master, threshold %lu ms, stale=%s",
                                 millis() - _lastTimeAsMaster, staleMs, idleTokenIsStale ? "YES" : "NO");
        }

        const bool coordinatorHasPriority = (fromNodeID < _nodeID);

        if ((_state == MBEE_WAITING_FOR_JOIN_INVITATION ||
             _state == MBEE_INITIAL_LISTEN ||
             (_state == MBEE_IDLE && idleTokenIsStale && coordinatorHasPriority) ||
             (_state == MBEE_HAVE_TOKEN && _knownNodeCount <= 1 && coordinatorHasPriority) ||
             (_state == MBEE_PASSING_TOKEN && _knownNodeCount <= 1 && coordinatorHasPriority))) {
            MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Accepted invitation from Node %d (state: %s)", fromNodeID, getStateName(_state));
            _invitationReceived = true;
            _invitationFromNode = fromNodeID;
            transitionToState(MBEE_CONNECTING);
        } else {
            MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Received invitation but not in a join-ready state (%s)", getStateName(_state));
        }
    } else {
        MBEE_DEBUG_PROTOCOL("JOIN INVITATION: Invitation for Node %d, not for us", invitedNodeID);
        // DO NOT ADD INVITED NODE TO NETWORK - WAIT FOR ACTUAL RESPONSE!
    }
}

void ModBeeProtocol::handleJoinResponse(uint8_t joiningNodeID, uint8_t fromNodeID) {
    MBEE_DEBUG_PROTOCOL("JOIN RESPONSE: Node %d wants to join from Node %d", joiningNodeID, fromNodeID);

    if (!_isCoordinator && _state != MBEE_COORDINATOR_BUILDING) {
        const uint8_t ringSize = getRingSizeForTimeouts();
        const unsigned long livenessWindow =
            (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
            * (unsigned long)ringSize
            * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
            * 2UL;
        if (!isLowestNodeID() && !isLowestNodeIDAmongRecentlySeen(millis(), livenessWindow)) {
            return;
        }
    }

    // Add the node that actually responded
    handleNodeAdd(joiningNodeID, fromNodeID);

    if (joiningNodeID != 0 && joiningNodeID != _nodeID) {
        _pendingAddNodeID = joiningNodeID;

        if (_pendingRemoveNodeID == joiningNodeID) {
            _pendingRemoveNodeID = 0;
            _pendingRemoveBroadcastRemaining = 0;
        }

        uint8_t cycles = (uint8_t)(_knownNodeCount * 2);
        if (cycles < 4) {
            cycles = 4;
        }
        if (cycles > 20) {
            cycles = 20;
        }
        _pendingAddBroadcastRemaining = cycles;
    }

    // Only mark as "response received" if it's for the node we most recently invited.
    if (_lastInvitedNodeID != 0 && joiningNodeID == _lastInvitedNodeID) {
        _joinResponseReceived = true;
    }
}

void ModBeeProtocol::noteControlFrameRx(uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID) {
    (void)addNodeID;
    (void)removeNodeID;

    const bool isJoinResponse = (nextMasterID == 0 && removeNodeID == 0 && addNodeID != 0);
    const bool isTokenTraffic  = (nextMasterID != 0);
    const bool isOurOwnFrame   = (srcNodeID == _nodeID);

    // This function is only called for VALID decoded frames.
    // Track that we've seen real frame traffic since entering the current state.
    if (!isOurOwnFrame) {
        _sawAnyControlFrameInState = true;
    }

    if (isJoinResponse) {
        _sawJoinResponseInState = true;
    }

    if (!isOurOwnFrame && isTokenTraffic) {
        _sawNonJoinTrafficInState = true;
        _lastTokenSeen = millis();
    }
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
    if (nodeID > ModBeeAPI::MODBEE_MAX_NODES) {
        return; // Ignore out-of-range IDs
    }

    _lastNodeSeen[nodeID] = millis();
}

void ModBeeProtocol::addNodeToRing(uint8_t nodeID) {
    if (nodeID == 0 || nodeID == _nodeID) return;
    if (nodeID > ModBeeAPI::MODBEE_MAX_NODES) return;

    _lastNodeSeen[nodeID] = millis();

    for (uint8_t i = 0; i < _knownNodeCount; i++) {
        if (_knownNodes[i] == nodeID) {
            // Node already known.  Still yield coordinator if this node has lower priority.
            if (nodeID < _nodeID && _isCoordinator) {
                MBEE_DEBUG_PROTOCOL("COORD: Node %d (lower ID) confirmed in ring — yielding coordinator role", nodeID);
                _isCoordinator = false;
            }
            return;
        }
    }

    if (_knownNodeCount < ModBeeAPI::MODBEE_MAX_NODES) {
        _knownNodes[_knownNodeCount++] = nodeID;
        MBEE_DEBUG_PROTOCOL("NODE ADDED: Node %d joined ring (%d total nodes)", nodeID, _knownNodeCount);

        if (nodeID < _nodeID && _isCoordinator) {
            MBEE_DEBUG_PROTOCOL("COORD: Node %d (lower ID) joined ring — yielding coordinator role", nodeID);
            _isCoordinator = false;
        }
    }
}

// =============================================================================
// TOKEN HANDLING
// =============================================================================
void ModBeeProtocol::handleTokenReceived(uint8_t fromNodeID, bool isDirected) {

    // Set appropriate event flags based on current state
    if (_state == MBEE_PASSING_TOKEN && fromNodeID == _tokenRetryNode) {
        _tokenConfirmed = true;
        _tokenRetryCount = 0;
    }

    if (isDirected) {
        addNodeToRing(fromNodeID);
    } else {
        updateNodeSeen(fromNodeID); // Only update timestamp; don't join the ring yet
    }

    MBEE_DEBUG_PROTOCOL("TOKEN: Received from Node %d (state: %s)", fromNodeID, getStateName(_state));
}

// =============================================================================
// NODE ADDITION AND REMOVAL
// =============================================================================
void ModBeeProtocol::handleNodeAdd(uint8_t nodeID, uint8_t fromNodeID) {
    MBEE_DEBUG_PROTOCOL("NODE ADD: Request to add Node %d from Node %d", nodeID, fromNodeID);
    // This is an explicit join-protocol event — add to the active ring.
    addNodeToRing(nodeID);

    // If we were still broadcasting a removal for this node, cancel it.
    if (_pendingRemoveNodeID == nodeID) {
        _pendingRemoveNodeID = 0;
        _pendingRemoveBroadcastRemaining = 0;
    }
}

void ModBeeProtocol::handleNodeRemove(uint8_t nodeID, uint8_t fromNodeID) {
    if (nodeID == _nodeID) {
        MBEE_DEBUG_PROTOCOL("NODE REMOVE: We were removed by Node %d — rejoining", fromNodeID);
        forceRejoin("removed-by-peer");
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

        if (_pendingAddNodeID == nodeID) {
            _pendingAddNodeID = 0;
            _pendingAddBroadcastRemaining = 0;
        }

        if (fromNodeID == _nodeID && nodeID != 0 && nodeID != _nodeID) {
            _pendingRemoveNodeID = nodeID;
            uint8_t cycles = (uint8_t)(_knownNodeCount * 2);
            if (cycles < 4) {
                cycles = 4;
            }
            if (cycles > 20) {
                cycles = 20;
            }
            _pendingRemoveBroadcastRemaining = cycles;
        }

        _lastNodeSeen[nodeID] = 0;

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

bool ModBeeProtocol::isLowestNodeIDAmongRecentlySeen(unsigned long now, unsigned long windowMs) const {

    for (int i = 0; i < _knownNodeCount; i++) {
        const uint8_t other = _knownNodes[i];
        if (other == 0 || other == _nodeID) {
            continue;
        }
        if (other < _nodeID) {
            const unsigned long last = _lastNodeSeen[other];
            if (last != 0 && (now - last) <= windowMs) {
                return false;
            }
        }
    }
    return true;
}

// =============================================================================
// TIMEOUT HANDLING
// =============================================================================
void ModBeeProtocol::checkNodeTimeouts() {
    unsigned long now = millis();
    
    const uint8_t ringSize = getRingSizeForTimeouts();
    const unsigned long livenessWindow =
        (unsigned long)(ModBeeAPI::TOKEN_RESPONSE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT)
        * (unsigned long)ringSize
        * (unsigned long)ModBeeAPI::MODBEE_MAX_RETRIES
        * 2UL;
    if (!isLowestNodeIDAmongRecentlySeen(now, livenessWindow)) {
        return;
    }
    
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

        if (timeSinceLastSeen > (ModBeeAPI::NODE_TIMEOUT_MS + ModBeeAPI::BASE_TIMEOUT) * (unsigned long)ringSize) {
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
