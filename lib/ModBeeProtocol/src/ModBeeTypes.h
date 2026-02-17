#pragma once
#include "ModBeeGlobal.h"

// =============================================================================
// PROTOCOL CONSTANTS AND DEFINITIONS
// =============================================================================

// Frame structure constants
#define MODBEE_SOF               0x7E    // Start of Frame marker
#define MODBEE_PACKET_DELIM      0x7C    // Packet delimiter within frame

// Network configuration limits
//#define MODBEE_MAX_NODES         10      // Maximum nodes allowed in network
#define MODBEE_MAX_RX_BUFFER     512     // Maximum receive buffer size
#define MODBEE_MAX_TX_BUFFER     512     // Maximum transmit buffer size
#define MODBEE_MIN_FRAME_LEN     7       // Minimum valid frame length

// Operation and data management limits
#define MODBEE_MAX_PENDING_OPS          50    // Maximum queued operations
#define MODBEE_MAX_PENDING_RESPONSES    50    // Maximum queued responses
#define MODBEE_MAX_DATA_POINTS          1000  // Maximum data map entries

// =============================================================================
// NEW JOIN PROTOCOL STATES
// =============================================================================

enum ModBeeProtocolState {
    MBEE_INITIAL_LISTEN,                // Listening for existing network with random timeout
    MBEE_COORDINATOR_BUILDING,          // Coordinator rapidly building network
    MBEE_WAITING_FOR_JOIN_INVITATION,   // Waiting for coordinator join invitation
    MBEE_CONNECTING,                    // Sending connection response to coordinator
    MBEE_DISCONNECTING,                 // Gracefully leaving network
    MBEE_IDLE,                          // Connected but not token holder
    MBEE_HAVE_TOKEN,                    // Currently holding network token
    MBEE_PASSING_TOKEN,                 // Passing token to next node
    MBEE_DISCONNECTED                   // Disconnected state
};

// =============================================================================
// JOIN PROTOCOL SPECIAL VALUES
// =============================================================================

#define MODBEE_JOIN_TOKEN              255    // NEXT field value indicating join invitation
//#define MODBEE_TOKEN_RECLAIM_TIMEOUT   5250    // Token reclaim timeout (ms)
//#define MODBEE_JOIN_CYCLE_INTERVAL     50     // Join invitation interval (ms)
//#define MODBEE_JOIN_RESPONSE_TIMEOUT   20     // Join response wait time (ms)

// =============================================================================
// REGISTER TYPE ENUMERATION
// =============================================================================

enum ModBeeRegisterType {
    MB_OUTPUT_COIL,             // Digital outputs (writable)
    MB_HOLDING_REGISTER,        // Analog outputs (writable)
    MB_INPUT_STATUS,            // Digital inputs (read-only)
    MB_INPUT_REGISTER           // Analog inputs (read-only)
};

// =============================================================================
// ERROR AND EVENT ENUMERATION
// =============================================================================

enum ModBeeError {
    // Communication errors
    MBEE_TIMEOUT,               // Operation timeout occurred
    MBEE_CRC_ERROR,             // CRC validation failed
    MBEE_FRAME_ERROR,           // Invalid frame format
    MBEE_BUFFER_OVERFLOW,       // Buffer capacity exceeded
    
    // Network management events
    MBEE_UNKNOWN_NODE,          // Unknown node detected
    MBEE_NODE_ADDED,            // Node added to network
    MBEE_NODE_REMOVED,          // Node removed from network
    MBEE_COORDINATOR_CHANGE,    // Coordinator role changed
    
    // Protocol operation errors
    MBEE_INVALID_REQUEST,       // Malformed request
    MBEE_PROTOCOL_VIOLATION,    // Protocol rule violated
    MBEE_PROTOCOL_ERROR,        // General protocol error
    MBEE_OPERATION_ERROR,       // Operation processing failed
    MBEE_OPERATION_TIMEOUT,     // Operation timed out
    
    // Modbus specific errors
    MBEE_MODBUS_ERROR,          // Modbus processing error
    MBEE_INVALID_FUNCTION,      // Invalid function code
    MBEE_INVALID_ADDRESS,       // Invalid register address
    MBEE_SLAVE_DEVICE_FAILURE,  // Slave device failure
    
    // Token ring management events
    MBEE_TOKEN_PASS,            // Token passed successfully
    MBEE_TOKEN_RECLAIM,         // Token reclaimed
    MBEE_NETWORK_TIMEOUT,       // Network communication timeout
    MBEE_NODE_TIMEOUT,          // Node response timeout
    
    // System events
    MBEE_STATE_CHANGE,          // Protocol state changed
    MBEE_DEBUG_EVENT,           // Debug information
    MBEE_UNKNOWN_ERROR          // Unclassified error
};

// =============================================================================
// MODBUS FUNCTION CODES
// =============================================================================

