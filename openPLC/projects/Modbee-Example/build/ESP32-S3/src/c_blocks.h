#ifndef C_BLOCKS_H
#define C_BLOCKS_H

//definition of external blocks - MODBEE_CONFIG
typedef struct {
} MODBEE_CONFIG_VARS;
void modbee_config_setup(MODBEE_CONFIG_VARS *vars);
void modbee_config_loop(MODBEE_CONFIG_VARS *vars);

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
void modbee_inputs_setup(MODBEE_INPUTS_VARS *vars);
void modbee_inputs_loop(MODBEE_INPUTS_VARS *vars);

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
void modbee_outputs_setup(MODBEE_OUTPUTS_VARS *vars);
void modbee_outputs_loop(MODBEE_OUTPUTS_VARS *vars);

#endif // C_BLOCKS_H
