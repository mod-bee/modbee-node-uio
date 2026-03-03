/*
 * This file is part of OpenPLC Runtime
 *
 * Copyright (C) 2023 Autonomy, GP Orcullo
 * Based on the work by GP Orcullo on Beremiz for uC
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.
 *
 */

#include <stdbool.h>

// Include defines.h first for Arduino builds to set USE_*_BLOCKS macros
// before iec_std_FB.h processes its conditional includes
#ifdef ARDUINO
#include "../examples/Baremetal/defines.h"
#endif

#include "iec_types_all.h"
#include "POUS.h"

#define SAME_ENDIANNESS      0
#define REVERSE_ENDIANNESS   1

char plc_program_md5[] = "97adaa0cca36bf1dacc21e4aab8f82c4";

uint8_t endianness;


extern MAIN RES0__INSTANCE0;
extern MODBEE RES0__INSTANCE1;

static const struct {
    void *ptr;
    __IEC_types_enum type;
} debug_vars[] = {
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.DX08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.AX01_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.AX02_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.AX03_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.AX04_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_INPUTS0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.DY08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.AY01_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.AY02_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HW_OUTPUTS0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.START), BOOL_ENUM},
    {&(RES0__INSTANCE0.STOP), BOOL_ENUM},
    {&(RES0__INSTANCE0.RUN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0.IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0.PT), TIME_ENUM},
    {&(RES0__INSTANCE0.TON0.Q), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0.ET), TIME_ENUM},
    {&(RES0__INSTANCE0.TON0.STATE), SINT_ENUM},
    {&(RES0__INSTANCE0.TON0.PREV_IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0.CURRENT_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.TON0.START_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.TON1.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON1.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON1.IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON1.PT), TIME_ENUM},
    {&(RES0__INSTANCE0.TON1.Q), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON1.ET), TIME_ENUM},
    {&(RES0__INSTANCE0.TON1.STATE), SINT_ENUM},
    {&(RES0__INSTANCE0.TON1.PREV_IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON1.CURRENT_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.TON1.START_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.TON1_DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.TON0_DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REQ), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.NODE_ID), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_TYPE), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.START_ADDR), WORD_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.LENGTH), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.ERROR), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.NODE_ONLINE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.COIL_08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_01), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_02), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_03), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_04), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_05), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_06), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_07), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.REG_08), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REQ), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.NODE_ID), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_TYPE), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.START_ADDR), WORD_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.LENGTH), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.COIL_08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_01), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_02), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_03), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_04), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_05), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_06), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_07), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.REG_08), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.ERROR), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.NODE_ONLINE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_READ_COILS_DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DI08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_WRITE_COILS_DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_DO08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_CONFIG0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_CONFIG0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_CONFIG0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REQ), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.NODE_ID), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_TYPE), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.START_ADDR), WORD_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.LENGTH), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.ERROR), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.NODE_ONLINE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.COIL_08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_01), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_02), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_03), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_04), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_05), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_06), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_07), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.REG_08), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_READ1.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REQ), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.NODE_ID), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_TYPE), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.START_ADDR), WORD_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.LENGTH), BYTE_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.COIL_08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_01), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_02), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_03), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_04), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_05), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_06), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_07), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.REG_08), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.DONE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.ERROR), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.NODE_ONLINE), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_WRITE1.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MBEE_AI01), INT_ENUM},
    {&(RES0__INSTANCE0.MBEE_AI02), INT_ENUM},
    {&(RES0__INSTANCE0.MBEE_AI03), INT_ENUM},
    {&(RES0__INSTANCE0.MBEE_AI04), INT_ENUM},
    {&(RES0__INSTANCE0.MBEE_AO01), REAL_ENUM},
    {&(RES0__INSTANCE0.MBEE_AO02), REAL_ENUM},
    {&(RES0__INSTANCE0.MBEE_AO01_TEMP), INT_ENUM},
    {&(RES0__INSTANCE0.MBEE_AO02_TEMP), INT_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HAT_PWR0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HAT_PWR0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HAT_PWR0.EN_HAT_POWER), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_HAT_PWR0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0._TMP_REAL_TO_INT1445590_ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0._TMP_REAL_TO_INT1445590_OUT), INT_ENUM},
    {&(RES0__INSTANCE0._TMP_REAL_TO_INT5476008_ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0._TMP_REAL_TO_INT5476008_OUT), INT_ENUM},
    {&(RES0__INSTANCE1.MODBEE_HW_CONFIG0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_HW_CONFIG0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_HW_CONFIG0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_CONFIG0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_CONFIG0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_CONFIG0.HASBEENINITIALIZED), BOOL_ENUM},
};

