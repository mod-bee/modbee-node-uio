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

#include "iec_types_all.h"
#include "POUS.h"

#define SAME_ENDIANNESS      0
#define REVERSE_ENDIANNESS   1

char plc_program_md5[] = "d8a3ed0622838c8b1228f280e6da8cc4";

uint8_t endianness;


extern MAIN RES0__INSTANCE0;
extern MODBEE RES0__INSTANCE1;

static const struct {
    void *ptr;
    __IEC_types_enum type;
} debug_vars[] = {
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.DX08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX01_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX02_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX03_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.AX04_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_INPUTS0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY01), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY02), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY03), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY04), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY05), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY06), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY07), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.DY08), BOOL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.AY01_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.AY02_SCALED), REAL_ENUM},
    {&(RES0__INSTANCE0.MODBEE_OUTPUTS0.HASBEENINITIALIZED), BOOL_ENUM},
    {&(RES0__INSTANCE0.START), BOOL_ENUM},
    {&(RES0__INSTANCE0.STOP), BOOL_ENUM},
    {&(RES0__INSTANCE0.RUN), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_CONFIG0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_CONFIG0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE1.MODBEE_CONFIG0.HASBEENINITIALIZED), BOOL_ENUM},
};

#define VAR_COUNT               34

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
    case REAL_ENUM:
        return sizeof(REAL);
    case BOOL_ENUM:
        return sizeof(BOOL);
    default:
        return 0;
    }
}

void *get_var_addr(size_t idx)
{
    void *ptr = debug_vars[idx].ptr;

    switch (debug_vars[idx].type) {
    case REAL_ENUM:
        return (void *)&((__IEC_REAL_t *) ptr)->value;
    case BOOL_ENUM:
        return (void *)&((__IEC_BOOL_t *) ptr)->value;
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
        case REAL_ENUM: {
            memcpy(&((__IEC_REAL_t *) ptr)->value, val, var_size);
            ((__IEC_REAL_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case BOOL_ENUM: {
            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);
            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        default:
            break;
        }
    } else {
        switch (debug_vars[idx].type) {
        case REAL_ENUM:
            ((__IEC_REAL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case BOOL_ENUM:
            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
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
