#ifndef C_BLOCKS_H
#define C_BLOCKS_H

//definition of external blocks - MODBEE_ADD_REGISTER
typedef struct {
  IEC_BYTE *REG;
  IEC_WORD *ADDRESS;
  IEC_BOOL *VAR_BOOL;
  IEC_INT *VAR_INT;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBEE_ADD_REGISTER_VARS;
void modbee_add_register_setup(MODBEE_ADD_REGISTER_VARS *vars);
void modbee_add_register_loop(MODBEE_ADD_REGISTER_VARS *vars);

//definition of external blocks - MODBEE_CONFIG
typedef struct {
} MODBEE_CONFIG_VARS;
void modbee_config_setup(MODBEE_CONFIG_VARS *vars);
void modbee_config_loop(MODBEE_CONFIG_VARS *vars);

//definition of external blocks - MODBEE_HAT_PWR
typedef struct {
  IEC_BOOL *EN_HAT_POWER;
} MODBEE_HAT_PWR_VARS;
void modbee_hat_pwr_setup(MODBEE_HAT_PWR_VARS *vars);
void modbee_hat_pwr_loop(MODBEE_HAT_PWR_VARS *vars);

//definition of external blocks - MODBEE_HW_CONFIG
typedef struct {
} MODBEE_HW_CONFIG_VARS;
void modbee_hw_config_setup(MODBEE_HW_CONFIG_VARS *vars);
void modbee_hw_config_loop(MODBEE_HW_CONFIG_VARS *vars);

//definition of external blocks - MODBEE_HW_INPUTS
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
} MODBEE_HW_INPUTS_VARS;
void modbee_hw_inputs_setup(MODBEE_HW_INPUTS_VARS *vars);
void modbee_hw_inputs_loop(MODBEE_HW_INPUTS_VARS *vars);

//definition of external blocks - MODBEE_HW_OUTPUTS
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
} MODBEE_HW_OUTPUTS_VARS;
void modbee_hw_outputs_setup(MODBEE_HW_OUTPUTS_VARS *vars);
void modbee_hw_outputs_loop(MODBEE_HW_OUTPUTS_VARS *vars);

//definition of external blocks - MODBEE_READ
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
} MODBEE_READ_VARS;
void modbee_read_setup(MODBEE_READ_VARS *vars);
void modbee_read_loop(MODBEE_READ_VARS *vars);

//definition of external blocks - MODBEE_READ_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
} MODBEE_READ_ARRAY_VARS;
void modbee_read_array_setup(MODBEE_READ_ARRAY_VARS *vars);
void modbee_read_array_loop(MODBEE_READ_ARRAY_VARS *vars);

//definition of external blocks - MODBEE_WRITE
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
} MODBEE_WRITE_VARS;
void modbee_write_setup(MODBEE_WRITE_VARS *vars);
void modbee_write_loop(MODBEE_WRITE_VARS *vars);

//definition of external blocks - MODBEE_WRITE_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *NODE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *NODE_ONLINE;
} MODBEE_WRITE_ARRAY_VARS;
void modbee_write_array_setup(MODBEE_WRITE_ARRAY_VARS *vars);
void modbee_write_array_loop(MODBEE_WRITE_ARRAY_VARS *vars);

//definition of external blocks - MODBUS_ADD_REGISTER
typedef struct {
  IEC_BYTE *REG;
  IEC_WORD *ADDRESS;
  IEC_BOOL *VAR_BOOL;
  IEC_INT *VAR_INT;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBUS_ADD_REGISTER_VARS;
void modbus_add_register_setup(MODBUS_ADD_REGISTER_VARS *vars);
void modbus_add_register_loop(MODBUS_ADD_REGISTER_VARS *vars);

//definition of external blocks - MODBUS_READ
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
} MODBUS_READ_VARS;
void modbus_read_setup(MODBUS_READ_VARS *vars);
void modbus_read_loop(MODBUS_READ_VARS *vars);

//definition of external blocks - MODBUS_READ_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
} MODBUS_READ_ARRAY_VARS;
void modbus_read_array_setup(MODBUS_READ_ARRAY_VARS *vars);
void modbus_read_array_loop(MODBUS_READ_ARRAY_VARS *vars);

//definition of external blocks - MODBUS_WRITE
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COIL_01;
  IEC_BOOL *COIL_02;
  IEC_BOOL *COIL_03;
  IEC_BOOL *COIL_04;
  IEC_BOOL *COIL_05;
  IEC_BOOL *COIL_06;
  IEC_BOOL *COIL_07;
  IEC_BOOL *COIL_08;
  IEC_INT *REG_01;
  IEC_INT *REG_02;
  IEC_INT *REG_03;
  IEC_INT *REG_04;
  IEC_INT *REG_05;
  IEC_INT *REG_06;
  IEC_INT *REG_07;
  IEC_INT *REG_08;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBUS_WRITE_VARS;
void modbus_write_setup(MODBUS_WRITE_VARS *vars);
void modbus_write_loop(MODBUS_WRITE_VARS *vars);

//definition of external blocks - MODBUS_WRITE_ARRAY
typedef struct {
  IEC_BOOL *REQ;
  IEC_BYTE *SLAVE_ID;
  IEC_BYTE *REG_TYPE;
  IEC_WORD *START_ADDR;
  IEC_BYTE *LENGTH;
  IEC_BOOL *COILS;
  IEC_INT *REGS;
  IEC_BOOL *DONE;
  IEC_BOOL *ERROR;
} MODBUS_WRITE_ARRAY_VARS;
void modbus_write_array_setup(MODBUS_WRITE_ARRAY_VARS *vars);
void modbus_write_array_loop(MODBUS_WRITE_ARRAY_VARS *vars);

#endif // C_BLOCKS_H
