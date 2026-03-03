#include <stdint.h>

#ifdef ARDUINO
#include <Arduino.h>
#endif

/*********************/
/*  IEC Types defs   */
/*********************/

typedef uint8_t  IEC_BOOL;

typedef int8_t    IEC_SINT;
typedef int16_t   IEC_INT;
typedef int32_t   IEC_DINT;
typedef int64_t   IEC_LINT;

typedef uint8_t    IEC_USINT;
typedef uint16_t   IEC_UINT;
typedef uint32_t   IEC_UDINT;
typedef uint64_t   IEC_ULINT;

typedef uint8_t    IEC_BYTE;
typedef uint16_t   IEC_WORD;
typedef uint32_t   IEC_DWORD;
typedef uint64_t   IEC_LWORD;

typedef float    IEC_REAL;
typedef double   IEC_LREAL;

#ifndef STR_MAX_LEN
#define STR_MAX_LEN 126
#endif

#ifndef STR_LEN_TYPE
#define STR_LEN_TYPE int8_t
#endif

typedef STR_LEN_TYPE __strlen_t;
typedef struct {
    __strlen_t len;
    uint8_t body[STR_MAX_LEN];
} IEC_STRING;

//definition of external blocks - MODBEE_ADD_REGISTER
typedef struct {
  IEC_BYTE *REG;
  IEC_WORD *ADDRESS;
  IEC_BOOL *VAR_BOOL;
  IEC_INT *VAR_INT;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBEE_ADD_REGISTER_VARS;

extern "C" void modbee_add_register_setup(MODBEE_ADD_REGISTER_VARS *vars);
extern "C" void modbee_add_register_loop(MODBEE_ADD_REGISTER_VARS *vars);

#define REG (*(vars->REG))
#define ADDRESS (*(vars->ADDRESS))
#define VAR_BOOL (*(vars->VAR_BOOL))
#define VAR_INT (*(vars->VAR_INT))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Called once when the block is initialized
void modbee_add_register_setup(MODBEE_ADD_REGISTER_VARS *vars)
{
  DONE = false;
  ERROR = false;
  
  // Validate register type
  if (REG > 3 || ADDRESS == 0) {
    ERROR = true;
    return;
  }
  
  // Register based on type - functions return void, just call them
  // These functions register the variable reference into the Modbus data map
  switch (REG) {
    case 0:  // COILS
      io.mbee.addCoil(ADDRESS, (bool*)&VAR_BOOL);
      break;
    case 1:  // INPUT STATUS
      io.mbee.addIsts(ADDRESS, (bool*)&VAR_BOOL);
      break;
    case 2:  // HOLDING REGISTERS
      io.mbee.addHreg(ADDRESS, (int16_t*)&VAR_INT);
      break;
    case 3:  // INPUT REGISTERS
      io.mbee.addIreg(ADDRESS, (int16_t*)&VAR_INT);
      break;
  }
  
  DONE = true;  // Functions return void; always succeeds for valid addresses
}

// Called at every PLC scan cycle
void modbee_add_register_loop(MODBEE_ADD_REGISTER_VARS *vars)
{
  // State maintained from setup() - nothing to do here
}
#undef REG
#undef ADDRESS
#undef VAR_BOOL
#undef VAR_INT
#undef DONE
#undef ERROR

//definition of external blocks - MODBEE_CONFIG
typedef struct {
} MODBEE_CONFIG_VARS;

extern "C" void modbee_config_setup(MODBEE_CONFIG_VARS *vars);
extern "C" void modbee_config_loop(MODBEE_CONFIG_VARS *vars);


/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Include ModBee debug macros
#include "ModBeeGlobal.h"

// ================================================================
//  DEBUG TOGGLE
//  Uncomment the line below to enable ModBee debug output on the
//  USB Serial port (115200 baud).  Comment it out again for
//  production builds - all debug code compiles away to nothing.
// ================================================================
#define MODBEE_ENABLE_DEBUG

#ifdef MODBEE_ENABLE_DEBUG

// ----------------------------------------------------------------
//  Protocol debug callback
//  Called for every internal state-machine / join / token event.
// ----------------------------------------------------------------
static void modbeeDebugCallback(ModBeeDebugLevel level, ModBeeDebugCategory category, const char* message) {
    const char* levelStr = "DBG";
    switch (level) {
        case MBEE_DEBUG_ERROR:   levelStr = "ERR"; break;
        case MBEE_DEBUG_WARN:    levelStr = "WRN"; break;
        case MBEE_DEBUG_INFO:    levelStr = "INF"; break;
        case MBEE_DEBUG_VERBOSE: levelStr = "VRB"; break;
        default:                 levelStr = "DBG"; break;
    }
    Serial.printf("[MBEE][%s][%lu] %s\n", levelStr, millis(), message);
}

// ----------------------------------------------------------------
//  Error / state-change callback
//  Called for every ModBeeError event including MBEE_STATE_CHANGE.
// ----------------------------------------------------------------
static void modbeeErrorCallback(ModBeeError error, const char* message) {
    Serial.printf("[MBEE][EVT][%lu] (%d) %s\n", millis(), (int)error, message ? message : "");
}

#endif // MODBEE_ENABLE_DEBUG


// Called once when the block is initialized
void modbee_config_setup(MODBEE_CONFIG_VARS *vars)
{

#ifdef MODBEE_ENABLE_DEBUG
  // Start USB Serial for debug output.
  // If the main sketch has already called Serial.begin() this is harmless.
  Serial.begin(115200);
  delay(500);   // Give the host USB-CDC a moment to enumerate

  // Register callbacks BEFORE connect() so we capture every event from boot.
  ModBeeDebug::setGlobalDebugEnabled(true);
  g_modbeeDebug.setDebugLevel(MBEE_DEBUG_ALL);
  g_modbeeDebug.onDebug(modbeeDebugCallback);
  io.mbee.onError(modbeeErrorCallback);

  Serial.printf("\n[MBEE][DBG] === ModBee debug enabled on Node %d ===\n", io.mbee.getNodeID());
#endif

  // Configure timing parameters
  io.mbee.MODBEE_INTERFRAME_GAP_US        = 5000;  // 5000µs between frames (5ms)
  io.mbee.MODBEE_OPERATION_TIMEOUT_MS     = 250;
  io.mbee.MODBEE_RESPONSE_TIMEOUT_MS      = 250;
  io.mbee.MODBEE_RETRY_DELAY_MS           = 100;
  io.mbee.MODBEE_MAX_RETRIES              = 2;
  io.mbee.INITIAL_LISTEN_PERIOD_MS        = 2000;  // Base initial listen time
  io.mbee.TOKEN_RESPONSE_TIMEOUT_MS       = 200;   // Token passing timeout
  io.mbee.BASE_TIMEOUT                    = 100;
  io.mbee.NODE_TIMEOUT_MS                 = 1000;
  io.mbee.MODBEE_TOKEN_RECLAIM_TIMEOUT    = 500;   // Token reclaim timeout (ms)
  io.mbee.MODBEE_JOIN_CYCLE_INTERVAL      = 100;   // Join invitation interval (ms)
  io.mbee.MODBEE_JOIN_RESPONSE_TIMEOUT    = 200;   // Join response wait time (ms)
  io.mbee.MODBEE_MAX_NODES                = 5;     // Maximum nodes allowed in network

  // Enable fail-safe mode (clears all registers and values on communication loss or node loss)
  io.mbee.enableFailSafe = true;

  delay(1000);
  // Connect to the network
  io.mbee.connect();
}

// Called at every PLC scan cycle
void modbee_config_loop(MODBEE_CONFIG_VARS *vars)
{

}

//definition of external blocks - MODBEE_HAT_PWR
typedef struct {
  IEC_BOOL *EN_HAT_POWER;
} MODBEE_HAT_PWR_VARS;

extern "C" void modbee_hat_pwr_setup(MODBEE_HAT_PWR_VARS *vars);
extern "C" void modbee_hat_pwr_loop(MODBEE_HAT_PWR_VARS *vars);

#define EN_HAT_POWER (*(vars->EN_HAT_POWER))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Called once when the block is initialized
void modbee_hat_pwr_setup(MODBEE_HAT_PWR_VARS *vars)
{

}

// Called at every PLC scan cycle
void modbee_hat_pwr_loop(MODBEE_HAT_PWR_VARS *vars)
{
    io.hatPower = EN_HAT_POWER;
}
#undef EN_HAT_POWER

//definition of external blocks - MODBEE_HW_CONFIG
typedef struct {
} MODBEE_HW_CONFIG_VARS;

extern "C" void modbee_hw_config_setup(MODBEE_HW_CONFIG_VARS *vars);
extern "C" void modbee_hw_config_loop(MODBEE_HW_CONFIG_VARS *vars);


/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
//#include <ModbeeWebServer.h>

// Initialize ESP32Modbee - all communication, I/O, and protocols
// You can swap the modbus and modbee tx/rx pins as needed, just ensure they match your hardware connections
ESP32Modbee io(
  MBEE_REMOTE_IO,     // mode - Change to MB_NONE, MB_MASTER, MB_SLAVE, MB_REMOTE_IO, MBEE_REMOTE_IO
  18, 17,             // modbusRxPin, modbusTxPin
  1,                  // modbusId
  16, 15,             // modbeeRxPin, modbeeTxPin 
  1,                  // modbeeId
  115200, SERIAL_8N1, // baudrate1, serialConfig1 (Modbus)
  115200, SERIAL_8N1  // baudrate2, serialConfig2 (ModBee)
);

// Initialize ModbeeWebServer
//ModbeeWebServer webServer(io, 80);

// Called once when the block is initialized
void modbee_hw_config_setup(MODBEE_HW_CONFIG_VARS *vars)
{
  // Initialize entire I/O system with all protocols
  io.begin();
  //webServer.begin();
}

// Called at every PLC scan cycle
void modbee_hw_config_loop(MODBEE_HW_CONFIG_VARS *vars)
{
  // This handles all I/O updates, Modbus communication, and ModBee network
  io.update();
  //webServer.update();
}

//definition of external blocks - MODBEE_HW_INPUTS
typedef struct {
  IEC_BOOL *DX01;
  IEC_BOOL *DX02;
  IEC_BOOL *DX03;
  IEC_BOOL *DX04;
  IEC_BOOL *DX05;
  IEC_BOOL *DX06;
  IEC_BOOL *DX07;
  IEC_BOOL *DX08;
  IEC_REAL *AX01_SCALED;
  IEC_REAL *AX02_SCALED;
  IEC_REAL *AX03_SCALED;
  IEC_REAL *AX04_SCALED;
} MODBEE_HW_INPUTS_VARS;

extern "C" void modbee_hw_inputs_setup(MODBEE_HW_INPUTS_VARS *vars);
extern "C" void modbee_hw_inputs_loop(MODBEE_HW_INPUTS_VARS *vars);

#define DX01 (*(vars->DX01))
#define DX02 (*(vars->DX02))
#define DX03 (*(vars->DX03))
#define DX04 (*(vars->DX04))
#define DX05 (*(vars->DX05))
#define DX06 (*(vars->DX06))
#define DX07 (*(vars->DX07))
#define DX08 (*(vars->DX08))
#define AX01_Scaled (*(vars->AX01_SCALED))
#define AX02_Scaled (*(vars->AX02_SCALED))
#define AX03_Scaled (*(vars->AX03_SCALED))
#define AX04_Scaled (*(vars->AX04_SCALED))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Called once when the block is initialized
void modbee_hw_inputs_setup(MODBEE_HW_INPUTS_VARS *vars)
{
  //input.begin();
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setADCMode(0, MODE_VOLTAGE); // AI01
  io.setADCMode(1, MODE_VOLTAGE); // AI02
  io.setADCMode(2, MODE_VOLTAGE); // AI03
  io.setADCMode(3, MODE_VOLTAGE); // AI04
}

// Called at every PLC scan cycle
void modbee_hw_inputs_loop(MODBEE_HW_INPUTS_VARS *vars)
{
  DX01 = io.DI01; 
  DX02 = io.DI02; 
  DX03 = io.DI03; 
  DX04 = io.DI04; 
  DX05 = io.DI05; 
  DX06 = io.DI06; 
  DX07 = io.DI07; 
  DX08 = io.DI08; 
  AX01_Scaled = io.AI01_Scaled;
  AX02_Scaled = io.AI02_Scaled;
  AX03_Scaled = io.AI03_Scaled;
  AX04_Scaled = io.AI04_Scaled;
}
#undef DX01
#undef DX02
#undef DX03
#undef DX04
#undef DX05
#undef DX06
#undef DX07
#undef DX08
#undef AX01_Scaled
#undef AX02_Scaled
#undef AX03_Scaled
#undef AX04_Scaled

//definition of external blocks - MODBEE_HW_OUTPUTS
typedef struct {
  IEC_BOOL *DY01;
  IEC_BOOL *DY02;
  IEC_BOOL *DY03;
  IEC_BOOL *DY04;
  IEC_BOOL *DY05;
  IEC_BOOL *DY06;
  IEC_BOOL *DY07;
  IEC_BOOL *DY08;
  IEC_REAL *AY01_SCALED;
  IEC_REAL *AY02_SCALED;
} MODBEE_HW_OUTPUTS_VARS;

extern "C" void modbee_hw_outputs_setup(MODBEE_HW_OUTPUTS_VARS *vars);
extern "C" void modbee_hw_outputs_loop(MODBEE_HW_OUTPUTS_VARS *vars);

#define DY01 (*(vars->DY01))
#define DY02 (*(vars->DY02))
#define DY03 (*(vars->DY03))
#define DY04 (*(vars->DY04))
#define DY05 (*(vars->DY05))
#define DY06 (*(vars->DY06))
#define DY07 (*(vars->DY07))
#define DY08 (*(vars->DY08))
#define AY01_Scaled (*(vars->AY01_SCALED))
#define AY02_Scaled (*(vars->AY02_SCALED))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Called once when the block is initialized
void modbee_hw_outputs_setup(MODBEE_HW_OUTPUTS_VARS *vars)
{
  //output.begin();
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setDACMode(0, MODE_VOLTAGE); // AO01
  io.setDACMode(1, MODE_VOLTAGE); // AO02
}

// Called at every PLC scan cycle
void modbee_hw_outputs_loop(MODBEE_HW_OUTPUTS_VARS *vars)
{
  io.DO01 = DY01; 
  io.DO02 = DY02; 
  io.DO03 = DY03; 
  io.DO04 = DY04; 
  io.DO05 = DY05; 
  io.DO06 = DY06; 
  io.DO07 = DY07; 
  io.DO08 = DY08; 
  io.AO01_Scaled = AY01_Scaled;
  io.AO02_Scaled = AY02_Scaled;

}
#undef DY01
#undef DY02
#undef DY03
#undef DY04
#undef DY05
#undef DY06
#undef DY07
#undef DY08
#undef AY01_Scaled
#undef AY02_Scaled

//definition of external blocks - MODBEE_READ
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
} MODBEE_READ_VARS;

