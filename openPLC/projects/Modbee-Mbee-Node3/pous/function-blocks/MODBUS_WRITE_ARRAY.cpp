FUNCTION_BLOCK MODBUS_WRITE_ARRAY
VAR_INPUT
	REQ : bool;
	SLAVE_ID : byte;
	REG_TYPE : byte;
	START_ADDR : word;
	LENGTH : byte;
	COILS : ARRAY [0..31] OF bool;
	REGS : ARRAY [0..31] OF int;
END_VAR

VAR_OUTPUT
	DONE : bool;
	ERROR : bool;
END_VAR
/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_WRITE_ARRAY (Multi-element, up to 32)
 *
 *  Writes multiple values to Modbus slave from array inputs.
 *  LENGTH specifies element count (1-32)
 *
 *  NOTE: MODBUS_* blocks use a shared one-transaction-at-a-time manager.
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBUS_WRITE_ARRAY_MAX_ELEMENTS 32
#define MODBUS_WRITE_ARRAY_MAX_INSTANCES 16

// Shared Modbus transaction manager (same pattern as existing MODBUS_READ/MODBUS_WRITE)
#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR
#define MODBEE_OPENPLC_MODBUS_TX_MGR
static volatile void *modbee_mb_owner = nullptr;
static inline bool modbee_mb_claim(void *owner)
{
  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))
    return false;
  modbee_mb_owner = owner;
  return true;
}
static inline void modbee_mb_release(void *owner)
{
  if (modbee_mb_owner == owner)
    modbee_mb_owner = nullptr;
}
#endif

typedef struct
{
  void *key; // stable per-instance key (e.g. pointer to REQ storage)
  bool in_use;

  bool last_req;
  bool started;
  bool queued;
  volatile bool completed;
  volatile bool success;

  uint8_t reg_type;
  uint8_t len;
  uint8_t slave_id;
  uint16_t start_addr;

  bool coil_buffer[MODBUS_WRITE_ARRAY_MAX_ELEMENTS];
  uint16_t hreg_buffer[MODBUS_WRITE_ARRAY_MAX_ELEMENTS];
} ModbusWriteArrayCtx;

static ModbusWriteArrayCtx s_modbus_write_array_ctx[MODBUS_WRITE_ARRAY_MAX_INSTANCES];
static volatile ModbusWriteArrayCtx *s_modbus_write_array_active = nullptr;

static ModbusWriteArrayCtx *get_modbus_write_array_ctx(MODBUS_WRITE_ARRAY_VARS *vars)
{
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBUS_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbus_write_array_ctx[i].in_use && s_modbus_write_array_ctx[i].key == key)
      return &s_modbus_write_array_ctx[i];
  }
  for (int i = 0; i < MODBUS_WRITE_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbus_write_array_ctx[i].in_use)
    {
      s_modbus_write_array_ctx[i].in_use = true;
      s_modbus_write_array_ctx[i].key = key;
      s_modbus_write_array_ctx[i].last_req = false;
      s_modbus_write_array_ctx[i].started = false;
      s_modbus_write_array_ctx[i].queued = false;
      s_modbus_write_array_ctx[i].completed = false;
      s_modbus_write_array_ctx[i].success = false;
      s_modbus_write_array_ctx[i].reg_type = 0xFF;
      s_modbus_write_array_ctx[i].len = 0;
      s_modbus_write_array_ctx[i].slave_id = 0;
      s_modbus_write_array_ctx[i].start_addr = 0;
      return &s_modbus_write_array_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_write_array_ctx(ModbusWriteArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusWriteArrayCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusWriteArrayCtx *ctx = (ModbusWriteArrayCtx *)s_modbus_write_array_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_write_array_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

void setup()
{
  DONE = false;
  ERROR = false;
}

void loop()
{
  ModbusWriteArrayCtx *ctx = get_modbus_write_array_ctx(vars);
  if (!ctx)
  {
    ERROR = true;
    DONE = true;
    return;
  }

  // REQ falling edge: reset instance state
  if (!REQ && ctx->last_req)
  {
    ctx->last_req = false;
    reset_modbus_write_array_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_write_array_active == ctx)
      s_modbus_write_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters and build write buffers
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBUS_WRITE_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_array_ctx(ctx);
      return;
    }

    ctx->started = true;
    ctx->queued = false;
    ctx->completed = false;
    ctx->success = false;
    ctx->len = len;
    ctx->reg_type = (uint8_t)REG_TYPE;
    ctx->slave_id = (uint8_t)SLAVE_ID;
    ctx->start_addr = (uint16_t)START_ADDR;

    for (uint8_t i = 0; i < MODBUS_WRITE_ARRAY_MAX_ELEMENTS; i++)
    {
      ctx->coil_buffer[i] = false;
      ctx->hreg_buffer[i] = 0;
    }

    const uint8_t *coils_in = (const uint8_t *)COILS;
    const int16_t *regs_in = (const int16_t *)REGS;

    if (ctx->reg_type == 0)
    {
      for (uint8_t i = 0; i < len; i++)
        ctx->coil_buffer[i] = (coils_in[i] != 0);
    }
    else if (ctx->reg_type == 2)
    {
      for (uint8_t i = 0; i < len; i++)
        ctx->hreg_buffer[i] = (uint16_t)regs_in[i];
    }
    else
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_array_ctx(ctx);
      return;
    }
  }

  if (!REQ || DONE)
    return;

  if (ctx->queued)
  {
    if (ctx->completed)
    {
      DONE = true;
      ERROR = !ctx->success;
      ctx->queued = false;
      ctx->started = false;
    }
    return;
  }

  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_write_array_active = ctx;
  bool queued = false;
  if (ctx->reg_type == 0)
  {
    queued = (io.mb.writeCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusWriteArrayCallback) != 0);
  }
  else if (ctx->reg_type == 2)
  {
    queued = (io.mb.writeHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusWriteArrayCallback) != 0);
  }

  if (!queued)
  {
    s_modbus_write_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}

END_FUNCTION_BLOCK