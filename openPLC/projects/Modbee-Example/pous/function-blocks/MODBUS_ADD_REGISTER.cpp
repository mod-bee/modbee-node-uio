FUNCTION_BLOCK MODBUS_ADD_REGISTER
VAR_INPUT
	REG : byte;
	ADDRESS : word;
	VAR_BOOL : bool;
	VAR_INT : int;
END_VAR

VAR_OUTPUT
	DONE : bool;
	ERROR : bool;
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

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

// Modbus ADD REGISTER - Self-contained register allocation and registration
// Each block instance allocates its own storage and registers automatically
// Registers once during setup() and maintains state

// Called once when the block is initialized
void setup()
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
void loop()
{
  // State maintained from setup() - nothing to do here
}

END_FUNCTION_BLOCK