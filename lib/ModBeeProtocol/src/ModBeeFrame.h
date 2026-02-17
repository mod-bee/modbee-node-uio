#pragma once
#include "ModBeeGlobal.h"

class ModBeeFrame {
public:
    // =============================================================================
    // BASIC FRAME BUILDING - FIX SIGNATURE TO MATCH .CPP
    // =============================================================================
    static uint16_t buildControlFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID);
    static uint16_t buildDataFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID, const std::vector<PendingModbusOp>& operations, ModBeeProtocol& protocol);
    static uint16_t buildResponseFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t nextMasterID, uint8_t addNodeID, uint8_t removeNodeID, const std::vector<ModbusRequest>& responses);
    
    // =============================================================================
    // PARSING
    // =============================================================================
    static bool parseHeader(const uint8_t* buffer, uint16_t bufLen, uint8_t& srcNodeID, uint8_t& nextMasterID, uint8_t& addNodeID, uint8_t& removeNodeID);
    static int findModbusSections(const uint8_t* buffer, uint16_t bufLen, std::vector<std::pair<uint16_t, uint16_t>>& sections);
    
    // =============================================================================
    // VALIDATION AND UTILITIES
    // =============================================================================
    static uint16_t calculateCRC(const uint8_t* buffer, uint16_t length);
    static bool verifyCRC(const uint8_t* buffer, uint16_t length);
    static bool hasModbusData(const uint8_t* buffer, uint16_t bufLen);
    static uint8_t extractTargetNodeID(const uint8_t* buffer, uint16_t bufLen, uint16_t sectionStart);
    static bool isValidFrame(const uint8_t* buffer, uint16_t bufLen);
    
    // =============================================================================
    // FRAME UTILITIES
    // =============================================================================
    static bool validateFrameLength(uint16_t length);
    static uint16_t getMaxDataPayload();
    static bool canFitInFrame(uint16_t currentSize, uint16_t additionalSize);
    static uint16_t buildPresenceFrame(uint8_t* buffer, uint8_t srcNodeID);
    static uint16_t buildTokenFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t nextMasterID);
    static uint16_t buildConnectionFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t addNodeID);
    static uint16_t buildDisconnectionFrame(uint8_t* buffer, uint8_t srcNodeID, uint8_t removeNodeID);
    
    // =============================================================================
    // FRAME TYPE CHECKING
    // =============================================================================
    static bool isTokenFrame(const uint8_t* buffer, uint16_t length);
    static bool isPresenceFrame(const uint8_t* buffer, uint16_t length);
    static bool isConnectionFrame(const uint8_t* buffer, uint16_t length);
    static bool isDisconnectionFrame(const uint8_t* buffer, uint16_t length);
    static bool isDataFrame(const uint8_t* buffer, uint16_t length);
    
    // =============================================================================
    // HEADER EXTRACTION
    // =============================================================================
    static uint8_t getSourceNodeID(const uint8_t* buffer, uint16_t length);
    static uint8_t getNextMasterID(const uint8_t* buffer, uint16_t length);
    static uint8_t getAddNodeID(const uint8_t* buffer, uint16_t length);
    static uint8_t getRemoveNodeID(const uint8_t* buffer, uint16_t length);
    
    // =============================================================================
    // MODBUS SECTION HANDLING
    // =============================================================================
    static bool extractModbusSection(const uint8_t* buffer, uint16_t length, uint16_t sectionStart, uint16_t sectionEnd, uint8_t& targetNodeID, std::vector<uint8_t>& modbusData);
    static uint16_t addModbusSection(uint8_t* buffer, uint16_t currentPos, uint8_t targetNodeID, const std::vector<uint8_t>& modbusData);
    
    // =============================================================================
    // DEBUG AND UTILITIES - FIX SIGNATURE TO MATCH .CPP
    // =============================================================================
    static void debugPrintFrame(const uint8_t* buffer, uint16_t length, ModBeeProtocol& protocol);
    static bool compactFrame(uint8_t* buffer, uint16_t& length);
    static uint16_t estimateFrameSize(const std::vector<PendingModbusOp>& operations);
    
};