FUNCTION_BLOCK MODBEE_READ_ARRAY
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
	COILS : ARRAY [0..31] OF bool;
	REGS : ARRAY [0..31] OF int;
END_VAR
/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBEE_READ_ARRAY (Multi-element, up to 32)
 *
 *  Reads multiple values from a ModBee node with array outputs.
 *  LENGTH specifies element count (1-32)
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
 *  4. REQ fall: Reset all flags
 *
 *  INVARIANT: DONE=true ONLY means operation finished successfully
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBEE_READ_ARRAY_MAX_ELEMENTS 32
#define MODBEE_READ_ARRAY_MAX_INSTANCES 16

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

  bool coil_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
  bool ists_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
  int16_t hreg_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
  int16_t ireg_buffer[MODBEE_READ_ARRAY_MAX_ELEMENTS];
} ModbeeReadArrayCtx;

static ModbeeReadArrayCtx s_modbee_read_array_ctx[MODBEE_READ_ARRAY_MAX_INSTANCES];

static ModbeeReadArrayCtx *get_modbee_read_array_ctx(MODBEE_READ_ARRAY_VARS *vars)
{
  (void)vars;
  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBEE_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbee_read_array_ctx[i].in_use && s_modbee_read_array_ctx[i].key == key)
      return &s_modbee_read_array_ctx[i];
  }
  for (int i = 0; i < MODBEE_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbee_read_array_ctx[i].in_use)
    {
      s_modbee_read_array_ctx[i].in_use = true;
      s_modbee_read_array_ctx[i].key = key;
      s_modbee_read_array_ctx[i].last_req = false;
      s_modbee_read_array_ctx[i].started = false;
      s_modbee_read_array_ctx[i].queued = false;
      s_modbee_read_array_ctx[i].completed = false;
      s_modbee_read_array_ctx[i].reg_type = 0xFF;
      s_modbee_read_array_ctx[i].len = 0;
      s_modbee_read_array_ctx[i].node_id = 0;
      s_modbee_read_array_ctx[i].start_addr = 0;
      s_modbee_read_array_ctx[i].operation_id = 0;
      for (uint8_t j = 0; j < MODBEE_READ_ARRAY_MAX_ELEMENTS; j++)
      {
        s_modbee_read_array_ctx[i].coil_buffer[j] = false;
        s_modbee_read_array_ctx[i].ists_buffer[j] = false;
        s_modbee_read_array_ctx[i].hreg_buffer[j] = 0;
        s_modbee_read_array_ctx[i].ireg_buffer[j] = 0;
      }
      return &s_modbee_read_array_ctx[i];
    }
  }
  return nullptr;
}

static inline void reset_modbee_read_array_ctx(ModbeeReadArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->operation_id = 0;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

// Callback for read completion. We map operationId back to the owning instance.
void modbeeReadArrayCallback(uint32_t operationId)
{
  for (int i = 0; i < MODBEE_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbee_read_array_ctx[i].in_use && s_modbee_read_array_ctx[i].queued && s_modbee_read_array_ctx[i].operation_id == operationId)
    {
      s_modbee_read_array_ctx[i].completed = true;
      return;
    }
  }
}

static inline uint8_t *modbee_read_array_coils_ptr(MODBEE_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (uint8_t *)COILS;
}

static inline int16_t *modbee_read_array_regs_ptr(MODBEE_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (int16_t *)REGS;
}

static inline void modbee_read_array_clear_outputs(MODBEE_READ_ARRAY_VARS *vars)
{
  // Clear the full arrays to avoid stale data.
  uint8_t *coils = modbee_read_array_coils_ptr(vars);
  int16_t *regs = modbee_read_array_regs_ptr(vars);
  for (uint8_t i = 0; i < MODBEE_READ_ARRAY_MAX_ELEMENTS; i++)
  {
    coils[i] = 0;
    regs[i] = 0;
  }
}

void setup()
{
  DONE = false;
  ERROR = false;
  NODE_ONLINE = false;
  modbee_read_array_clear_outputs(vars);
}

void loop()
{
  ModbeeReadArrayCtx *ctx = get_modbee_read_array_ctx(vars);
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
    reset_modbee_read_array_ctx(ctx);
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
      reset_modbee_read_array_ctx(ctx);
      return;
    }

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBEE_READ_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
      return;
    }

    const uint8_t reg_type = (uint8_t)REG_TYPE;
    if (reg_type > 3)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
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
      operation_id = io.mbee.readCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    case 1:
      operation_id = io.mbee.readIstsManual(ctx->node_id, ctx->start_addr, ctx->ists_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    case 2:
      operation_id = io.mbee.readHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    case 3:
      operation_id = io.mbee.readIregManual(ctx->node_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, 0, modbeeReadArrayCallback);
      break;
    default:
      break;
    }

    if (operation_id == 0)
    {
      ERROR = true;
      DONE = false;
      reset_modbee_read_array_ctx(ctx);
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
      uint8_t *coils = modbee_read_array_coils_ptr(vars);
      int16_t *regs = modbee_read_array_regs_ptr(vars);
      switch (ctx->reg_type)
      {
      case 0:
        for (uint8_t i = 0; i < len; i++)
          coils[i] = ctx->coil_buffer[i] ? 1 : 0;
        break;
      case 1:
        for (uint8_t i = 0; i < len; i++)
          coils[i] = ctx->ists_buffer[i] ? 1 : 0;
        break;
      case 2:
        for (uint8_t i = 0; i < len; i++)
          regs[i] = ctx->hreg_buffer[i];
        break;
      case 3:
        for (uint8_t i = 0; i < len; i++)
          regs[i] = ctx->ireg_buffer[i];
        break;
      default:
        break;
      }
    }
    return;
  }
}

END_FUNCTION_BLOCK