extern "C" void modbee_read_setup(MODBEE_READ_VARS *vars);
extern "C" void modbee_read_loop(MODBEE_READ_VARS *vars);

#define REQ (*(vars->REQ))
#define NODE_ID (*(vars->NODE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))
#define NODE_ONLINE (*(vars->NODE_ONLINE))
#define COIL_01 (*(vars->COIL_01))
#define COIL_02 (*(vars->COIL_02))
#define COIL_03 (*(vars->COIL_03))
#define COIL_04 (*(vars->COIL_04))
#define COIL_05 (*(vars->COIL_05))
#define COIL_06 (*(vars->COIL_06))
#define COIL_07 (*(vars->COIL_07))
#define COIL_08 (*(vars->COIL_08))
#define REG_01 (*(vars->REG_01))
#define REG_02 (*(vars->REG_02))
#define REG_03 (*(vars->REG_03))
#define REG_04 (*(vars->REG_04))
#define REG_05 (*(vars->REG_05))
#define REG_06 (*(vars->REG_06))
#define REG_07 (*(vars->REG_07))
#define REG_08 (*(vars->REG_08))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
 *  4. REQ fall: Reset all flags
 *  
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

typedef struct
{
  void *key; // stable per-instance key (pointer into FB instance)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;

  uint8_t reg_type;
  uint8_t len;
  uint8_t node_id;
  uint16_t start_addr;
  uint32_t operation_id;

  bool coil_buffer[MAX_ELEMENTS];
  bool ists_buffer[MAX_ELEMENTS];
  int16_t hreg_buffer[MAX_ELEMENTS];
  int16_t ireg_buffer[MAX_ELEMENTS];
} ModbeeReadCtx;

static ModbeeReadCtx s_modbee_read_ctx[MAX_INSTANCES];