#define VAR_COUNT               204

uint16_t get_var_count(void)
{
    return VAR_COUNT;
}

size_t get_var_size(size_t idx)
{
    if (idx >= VAR_COUNT)
    {
        return 0;
    }
    switch (debug_vars[idx].type) {
    case BYTE_ENUM:
        return sizeof(BYTE);
    case INT_ENUM:
        return sizeof(INT);
    case TIME_ENUM:
        return sizeof(TIME);
    case WORD_ENUM:
        return sizeof(WORD);
    case SINT_ENUM:
        return sizeof(SINT);
    case BOOL_ENUM:
        return sizeof(BOOL);
    case REAL_ENUM:
        return sizeof(REAL);
    default:
        return 0;
    }
}

void *get_var_addr(size_t idx)
{
    void *ptr = debug_vars[idx].ptr;

    switch (debug_vars[idx].type) {
    case BYTE_ENUM:
        return (void *)&((__IEC_BYTE_t *) ptr)->value;
    case INT_ENUM:
        return (void *)&((__IEC_INT_t *) ptr)->value;
    case TIME_ENUM:
        return (void *)&((__IEC_TIME_t *) ptr)->value;
    case WORD_ENUM:
        return (void *)&((__IEC_WORD_t *) ptr)->value;
    case SINT_ENUM:
        return (void *)&((__IEC_SINT_t *) ptr)->value;
    case BOOL_ENUM:
        return (void *)&((__IEC_BOOL_t *) ptr)->value;
    case REAL_ENUM:
        return (void *)&((__IEC_REAL_t *) ptr)->value;
    default:
        return 0;
    }
}

void force_var(size_t idx, bool forced, void *val)
{
    void *ptr = debug_vars[idx].ptr;

    if (forced) {
        size_t var_size = get_var_size(idx);
        switch (debug_vars[idx].type) {
        case BYTE_ENUM: {
            memcpy(&((__IEC_BYTE_t *) ptr)->value, val, var_size);
            ((__IEC_BYTE_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case INT_ENUM: {
            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);
            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case TIME_ENUM: {
            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);
            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case WORD_ENUM: {
            memcpy(&((__IEC_WORD_t *) ptr)->value, val, var_size);
            ((__IEC_WORD_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case SINT_ENUM: {
            memcpy(&((__IEC_SINT_t *) ptr)->value, val, var_size);
            ((__IEC_SINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case BOOL_ENUM: {
            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);
            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case REAL_ENUM: {
            memcpy(&((__IEC_REAL_t *) ptr)->value, val, var_size);
            ((__IEC_REAL_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        default:
            break;
        }
    } else {
        switch (debug_vars[idx].type) {
        case BYTE_ENUM:
            ((__IEC_BYTE_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case INT_ENUM:
            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case TIME_ENUM:
            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case WORD_ENUM:
            ((__IEC_WORD_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case SINT_ENUM:
            ((__IEC_SINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case BOOL_ENUM:
            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case REAL_ENUM:
            ((__IEC_REAL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        default:
            break;
        }
    }
}

void swap_bytes(void *ptr, size_t size)
{
    uint8_t *bytePtr = (uint8_t *)ptr;
    size_t i;
    for (i = 0; i < size / 2; ++i)
    {
        uint8_t temp = bytePtr[i];
        bytePtr[i] = bytePtr[size - 1 - i];
        bytePtr[size - 1 - i] = temp;
    }
}

void trace_reset(void)
{
    for (size_t i=0; i < VAR_COUNT; i++)
    {
        force_var(i, false, 0);
    }
}

void set_trace(size_t idx, bool forced, void *val)
{
    if (idx >= 0 && idx < VAR_COUNT)
    {
        if (endianness == REVERSE_ENDIANNESS)
        {
            // Prevent swapping for STRING type
            if (debug_vars[idx].type == STRING_ENUM)
            {
                // Do nothing
                ;
            }
            else
            {
                swap_bytes(val, get_var_size(idx));
            }
        }

        force_var(idx, forced, val);
    }
}

void set_endianness(uint8_t value)
{
    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)
    {
        endianness = value;
    }
}
