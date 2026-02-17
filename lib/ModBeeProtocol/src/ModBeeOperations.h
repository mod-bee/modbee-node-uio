#pragma once
#include "ModBeeGlobal.h"

/**
 * ModBeeOperations - Manages all pending Modbus operations and requests
 * Based on the actual implementation in ModBeeOperations.cpp
 */
class ModBeeOperations {
public:
    // =============================================================================
    // CONSTRUCTOR AND DESTRUCTOR
    // =============================================================================
    ModBeeOperations();
    ~ModBeeOperations();
    
    // =============================================================================
    // OPERATION MANAGEMENT
    // =============================================================================
    void addPendingOperation(const PendingModbusOp& op, ModBeeProtocol& protocol);
    void addPendingResponse(const PendingResponse& response);
    void removePendingOperation(const PendingModbusOp& op);
    void removePendingResponse(const ModbusRequest& response);
    void clearPendingOperations();
    void clearPendingResponses();
    void clearNodeOperations(uint8_t nodeID);
    void applyFailsafeForNode(uint8_t nodeID);
    
    // =============================================================================
    // ACCESS METHODS
    // =============================================================================
    std::vector<PendingModbusOp>& getPendingOps();
    const std::vector<PendingModbusOp>& getPendingOps() const;
    std::vector<PendingResponse>& getPendingResponses();
    const std::vector<PendingResponse>& getPendingResponses() const;
    
    // =============================================================================
    // STATUS METHODS
    // =============================================================================
    uint16_t getPendingOpCount() const;
    uint16_t getPendingResponseCount() const;
    bool hasPendingOperations() const;
    bool hasPendingResponses() const;
    void clearPendingOps();
    
    // =============================================================================
    // NODE-SPECIFIC QUERIES
    // =============================================================================
    bool hasOperationsForNode(uint8_t nodeID) const;
    std::vector<PendingModbusOp> getOperationsForNode(uint8_t nodeID) const;
    std::vector<PendingResponse> getResponsesForNode(uint8_t nodeID) const;
    
    // =============================================================================
    // OPERATION OPTIMIZATION AND PRIORITIZATION
    // =============================================================================
    void prioritizeOperation(const PendingModbusOp& op);
    void optimizeOperations();
    void retryFailedOperations();
    bool isOperationReady(const PendingModbusOp& op) const;
    
    // =============================================================================
    // PROCESSING AND CLEANUP
    // =============================================================================
    void processPendingOperations(ModBeeProtocol& protocol);
    void cleanupTimedOutOperations(ModBeeProtocol& protocol);
    void debugPrintOperations(ModBeeProtocol& protocol) const;
    
    // =============================================================================
    // STATISTICS
    // =============================================================================
    void getStatistics(OperationStats& stats) const;
    
    // =============================================================================
    // CAPACITY MANAGEMENT
    // =============================================================================
    void reserveCapacity(uint16_t opCount, uint16_t responseCount);
    bool canAddOperation() const;
    bool canAddResponse() const;
    uint16_t getAvailableOpSlots() const;
    uint16_t getAvailableResponseSlots() const;

    // =============================================================================
    // DIRECT RESPONSE MATCHING AND FULFILLMENT
    // =============================================================================
    bool matchAndFulfillResponse(const ModbusRequest& response, uint8_t srcNodeID);
    void writeResponseToVariable(const PendingModbusOp& op, const ModbusRequest& response);
    PendingModbusOp* findMatchingRequest(uint8_t srcNodeID, const ModbusRequest& response);

private:
    // =============================================================================
    // OPERATION STORAGE
    // =============================================================================
    std::vector<PendingModbusOp> _pendingOps;
    std::vector<PendingResponse> _pendingResponses;

    // =============================================================================
    // HELPER METHODS FOR DIRECT RESPONSE
    // =============================================================================
    bool extractCoilData(const ModbusRequest& response, bool* values, uint16_t maxValues);
    bool extractRegisterData(const ModbusRequest& response, int16_t* values, uint16_t maxValues);
};