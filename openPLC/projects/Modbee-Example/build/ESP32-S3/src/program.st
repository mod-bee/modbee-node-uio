PROGRAM modbee
  VAR
    MODBEE_CONFIG0 : MODBEE_CONFIG;
  END_VAR

  MODBEE_CONFIG0(EN := TRUE);
END_PROGRAM

FUNCTION_BLOCK MODBEE_CONFIG
  VAR
    hasBeenInitialized : BOOL := 0;
  END_VAR

  {{
  MODBEE_CONFIG_VARS vars;
  }}
  if hasBeenInitialized = False then
  {{
  modbee_config_setup(&vars);
  }}
  hasBeenInitialized := True;
  end_if;
  {{
  modbee_config_loop(&vars);
  }}
END_FUNCTION_BLOCK

FUNCTION_BLOCK MODBEE_INPUTS
  VAR_OUTPUT
    DX01 : BOOL;
    DX02 : BOOL;
    DX03 : BOOL;
    DX04 : BOOL;
    DX05 : BOOL;
    DX06 : BOOL;
    DX07 : BOOL;
    DX08 : BOOL;
    AX01_Scaled : REAL;
    AX02_Scaled : REAL;
    AX03_Scaled : REAL;
    AX04_Scaled : REAL;
  END_VAR
  VAR
    hasBeenInitialized : BOOL := 0;
  END_VAR

  {{
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
  }}
  if hasBeenInitialized = False then
  {{
  modbee_inputs_setup(&vars);
  }}
  hasBeenInitialized := True;
  end_if;
  {{
  modbee_inputs_loop(&vars);
  }}
END_FUNCTION_BLOCK

FUNCTION_BLOCK MODBEE_OUTPUTS
  VAR_INPUT
    DY01 : BOOL;
    DY02 : BOOL;
    DY03 : BOOL;
    DY04 : BOOL;
    DY05 : BOOL;
    DY06 : BOOL;
    DY07 : BOOL;
    DY08 : BOOL;
    AY01_Scaled : REAL;
    AY02_Scaled : REAL;
  END_VAR
  VAR
    hasBeenInitialized : BOOL := 0;
  END_VAR

  {{
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
  }}
  if hasBeenInitialized = False then
  {{
  modbee_outputs_setup(&vars);
  }}
  hasBeenInitialized := True;
  end_if;
  {{
  modbee_outputs_loop(&vars);
  }}
END_FUNCTION_BLOCK

PROGRAM main
  VAR
    MODBEE_INPUTS0 : MODBEE_INPUTS;
    MODBEE_OUTPUTS0 : MODBEE_OUTPUTS;
    start : BOOL;
    stop : BOOL;
    run : BOOL;
  END_VAR

  MODBEE_INPUTS0(EN := TRUE);
  IF MODBEE_INPUTS0.ENO THEN
      start := MODBEE_INPUTS0.DX01;
  END_IF;
  IF MODBEE_INPUTS0.ENO THEN
      stop := MODBEE_INPUTS0.DX02;
  END_IF;
  run := NOT(stop) AND (run OR start);
  MODBEE_OUTPUTS0(EN := TRUE, DY01 := run);
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#1ms,PRIORITY := 1);
    TASK Task1(INTERVAL := T#1ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : main;
    PROGRAM instance1 WITH Task1 : modbee;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "d8a3ed0622838c8b1228f280e6da8cc4";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:char plc_program_md5[] = "d8a3ed0622838c8b1228f280e6da8cc4";*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern MAIN RES0__INSTANCE0;*)
(*DBG:extern MODBEE RES0__INSTANCE1;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX01), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX02), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX03), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX04), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX05), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX06), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX07), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX08), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX01_SCALED), REAL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX02_SCALED), REAL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX03_SCALED), REAL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX04_SCALED), REAL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_INPUTS0.HASBEENINITIALIZED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY01), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY02), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY03), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY04), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY05), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY06), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY07), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY08), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.AY01_SCALED), REAL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.AY02_SCALED), REAL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.HASBEENINITIALIZED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.START), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STOP), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RUN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.MODBEE_CONFIG0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.MODBEE_CONFIG0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.MODBEE_CONFIG0.HASBEENINITIALIZED), BOOL_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               34*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case REAL_ENUM:*)
(*DBG:        return sizeof(REAL);*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case REAL_ENUM:*)
(*DBG:        return (void *)&((__IEC_REAL_t *) ptr)->value;*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case REAL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_REAL_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_REAL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case REAL_ENUM:*)
(*DBG:            ((__IEC_REAL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size)*)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i)*)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++)*)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Prevent swapping for STRING type*)
(*DBG:            if (debug_vars[idx].type == STRING_ENUM)*)
(*DBG:            {*)
(*DBG:                // Do nothing*)
(*DBG:                ;*)
(*DBG:            }*)
(*DBG:            else*)
(*DBG:            {*)
(*DBG:                swap_bytes(val, get_var_size(idx));*)
(*DBG:            }*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)