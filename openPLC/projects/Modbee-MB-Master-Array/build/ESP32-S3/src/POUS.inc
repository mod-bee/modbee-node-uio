#include "POUS.h"
#include "Config0.h"

void MODBEE_HW_CONFIG_init__(MODBEE_HW_CONFIG *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_HW_CONFIG_body__(MODBEE_HW_CONFIG *data__) {
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

  MODBEE_HW_CONFIG_VARS vars;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_hw_config_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_hw_config_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_HW_CONFIG_body__() 





void MODBEE_init__(MODBEE *data__, BOOL retain) {
  MODBEE_HW_CONFIG_init__(&data__->MODBEE_HW_CONFIG0,retain);
}

// Code part
void MODBEE_body__(MODBEE *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->MODBEE_HW_CONFIG0.,EN,,__BOOL_LITERAL(TRUE));
  MODBEE_HW_CONFIG_body__(&data__->MODBEE_HW_CONFIG0);

  goto __end;

__end:
  return;
} // MODBEE_body__() 





void MODBEE_ADD_REGISTER_init__(MODBEE_ADD_REGISTER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REG,0,retain)
  __INIT_VAR(data__->ADDRESS,0,retain)
  __INIT_VAR(data__->VAR_BOOL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->VAR_INT,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_ADD_REGISTER_body__(MODBEE_ADD_REGISTER *data__) {
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

  MODBEE_ADD_REGISTER_VARS vars;
  vars.REG = &data__->REG.value;
  vars.ADDRESS = &data__->ADDRESS.value;
  vars.VAR_BOOL = &data__->VAR_BOOL.value;
  vars.VAR_INT = &data__->VAR_INT.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_add_register_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_add_register_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_ADD_REGISTER_body__() 





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





void MODBEE_HAT_PWR_init__(MODBEE_HAT_PWR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->EN_HAT_POWER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_HAT_PWR_body__(MODBEE_HAT_PWR *data__) {
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

  MODBEE_HAT_PWR_VARS vars;
  vars.EN_HAT_POWER = &data__->EN_HAT_POWER.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_hat_pwr_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_hat_pwr_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_HAT_PWR_body__() 





void MODBEE_HW_INPUTS_init__(MODBEE_HW_INPUTS *data__, BOOL retain) {
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
void MODBEE_HW_INPUTS_body__(MODBEE_HW_INPUTS *data__) {
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

  MODBEE_HW_INPUTS_VARS vars;
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

  modbee_hw_inputs_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_hw_inputs_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_HW_INPUTS_body__() 





void MODBEE_HW_OUTPUTS_init__(MODBEE_HW_OUTPUTS *data__, BOOL retain) {
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
void MODBEE_HW_OUTPUTS_body__(MODBEE_HW_OUTPUTS *data__) {
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

  MODBEE_HW_OUTPUTS_VARS vars;
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

  modbee_hw_outputs_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_hw_outputs_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_HW_OUTPUTS_body__() 





void MODBEE_READ_init__(MODBEE_READ *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ONLINE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_01,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_02,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_03,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_04,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_05,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_06,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_07,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_08,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REG_01,0,retain)
  __INIT_VAR(data__->REG_02,0,retain)
  __INIT_VAR(data__->REG_03,0,retain)
  __INIT_VAR(data__->REG_04,0,retain)
  __INIT_VAR(data__->REG_05,0,retain)
  __INIT_VAR(data__->REG_06,0,retain)
  __INIT_VAR(data__->REG_07,0,retain)
  __INIT_VAR(data__->REG_08,0,retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_READ_body__(MODBEE_READ *data__) {
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

  MODBEE_READ_VARS vars;
  vars.REQ = &data__->REQ.value;
  vars.NODE_ID = &data__->NODE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  vars.NODE_ONLINE = &data__->NODE_ONLINE.value;
  vars.COIL_01 = &data__->COIL_01.value;
  vars.COIL_02 = &data__->COIL_02.value;
  vars.COIL_03 = &data__->COIL_03.value;
  vars.COIL_04 = &data__->COIL_04.value;
  vars.COIL_05 = &data__->COIL_05.value;
  vars.COIL_06 = &data__->COIL_06.value;
  vars.COIL_07 = &data__->COIL_07.value;
  vars.COIL_08 = &data__->COIL_08.value;
  vars.REG_01 = &data__->REG_01.value;
  vars.REG_02 = &data__->REG_02.value;
  vars.REG_03 = &data__->REG_03.value;
  vars.REG_04 = &data__->REG_04.value;
  vars.REG_05 = &data__->REG_05.value;
  vars.REG_06 = &data__->REG_06.value;
  vars.REG_07 = &data__->REG_07.value;
  vars.REG_08 = &data__->REG_08.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_read_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_read_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_READ_body__() 





void MODBEE_READ_ARRAY_init__(MODBEE_READ_ARRAY *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ONLINE,__BOOL_LITERAL(FALSE),retain)
  {
    __SET_VAR(,data__->COILS.value.table[0],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[1],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[2],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[3],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[4],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[5],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[6],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[7],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[8],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[9],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[10],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[11],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[12],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[13],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[14],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[15],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[16],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[17],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[18],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[19],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[20],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[21],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[22],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[23],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[24],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[25],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[26],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[27],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[28],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[29],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[30],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[31],,__BOOL_LITERAL(FALSE));
  }
  {
    __SET_VAR(,data__->REGS.value.table[0],,0);
    __SET_VAR(,data__->REGS.value.table[1],,0);
    __SET_VAR(,data__->REGS.value.table[2],,0);
    __SET_VAR(,data__->REGS.value.table[3],,0);
    __SET_VAR(,data__->REGS.value.table[4],,0);
    __SET_VAR(,data__->REGS.value.table[5],,0);
    __SET_VAR(,data__->REGS.value.table[6],,0);
    __SET_VAR(,data__->REGS.value.table[7],,0);
    __SET_VAR(,data__->REGS.value.table[8],,0);
    __SET_VAR(,data__->REGS.value.table[9],,0);
    __SET_VAR(,data__->REGS.value.table[10],,0);
    __SET_VAR(,data__->REGS.value.table[11],,0);
    __SET_VAR(,data__->REGS.value.table[12],,0);
    __SET_VAR(,data__->REGS.value.table[13],,0);
    __SET_VAR(,data__->REGS.value.table[14],,0);
    __SET_VAR(,data__->REGS.value.table[15],,0);
    __SET_VAR(,data__->REGS.value.table[16],,0);
    __SET_VAR(,data__->REGS.value.table[17],,0);
    __SET_VAR(,data__->REGS.value.table[18],,0);
    __SET_VAR(,data__->REGS.value.table[19],,0);
    __SET_VAR(,data__->REGS.value.table[20],,0);
    __SET_VAR(,data__->REGS.value.table[21],,0);
    __SET_VAR(,data__->REGS.value.table[22],,0);
    __SET_VAR(,data__->REGS.value.table[23],,0);
    __SET_VAR(,data__->REGS.value.table[24],,0);
    __SET_VAR(,data__->REGS.value.table[25],,0);
    __SET_VAR(,data__->REGS.value.table[26],,0);
    __SET_VAR(,data__->REGS.value.table[27],,0);
    __SET_VAR(,data__->REGS.value.table[28],,0);
    __SET_VAR(,data__->REGS.value.table[29],,0);
    __SET_VAR(,data__->REGS.value.table[30],,0);
    __SET_VAR(,data__->REGS.value.table[31],,0);
  }
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_READ_ARRAY_body__(MODBEE_READ_ARRAY *data__) {
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

  MODBEE_READ_ARRAY_VARS vars;
  IEC_BOOL __flat_COILS[32];
  IEC_INT __flat_REGS[32];
  for (int __i = 0; __i < 32; __i++) __flat_COILS[__i] = data__->COILS.value.table[__i].value;
  for (int __i = 0; __i < 32; __i++) __flat_REGS[__i] = data__->REGS.value.table[__i].value;
  vars.REQ = &data__->REQ.value;
  vars.NODE_ID = &data__->NODE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  vars.NODE_ONLINE = &data__->NODE_ONLINE.value;
  vars.COILS = __flat_COILS - 0;
  vars.REGS = __flat_REGS - 0;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_read_array_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_read_array_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  for (int __i = 0; __i < 32; __i++) data__->COILS.value.table[__i].value = __flat_COILS[__i];
  for (int __i = 0; __i < 32; __i++) data__->REGS.value.table[__i].value = __flat_REGS[__i];
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_READ_ARRAY_body__() 





void MODBEE_WRITE_init__(MODBEE_WRITE *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  __INIT_VAR(data__->COIL_01,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_02,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_03,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_04,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_05,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_06,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_07,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_08,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REG_01,0,retain)
  __INIT_VAR(data__->REG_02,0,retain)
  __INIT_VAR(data__->REG_03,0,retain)
  __INIT_VAR(data__->REG_04,0,retain)
  __INIT_VAR(data__->REG_05,0,retain)
  __INIT_VAR(data__->REG_06,0,retain)
  __INIT_VAR(data__->REG_07,0,retain)
  __INIT_VAR(data__->REG_08,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ONLINE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_WRITE_body__(MODBEE_WRITE *data__) {
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

  MODBEE_WRITE_VARS vars;
  vars.REQ = &data__->REQ.value;
  vars.NODE_ID = &data__->NODE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.COIL_01 = &data__->COIL_01.value;
  vars.COIL_02 = &data__->COIL_02.value;
  vars.COIL_03 = &data__->COIL_03.value;
  vars.COIL_04 = &data__->COIL_04.value;
  vars.COIL_05 = &data__->COIL_05.value;
  vars.COIL_06 = &data__->COIL_06.value;
  vars.COIL_07 = &data__->COIL_07.value;
  vars.COIL_08 = &data__->COIL_08.value;
  vars.REG_01 = &data__->REG_01.value;
  vars.REG_02 = &data__->REG_02.value;
  vars.REG_03 = &data__->REG_03.value;
  vars.REG_04 = &data__->REG_04.value;
  vars.REG_05 = &data__->REG_05.value;
  vars.REG_06 = &data__->REG_06.value;
  vars.REG_07 = &data__->REG_07.value;
  vars.REG_08 = &data__->REG_08.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  vars.NODE_ONLINE = &data__->NODE_ONLINE.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_write_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_write_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_WRITE_body__() 





void MODBEE_WRITE_ARRAY_init__(MODBEE_WRITE_ARRAY *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  {
    __SET_VAR(,data__->COILS.value.table[0],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[1],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[2],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[3],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[4],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[5],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[6],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[7],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[8],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[9],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[10],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[11],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[12],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[13],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[14],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[15],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[16],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[17],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[18],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[19],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[20],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[21],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[22],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[23],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[24],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[25],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[26],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[27],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[28],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[29],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[30],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[31],,__BOOL_LITERAL(FALSE));
  }
  {
    __SET_VAR(,data__->REGS.value.table[0],,0);
    __SET_VAR(,data__->REGS.value.table[1],,0);
    __SET_VAR(,data__->REGS.value.table[2],,0);
    __SET_VAR(,data__->REGS.value.table[3],,0);
    __SET_VAR(,data__->REGS.value.table[4],,0);
    __SET_VAR(,data__->REGS.value.table[5],,0);
    __SET_VAR(,data__->REGS.value.table[6],,0);
    __SET_VAR(,data__->REGS.value.table[7],,0);
    __SET_VAR(,data__->REGS.value.table[8],,0);
    __SET_VAR(,data__->REGS.value.table[9],,0);
    __SET_VAR(,data__->REGS.value.table[10],,0);
    __SET_VAR(,data__->REGS.value.table[11],,0);
    __SET_VAR(,data__->REGS.value.table[12],,0);
    __SET_VAR(,data__->REGS.value.table[13],,0);
    __SET_VAR(,data__->REGS.value.table[14],,0);
    __SET_VAR(,data__->REGS.value.table[15],,0);
    __SET_VAR(,data__->REGS.value.table[16],,0);
    __SET_VAR(,data__->REGS.value.table[17],,0);
    __SET_VAR(,data__->REGS.value.table[18],,0);
    __SET_VAR(,data__->REGS.value.table[19],,0);
    __SET_VAR(,data__->REGS.value.table[20],,0);
    __SET_VAR(,data__->REGS.value.table[21],,0);
    __SET_VAR(,data__->REGS.value.table[22],,0);
    __SET_VAR(,data__->REGS.value.table[23],,0);
    __SET_VAR(,data__->REGS.value.table[24],,0);
    __SET_VAR(,data__->REGS.value.table[25],,0);
    __SET_VAR(,data__->REGS.value.table[26],,0);
    __SET_VAR(,data__->REGS.value.table[27],,0);
    __SET_VAR(,data__->REGS.value.table[28],,0);
    __SET_VAR(,data__->REGS.value.table[29],,0);
    __SET_VAR(,data__->REGS.value.table[30],,0);
    __SET_VAR(,data__->REGS.value.table[31],,0);
  }
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NODE_ONLINE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBEE_WRITE_ARRAY_body__(MODBEE_WRITE_ARRAY *data__) {
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

  MODBEE_WRITE_ARRAY_VARS vars;
  IEC_BOOL __flat_COILS[32];
  IEC_INT __flat_REGS[32];
  for (int __i = 0; __i < 32; __i++) __flat_COILS[__i] = data__->COILS.value.table[__i].value;
  for (int __i = 0; __i < 32; __i++) __flat_REGS[__i] = data__->REGS.value.table[__i].value;
  vars.REQ = &data__->REQ.value;
  vars.NODE_ID = &data__->NODE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.COILS = __flat_COILS - 0;
  vars.REGS = __flat_REGS - 0;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  vars.NODE_ONLINE = &data__->NODE_ONLINE.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_write_array_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbee_write_array_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBEE_WRITE_ARRAY_body__() 





void MODBUS_ADD_REGISTER_init__(MODBUS_ADD_REGISTER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REG,0,retain)
  __INIT_VAR(data__->ADDRESS,0,retain)
  __INIT_VAR(data__->VAR_BOOL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->VAR_INT,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBUS_ADD_REGISTER_body__(MODBUS_ADD_REGISTER *data__) {
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

  MODBUS_ADD_REGISTER_VARS vars;
  vars.REG = &data__->REG.value;
  vars.ADDRESS = &data__->ADDRESS.value;
  vars.VAR_BOOL = &data__->VAR_BOOL.value;
  vars.VAR_INT = &data__->VAR_INT.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_add_register_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_add_register_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBUS_ADD_REGISTER_body__() 





void MODBUS_READ_init__(MODBUS_READ *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SLAVE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_01,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_02,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_03,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_04,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_05,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_06,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_07,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_08,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REG_01,0,retain)
  __INIT_VAR(data__->REG_02,0,retain)
  __INIT_VAR(data__->REG_03,0,retain)
  __INIT_VAR(data__->REG_04,0,retain)
  __INIT_VAR(data__->REG_05,0,retain)
  __INIT_VAR(data__->REG_06,0,retain)
  __INIT_VAR(data__->REG_07,0,retain)
  __INIT_VAR(data__->REG_08,0,retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBUS_READ_body__(MODBUS_READ *data__) {
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

  MODBUS_READ_VARS vars;
  vars.REQ = &data__->REQ.value;
  vars.SLAVE_ID = &data__->SLAVE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  vars.COIL_01 = &data__->COIL_01.value;
  vars.COIL_02 = &data__->COIL_02.value;
  vars.COIL_03 = &data__->COIL_03.value;
  vars.COIL_04 = &data__->COIL_04.value;
  vars.COIL_05 = &data__->COIL_05.value;
  vars.COIL_06 = &data__->COIL_06.value;
  vars.COIL_07 = &data__->COIL_07.value;
  vars.COIL_08 = &data__->COIL_08.value;
  vars.REG_01 = &data__->REG_01.value;
  vars.REG_02 = &data__->REG_02.value;
  vars.REG_03 = &data__->REG_03.value;
  vars.REG_04 = &data__->REG_04.value;
  vars.REG_05 = &data__->REG_05.value;
  vars.REG_06 = &data__->REG_06.value;
  vars.REG_07 = &data__->REG_07.value;
  vars.REG_08 = &data__->REG_08.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_read_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_read_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBUS_READ_body__() 





void MODBUS_READ_ARRAY_init__(MODBUS_READ_ARRAY *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SLAVE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  {
    __SET_VAR(,data__->COILS.value.table[0],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[1],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[2],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[3],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[4],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[5],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[6],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[7],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[8],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[9],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[10],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[11],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[12],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[13],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[14],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[15],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[16],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[17],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[18],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[19],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[20],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[21],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[22],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[23],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[24],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[25],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[26],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[27],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[28],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[29],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[30],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[31],,__BOOL_LITERAL(FALSE));
  }
  {
    __SET_VAR(,data__->REGS.value.table[0],,0);
    __SET_VAR(,data__->REGS.value.table[1],,0);
    __SET_VAR(,data__->REGS.value.table[2],,0);
    __SET_VAR(,data__->REGS.value.table[3],,0);
    __SET_VAR(,data__->REGS.value.table[4],,0);
    __SET_VAR(,data__->REGS.value.table[5],,0);
    __SET_VAR(,data__->REGS.value.table[6],,0);
    __SET_VAR(,data__->REGS.value.table[7],,0);
    __SET_VAR(,data__->REGS.value.table[8],,0);
    __SET_VAR(,data__->REGS.value.table[9],,0);
    __SET_VAR(,data__->REGS.value.table[10],,0);
    __SET_VAR(,data__->REGS.value.table[11],,0);
    __SET_VAR(,data__->REGS.value.table[12],,0);
    __SET_VAR(,data__->REGS.value.table[13],,0);
    __SET_VAR(,data__->REGS.value.table[14],,0);
    __SET_VAR(,data__->REGS.value.table[15],,0);
    __SET_VAR(,data__->REGS.value.table[16],,0);
    __SET_VAR(,data__->REGS.value.table[17],,0);
    __SET_VAR(,data__->REGS.value.table[18],,0);
    __SET_VAR(,data__->REGS.value.table[19],,0);
    __SET_VAR(,data__->REGS.value.table[20],,0);
    __SET_VAR(,data__->REGS.value.table[21],,0);
    __SET_VAR(,data__->REGS.value.table[22],,0);
    __SET_VAR(,data__->REGS.value.table[23],,0);
    __SET_VAR(,data__->REGS.value.table[24],,0);
    __SET_VAR(,data__->REGS.value.table[25],,0);
    __SET_VAR(,data__->REGS.value.table[26],,0);
    __SET_VAR(,data__->REGS.value.table[27],,0);
    __SET_VAR(,data__->REGS.value.table[28],,0);
    __SET_VAR(,data__->REGS.value.table[29],,0);
    __SET_VAR(,data__->REGS.value.table[30],,0);
    __SET_VAR(,data__->REGS.value.table[31],,0);
  }
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBUS_READ_ARRAY_body__(MODBUS_READ_ARRAY *data__) {
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

  MODBUS_READ_ARRAY_VARS vars;
  IEC_BOOL __flat_COILS[32];
  IEC_INT __flat_REGS[32];
  for (int __i = 0; __i < 32; __i++) __flat_COILS[__i] = data__->COILS.value.table[__i].value;
  for (int __i = 0; __i < 32; __i++) __flat_REGS[__i] = data__->REGS.value.table[__i].value;
  vars.REQ = &data__->REQ.value;
  vars.SLAVE_ID = &data__->SLAVE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  vars.COILS = __flat_COILS - 0;
  vars.REGS = __flat_REGS - 0;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_read_array_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_read_array_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  for (int __i = 0; __i < 32; __i++) data__->COILS.value.table[__i].value = __flat_COILS[__i];
  for (int __i = 0; __i < 32; __i++) data__->REGS.value.table[__i].value = __flat_REGS[__i];
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBUS_READ_ARRAY_body__() 





void MODBUS_WRITE_init__(MODBUS_WRITE *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SLAVE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  __INIT_VAR(data__->COIL_01,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_02,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_03,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_04,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_05,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_06,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_07,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_08,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REG_01,0,retain)
  __INIT_VAR(data__->REG_02,0,retain)
  __INIT_VAR(data__->REG_03,0,retain)
  __INIT_VAR(data__->REG_04,0,retain)
  __INIT_VAR(data__->REG_05,0,retain)
  __INIT_VAR(data__->REG_06,0,retain)
  __INIT_VAR(data__->REG_07,0,retain)
  __INIT_VAR(data__->REG_08,0,retain)
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBUS_WRITE_body__(MODBUS_WRITE *data__) {
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

  MODBUS_WRITE_VARS vars;
  vars.REQ = &data__->REQ.value;
  vars.SLAVE_ID = &data__->SLAVE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.COIL_01 = &data__->COIL_01.value;
  vars.COIL_02 = &data__->COIL_02.value;
  vars.COIL_03 = &data__->COIL_03.value;
  vars.COIL_04 = &data__->COIL_04.value;
  vars.COIL_05 = &data__->COIL_05.value;
  vars.COIL_06 = &data__->COIL_06.value;
  vars.COIL_07 = &data__->COIL_07.value;
  vars.COIL_08 = &data__->COIL_08.value;
  vars.REG_01 = &data__->REG_01.value;
  vars.REG_02 = &data__->REG_02.value;
  vars.REG_03 = &data__->REG_03.value;
  vars.REG_04 = &data__->REG_04.value;
  vars.REG_05 = &data__->REG_05.value;
  vars.REG_06 = &data__->REG_06.value;
  vars.REG_07 = &data__->REG_07.value;
  vars.REG_08 = &data__->REG_08.value;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_write_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_write_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBUS_WRITE_body__() 





void MODBUS_WRITE_ARRAY_init__(MODBUS_WRITE_ARRAY *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->REQ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SLAVE_ID,0,retain)
  __INIT_VAR(data__->REG_TYPE,0,retain)
  __INIT_VAR(data__->START_ADDR,0,retain)
  __INIT_VAR(data__->LENGTH,0,retain)
  {
    __SET_VAR(,data__->COILS.value.table[0],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[1],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[2],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[3],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[4],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[5],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[6],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[7],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[8],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[9],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[10],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[11],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[12],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[13],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[14],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[15],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[16],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[17],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[18],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[19],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[20],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[21],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[22],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[23],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[24],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[25],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[26],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[27],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[28],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[29],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[30],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->COILS.value.table[31],,__BOOL_LITERAL(FALSE));
  }
  {
    __SET_VAR(,data__->REGS.value.table[0],,0);
    __SET_VAR(,data__->REGS.value.table[1],,0);
    __SET_VAR(,data__->REGS.value.table[2],,0);
    __SET_VAR(,data__->REGS.value.table[3],,0);
    __SET_VAR(,data__->REGS.value.table[4],,0);
    __SET_VAR(,data__->REGS.value.table[5],,0);
    __SET_VAR(,data__->REGS.value.table[6],,0);
    __SET_VAR(,data__->REGS.value.table[7],,0);
    __SET_VAR(,data__->REGS.value.table[8],,0);
    __SET_VAR(,data__->REGS.value.table[9],,0);
    __SET_VAR(,data__->REGS.value.table[10],,0);
    __SET_VAR(,data__->REGS.value.table[11],,0);
    __SET_VAR(,data__->REGS.value.table[12],,0);
    __SET_VAR(,data__->REGS.value.table[13],,0);
    __SET_VAR(,data__->REGS.value.table[14],,0);
    __SET_VAR(,data__->REGS.value.table[15],,0);
    __SET_VAR(,data__->REGS.value.table[16],,0);
    __SET_VAR(,data__->REGS.value.table[17],,0);
    __SET_VAR(,data__->REGS.value.table[18],,0);
    __SET_VAR(,data__->REGS.value.table[19],,0);
    __SET_VAR(,data__->REGS.value.table[20],,0);
    __SET_VAR(,data__->REGS.value.table[21],,0);
    __SET_VAR(,data__->REGS.value.table[22],,0);
    __SET_VAR(,data__->REGS.value.table[23],,0);
    __SET_VAR(,data__->REGS.value.table[24],,0);
    __SET_VAR(,data__->REGS.value.table[25],,0);
    __SET_VAR(,data__->REGS.value.table[26],,0);
    __SET_VAR(,data__->REGS.value.table[27],,0);
    __SET_VAR(,data__->REGS.value.table[28],,0);
    __SET_VAR(,data__->REGS.value.table[29],,0);
    __SET_VAR(,data__->REGS.value.table[30],,0);
    __SET_VAR(,data__->REGS.value.table[31],,0);
  }
  __INIT_VAR(data__->DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ERROR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HASBEENINITIALIZED,0,retain)
}

// Code part
void MODBUS_WRITE_ARRAY_body__(MODBUS_WRITE_ARRAY *data__) {
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

  MODBUS_WRITE_ARRAY_VARS vars;
  IEC_BOOL __flat_COILS[32];
  IEC_INT __flat_REGS[32];
  for (int __i = 0; __i < 32; __i++) __flat_COILS[__i] = data__->COILS.value.table[__i].value;
  for (int __i = 0; __i < 32; __i++) __flat_REGS[__i] = data__->REGS.value.table[__i].value;
  vars.REQ = &data__->REQ.value;
  vars.SLAVE_ID = &data__->SLAVE_ID.value;
  vars.REG_TYPE = &data__->REG_TYPE.value;
  vars.START_ADDR = &data__->START_ADDR.value;
  vars.LENGTH = &data__->LENGTH.value;
  vars.COILS = __flat_COILS - 0;
  vars.REGS = __flat_REGS - 0;
  vars.DONE = &data__->DONE.value;
  vars.ERROR = &data__->ERROR.value;
  
  #undef GetFbVar
  #undef SetFbVar
;
  if ((__GET_VAR(data__->HASBEENINITIALIZED,) == __BOOL_LITERAL(FALSE))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_write_array_setup(&vars);
  
    #undef GetFbVar
    #undef SetFbVar
;
    __SET_VAR(data__->,HASBEENINITIALIZED,,__BOOL_LITERAL(TRUE));
  };
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

  modbus_write_array_loop(&vars);
  
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // MODBUS_WRITE_ARRAY_body__() 





static inline INT __MAIN_REAL_TO_INT1(BOOL EN,
  REAL IN,
  MAIN *data__)
{
  INT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_REAL_TO_INT5408527_ENO,);
  __res = REAL_TO_INT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_REAL_TO_INT5408527_ENO,,__TMP_ENO);
  return __res;
}

static inline INT __MAIN_REAL_TO_INT2(BOOL EN,
  REAL IN,
  MAIN *data__)
{
  INT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_REAL_TO_INT3098114_ENO,);
  __res = REAL_TO_INT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_REAL_TO_INT3098114_ENO,,__TMP_ENO);
  return __res;
}

void MAIN_init__(MAIN *data__, BOOL retain) {
  MODBEE_HW_INPUTS_init__(&data__->MODBEE_HW_INPUTS0,retain);
  MODBEE_HW_OUTPUTS_init__(&data__->MODBEE_HW_OUTPUTS0,retain);
  __INIT_VAR(data__->START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STOP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUN,__BOOL_LITERAL(FALSE),retain)
  {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[0],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[1],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[2],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[3],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[4],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[5],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[6],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[7],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[8],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[9],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[10],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[11],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[12],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[13],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[14],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[15],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[16],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[17],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[18],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[19],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[20],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[21],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[22],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[23],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[24],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[25],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[26],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[27],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[28],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[29],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[30],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[31],,__BOOL_LITERAL(FALSE));
  }
  {
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[0],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[1],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[2],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[3],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[4],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[5],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[6],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[7],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[8],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[9],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[10],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[11],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[12],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[13],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[14],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[15],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[16],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[17],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[18],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[19],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[20],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[21],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[22],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[23],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[24],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[25],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[26],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[27],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[28],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[29],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[30],,__BOOL_LITERAL(FALSE));
    __SET_VAR(,data__->MB_SLAVE_DI.value.table[31],,__BOOL_LITERAL(FALSE));
  }
  __INIT_VAR(data__->MB_WRITE_COILS_DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MB_READ_COILS_DONE,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TON0,retain);
  TON_init__(&data__->TON1,retain);
  __INIT_VAR(data__->TON1_DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TON0_DONE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MB_READ_REGS_DONE,__BOOL_LITERAL(FALSE),retain)
  {
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[0],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[1],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[2],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[3],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[4],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[5],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[6],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[7],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[8],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[9],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[10],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[11],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[12],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[13],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[14],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[15],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[16],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[17],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[18],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[19],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[20],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[21],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[22],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[23],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[24],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[25],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[26],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[27],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[28],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[29],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[30],,0);
    __SET_VAR(,data__->MB_SLAVE_AI.value.table[31],,0);
  }
  __INIT_VAR(data__->MB_WRITE_REGS_DONE,__BOOL_LITERAL(FALSE),retain)
  {
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[0],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[1],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[2],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[3],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[4],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[5],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[6],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[7],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[8],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[9],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[10],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[11],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[12],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[13],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[14],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[15],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[16],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[17],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[18],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[19],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[20],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[21],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[22],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[23],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[24],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[25],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[26],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[27],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[28],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[29],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[30],,0);
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[31],,0);
  }
  {
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[0],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[1],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[2],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[3],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[4],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[5],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[6],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[7],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[8],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[9],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[10],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[11],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[12],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[13],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[14],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[15],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[16],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[17],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[18],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[19],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[20],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[21],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[22],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[23],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[24],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[25],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[26],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[27],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[28],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[29],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[30],,0);
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[31],,0);
  }
  __INIT_VAR(data__->MB_WRITE_REGS_DONE0,__BOOL_LITERAL(FALSE),retain)
  MODBUS_READ_ARRAY_init__(&data__->MODBUS_READ_ARRAY0,retain);
  MODBUS_READ_ARRAY_init__(&data__->MODBUS_READ_ARRAY1,retain);
  MODBUS_WRITE_ARRAY_init__(&data__->MODBUS_WRITE_ARRAY0,retain);
  MODBUS_WRITE_ARRAY_init__(&data__->MODBUS_WRITE_ARRAY1,retain);
  __INIT_VAR(data__->_TMP_REAL_TO_INT5408527_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_REAL_TO_INT5408527_OUT,0,retain)
  __INIT_VAR(data__->_TMP_REAL_TO_INT3098114_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_REAL_TO_INT3098114_OUT,0,retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->MODBEE_HW_INPUTS0.,EN,,__BOOL_LITERAL(TRUE));
  MODBEE_HW_INPUTS_body__(&data__->MODBEE_HW_INPUTS0);
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(0) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX01,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(1) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX02,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(2) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX03,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(3) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX04,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(4) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX05,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(5) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX06,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(6) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX07,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_DO.value.table[(7) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.DX08,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[(0) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.AX01_SCALED,));
  };
  if (__GET_VAR(data__->MODBEE_HW_INPUTS0.ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_AO.value.table[(1) - (0)],,__GET_VAR(data__->MODBEE_HW_INPUTS0.AX02_SCALED,));
  };
  __SET_VAR(data__->TON0.,IN,,!(__GET_VAR(data__->TON1_DONE,)));
  __SET_VAR(data__->TON0.,PT,,__time_to_timespec(1, 500, 0, 0, 0, 0));
  TON_body__(&data__->TON0);
  __SET_VAR(data__->,TON0_DONE,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->TON1.,IN,,__GET_VAR(data__->TON0_DONE,));
  __SET_VAR(data__->TON1.,PT,,__time_to_timespec(1, 20, 0, 0, 0, 0));
  TON_body__(&data__->TON1);
  __SET_VAR(data__->,TON1_DONE,,__GET_VAR(data__->TON1.Q,));
  __SET_VAR(data__->MODBUS_READ_ARRAY0.,EN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->MODBUS_READ_ARRAY0.,REQ,,__GET_VAR(data__->TON0_DONE,));
  __SET_VAR(data__->MODBUS_READ_ARRAY0.,SLAVE_ID,,1);
  __SET_VAR(data__->MODBUS_READ_ARRAY0.,REG_TYPE,,1);
  __SET_VAR(data__->MODBUS_READ_ARRAY0.,START_ADDR,,100);
  __SET_VAR(data__->MODBUS_READ_ARRAY0.,LENGTH,,8);
  MODBUS_READ_ARRAY_body__(&data__->MODBUS_READ_ARRAY0);
  if (__GET_VAR(data__->MODBUS_READ_ARRAY0.ENO,)) {
    __SET_VAR(data__->,MB_READ_COILS_DONE,,__GET_VAR(data__->MODBUS_READ_ARRAY0.DONE,));
  };
  if (__GET_VAR(data__->MODBUS_READ_ARRAY0.ENO,)) {
    __SET_VAR(data__->,MB_SLAVE_DI,,__GET_VAR(data__->MODBUS_READ_ARRAY0.COILS,));
  };
  __SET_VAR(data__->MODBUS_READ_ARRAY1.,EN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->MODBUS_READ_ARRAY1.,REQ,,__GET_VAR(data__->MB_READ_COILS_DONE,));
  __SET_VAR(data__->MODBUS_READ_ARRAY1.,SLAVE_ID,,1);
  __SET_VAR(data__->MODBUS_READ_ARRAY1.,REG_TYPE,,3);
  __SET_VAR(data__->MODBUS_READ_ARRAY1.,START_ADDR,,100);
  __SET_VAR(data__->MODBUS_READ_ARRAY1.,LENGTH,,4);
  MODBUS_READ_ARRAY_body__(&data__->MODBUS_READ_ARRAY1);
  if (__GET_VAR(data__->MODBUS_READ_ARRAY1.ENO,)) {
    __SET_VAR(data__->,MB_READ_REGS_DONE,,__GET_VAR(data__->MODBUS_READ_ARRAY1.DONE,));
  };
  if (__GET_VAR(data__->MODBUS_READ_ARRAY1.ENO,)) {
    __SET_VAR(data__->,MB_SLAVE_AI,,__GET_VAR(data__->MODBUS_READ_ARRAY1.REGS,));
  };
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,EN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,REQ,,__GET_VAR(data__->MB_READ_REGS_DONE,));
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,SLAVE_ID,,1);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,REG_TYPE,,0);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,START_ADDR,,100);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,LENGTH,,8);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY0.,COILS,,__GET_VAR(data__->MB_SLAVE_DO,));
  MODBUS_WRITE_ARRAY_body__(&data__->MODBUS_WRITE_ARRAY0);
  if (__GET_VAR(data__->MODBUS_WRITE_ARRAY0.ENO,)) {
    __SET_VAR(data__->,MB_WRITE_COILS_DONE,,__GET_VAR(data__->MODBUS_WRITE_ARRAY0.DONE,));
  };
  __SET_VAR(data__->,_TMP_REAL_TO_INT5408527_OUT,,__MAIN_REAL_TO_INT1(
    (BOOL)__BOOL_LITERAL(TRUE),
    (REAL)__GET_VAR(data__->MB_SLAVE_AO.value.table[(0) - (0)],),
    data__));
  __SET_VAR(data__->,_TMP_REAL_TO_INT3098114_OUT,,__MAIN_REAL_TO_INT2(
    (BOOL)__BOOL_LITERAL(TRUE),
    (REAL)__GET_VAR(data__->MB_SLAVE_AO.value.table[(1) - (0)],),
    data__));
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,EN,,(__GET_VAR(data__->_TMP_REAL_TO_INT3098114_ENO,) || __GET_VAR(data__->_TMP_REAL_TO_INT5408527_ENO,)));
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,REQ,,__GET_VAR(data__->MB_WRITE_COILS_DONE,));
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,SLAVE_ID,,1);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,REG_TYPE,,2);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,START_ADDR,,100);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,LENGTH,,2);
  __SET_VAR(data__->MODBUS_WRITE_ARRAY1.,REGS,,__GET_VAR(data__->MB_SLAVE_AO_TEMP,));
  MODBUS_WRITE_ARRAY_body__(&data__->MODBUS_WRITE_ARRAY1);
  if (__GET_VAR(data__->_TMP_REAL_TO_INT5408527_ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[(0) - (0)],,__GET_VAR(data__->_TMP_REAL_TO_INT5408527_OUT,));
  };
  if (__GET_VAR(data__->_TMP_REAL_TO_INT3098114_ENO,)) {
    __SET_VAR(,data__->MB_SLAVE_AO_TEMP.value.table[(1) - (0)],,__GET_VAR(data__->_TMP_REAL_TO_INT3098114_OUT,));
  };
  __SET_VAR(data__->MODBEE_HW_OUTPUTS0.,EN,,__BOOL_LITERAL(TRUE));
  MODBEE_HW_OUTPUTS_body__(&data__->MODBEE_HW_OUTPUTS0);

  goto __end;

__end:
  return;
} // MAIN_body__() 





