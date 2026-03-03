FUNCTION_BLOCK MODBEE_WRITE
VAR_INPUT
	REQ : bool;
	NODE_ID : byte;
	REG_TYPE : byte;
	START_ADDR : word;
	LENGTH : byte;
	COIL_01 : bool;
	COIL_02 : bool;
	COIL_03 : bool;
	COIL_04 : bool;
	COIL_05 : bool;
	COIL_06 : bool;
	COIL_07 : bool;
	COIL_08 : bool;
	REG_01 : int;
	REG_02 : int;
	REG_03 : int;
	REG_04 : int;
	REG_05 : int;
	REG_06 : int;
	REG_07 : int;
	REG_08 : int;
END_VAR

VAR_OUTPUT
	DONE : bool;
	ERROR : bool;
	NODE_ONLINE : bool;
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
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async write with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Set DONE when callback indicates success
 *  4. REQ fall: Reset all flags
 *  
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

typedef struct
{
  void *key; // stable per-instance key (pointer into FB instance)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;

  uint8_t reg_type;
  uint8_t len;
  uint8_t node_id;
  uint16_t start_addr;
  uint32_t operation_id;

  bool coil_buffer[MAX_ELEMENTS];
  int16_t hreg_buffer[MAX_ELEMENTS];
} ModbeeWriteCtx;

static ModbeeWriteCtx s_modbee_write_ctx[MAX_INSTANCES];

static ModbeeWriteCtx *get_modbee_write_ctx(MODBEE_WRITE_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].key == key)
      return &s_modbee_write_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbee_write_ctx[i].in_use)
    {
      s_modbee_write_ctx[i].in_use = true;
      s_modbee_write_ctx[i].key = key;
      s_modbee_write_ctx[i].last_req = false;
      s_modbee_write_ctx[i].started = false;
      s_modbee_write_ctx[i].queued = false;
      s_modbee_write_ctx[i].completed = false;
      s_modbee_write_ctx[i].reg_type = 0xFF;
      s_modbee_write_ctx[i].len = 0;
      s_modbee_write_ctx[i].node_id = 0;
      s_modbee_write_ctx[i].start_addr = 0;
      s_modbee_write_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)
      {
        s_modbee_write_ctx[i].coil_buffer[j] = false;
        s_modbee_write_ctx[i].hreg_buffer[j] = 0;
      }
      return &s_modbee_write_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_write_ctx(ModbeeWriteCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for write completion. We map operationId back to the owning instance.
void modbeeWriteCallback(uint32_t operationId)
{
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].queued && s_modbee_write_ctx[i].operation_id == operationId)
    {
      s_modbee_write_ctx[i].completed = true;
      return;
    }
  }
}

void setup()
{
  DONE = false;
  ERROR = false;
  NODE_ONLINE = false;
}

void loop()
{
  ModbeeWriteCtx *ctx = get_modbee_write_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = false;
    return;
  }
  
  // ===== STATE 1: REQ falling edge - RESET =====
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    DONE = false;
    ERROR = false;
    NODE_ONLINE = false;
    reset_modbee_write_ctx(ctx);
    return;
  }
  
  // ===== STATE 2: REQ rising edge - START OPERATION =====
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;
    
    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);
    if (!NODE_ONLINE) {
      ERROR = true;
      DONE = false;  // Error occurred, operation not done
      return;
    }
    
    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;  // Error occurred, operation not done
      reset_modbee_write_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type != 0 && reg_type != 2)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->operation_id = 0;
    ctx->len = len;
    ctx->reg_type = reg_type;
    ctx->node_id = (uint8_t)NODE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)
    {
      ctx->coil_buffer[i] = false;
      ctx->hreg_buffer[i] = 0;
    }

    if (ctx->reg_type == 0)
    {
      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;
      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;
      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;
      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;
      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;
      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;
      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;
      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;
    }
    else
    {
      ctx->hreg_buffer[0] = (len > 0) ? (int16_t)REG_01 : 0;
      ctx->hreg_buffer[1] = (len > 1) ? (int16_t)REG_02 : 0;
      ctx->hreg_buffer[2] = (len > 2) ? (int16_t)REG_03 : 0;
      ctx->hreg_buffer[3] = (len > 3) ? (int16_t)REG_04 : 0;
      ctx->hreg_buffer[4] = (len > 4) ? (int16_t)REG_05 : 0;
      ctx->hreg_buffer[5] = (len > 5) ? (int16_t)REG_06 : 0;
      ctx->hreg_buffer[6] = (len > 6) ? (int16_t)REG_07 : 0;
      ctx->hreg_buffer[7] = (len > 7) ? (int16_t)REG_08 : 0;
    }

    uint32_t operation_id = 0;
    if (ctx->reg_type == 0)
      operation_id = io.mbee.writeCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeWriteCallback);
    else
      operation_id = io.mbee.writeHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeWriteCallback);

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_write_ctx(ctx);
      return;
    }

    ctx->operation_id = operation_id;
    ctx->queued = true;
    return;
  }
  
  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====
  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = false;
      ctx->queued = false;
      ctx->started = false;
      ctx->operation_id = 0;
    }
    return;
  }
  
  // Not queued anymore and not done yet: nothing to do.
}

END_FUNCTION_BLOCK