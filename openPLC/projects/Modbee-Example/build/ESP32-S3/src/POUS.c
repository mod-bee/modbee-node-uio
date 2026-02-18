#include "POUS.h"
#include "Config0.h"

void MODBEE_CONFIG_init__(MODBEE_CONFIG *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_CONFIG_body__(MODBEE_CONFIG *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  MODBEE_CONFIG_VARS vars;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_config_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_config_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_CONFIG_body__() 





void MODBEE_INPUTS_init__(MODBEE_INPUTS *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->DX01,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX02,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX03,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX04,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX05,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX06,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX07,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DX08,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AX01_SCALED,0,retain)
  __INIT_VAR(data__->AX02_SCALED,0,retain)
  __INIT_VAR(data__->AX03_SCALED,0,retain)
  __INIT_VAR(data__->AX04_SCALED,0,retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_INPUTS_body__(MODBEE_INPUTS *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  MODBEE_INPUTS_VARS vars;
  vars.DX01 = &data__->DX01.value;
  vars.DX02 = &data__->DX02.value;
  vars.DX03 = &data__->DX03.value;
  vars.DX04 = &data__->DX04.value;
  vars.DX05 = &data__->DX05.value;
  vars.DX06 = &data__->DX06.value;
  vars.DX07 = &data__->DX07.value;
  vars.DX08 = &data__->DX08.value;
  vars.AX01_SCALED = &data__->AX01_SCALED.value;
  vars.AX02_SCALED = &data__->AX02_SCALED.value;
  vars.AX03_SCALED = &data__->AX03_SCALED.value;
  vars.AX04_SCALED = &data__->AX04_SCALED.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_inputs_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_inputs_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_INPUTS_body__() 





void MODBEE_OUTPUTS_init__(MODBEE_OUTPUTS *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->DY01,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY02,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY03,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY04,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY05,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY06,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY07,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DY08,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AY01_SCALED,0,retain)
  __INIT_VAR(data__->AY02_SCALED,0,retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_OUTPUTS_body__(MODBEE_OUTPUTS *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  MODBEE_OUTPUTS_VARS vars;
  vars.DY01 = &data__->DY01.value;
  vars.DY02 = &data__->DY02.value;
  vars.DY03 = &data__->DY03.value;
  vars.DY04 = &data__->DY04.value;
  vars.DY05 = &data__->DY05.value;
  vars.DY06 = &data__->DY06.value;
  vars.DY07 = &data__->DY07.value;
  vars.DY08 = &data__->DY08.value;
  vars.AY01_SCALED = &data__->AY01_SCALED.value;
  vars.AY02_SCALED = &data__->AY02_SCALED.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_outputs_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_outputs_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_OUTPUTS_body__() 





void MAIN_init__(MAIN *data__, BOOL retain) {
  MODBEE_INPUTS_init__(&data__->MODBEE_INPUTS0,retain);
  MODBEE_OUTPUTS_init__(&data__->MODBEE_OUTPUTS0,retain);
  __INIT_VAR(data__->START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STOP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUN,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->MODBEE_INPUTS0.,EN,,__BOOL_LITERAL(TRUE));
  MODBEE_INPUTS_body__(&data__->MODBEE_INPUTS0);
  if (__GET_VAR(data__->MODBEE_INPUTS0.ENO,)) {
    __SET_VAR(data__->,START,,__GET_VAR(data__->MODBEE_INPUTS0.DX01,));
  };
  if (__GET_VAR(data__->MODBEE_INPUTS0.ENO,)) {
    __SET_VAR(data__->,STOP,,__GET_VAR(data__->MODBEE_INPUTS0.DX02,));
  };
  __SET_VAR(data__->,RUN,,(!(__GET_VAR(data__->STOP,)) && (__GET_VAR(data__->RUN,) || __GET_VAR(data__->START,))));
  __SET_VAR(data__->MODBEE_OUTPUTS0.,EN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->MODBEE_OUTPUTS0.,DY01,,__GET_VAR(data__->RUN,));
  MODBEE_OUTPUTS_body__(&data__->MODBEE_OUTPUTS0);

  goto __end;

__end:
  return;
} // MAIN_body__() 





void MODBEE_init__(MODBEE *data__, BOOL retain) {
  MODBEE_CONFIG_init__(&data__->MODBEE_CONFIG0,retain);
}

// Code part
void MODBEE_body__(MODBEE *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->MODBEE_CONFIG0.,EN,,__BOOL_LITERAL(TRUE));
  MODBEE_CONFIG_body__(&data__->MODBEE_CONFIG0);

  goto __end;

__end:
  return;
} // MODBEE_body__() 





