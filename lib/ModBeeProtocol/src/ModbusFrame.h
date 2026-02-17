#pragma once
#include "ModBeeGlobal.h"

/**
 * Pure Modbus RTU Frame Handler
 * Handles building and parsing of Modbus RTU frames (without CRC)
 * This is kept separate from ModBee protocol for clean separation
 */
class ModbusFrame {
public:
    // =============================================================================
    // CORE REQUEST/RESPONSE BUILDING
    // =============================================================================
    static uint16_t buildModbusRequest(uint8_t* buffer, const PendingModbusOp* op = nullptr);
    static uint16_t buildModbusResponse(uint8_t* buffer, const ModbusRequest& response);
    
    // =============================================================================
    // PARSING FUNCTIONS
    // =============================================================================
    static bool parseModbusRequest(const uint8_t* buffer, uint16_t len, ModbusRequest& req);
    static bool parseModbusResponse(const uint8_t* buffer, uint16_t len, ModbusRequest& resp);
    
    // =============================================================================
    // CRC AND VALIDATION
    // =============================================================================
    static uint16_t calculateCRC16(const uint8_t* buffer, uint16_t length);
    static bool isValidFunctionCode(uint8_t functionCode);
    static bool isReadFunction(uint8_t functionCode);
    static bool isWriteFunction(uint8_t functionCode);
    static bool isErrorResponse(uint8_t functionCode);
    static uint8_t makeErrorResponse(uint8_t functionCode);
    static uint8_t getBaseFunctionCode(uint8_t functionCode);
    
    // =============================================================================
    // REQUEST/RESPONSE VALIDATION
    // =============================================================================
    static bool validateRequest(const ModbusRequest& request);
    static bool validateResponse(const ModbusRequest& response);
    
    // =============================================================================
    // SIZE ESTIMATION
    // =============================================================================
    static uint16_t estimateRequestSize(const ModbusRequest& request);
    static uint16_t estimateResponseSize(const ModbusRequest& request);
    
    // =============================================================================
    // BIT MANIPULATION - NOW PUBLIC
    // =============================================================================
    static void packBits(const bool* bits, uint8_t* packed, uint16_t quantity);
    static void unpackBits(const uint8_t* packed, bool* bits, uint16_t quantity);
    static uint8_t getBitPackedBytes(uint16_t quantity);
    
    // =============================================================================
    // REQUEST OPTIMIZATION - ADD THESE MISSING METHODS
    // =============================================================================
    static bool canCombineRequests(const ModbusRequest& req1, const ModbusRequest& req2);
    static ModbusRequest combineRequests(const ModbusRequest& req1, const ModbusRequest& req2);
    static std::vector<ModbusRequest> optimizeRequests(const std::vector<ModbusRequest>& requests);
    
    // =============================================================================
    // DEBUG FUNCTIONS
    // =============================================================================
    static void debugPrintRequest(const ModbusRequest& request);
    static void debugPrintResponse(const ModbusRequest& response);
};