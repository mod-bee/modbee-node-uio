FUNCTION_BLOCK MODBUS_WRITE
VAR_INPUT
	REQ : bool;
	SLAVE_ID : byte;
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
END_VAR
/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_WRITE (Multi-element, up to 8)
 *
 *  Writes multiple values to Modbus slave from scalar inputs
 *  LENGTH specifies element count (1-8)
 *  
 *  PROPER STATE MACHINE:
 *  1. REQ rise: Queue write operation
 *  2. Wait: Monitor with 1000ms timeout
 *  3. Complete: Mark done (success/timeout)
 *  4. REQ fall: Reset all flags
 *  
 *  INVARIANT: DONE=true ONLY means operation finished (success or timeout)
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

// Shared Modbus transaction manager (see MODBUS_READ.cpp)
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

  bool coil_buffer[MAX_ELEMENTS];
  uint16_t hreg_buffer[MAX_ELEMENTS];
} ModbusWriteCtx;

static ModbusWriteCtx s_modbus_write_ctx[MAX_INSTANCES];
static volatile ModbusWriteCtx *s_modbus_write_active = nullptr;

static ModbusWriteCtx *get_modbus_write_ctx(MODBUS_WRITE_VARS *vars)
{
  // IMPORTANT: `vars` is a stack-local struct in OpenPLC's generated code, so
  // `vars` (and its address) is NOT stable across scan cycles.
  // The pointers inside `vars` *are* stable (they point into the FB instance).
  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.
  // So `vars->REQ` will get macro-expanded and break compilation.
  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbus_write_ctx[i].in_use && s_modbus_write_ctx[i].key == key)
      return &s_modbus_write_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbus_write_ctx[i].in_use)
    {
      s_modbus_write_ctx[i].in_use = true;
      s_modbus_write_ctx[i].key = key;
      s_modbus_write_ctx[i].last_req = false;
      s_modbus_write_ctx[i].started = false;
      s_modbus_write_ctx[i].queued = false;
      s_modbus_write_ctx[i].completed = false;
      s_modbus_write_ctx[i].success = false;
      s_modbus_write_ctx[i].reg_type = 0xFF;
      s_modbus_write_ctx[i].len = 0;
      s_modbus_write_ctx[i].slave_id = 0;
      s_modbus_write_ctx[i].start_addr = 0;
      return &s_modbus_write_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_write_ctx(ModbusWriteCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusWriteCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusWriteCtx *ctx = (ModbusWriteCtx *)s_modbus_write_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_write_active = nullptr;
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
  ModbusWriteCtx *ctx = get_modbus_write_ctx(vars);
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
    reset_modbus_write_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_write_active == ctx)
      s_modbus_write_active = nullptr;
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
    if (len == 0 || len > MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_ctx(ctx);
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

    // Build persistent buffers for the async write
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
    else if (ctx->reg_type == 2)
    {
      ctx->hreg_buffer[0] = (len > 0) ? (uint16_t)REG_01 : 0;
      ctx->hreg_buffer[1] = (len > 1) ? (uint16_t)REG_02 : 0;
      ctx->hreg_buffer[2] = (len > 2) ? (uint16_t)REG_03 : 0;
      ctx->hreg_buffer[3] = (len > 3) ? (uint16_t)REG_04 : 0;
      ctx->hreg_buffer[4] = (len > 4) ? (uint16_t)REG_05 : 0;
      ctx->hreg_buffer[5] = (len > 5) ? (uint16_t)REG_06 : 0;
      ctx->hreg_buffer[6] = (len > 6) ? (uint16_t)REG_07 : 0;
      ctx->hreg_buffer[7] = (len > 7) ? (uint16_t)REG_08 : 0;
    }
    else
    {
      ERROR = true;
      DONE = true;
      reset_modbus_write_ctx(ctx);
      return;
    }
  }

  if (!REQ || DONE)
    return;

  // If queued, wait for callback to mark completion
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

  // Not queued yet: try to claim and queue. Busy means retry next scan.
  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_write_active = ctx;
  bool queued = false;
  if (ctx->reg_type == 0)
  {
    queued = (io.mb.writeCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusWriteCallback) != 0);
  }
  else if (ctx->reg_type == 2)
  {
    queued = (io.mb.writeHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusWriteCallback) != 0);
  }

  if (!queued)
  {
    s_modbus_write_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}

END_FUNCTION_BLOCK