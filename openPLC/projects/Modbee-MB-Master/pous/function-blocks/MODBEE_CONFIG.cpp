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

// Called once when the block is initialized
void setup()
{

  // Configure timing parameters (optional but recommended higher values for wireless or slower networks)
  io.mbee.MODBEE_INTERFRAME_GAP_US        = 5000;  // 5000µs between frames (5ms) 
  io.mbee.MODBEE_OPERATION_TIMEOUT_MS     = 100;
  io.mbee.MODBEE_RESPONSE_TIMEOUT_MS      = 100;
  io.mbee.MODBEE_RETRY_DELAY_MS           = 100;
  io.mbee.MODBEE_MAX_RETRIES              = 2;
  io.mbee.INITIAL_LISTEN_PERIOD_MS        = 2000;  // Base initial listen time
  io.mbee.TOKEN_RESPONSE_TIMEOUT_MS       = 50;    // Token passing timeout
  io.mbee.BASE_TIMEOUT                    = 100;   
  io.mbee.NODE_TIMEOUT_MS                 = 50;
  io.mbee.MODBEE_TOKEN_RECLAIM_TIMEOUT    = 30;    // Token reclaim timeout (ms)
  io.mbee.MODBEE_JOIN_CYCLE_INTERVAL      = 50;    // Join invitation interval (ms)
  io.mbee.MODBEE_JOIN_RESPONSE_TIMEOUT    = 20;    // Join response wait time (ms)
  io.mbee.MODBEE_MAX_NODES                = 5;     // Maximum nodes allowed in network (set higher to allow future nodes)

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