#define MB_FC_READ_COILS            0x01    // Read coil status
#define MB_FC_READ_DISCRETE_INPUTS  0x02    // Read discrete inputs
#define MB_FC_READ_HOLDING_REGISTERS 0x03   // Read holding registers
#define MB_FC_READ_INPUT_REGISTERS  0x04    // Read input registers
#define MB_FC_WRITE_SINGLE_COIL     0x05    // Write single coil
#define MB_FC_WRITE_SINGLE_REGISTER 0x06    // Write single register
#define MB_FC_WRITE_MULTIPLE_COILS  0x0F    // Write multiple coils
#define MB_FC_WRITE_MULTIPLE_REGISTERS 0x10 // Write multiple registers

// =============================================================================
// MODBUS EXCEPTION CODES
// =============================================================================

#define MB_EX_ILLEGAL_FUNCTION      0x01    // Function code not supported
#define MB_EX_ILLEGAL_DATA_ADDRESS  0x02    // Register address invalid
#define MB_EX_ILLEGAL_DATA_VALUE    0x03    // Data value invalid
#define MB_EX_SLAVE_DEVICE_FAILURE  0x04    // Device failure occurred

// =============================================================================
// DATA STRUCTURES
// =============================================================================

/**
 * Modbus request/response structure
 */
struct ModbusRequest {
    uint8_t function;                   // Modbus function code
    uint16_t startAddr;                 // Starting register address
    uint16_t quantity;                  // Number of registers/coils
    std::vector<uint8_t> data;          // Data payload
    bool isResponse = false;            // Response flag
};

/**
 * Pending operation structure for queue management
 */
struct PendingModbusOp {
    uint8_t destNodeID;                 // Target node ID
    uint8_t sourceNodeID;               // Source node ID
    ModbusRequest req;                  // Request data
    unsigned long timestamp;            // Queue timestamp
    uint8_t retryCount;                 // Retry counter
    void* resultPtr;                    // Result pointer for direct access
    bool isArray;                       // Array operation flag
    uint16_t arraySize;                 // Array size if applicable
    std::function<void()> onComplete;   // Completion callback
};

/**
 * Pending response structure for response queue
 */
struct PendingResponse {
    ModbusRequest response;             // Response data
    uint8_t destNodeID;                 // Response destination
    uint8_t sourceNodeID;               // Response source
    unsigned long timestamp;            // Queue timestamp
};

/**
 * Pending read tracking key for request matching
 */
struct PendingReadKey {
    uint8_t nodeID;                     // Target node ID
    uint8_t functionCode;               // Modbus function code
    uint16_t address;                   // Register address
    
    bool operator<(const PendingReadKey& other) const {
        if (nodeID != other.nodeID) return nodeID < other.nodeID;
        if (functionCode != other.functionCode) return functionCode < other.functionCode;
        return address < other.address;
    }
};

/**
 * Pending read information structure
 */
struct PendingReadInfo {
    uint16_t quantity;                  // Number of items requested
    unsigned long timestamp;            // Request timestamp
    uint8_t retryCount;                 // Retry counter
};

/**
 * Data map statistics structure
 */
struct DataMapStats {
    uint16_t coilCount;                 // Number of bound coils
    uint16_t istsCount;                 // Number of bound discrete inputs
    uint16_t hregCount;                 // Number of bound holding registers
    uint16_t iregCount;                 // Number of bound input registers
    uint16_t coilMinAddr;               // Minimum coil address
    uint16_t coilMaxAddr;               // Maximum coil address
    uint16_t istsMinAddr;               // Minimum discrete input address
    uint16_t istsMaxAddr;               // Maximum discrete input address
    uint16_t hregMinAddr;               // Minimum holding register address
    uint16_t hregMaxAddr;               // Maximum holding register address
    uint16_t iregMinAddr;               // Minimum input register address
    uint16_t iregMaxAddr;               // Maximum input register address
};

/**
 * Operations statistics structure
 */
struct OperationStats {
    uint16_t pendingOperations;         // Pending operations count
    uint16_t pendingResponses;          // Pending responses count
    uint16_t pendingReads;              // Pending reads count
    uint16_t readOperations;            // Read operations count
    uint16_t writeOperations;           // Write operations count
    uint16_t retryOperations;           // Retry operations count
};

/**
 * Data map export structure for backup/restore
 */
struct DataMapExport {
    std::map<uint16_t, bool> coils;     // Exported coil values
    std::map<uint16_t, bool> ists;      // Exported discrete input values
    std::map<uint16_t, int16_t> hregs;  // Exported holding register values
    std::map<uint16_t, int16_t> iregs;  // Exported input register values
};

// =============================================================================
// CALLBACK FUNCTION TYPES
// =============================================================================

// Register value callback types
typedef std::function<bool(uint16_t address, bool value)> CoilCallback;
typedef std::function<bool(uint16_t address, int16_t value)> HregCallback;

// Error handler function type
typedef void (*ModBeeErrorHandler)(ModBeeError error, const char* msg);

/**
 * Packet structure for callback handlers
 */
struct ModBeePacket {
    uint8_t destNodeID;                 // Destination node ID
    uint8_t srcNodeID;                  // Source node ID
    ModBeeRegisterType regType;         // Register type
    uint16_t address;                   // Register address
    uint16_t length;                    // Data length
    const uint8_t* data;                // Data pointer
    uint16_t crc;                       // CRC value
};