static ModbeeReadCtx *get_modbee_read_ctx(MODBEE_READ_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].key == key)
      return &s_modbee_read_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbee_read_ctx[i].in_use)
    {
      s_modbee_read_ctx[i].in_use = true;
      s_modbee_read_ctx[i].key = key;
      s_modbee_read_ctx[i].last_req = false;
      s_modbee_read_ctx[i].started = false;
      s_modbee_read_ctx[i].queued = false;
      s_modbee_read_ctx[i].completed = false;
      s_modbee_read_ctx[i].reg_type = 0xFF;
      s_modbee_read_ctx[i].len = 0;
      s_modbee_read_ctx[i].node_id = 0;
      s_modbee_read_ctx[i].start_addr = 0;
      s_modbee_read_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)
      {
        s_modbee_read_ctx[i].coil_buffer[j] = false;
        s_modbee_read_ctx[i].ists_buffer[j] = false;
        s_modbee_read_ctx[i].hreg_buffer[j] = 0;
        s_modbee_read_ctx[i].ireg_buffer[j] = 0;
      }
      return &s_modbee_read_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_read_ctx(ModbeeReadCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for read completion. We map operationId back to the owning instance.
void modbeeReadCallback(uint32_t operationId)
{
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].queued && s_modbee_read_ctx[i].operation_id == operationId)
    {
      s_modbee_read_ctx[i].completed = true;
      return;
    }
  }
}

void modbee_read_setup(MODBEE_READ_VARS *vars)
{
  DONE = false;
  ERROR = false;
  NODE_ONLINE = false;
}

void modbee_read_loop(MODBEE_READ_VARS *vars)
{
  ModbeeReadCtx *ctx = get_modbee_read_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = false;
    return;
  }

  // ===== STATE 1: REQ falling edge - RESET =====
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    DONE = false;
    ERROR = false;
    NODE_ONLINE = false;
    reset_modbee_read_ctx(ctx);
    return;
  }
  
  // ===== STATE 2: REQ rising edge - START OPERATION =====
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);
    if (!NODE_ONLINE)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
      return;
    }

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type > 3)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->operation_id = 0;
    ctx->len = len;
    ctx->reg_type = reg_type;
    ctx->node_id = (uint8_t)NODE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    uint32_t operation_id = 0;
    switch (ctx->reg_type)
    {
    case 0:
      operation_id = io.mbee.readCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    case 1:
      operation_id = io.mbee.readIstsManual(ctx->node_id, ctx->start_addr, ctx->ists_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    case 2:
      operation_id = io.mbee.readHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    case 3:
      operation_id = io.mbee.readIregManual(ctx->node_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    default:
      break;
    }

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
      return;
    }

    ctx->operation_id = operation_id;
    ctx->queued = true;
    return;
  }
  
  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====
  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = false;
      ctx->queued = false;
      ctx->started = false;
      ctx->operation_id = 0;

      const uint8_t len = ctx->len;
      switch (ctx->reg_type)
      {
      case 0:
        COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;
        COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;
        COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;
        COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;
        COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;
        COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;
        COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;
        COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;
        break;
      case 1:
        COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;
        COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;
        COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;
        COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;
        COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;
        COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;
        COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;
        COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;
        break;
      case 2:
        REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;
        REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;
        REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;
        REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;
        REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;
        REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;
        REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;
        REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;
        break;
      case 3:
        REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;
        REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;
        REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;
        REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;
        REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;
        REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;
        REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;
        REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;
        break;
      default:
        break;
      }
    }
    return;
  }
  
  // Not queued anymore and not done yet: nothing to do.
}
#undef REQ
#undef NODE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef DONE
#undef ERROR
#undef NODE_ONLINE
#undef COIL_01
#undef COIL_02
#undef COIL_03
#undef COIL_04
#undef COIL_05
#undef COIL_06
#undef COIL_07
#undef COIL_08
#undef REG_01
#undef REG_02
#undef REG_03
#undef REG_04
#undef REG_05
#undef REG_06
#undef REG_07
#undef REG_08

//definition of external blocks - MODBEE_READ_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
} MODBEE_READ_ARRAY_VARS;

extern "C" void modbee_read_array_setup(MODBEE_READ_ARRAY_VARS *vars);
extern "C" void modbee_read_array_loop(MODBEE_READ_ARRAY_VARS *vars);

#define REQ (*(vars->REQ))
#define NODE_ID (*(vars->NODE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))
#define NODE_ONLINE (*(vars->NODE_ONLINE))
#define COILS (vars->COILS)
#define REGS (vars->REGS)

/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBEE_READ_ARRAY (Multi-element, up to 32)
 *
 *  Reads multiple values from a ModBee node with array outputs.
 *  LENGTH specifies element count (1-32)
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
 *  4. REQ fall: Reset all flags
 *
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBEE_READ_ARRAY_MAX_ELEMENTS 32
#define MODBEE_READ_ARRAY_MAX_INSTANCES 16

typedef struct
{
  void *key; // stable per-instance key (pointer into FB instance)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;

  uint8_t reg_type;
  uint8_t len;
  uint8_t node_id;
  uint16_t start_addr;
  uint32_t operation_id;

  bool coil_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
  bool ists_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
  int16_t hreg_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
  int16_t ireg_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
} ModbeeReadArrayCtx;

static ModbeeReadArrayCtx s_modbee_read_array_ctx[MODBEE_READ_ARRAY_MAX_INSTANCES];

static ModbeeReadArrayCtx *get_modbee_read_array_ctx(MODBEE_READ_ARRAY_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBEE_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbee_read_array_ctx[i].in_use && s_modbee_read_array_ctx[i].key == key)
      return &s_modbee_read_array_ctx[i];
  }
  for (int i = 0; i < MODBEE_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbee_read_array_ctx[i].in_use)
    {
      s_modbee_read_array_ctx[i].in_use = true;
      s_modbee_read_array_ctx[i].key = key;
      s_modbee_read_array_ctx[i].last_req = false;
      s_modbee_read_array_ctx[i].started = false;
      s_modbee_read_array_ctx[i].queued = false;
      s_modbee_read_array_ctx[i].completed = false;
      s_modbee_read_array_ctx[i].reg_type = 0xFF;
      s_modbee_read_array_ctx[i].len = 0;
      s_modbee_read_array_ctx[i].node_id = 0;
      s_modbee_read_array_ctx[i].start_addr = 0;
      s_modbee_read_array_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MODBEE_READ_ARRAY_MAX_ELEMENTS; j++)
      {
        s_modbee_read_array_ctx[i].coil_buffer[j] = false;
        s_modbee_read_array_ctx[i].ists_buffer[j] = false;
        s_modbee_read_array_ctx[i].hreg_buffer[j] = 0;
        s_modbee_read_array_ctx[i].ireg_buffer[j] = 0;
      }
      return &s_modbee_read_array_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_read_array_ctx(ModbeeReadArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for read completion. We map operationId back to the owning instance.
void modbeeReadArrayCallback(uint32_t operationId)
{
  for (int i = 0; i < MODBEE_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbee_read_array_ctx[i].in_use && s_modbee_read_array_ctx[i].queued && s_modbee_read_array_ctx[i].operation_id == operationId)
    {
      s_modbee_read_array_ctx[i].completed = true;
      return;
    }
  }
}

static inline uint8_t *modbee_read_array_coils_ptr(MODBEE_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (uint8_t *)COILS;
}

static inline int16_t *modbee_read_array_regs_ptr(MODBEE_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (int16_t *)REGS;
}

static inline void modbee_read_array_clear_outputs(MODBEE_READ_ARRAY_VARS *vars)
{
  // Clear the full arrays to avoid stale data.
  uint8_t *coils = modbee_read_array_coils_ptr(vars);
  int16_t *regs = modbee_read_array_regs_ptr(vars);
  for (uint8_t i = 0; i < MODBEE_READ_ARRAY_MAX_ELEMENTS; i++)
  {
    coils[i] = 0;
    regs[i] = 0;
  }
}

void modbee_read_array_setup(MODBEE_READ_ARRAY_VARS *vars)
{
  DONE = false;
  ERROR = false;
  NODE_ONLINE = false;
  modbee_read_array_clear_outputs(vars);
}

