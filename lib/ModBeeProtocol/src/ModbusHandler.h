#pragma once
#include "ModBeeGlobal.h"

// Forward declarations
class ModBeeProtocol;

/**
 * ModbusHandler - Processes Modbus requests and builds responses
 * 
 * This class handles the business logic of processing incoming Modbus requests
 * against the local data map and building appropriate responses. It also manages
 * request/response matching and operation grouping for efficient transmission.
 */
class ModbusHandler {
public:
    // =============================================================================
    // CONSTRUCTOR AND DESTRUCTOR
    // =============================================================================
    ModbusHandler(ModbusDataMap& dataMap);
    ~ModbusHandler();
    
    // =============================================================================
    // MAIN REQUEST PROCESSING
    // =============================================================================
    bool processRequest(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID);
    
    // =============================================================================
    // INDIVIDUAL MODBUS FUNCTION REQUESTS
    // =============================================================================
    bool processReadCoils(const ModbusRequest& request, ModbusRequest& response);
    bool processReadDiscreteInputs(const ModbusRequest& request, ModbusRequest& response);
    bool processReadHoldingRegisters(const ModbusRequest& request, ModbusRequest& response);
    bool processReadInputRegisters(const ModbusRequest& request, ModbusRequest& response);
    bool processWriteSingleCoil(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID);
    bool processWriteSingleRegister(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID);
    bool processWriteMultipleCoils(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID);
    bool processWriteMultipleRegisters(const ModbusRequest& request, ModbusRequest& response, uint8_t sourceNodeID);
    
    // =============================================================================
    // RESPONSE PROCESSING FOR READ OPERATIONS
    // =============================================================================
    bool processReadCoilsResponse(ModBeeProtocol& protocol, const ModbusRequest& response, uint8_t srcNodeID);
    bool processReadDiscreteInputsResponse(ModBeeProtocol& protocol, const ModbusRequest& response, uint8_t srcNodeID);
    bool processReadHoldingRegistersResponse(ModBeeProtocol& protocol, const ModbusRequest& response, uint8_t srcNodeID);
    bool processReadInputRegistersResponse(ModBeeProtocol& protocol, const ModbusRequest& response, uint8_t srcNodeID);
    
    // =============================================================================
    // STATIC METHODS FOR MODBUS OPERATIONS
    // =============================================================================
    static bool matchesRequest(const ModbusRequest& request, const ModbusRequest& response);
    static bool processResponse(ModBeeProtocol& protocol, const ModbusRequest& response, uint8_t sourceNodeID);
    static uint8_t getExceptionCode(const ModbusRequest& request);
    
    // =============================================================================
    // UTILITY METHODS FOR REQUEST OPTIMIZATION AND VALIDATION
    // =============================================================================
    bool validateAddress(uint8_t function, uint16_t address, uint16_t quantity);
    bool validateQuantity(uint8_t function, uint16_t quantity);
    void debugPrintRequest(const ModbusRequest& request);
    void debugPrintResponse(const ModbusRequest& response);

private:
    ModbusDataMap& _dataMap;
    
    // =============================================================================
    // HELPER METHODS
    // =============================================================================
    bool buildErrorResponse(const ModbusRequest& request, uint8_t exceptionCode, ModbusRequest& response);
};