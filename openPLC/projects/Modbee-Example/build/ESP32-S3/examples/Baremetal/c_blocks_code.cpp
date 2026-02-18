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
void modbee_config_setup(MODBEE_CONFIG_VARS *vars)
{
  io.begin();
  //webServer.begin();

}

// Called at every PLC scan cycle
void modbee_config_loop(MODBEE_CONFIG_VARS *vars)
{
  io.update();
  //webServer.update();
}
//definition of external blocks - MODBEE_INPUTS
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
} MODBEE_INPUTS_VARS;

extern "C" void modbee_inputs_setup(MODBEE_INPUTS_VARS *vars);
extern "C" void modbee_inputs_loop(MODBEE_INPUTS_VARS *vars);

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

// Called once when the block is initialized
void modbee_inputs_setup(MODBEE_INPUTS_VARS *vars)
{
  //input.begin();
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setADCMode(0, MODE_VOLTAGE); // AI01
  io.setADCMode(1, MODE_VOLTAGE); // AI02
  io.setADCMode(2, MODE_VOLTAGE); // AI03
  io.setADCMode(3, MODE_VOLTAGE); // AI04
}

// Called at every PLC scan cycle
void modbee_inputs_loop(MODBEE_INPUTS_VARS *vars)
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
//definition of external blocks - MODBEE_OUTPUTS
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
} MODBEE_OUTPUTS_VARS;

extern "C" void modbee_outputs_setup(MODBEE_OUTPUTS_VARS *vars);
extern "C" void modbee_outputs_loop(MODBEE_OUTPUTS_VARS *vars);

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


// Called once when the block is initialized
void modbee_outputs_setup(MODBEE_OUTPUTS_VARS *vars)
{
  //output.begin();
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setDACMode(0, MODE_VOLTAGE); // AO01
  io.setDACMode(1, MODE_VOLTAGE); // AO02
}

// Called at every PLC scan cycle
void modbee_outputs_loop(MODBEE_OUTPUTS_VARS *vars)
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
