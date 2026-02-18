#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

// FUNCTION_BLOCK MODBEE_CONFIG
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,HASBEENINITIALIZED)

} MODBEE_CONFIG;

void MODBEE_CONFIG_init__(MODBEE_CONFIG *data__, BOOL retain);
// Code part
void MODBEE_CONFIG_body__(MODBEE_CONFIG *data__);
// FUNCTION_BLOCK MODBEE_INPUTS
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,DX01)
  __DECLARE_VAR(BOOL,DX02)
  __DECLARE_VAR(BOOL,DX03)
  __DECLARE_VAR(BOOL,DX04)
  __DECLARE_VAR(BOOL,DX05)
  __DECLARE_VAR(BOOL,DX06)
  __DECLARE_VAR(BOOL,DX07)
  __DECLARE_VAR(BOOL,DX08)
  __DECLARE_VAR(REAL,AX01_SCALED)
  __DECLARE_VAR(REAL,AX02_SCALED)
  __DECLARE_VAR(REAL,AX03_SCALED)
  __DECLARE_VAR(REAL,AX04_SCALED)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,HASBEENINITIALIZED)

} MODBEE_INPUTS;

void MODBEE_INPUTS_init__(MODBEE_INPUTS *data__, BOOL retain);
// Code part
void MODBEE_INPUTS_body__(MODBEE_INPUTS *data__);
// FUNCTION_BLOCK MODBEE_OUTPUTS
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,DY01)
  __DECLARE_VAR(BOOL,DY02)
  __DECLARE_VAR(BOOL,DY03)
  __DECLARE_VAR(BOOL,DY04)
  __DECLARE_VAR(BOOL,DY05)
  __DECLARE_VAR(BOOL,DY06)
  __DECLARE_VAR(BOOL,DY07)
  __DECLARE_VAR(BOOL,DY08)
  __DECLARE_VAR(REAL,AY01_SCALED)
  __DECLARE_VAR(REAL,AY02_SCALED)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,HASBEENINITIALIZED)

} MODBEE_OUTPUTS;

void MODBEE_OUTPUTS_init__(MODBEE_OUTPUTS *data__, BOOL retain);
// Code part
void MODBEE_OUTPUTS_body__(MODBEE_OUTPUTS *data__);
// PROGRAM MAIN
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  MODBEE_INPUTS MODBEE_INPUTS0;
  MODBEE_OUTPUTS MODBEE_OUTPUTS0;
  __DECLARE_VAR(BOOL,START)
  __DECLARE_VAR(BOOL,STOP)
  __DECLARE_VAR(BOOL,RUN)

} MAIN;

void MAIN_init__(MAIN *data__, BOOL retain);
// Code part
void MAIN_body__(MAIN *data__);
// PROGRAM MODBEE
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  MODBEE_CONFIG MODBEE_CONFIG0;

} MODBEE;

void MODBEE_init__(MODBEE *data__, BOOL retain);
// Code part
void MODBEE_body__(MODBEE *data__);
#endif //__POUS_H
