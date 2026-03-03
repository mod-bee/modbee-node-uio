FUNCTION_BLOCK MODBEE_HW_CONFIG
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
//#include <ModbeeWebServer.h>

// Initialize ESP32Modbee - all communication, I/O, and protocols
// You can swap the modbus and modbee tx/rx pins as needed, just ensure they match your hardware connections
ESP32Modbee io(
  MBEE_REMOTE_IO,     // mode - Change to MB_NONE, MB_MASTER, MB_SLAVE, MB_REMOTE_IO, MBEE_REMOTE_IO
  16, 15,             // modbusRxPin, modbusTxPin
  1,                  // modbusId
  18, 17,             // modbeeRxPin, modbeeTxPin 
  3,                  // modbeeId
  115200, SERIAL_8N1, // baudrate1, serialConfig1 (Modbus)
  115200, SERIAL_8N1  // baudrate2, serialConfig2 (ModBee)
);

// Initialize ModbeeWebServer
//ModbeeWebServer webServer(io, 80);

// Called once when the block is initialized
void setup()
{
  // Initialize entire I/O system with all protocols
  io.begin();
  //webServer.begin();
}

// Called at every PLC scan cycle
void loop()
{
  // This handles all I/O updates, Modbus communication, and ModBee network
  io.update();
  //webServer.update();
}

END_FUNCTION_BLOCK