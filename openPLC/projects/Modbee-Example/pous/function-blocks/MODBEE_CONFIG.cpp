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
//#include <ModbeeWebServer.h>

// Initialize ESP32Modbee
ESP32Modbee io(
  MB_NONE,            // mode
  LED_PIN,            // ledPin
  37, 38,             // sdaPin, sclPin
  18, 17,             // modbusRxPin, modbusTxPin
  1,                  // modbusId
  16, 15,             // modbeeRxPin, modbeeTxPin 
  5,                  // modbeeId
  115200, SERIAL_8N1, // baudrate1, serialConfig1 //Modbus
  &Serial1,           // serialPort1
  115200, SERIAL_8N1, // baudrate2, serialConfig2 //ModBee
  &Serial2            // serialPort2
);

// Initialize ModbeeWebServer
//ModbeeWebServer webServer(io, 80);

// Called once when the block is initialized
void setup()
{
  io.begin();
  //webServer.begin();

}

// Called at every PLC scan cycle
void loop()
{
  io.update();
  //webServer.update();
}