void modbee_read_array_loop(MODBEE_READ_ARRAY_VARS *vars)
{
  ModbeeReadArrayCtx *ctx = get_modbee_read_array_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = false;
    return;
  }

  // ===== STATE 1: REQ falling edge - RESET =====
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    DONE = false;
    ERROR = false;
    NODE_ONLINE = false;
    reset_modbee_read_array_ctx(ctx);
    return;
  }

  // ===== STATE 2: REQ rising edge - START OPERATION =====
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;
    modbee_read_array_clear_outputs(vars);

    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);
    if (!NODE_ONLINE)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
      return;
    }

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBEE_READ_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type > 3)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->operation_id = 0;
    ctx->len = len;
    ctx->reg_type = reg_type;
    ctx->node_id = (uint8_t)NODE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    uint32_t operation_id = 0;
    switch (ctx->reg_type)
    {
    case 0:
      operation_id = io.mbee.readCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    case 1:
      operation_id = io.mbee.readIstsManual(ctx->node_id, ctx->start_addr, ctx->ists_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    case 2:
      operation_id = io.mbee.readHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    case 3:
      operation_id = io.mbee.readIregManual(ctx->node_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    default:
      break;
    }

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
      return;
    }

    ctx->operation_id = operation_id;
    ctx->queued = true;
    return;
  }

  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====
  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = false;
      ctx->queued = false;
      ctx->started = false;
      ctx->operation_id = 0;

      const uint8_t len = ctx->len;
      uint8_t *coils = modbee_read_array_coils_ptr(vars);
      int16_t *regs = modbee_read_array_regs_ptr(vars);
      switch (ctx->reg_type)
      {
      case 0:
        for (uint8_t i = 0; i < len; i++)
          coils[i] = ctx->coil_buffer[i] ? 1 : 0;
        break;
      case 1:
        for (uint8_t i = 0; i < len; i++)
          coils[i] = ctx->ists_buffer[i] ? 1 : 0;
        break;
      case 2:
        for (uint8_t i = 0; i < len; i++)
          regs[i] = ctx->hreg_buffer[i];
        break;
      case 3:
        for (uint8_t i = 0; i < len; i++)
          regs[i] = ctx->ireg_buffer[i];
        break;
      default:
        break;
      }
    }
    return;
  }
}
#undef REQ
#undef NODE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef DONE
#undef ERROR
#undef NODE_ONLINE
#undef COILS
#undef REGS

//definition of external blocks - MODBEE_WRITE
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
} MODBEE_WRITE_VARS;

extern "C" void modbee_write_setup(MODBEE_WRITE_VARS *vars);
extern "C" void modbee_write_loop(MODBEE_WRITE_VARS *vars);

#define REQ (*(vars->REQ))
#define NODE_ID (*(vars->NODE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define COIL_01 (*(vars->COIL_01))
#define COIL_02 (*(vars->COIL_02))
#define COIL_03 (*(vars->COIL_03))
#define COIL_04 (*(vars->COIL_04))
#define COIL_05 (*(vars->COIL_05))
#define COIL_06 (*(vars->COIL_06))
#define COIL_07 (*(vars->COIL_07))
#define COIL_08 (*(vars->COIL_08))
#define REG_01 (*(vars->REG_01))
#define REG_02 (*(vars->REG_02))
#define REG_03 (*(vars->REG_03))
#define REG_04 (*(vars->REG_04))
#define REG_05 (*(vars->REG_05))
#define REG_06 (*(vars->REG_06))
#define REG_07 (*(vars->REG_07))
#define REG_08 (*(vars->REG_08))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))
#define NODE_ONLINE (*(vars->NODE_ONLINE))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async write with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Set DONE when callback indicates success
 *  4. REQ fall: Reset all flags
 *  
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

typedef struct
{
  void *key; // stable per-instance key (pointer into FB instance)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;

  uint8_t reg_type;
  uint8_t len;
  uint8_t node_id;
  uint16_t start_addr;
  uint32_t operation_id;

  bool coil_buffer[MAX_ELEMENTS];
  int16_t hreg_buffer[MAX_ELEMENTS];
} ModbeeWriteCtx;

static ModbeeWriteCtx s_modbee_write_ctx[MAX_INSTANCES];

static ModbeeWriteCtx *get_modbee_write_ctx(MODBEE_WRITE_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].key == key)
      return &s_modbee_write_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbee_write_ctx[i].in_use)
    {
      s_modbee_write_ctx[i].in_use = true;
      s_modbee_write_ctx[i].key = key;
      s_modbee_write_ctx[i].last_req = false;
      s_modbee_write_ctx[i].started = false;
      s_modbee_write_ctx[i].queued = false;
      s_modbee_write_ctx[i].completed = false;
      s_modbee_write_ctx[i].reg_type = 0xFF;
      s_modbee_write_ctx[i].len = 0;
      s_modbee_write_ctx[i].node_id = 0;
      s_modbee_write_ctx[i].start_addr = 0;
      s_modbee_write_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)
      {
        s_modbee_write_ctx[i].coil_buffer[j] = false;
        s_modbee_write_ctx[i].hreg_buffer[j] = 0;
      }
      return &s_modbee_write_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_write_ctx(ModbeeWriteCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for write completion. We map operationId back to the owning instance.
void modbeeWriteCallback(uint32_t operationId)
{
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].queued && s_modbee_write_ctx[i].operation_id == operationId)
    {
      s_modbee_write_ctx[i].completed = true;
      return;
    }
  }
}

void modbee_write_setup(MODBEE_WRITE_VARS *vars)
{
  DONE = false;
  ERROR = false;
  NODE_ONLINE = false;
}

void modbee_write_loop(MODBEE_WRITE_VARS *vars)
{
  ModbeeWriteCtx *ctx = get_modbee_write_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = false;
    return;
  }
  
  // ===== STATE 1: REQ falling edge - RESET =====
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    DONE = false;
    ERROR = false;
    NODE_ONLINE = false;
    reset_modbee_write_ctx(ctx);
    return;
  }
  
  // ===== STATE 2: REQ rising edge - START OPERATION =====
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;
    
    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);
    if (!NODE_ONLINE) {
      ERROR = true;
      DONE = false;  // Error occurred, operation not done
      return;
    }
    
    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;  // Error occurred, operation not done
      reset_modbee_write_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type != 0 && reg_type != 2)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->operation_id = 0;
    ctx->len = len;
    ctx->reg_type = reg_type;
    ctx->node_id = (uint8_t)NODE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)
    {
      ctx->coil_buffer[i] = false;
      ctx->hreg_buffer[i] = 0;
    }

    if (ctx->reg_type == 0)
    {
      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;
      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;
      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;
      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;
      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;
      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;
      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;
      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;
    }
    else
    {
      ctx->hreg_buffer[0] = (len > 0) ? (int16_t)REG_01 : 0;
      ctx->hreg_buffer[1] = (len > 1) ? (int16_t)REG_02 : 0;
      ctx->hreg_buffer[2] = (len > 2) ? (int16_t)REG_03 : 0;
      ctx->hreg_buffer[3] = (len > 3) ? (int16_t)REG_04 : 0;
      ctx->hreg_buffer[4] = (len > 4) ? (int16_t)REG_05 : 0;
      ctx->hreg_buffer[5] = (len > 5) ? (int16_t)REG_06 : 0;
      ctx->hreg_buffer[6] = (len > 6) ? (int16_t)REG_07 : 0;
      ctx->hreg_buffer[7] = (len > 7) ? (int16_t)REG_08 : 0;
    }

    uint32_t operation_id = 0;
    if (ctx->reg_type == 0)
      operation_id = io.mbee.writeCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeWriteCallback);
    else
      operation_id = io.mbee.writeHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeWriteCallback);

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_ctx(ctx);
      return;
    }

    ctx->operation_id = operation_id;
    ctx->queued = true;
    return;
  }
  
  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====
  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = false;
      ctx->queued = false;
      ctx->started = false;
      ctx->operation_id = 0;
    }
    return;
  }
  
  // Not queued anymore and not done yet: nothing to do.
}
#undef REQ
#undef NODE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef COIL_01
#undef COIL_02
#undef COIL_03
#undef COIL_04
#undef COIL_05
#undef COIL_06
#undef COIL_07
#undef COIL_08
#undef REG_01
#undef REG_02
#undef REG_03
#undef REG_04
#undef REG_05
#undef REG_06
#undef REG_07
#undef REG_08
#undef DONE
#undef ERROR
#undef NODE_ONLINE

//definition of external blocks - MODBEE_WRITE_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
} MODBEE_WRITE_ARRAY_VARS;

extern "C" void modbee_write_array_setup(MODBEE_WRITE_ARRAY_VARS *vars);
extern "C" void modbee_write_array_loop(MODBEE_WRITE_ARRAY_VARS *vars);

#define REQ (*(vars->REQ))
#define NODE_ID (*(vars->NODE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define COILS (vars->COILS)
#define REGS (vars->REGS)
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))
#define NODE_ONLINE (*(vars->NODE_ONLINE))

