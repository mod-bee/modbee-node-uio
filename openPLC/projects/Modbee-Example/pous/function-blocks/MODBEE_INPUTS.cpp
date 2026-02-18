FUNCTION_BLOCK MODBEE_INPUTS
VAR_OUTPUT
	DX01 : bool;
	DX02 : bool;
	DX03 : bool;
	DX04 : bool;
	DX05 : bool;
	DX06 : bool;
	DX07 : bool;
	DX08 : bool;
	AX01_Scaled : real;
	AX02_Scaled : real;
	AX03_Scaled : real;
	AX04_Scaled : real;
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

// Called once when the block is initialized
void setup()
{
  //input.begin();
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setADCMode(0, MODE_VOLTAGE); // AI01
  io.setADCMode(1, MODE_VOLTAGE); // AI02
  io.setADCMode(2, MODE_VOLTAGE); // AI03
  io.setADCMode(3, MODE_VOLTAGE); // AI04
}

// Called at every PLC scan cycle
void loop()
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