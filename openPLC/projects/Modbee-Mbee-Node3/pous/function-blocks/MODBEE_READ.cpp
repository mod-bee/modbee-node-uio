FUNCTION_BLOCK MODBEE_READ
VAR_INPUT
	REQ : bool;
	NODE_ID : byte;
	REG_TYPE : byte;
	START_ADDR : word;
	LENGTH : byte;
END_VAR

VAR_OUTPUT
	DONE : bool;
	ERROR : bool;
	NODE_ONLINE : bool;
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
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
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
  bool ists_buffer[MAX_ELEMENTS];
  int16_t hreg_buffer[MAX_ELEMENTS];
  int16_t ireg_buffer[MAX_ELEMENTS];
} ModbeeReadCtx;

static ModbeeReadCtx s_modbee_read_ctx[MAX_INSTANCES];

static ModbeeReadCtx *get_modbee_read_ctx(MODBEE_READ_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].key == key)
      return &s_modbee_read_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbee_read_ctx[i].in_use)
    {
      s_modbee_read_ctx[i].in_use = true;
      s_modbee_read_ctx[i].key = key;
      s_modbee_read_ctx[i].last_req = false;
      s_modbee_read_ctx[i].started = false;
      s_modbee_read_ctx[i].queued = false;
      s_modbee_read_ctx[i].completed = false;
      s_modbee_read_ctx[i].reg_type = 0xFF;
      s_modbee_read_ctx[i].len = 0;
      s_modbee_read_ctx[i].node_id = 0;
      s_modbee_read_ctx[i].start_addr = 0;
      s_modbee_read_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)
      {
        s_modbee_read_ctx[i].coil_buffer[j] = false;
        s_modbee_read_ctx[i].ists_buffer[j] = false;
        s_modbee_read_ctx[i].hreg_buffer[j] = 0;
        s_modbee_read_ctx[i].ireg_buffer[j] = 0;
      }
      return &s_modbee_read_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_read_ctx(ModbeeReadCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for read completion. We map operationId back to the owning instance.
void modbeeReadCallback(uint32_t operationId)
{
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].queued && s_modbee_read_ctx[i].operation_id == operationId)
    {
      s_modbee_read_ctx[i].completed = true;
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
  ModbeeReadCtx *ctx = get_modbee_read_ctx(vars);
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
    reset_modbee_read_ctx(ctx);
    return;
  }
  
  // ===== STATE 2: REQ rising edge - START OPERATION =====
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);
    if (!NODE_ONLINE)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
      return;
    }

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type > 3)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
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

    uint32_t operation_id = 0;
    switch (ctx->reg_type)
    {
    case 0:
      operation_id = io.mbee.readCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    case 1:
      operation_id = io.mbee.readIstsManual(ctx->node_id, ctx->start_addr, ctx->ists_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    case 2:
      operation_id = io.mbee.readHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    case 3:
      operation_id = io.mbee.readIregManual(ctx->node_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, 0, modbeeReadCallback);
      break;
    default:
      break;
    }

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_ctx(ctx);
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

      const uint8_t len = ctx->len;
      switch (ctx->reg_type)
      {
      case 0:
        COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;
        COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;
        COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;
        COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;
        COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;
        COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;
        COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;
        COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;
        break;
      case 1:
        COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;
        COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;
        COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;
        COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;
        COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;
        COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;
        COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;
        COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;
        break;
      case 2:
        REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;
        REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;
        REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;
        REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;
        REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;
        REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;
        REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;
        REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;
        break;
      case 3:
        REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;
        REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;
        REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;
        REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;
        REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;
        REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;
        REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;
        REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;
        break;
      default:
        break;
      }
    }
    return;
  }
  
  // Not queued anymore and not done yet: nothing to do.
}

END_FUNCTION_BLOCK