/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBEE_WRITE_ARRAY (Multi-element, up to 32)
 *
 *  Writes multiple values to a ModBee node from array inputs.
 *  LENGTH specifies element count (1-32)
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async write with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Set DONE when callback indicates success
 *  4. REQ fall: Reset all flags
 *
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBEE_WRITE_ARRAY_MAX_ELEMENTS 32
#define MODBEE_WRITE_ARRAY_MAX_INSTANCES 16

typedef struct
{
  void *key; // stable per-instance key (pointer into FB instance)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;

  uint8_t reg_type;
  uint8_t len;
  uint8_t node_id;
  uint16_t start_addr;
  uint32_t operation_id;

  bool coil_buffer[MODBEE_WRITE_ARRAY_MAX_ELEMENTS];
  int16_t hreg_buffer[MODBEE_WRITE_ARRAY_MAX_ELEMENTS];
} ModbeeWriteArrayCtx;

static ModbeeWriteArrayCtx s_modbee_write_array_ctx[MODBEE_WRITE_ARRAY_MAX_INSTANCES];

static ModbeeWriteArrayCtx *get_modbee_write_array_ctx(MODBEE_WRITE_ARRAY_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBEE_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbee_write_array_ctx[i].in_use && s_modbee_write_array_ctx[i].key == key)
      return &s_modbee_write_array_ctx[i];
  }
  for (int i = 0; i < MODBEE_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbee_write_array_ctx[i].in_use)
    {
      s_modbee_write_array_ctx[i].in_use = true;
      s_modbee_write_array_ctx[i].key = key;
      s_modbee_write_array_ctx[i].last_req = false;
      s_modbee_write_array_ctx[i].started = false;
      s_modbee_write_array_ctx[i].queued = false;
      s_modbee_write_array_ctx[i].completed = false;
      s_modbee_write_array_ctx[i].reg_type = 0xFF;
      s_modbee_write_array_ctx[i].len = 0;
      s_modbee_write_array_ctx[i].node_id = 0;
      s_modbee_write_array_ctx[i].start_addr = 0;
      s_modbee_write_array_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MODBEE_WRITE_ARRAY_MAX_ELEMENTS; j++)
      {
        s_modbee_write_array_ctx[i].coil_buffer[j] = false;
        s_modbee_write_array_ctx[i].hreg_buffer[j] = 0;
      }
      return &s_modbee_write_array_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_write_array_ctx(ModbeeWriteArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for write completion. We map operationId back to the owning instance.
void modbeeWriteArrayCallback(uint32_t operationId)
{
  for (int i = 0; i < MODBEE_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbee_write_array_ctx[i].in_use && s_modbee_write_array_ctx[i].queued && s_modbee_write_array_ctx[i].operation_id == operationId)
    {
      s_modbee_write_array_ctx[i].completed = true;
      return;
    }
  }
}

void modbee_write_array_setup(MODBEE_WRITE_ARRAY_VARS *vars)
{
  DONE = false;
  ERROR = false;
  NODE_ONLINE = false;
}

void modbee_write_array_loop(MODBEE_WRITE_ARRAY_VARS *vars)
{
  ModbeeWriteArrayCtx *ctx = get_modbee_write_array_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = false;
    return;
  }

  // ===== STATE 1: REQ falling edge - RESET =====
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    DONE = false;
    ERROR = false;
    NODE_ONLINE = false;
    reset_modbee_write_array_ctx(ctx);
    return;
  }

  // ===== STATE 2: REQ rising edge - START OPERATION =====
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);
    if (!NODE_ONLINE)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_array_ctx(ctx);
      return;
    }

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBEE_WRITE_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_array_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type != 0 && reg_type != 2)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_array_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->operation_id = 0;
    ctx->len = len;
    ctx->reg_type = reg_type;
    ctx->node_id = (uint8_t)NODE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    for (uint8_t i = 0; i < MODBEE_WRITE_ARRAY_MAX_ELEMENTS; i++)
    {
      ctx->coil_buffer[i] = false;
      ctx->hreg_buffer[i] = 0;
    }

    // Copy input arrays into persistent buffers for async write.
    // NOTE: In OpenPLC generated C, ARRAY pins are exposed as pointer macros.
    const uint8_t *coils_in = (const uint8_t *)COILS;
    const int16_t *regs_in = (const int16_t *)REGS;
    if (ctx->reg_type == 0)
    {
      for (uint8_t i = 0; i < len; i++)
        ctx->coil_buffer[i] = (coils_in[i] != 0);
    }
    else
    {
      for (uint8_t i = 0; i < len; i++)
        ctx->hreg_buffer[i] = regs_in[i];
    }

    uint32_t operation_id = 0;
    if (ctx->reg_type == 0)
      operation_id = io.mbee.writeCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeWriteArrayCallback);
    else
      operation_id = io.mbee.writeHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeWriteArrayCallback);

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_array_ctx(ctx);
      return;
    }

    ctx->operation_id = operation_id;
    ctx->queued = true;
    return;
  }

  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====
  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = false;
      ctx->queued = false;
      ctx->started = false;
      ctx->operation_id = 0;
    }
    return;
  }
}
#undef REQ
#undef NODE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef COILS
#undef REGS
#undef DONE
#undef ERROR
#undef NODE_ONLINE

