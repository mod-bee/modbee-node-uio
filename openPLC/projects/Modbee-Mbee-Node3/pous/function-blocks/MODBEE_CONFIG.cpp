FUNCTION_BLOCK MODBEE_CONFIG
VAR
END_VAR
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
void setup()
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
void loop()
{

}

END_FUNCTION_BLOCK