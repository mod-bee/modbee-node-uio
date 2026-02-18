FUNCTION_BLOCK MODBEE_OUTPUTS
VAR_INPUT
	DY01 : bool;
	DY02 : bool;
	DY03 : bool;
	DY04 : bool;
	DY05 : bool;
	DY06 : bool;
	DY07 : bool;
	DY08 : bool;
	AY01_Scaled : real;
	AY02_Scaled : real;
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
  //output.begin();
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setDACMode(0, MODE_VOLTAGE); // AO01
  io.setDACMode(1, MODE_VOLTAGE); // AO02
}

// Called at every PLC scan cycle
void loop()
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