//definition of external blocks - MODBUS_ADD_REGISTER
typedef struct {
  IEC_BYTE *REG;
  IEC_WORD *ADDRESS;
  IEC_BOOL *VAR_BOOL;
  IEC_INT *VAR_INT;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBUS_ADD_REGISTER_VARS;

extern "C" void modbus_add_register_setup(MODBUS_ADD_REGISTER_VARS *vars);
extern "C" void modbus_add_register_loop(MODBUS_ADD_REGISTER_VARS *vars);

#define REG (*(vars->REG))
#define ADDRESS (*(vars->ADDRESS))
#define VAR_BOOL (*(vars->VAR_BOOL))
#define VAR_INT (*(vars->VAR_INT))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))

/* ================================================================
 *  C/C++ FUNCTION BLOCK
 *
 *  ---------------------------------------------------------------
 *  - This function block runs **in sync** with the PLC runtime.
 *  - The `setup()` function is called once when the block initializes.
 *  - The `loop()` function is called at every PLC scan cycle.
 *  - Block input and output variables declared in the variable table
 *    can be accessed directly by name in this C/C++ code.
 *
 *  This block executes as part of the main PLC process and follows
 *  the configured scan time in the Resources. Use it for real-time
 *  control logic, fast I/O operations, or any C-based algorithms.
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Modbus ADD REGISTER - Self-contained register allocation and registration
// Each block instance allocates its own storage and registers automatically
// Registers once during setup() and maintains state

// Called once when the block is initialized
void modbus_add_register_setup(MODBUS_ADD_REGISTER_VARS *vars)
{
  DONE = false;
  ERROR = false;
  
  // Validate register type
  if (REG > 3 || ADDRESS == 0) {
    ERROR = true;
    return;
  }
  
  // Register based on type - same API as ESP32Modbee.cpp
  switch (REG) {
    case 0:  // COILS
      io.mb.addCoil(ADDRESS);
      io.mb.Coil(ADDRESS, 0);
      break;
    case 1:  // INPUT STATUS
      io.mb.addIsts(ADDRESS);
      io.mb.Ists(ADDRESS, 0);
      break;
    case 2:  // HOLDING REGISTERS
      io.mb.addHreg(ADDRESS, VAR_INT);
      io.mb.Hreg(ADDRESS, 0);
      break;
    case 3:  // INPUT REGISTERS
      io.mb.addIreg(ADDRESS);
      io.mb.Ireg(ADDRESS, 0);
      break;
  }
  
  DONE = true;  // Functions return void; always succeeds for valid addresses
}

// Called at every PLC scan cycle
void modbus_add_register_loop(MODBUS_ADD_REGISTER_VARS *vars)
{
  // State maintained from setup() - nothing to do here
}
#undef REG
#undef ADDRESS
#undef VAR_BOOL
#undef VAR_INT
#undef DONE
#undef ERROR

//definition of external blocks - MODBUS_READ
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
} MODBUS_READ_VARS;

extern "C" void modbus_read_setup(MODBUS_READ_VARS *vars);
extern "C" void modbus_read_loop(MODBUS_READ_VARS *vars);

#define REQ (*(vars->REQ))
#define SLAVE_ID (*(vars->SLAVE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))
#define COIL_01 (*(vars->COIL_01))
#define COIL_02 (*(vars->COIL_02))
#define COIL_03 (*(vars->COIL_03))
#define COIL_04 (*(vars->COIL_04))
#define COIL_05 (*(vars->COIL_05))
#define COIL_06 (*(vars->COIL_06))
#define COIL_07 (*(vars->COIL_07))
#define COIL_08 (*(vars->COIL_08))
#define REG_01 (*(vars->REG_01))
#define REG_02 (*(vars->REG_02))
#define REG_03 (*(vars->REG_03))
#define REG_04 (*(vars->REG_04))
#define REG_05 (*(vars->REG_05))
#define REG_06 (*(vars->REG_06))
#define REG_07 (*(vars->REG_07))
#define REG_08 (*(vars->REG_08))

/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_READ (Multi-element, up to 8)
 *
 *  Reads multiple values from Modbus slave with scalar outputs
 *  LENGTH specifies element count (1-8)
 *  
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
 *  4. REQ fall: Reset all flags
 *  
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

// -----------------------------------------------------------------------------
// Shared "one transaction at a time" manager
// NOTE: The underlying ModbusRTU stack cannot safely run multiple in-flight
// requests when different FB instances are issuing async transactions.
// -----------------------------------------------------------------------------
#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR
#define MODBEE_OPENPLC_MODBUS_TX_MGR
static volatile void *modbee_mb_owner = nullptr;
static inline bool modbee_mb_claim(void *owner)
{
  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))
    return false;
  modbee_mb_owner = owner;
  return true;
}
static inline void modbee_mb_release(void *owner)
{
  if (modbee_mb_owner == owner)
    modbee_mb_owner = nullptr;
}
#endif

typedef struct
{
  void *key; // stable per-instance key (e.g. pointer to REQ storage)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;
  volatile bool success;

  uint8_t reg_type;
  uint8_t len;
  uint8_t slave_id;
  uint16_t start_addr;

  bool coil_buffer[MAX_ELEMENTS];
  bool ists_buffer[MAX_ELEMENTS];
  uint16_t hreg_buffer[MAX_ELEMENTS];
  uint16_t ireg_buffer[MAX_ELEMENTS];
} ModbusReadCtx;

static ModbusReadCtx s_modbus_read_ctx[MAX_INSTANCES];
static volatile ModbusReadCtx *s_modbus_read_active = nullptr;

static ModbusReadCtx *get_modbus_read_ctx(MODBUS_READ_VARS *vars)
{
  // IMPORTANT: `vars` itself is a stack-local struct in OpenPLC's generated code,
  // so `vars` (and its address) is NOT stable across scan cycles.
  // The pointers inside `vars` *are* stable (they point into the FB instance).
  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.
  // So `vars->REQ` will get macro-expanded and break compilation.
  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbus_read_ctx[i].in_use && s_modbus_read_ctx[i].key == key)
      return &s_modbus_read_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbus_read_ctx[i].in_use)
    {
      s_modbus_read_ctx[i].in_use = true;
      s_modbus_read_ctx[i].key = key;
      s_modbus_read_ctx[i].last_req = false;
      s_modbus_read_ctx[i].started = false;
      s_modbus_read_ctx[i].queued = false;
      s_modbus_read_ctx[i].completed = false;
      s_modbus_read_ctx[i].success = false;
      s_modbus_read_ctx[i].reg_type = 0xFF;
      s_modbus_read_ctx[i].len = 0;
      s_modbus_read_ctx[i].slave_id = 0;
      s_modbus_read_ctx[i].start_addr = 0;
      return &s_modbus_read_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_read_ctx(ModbusReadCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusReadCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusReadCtx *ctx = (ModbusReadCtx *)s_modbus_read_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_read_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

static inline void copy_read_results(MODBUS_READ_VARS *vars, const ModbusReadCtx *ctx)
{
  // OpenPLC generates access macros like `#define COIL_01 (*(vars->COIL_01))`.
  // Those macros require a local variable named `vars` in scope.
  if (!vars || !ctx)
    return;

  const uint8_t len = ctx->len;
  switch (ctx->reg_type)
  {
  case 0: // COILS
    COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;
    COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;
    COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;
    COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;
    COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;
    COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;
    COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;
    COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;
    break;
  case 1: // INPUT STATUS
    COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;
    COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;
    COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;
    COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;
    COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;
    COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;
    COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;
    COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;
    break;
  case 2: // HOLDING REGISTERS
    REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;
    REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;
    REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;
    REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;
    REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;
    REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;
    REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;
    REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;
    break;
  case 3: // INPUT REGISTERS
    REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;
    REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;
    REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;
    REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;
    REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;
    REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;
    REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;
    REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;
    break;
  default:
    break;
  }
}

void modbus_read_setup(MODBUS_READ_VARS *vars)
{
  DONE = false;
  ERROR = false;
}

void modbus_read_loop(MODBUS_READ_VARS *vars)
{
  ModbusReadCtx *ctx = get_modbus_read_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = true;
    return;
  }

  // REQ falling edge: reset instance state
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    reset_modbus_read_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_read_active == ctx)
      s_modbus_read_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters, begin operation
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_read_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->success = false;
    ctx->len = len;
    ctx->reg_type = (uint8_t)REG_TYPE;
    ctx->slave_id = (uint8_t)SLAVE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;
  }

  // Nothing to do unless we're in an active request cycle
  if (!REQ || DONE)
    return;

  // If queued, wait for callback to mark completion
  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = !ctx->success;
      ctx->queued = false;
      ctx->started = false;
      if (!ERROR)
        copy_read_results(vars, ctx);
    }
    return;
  }

  // Not queued yet: try to claim the Modbus stack and queue the transaction.
  // If the stack is busy, we just retry on the next scan (no error).
  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_read_active = ctx;
  bool queued = false;
  switch (ctx->reg_type)
  {
  case 0: // COILS
    queued = (io.mb.readCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  case 1: // INPUT STATUS
    queued = (io.mb.readIsts(ctx->slave_id, ctx->start_addr, ctx->ists_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  case 2: // HOLDING REGISTERS
    queued = (io.mb.readHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  case 3: // INPUT REGISTERS
    queued = (io.mb.readIreg(ctx->slave_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  default:
    break;
  }

  if (!queued)
  {
    s_modbus_read_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}
#undef REQ
#undef SLAVE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef DONE
#undef ERROR
#undef COIL_01
#undef COIL_02
#undef COIL_03
#undef COIL_04
#undef COIL_05
#undef COIL_06
#undef COIL_07
#undef COIL_08
#undef REG_01
#undef REG_02
#undef REG_03
#undef REG_04
#undef REG_05
#undef REG_06
#undef REG_07
#undef REG_08

//definition of external blocks - MODBUS_READ_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
} MODBUS_READ_ARRAY_VARS;

extern "C" void modbus_read_array_setup(MODBUS_READ_ARRAY_VARS *vars);
extern "C" void modbus_read_array_loop(MODBUS_READ_ARRAY_VARS *vars);

#define REQ (*(vars->REQ))
#define SLAVE_ID (*(vars->SLAVE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))
#define COILS (vars->COILS)
#define REGS (vars->REGS)

/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_READ_ARRAY (Multi-element, up to 32)
 *
 *  Reads multiple values from Modbus slave with array outputs.
 *  LENGTH specifies element count (1-32)
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
 *  4. REQ fall: Reset all flags
 *
 *  NOTE: MODBUS_* blocks use a shared one-transaction-at-a-time manager.
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBUS_READ_ARRAY_MAX_ELEMENTS 32
#define MODBUS_READ_ARRAY_MAX_INSTANCES 16

// Shared Modbus transaction manager (same pattern as existing MODBUS_READ/MODBUS_WRITE)
#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR
#define MODBEE_OPENPLC_MODBUS_TX_MGR
static volatile void *modbee_mb_owner = nullptr;
static inline bool modbee_mb_claim(void *owner)
{
  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))
    return false;
  modbee_mb_owner = owner;
  return true;
}
static inline void modbee_mb_release(void *owner)
{
  if (modbee_mb_owner == owner)
    modbee_mb_owner = nullptr;
}
#endif

typedef struct
{
  void *key; // stable per-instance key (e.g. pointer to REQ storage)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;
  volatile bool success;

  uint8_t reg_type;
  uint8_t len;
  uint8_t slave_id;
  uint16_t start_addr;

  bool coil_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
  bool ists_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
  uint16_t hreg_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
  uint16_t ireg_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
} ModbusReadArrayCtx;

static ModbusReadArrayCtx s_modbus_read_array_ctx[MODBUS_READ_ARRAY_MAX_INSTANCES];
static volatile ModbusReadArrayCtx *s_modbus_read_array_active = nullptr;

static ModbusReadArrayCtx *get_modbus_read_array_ctx(MODBUS_READ_ARRAY_VARS *vars)
{
  // `&REQ` expands to stable per-instance storage pointer.
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBUS_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbus_read_array_ctx[i].in_use && s_modbus_read_array_ctx[i].key == key)
      return &s_modbus_read_array_ctx[i];
  }
  for (int i = 0; i < MODBUS_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbus_read_array_ctx[i].in_use)
    {
      s_modbus_read_array_ctx[i].in_use = true;
      s_modbus_read_array_ctx[i].key = key;
      s_modbus_read_array_ctx[i].last_req = false;
      s_modbus_read_array_ctx[i].started = false;
      s_modbus_read_array_ctx[i].queued = false;
      s_modbus_read_array_ctx[i].completed = false;
      s_modbus_read_array_ctx[i].success = false;
      s_modbus_read_array_ctx[i].reg_type = 0xFF;
      s_modbus_read_array_ctx[i].len = 0;
      s_modbus_read_array_ctx[i].slave_id = 0;
      s_modbus_read_array_ctx[i].start_addr = 0;
      return &s_modbus_read_array_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_read_array_ctx(ModbusReadArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusReadArrayCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusReadArrayCtx *ctx = (ModbusReadArrayCtx *)s_modbus_read_array_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_read_array_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

static inline uint8_t *modbus_read_array_coils_ptr(MODBUS_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (uint8_t *)COILS;
}

static inline int16_t *modbus_read_array_regs_ptr(MODBUS_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (int16_t *)REGS;
}

static inline void modbus_read_array_clear_outputs(MODBUS_READ_ARRAY_VARS *vars)
{
  uint8_t *coils = modbus_read_array_coils_ptr(vars);
  int16_t *regs = modbus_read_array_regs_ptr(vars);
  for (uint8_t i = 0; i < MODBUS_READ_ARRAY_MAX_ELEMENTS; i++)
  {
    coils[i] = 0;
    regs[i] = 0;
  }
}

static inline void modbus_read_array_copy_results(MODBUS_READ_ARRAY_VARS *vars, const ModbusReadArrayCtx *ctx)
{
  if (!ctx)
    return;

  modbus_read_array_clear_outputs(vars);
  const uint8_t len = ctx->len;
  uint8_t *coils = modbus_read_array_coils_ptr(vars);
  int16_t *regs = modbus_read_array_regs_ptr(vars);
  switch (ctx->reg_type)
  {
  case 0: // COILS
    for (uint8_t i = 0; i < len; i++)
      coils[i] = ctx->coil_buffer[i] ? 1 : 0;
    break;
  case 1: // INPUT STATUS
    for (uint8_t i = 0; i < len; i++)
      coils[i] = ctx->ists_buffer[i] ? 1 : 0;
    break;
  case 2: // HOLDING REGISTERS
    for (uint8_t i = 0; i < len; i++)
      regs[i] = (int16_t)ctx->hreg_buffer[i];
    break;
  case 3: // INPUT REGISTERS
    for (uint8_t i = 0; i < len; i++)
      regs[i] = (int16_t)ctx->ireg_buffer[i];
    break;
  default:
    break;
  }
}

void modbus_read_array_setup(MODBUS_READ_ARRAY_VARS *vars)
{
  DONE = false;
  ERROR = false;
  modbus_read_array_clear_outputs(vars);
}

void modbus_read_array_loop(MODBUS_READ_ARRAY_VARS *vars)
{
  ModbusReadArrayCtx *ctx = get_modbus_read_array_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = true;
    return;
  }

  // REQ falling edge: reset instance state
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    reset_modbus_read_array_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_read_array_active == ctx)
      s_modbus_read_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;
    modbus_read_array_clear_outputs(vars);

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBUS_READ_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_read_array_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->success = false;
    ctx->len = len;
    ctx->reg_type = (uint8_t)REG_TYPE;
    ctx->slave_id = (uint8_t)SLAVE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;
  }

  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = !ctx->success;
      ctx->queued = false;
      ctx->started = false;
      if (!ERROR)
        modbus_read_array_copy_results(vars, ctx);
    }
    return;
  }

  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_read_array_active = ctx;
  bool queued = false;
  switch (ctx->reg_type)
  {
  case 0:
    queued = (io.mb.readCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  case 1:
    queued = (io.mb.readIsts(ctx->slave_id, ctx->start_addr, ctx->ists_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  case 2:
    queued = (io.mb.readHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  case 3:
    queued = (io.mb.readIreg(ctx->slave_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  default:
    break;
  }

  if (!queued)
  {
    s_modbus_read_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}
#undef REQ
#undef SLAVE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef DONE
#undef ERROR
#undef COILS
#undef REGS

//definition of external blocks - MODBUS_WRITE
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBUS_WRITE_VARS;

extern "C" void modbus_write_setup(MODBUS_WRITE_VARS *vars);
extern "C" void modbus_write_loop(MODBUS_WRITE_VARS *vars);

#define REQ (*(vars->REQ))
#define SLAVE_ID (*(vars->SLAVE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define COIL_01 (*(vars->COIL_01))
#define COIL_02 (*(vars->COIL_02))
#define COIL_03 (*(vars->COIL_03))
#define COIL_04 (*(vars->COIL_04))
#define COIL_05 (*(vars->COIL_05))
#define COIL_06 (*(vars->COIL_06))
#define COIL_07 (*(vars->COIL_07))
#define COIL_08 (*(vars->COIL_08))
#define REG_01 (*(vars->REG_01))
#define REG_02 (*(vars->REG_02))
#define REG_03 (*(vars->REG_03))
#define REG_04 (*(vars->REG_04))
#define REG_05 (*(vars->REG_05))
#define REG_06 (*(vars->REG_06))
#define REG_07 (*(vars->REG_07))
#define REG_08 (*(vars->REG_08))
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))

/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_WRITE (Multi-element, up to 8)
 *
 *  Writes multiple values to Modbus slave from scalar inputs
 *  LENGTH specifies element count (1-8)
 *  
 *  PROPER STATE MACHINE:
 *  1. REQ rise: Queue write operation
 *  2. Wait: Monitor with 1000ms timeout
 *  3. Complete: Mark done (success/timeout)
 *  4. REQ fall: Reset all flags
 *  
 *  INVARIANT: DONE=true ONLY means operation finished (success or timeout)
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

// Shared Modbus transaction manager (see MODBUS_READ.cpp)
#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR
#define MODBEE_OPENPLC_MODBUS_TX_MGR
static volatile void *modbee_mb_owner = nullptr;
static inline bool modbee_mb_claim(void *owner)
{
  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))
    return false;
  modbee_mb_owner = owner;
  return true;
}
static inline void modbee_mb_release(void *owner)
{
  if (modbee_mb_owner == owner)
    modbee_mb_owner = nullptr;
}
#endif

typedef struct
{
  void *key; // stable per-instance key (e.g. pointer to REQ storage)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;
  volatile bool success;

  uint8_t reg_type;
  uint8_t len;
  uint8_t slave_id;
  uint16_t start_addr;

  bool coil_buffer[MAX_ELEMENTS];
  uint16_t hreg_buffer[MAX_ELEMENTS];
} ModbusWriteCtx;

static ModbusWriteCtx s_modbus_write_ctx[MAX_INSTANCES];
static volatile ModbusWriteCtx *s_modbus_write_active = nullptr;

static ModbusWriteCtx *get_modbus_write_ctx(MODBUS_WRITE_VARS *vars)
{
  // IMPORTANT: `vars` is a stack-local struct in OpenPLC's generated code, so
  // `vars` (and its address) is NOT stable across scan cycles.
  // The pointers inside `vars` *are* stable (they point into the FB instance).
  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.
  // So `vars->REQ` will get macro-expanded and break compilation.
  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbus_write_ctx[i].in_use && s_modbus_write_ctx[i].key == key)
      return &s_modbus_write_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbus_write_ctx[i].in_use)
    {
      s_modbus_write_ctx[i].in_use = true;
      s_modbus_write_ctx[i].key = key;
      s_modbus_write_ctx[i].last_req = false;
      s_modbus_write_ctx[i].started = false;
      s_modbus_write_ctx[i].queued = false;
      s_modbus_write_ctx[i].completed = false;
      s_modbus_write_ctx[i].success = false;
      s_modbus_write_ctx[i].reg_type = 0xFF;
      s_modbus_write_ctx[i].len = 0;
      s_modbus_write_ctx[i].slave_id = 0;
      s_modbus_write_ctx[i].start_addr = 0;
      return &s_modbus_write_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_write_ctx(ModbusWriteCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusWriteCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusWriteCtx *ctx = (ModbusWriteCtx *)s_modbus_write_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_write_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

void modbus_write_setup(MODBUS_WRITE_VARS *vars)
{
  DONE = false;
  ERROR = false;
}

void modbus_write_loop(MODBUS_WRITE_VARS *vars)
{
  ModbusWriteCtx *ctx = get_modbus_write_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = true;
    return;
  }

  // REQ falling edge: reset instance state
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    reset_modbus_write_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_write_active == ctx)
      s_modbus_write_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters and build write buffers
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->success = false;
    ctx->len = len;
    ctx->reg_type = (uint8_t)REG_TYPE;
    ctx->slave_id = (uint8_t)SLAVE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    // Build persistent buffers for the async write
    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)
    {
      ctx->coil_buffer[i] = false;
      ctx->hreg_buffer[i] = 0;
    }

    if (ctx->reg_type == 0)
    {
      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;
      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;
      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;
      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;
      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;
      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;
      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;
      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;
    }
    else if (ctx->reg_type == 2)
    {
      ctx->hreg_buffer[0] = (len > 0) ? (uint16_t)REG_01 : 0;
      ctx->hreg_buffer[1] = (len > 1) ? (uint16_t)REG_02 : 0;
      ctx->hreg_buffer[2] = (len > 2) ? (uint16_t)REG_03 : 0;
      ctx->hreg_buffer[3] = (len > 3) ? (uint16_t)REG_04 : 0;
      ctx->hreg_buffer[4] = (len > 4) ? (uint16_t)REG_05 : 0;
      ctx->hreg_buffer[5] = (len > 5) ? (uint16_t)REG_06 : 0;
      ctx->hreg_buffer[6] = (len > 6) ? (uint16_t)REG_07 : 0;
      ctx->hreg_buffer[7] = (len > 7) ? (uint16_t)REG_08 : 0;
    }
    else
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_ctx(ctx);
      return;
    }
  }

  if (!REQ || DONE)
    return;

  // If queued, wait for callback to mark completion
  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = !ctx->success;
      ctx->queued = false;
      ctx->started = false;
    }
    return;
  }

  // Not queued yet: try to claim and queue. Busy means retry next scan.
  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_write_active = ctx;
  bool queued = false;
  if (ctx->reg_type == 0)
  {
    queued = (io.mb.writeCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusWriteCallback) != 0);
  }
  else if (ctx->reg_type == 2)
  {
    queued = (io.mb.writeHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusWriteCallback) != 0);
  }

  if (!queued)
  {
    s_modbus_write_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}
#undef REQ
#undef SLAVE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef COIL_01
#undef COIL_02
#undef COIL_03
#undef COIL_04
#undef COIL_05
#undef COIL_06
#undef COIL_07
#undef COIL_08
#undef REG_01
#undef REG_02
#undef REG_03
#undef REG_04
#undef REG_05
#undef REG_06
#undef REG_07
#undef REG_08
#undef DONE
#undef ERROR

//definition of external blocks - MODBUS_WRITE_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBUS_WRITE_ARRAY_VARS;

extern "C" void modbus_write_array_setup(MODBUS_WRITE_ARRAY_VARS *vars);
extern "C" void modbus_write_array_loop(MODBUS_WRITE_ARRAY_VARS *vars);

#define REQ (*(vars->REQ))
#define SLAVE_ID (*(vars->SLAVE_ID))
#define REG_TYPE (*(vars->REG_TYPE))
#define START_ADDR (*(vars->START_ADDR))
#define LENGTH (*(vars->LENGTH))
#define COILS (vars->COILS)
#define REGS (vars->REGS)
#define DONE (*(vars->DONE))
#define ERROR (*(vars->ERROR))

/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_WRITE_ARRAY (Multi-element, up to 32)
 *
 *  Writes multiple values to Modbus slave from array inputs.
 *  LENGTH specifies element count (1-32)
 *
 *  NOTE: MODBUS_* blocks use a shared one-transaction-at-a-time manager.
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBUS_WRITE_ARRAY_MAX_ELEMENTS 32
#define MODBUS_WRITE_ARRAY_MAX_INSTANCES 16

// Shared Modbus transaction manager (same pattern as existing MODBUS_READ/MODBUS_WRITE)
#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR
#define MODBEE_OPENPLC_MODBUS_TX_MGR
static volatile void *modbee_mb_owner = nullptr;
static inline bool modbee_mb_claim(void *owner)
{
  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))
    return false;
  modbee_mb_owner = owner;
  return true;
}
static inline void modbee_mb_release(void *owner)
{
  if (modbee_mb_owner == owner)
    modbee_mb_owner = nullptr;
}
#endif

typedef struct
{
  void *key; // stable per-instance key (e.g. pointer to REQ storage)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;
  volatile bool success;

  uint8_t reg_type;
  uint8_t len;
  uint8_t slave_id;
  uint16_t start_addr;

  bool coil_buffer[MODBUS_WRITE_ARRAY_MAX_ELEMENTS];
  uint16_t hreg_buffer[MODBUS_WRITE_ARRAY_MAX_ELEMENTS];
} ModbusWriteArrayCtx;

static ModbusWriteArrayCtx s_modbus_write_array_ctx[MODBUS_WRITE_ARRAY_MAX_INSTANCES];
static volatile ModbusWriteArrayCtx *s_modbus_write_array_active = nullptr;

static ModbusWriteArrayCtx *get_modbus_write_array_ctx(MODBUS_WRITE_ARRAY_VARS *vars)
{
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBUS_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbus_write_array_ctx[i].in_use && s_modbus_write_array_ctx[i].key == key)
      return &s_modbus_write_array_ctx[i];
  }
  for (int i = 0; i < MODBUS_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbus_write_array_ctx[i].in_use)
    {
      s_modbus_write_array_ctx[i].in_use = true;
      s_modbus_write_array_ctx[i].key = key;
      s_modbus_write_array_ctx[i].last_req = false;
      s_modbus_write_array_ctx[i].started = false;
      s_modbus_write_array_ctx[i].queued = false;
      s_modbus_write_array_ctx[i].completed = false;
      s_modbus_write_array_ctx[i].success = false;
      s_modbus_write_array_ctx[i].reg_type = 0xFF;
      s_modbus_write_array_ctx[i].len = 0;
      s_modbus_write_array_ctx[i].slave_id = 0;
      s_modbus_write_array_ctx[i].start_addr = 0;
      return &s_modbus_write_array_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_write_array_ctx(ModbusWriteArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusWriteArrayCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusWriteArrayCtx *ctx = (ModbusWriteArrayCtx *)s_modbus_write_array_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_write_array_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

void modbus_write_array_setup(MODBUS_WRITE_ARRAY_VARS *vars)
{
  DONE = false;
  ERROR = false;
}

void modbus_write_array_loop(MODBUS_WRITE_ARRAY_VARS *vars)
{
  ModbusWriteArrayCtx *ctx = get_modbus_write_array_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = true;
    return;
  }

  // REQ falling edge: reset instance state
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    reset_modbus_write_array_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_write_array_active == ctx)
      s_modbus_write_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters and build write buffers
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBUS_WRITE_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_array_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->success = false;
    ctx->len = len;
    ctx->reg_type = (uint8_t)REG_TYPE;
    ctx->slave_id = (uint8_t)SLAVE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    for (uint8_t i = 0; i < MODBUS_WRITE_ARRAY_MAX_ELEMENTS; i++)
    {
      ctx->coil_buffer[i] = false;
      ctx->hreg_buffer[i] = 0;
    }

    const uint8_t *coils_in = (const uint8_t *)COILS;
    const int16_t *regs_in = (const int16_t *)REGS;

    if (ctx->reg_type == 0)
    {
      for (uint8_t i = 0; i < len; i++)
        ctx->coil_buffer[i] = (coils_in[i] != 0);
    }
    else if (ctx->reg_type == 2)
    {
      for (uint8_t i = 0; i < len; i++)
        ctx->hreg_buffer[i] = (uint16_t)regs_in[i];
    }
    else
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_array_ctx(ctx);
      return;
    }
  }

  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = !ctx->success;
      ctx->queued = false;
      ctx->started = false;
    }
    return;
  }

  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_write_array_active = ctx;
  bool queued = false;
  if (ctx->reg_type == 0)
  {
    queued = (io.mb.writeCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusWriteArrayCallback) != 0);
  }
  else if (ctx->reg_type == 2)
  {
    queued = (io.mb.writeHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusWriteArrayCallback) != 0);
  }

  if (!queued)
  {
    s_modbus_write_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}
#undef REQ
#undef SLAVE_ID
#undef REG_TYPE
#undef START_ADDR
#undef LENGTH
#undef COILS
#undef REGS
#undef DONE
#undef ERROR

