FUNCTION_BLOCK MODBUS_READ_ARRAY
VAR_INPUT
	REQ : bool;
	SLAVE_ID : byte;
	REG_TYPE : byte;
	START_ADDR : word;
	LENGTH : byte;
END_VAR

VAR_OUTPUT
	DONE : bool;
	ERROR : bool;
	COILS : ARRAY [0..31] OF bool;
	REGS : ARRAY [0..31] OF int;
END_VAR
/* ================================================================
 *  C/C++ FUNCTION BLOCK - MODBUS_READ_ARRAY (Multi-element, up to 32)
 *
 *  Reads multiple values from Modbus slave with array outputs.
 *  LENGTH specifies element count (1-32)
 *
 *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:
 *  1. REQ rise: Start async read with callback
 *  2. Wait: Callback sets completion flag when response received
 *  3. Complete: Copy results when callback indicates success
 *  4. REQ fall: Reset all flags
 *
 *  NOTE: MODBUS_* blocks use a shared one-transaction-at-a-time manager.
 * ================================================================ */

#include <stdint.h>
#include <stdbool.h>

#include <ESP32Modbee.h>
extern ESP32Modbee io;

#define MODBUS_READ_ARRAY_MAX_ELEMENTS 32
#define MODBUS_READ_ARRAY_MAX_INSTANCES 16

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

  bool coil_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
  bool ists_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
  uint16_t hreg_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
  uint16_t ireg_buffer[MODBUS_READ_ARRAY_MAX_ELEMENTS];
} ModbusReadArrayCtx;

static ModbusReadArrayCtx s_modbus_read_array_ctx[MODBUS_READ_ARRAY_MAX_INSTANCES];
static volatile ModbusReadArrayCtx *s_modbus_read_array_active = nullptr;

static ModbusReadArrayCtx *get_modbus_read_array_ctx(MODBUS_READ_ARRAY_VARS *vars)
{
  // `&REQ` expands to stable per-instance storage pointer.
  void *key = (void *)&REQ;

  for (int i = 0; i < MODBUS_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (s_modbus_read_array_ctx[i].in_use && s_modbus_read_array_ctx[i].key == key)
      return &s_modbus_read_array_ctx[i];
  }
  for (int i = 0; i < MODBUS_READ_ARRAY_MAX_INSTANCES; i++)
  {
    if (!s_modbus_read_array_ctx[i].in_use)
    {
      s_modbus_read_array_ctx[i].in_use = true;
      s_modbus_read_array_ctx[i].key = key;
      s_modbus_read_array_ctx[i].last_req = false;
      s_modbus_read_array_ctx[i].started = false;
      s_modbus_read_array_ctx[i].queued = false;
      s_modbus_read_array_ctx[i].completed = false;
      s_modbus_read_array_ctx[i].success = false;
      s_modbus_read_array_ctx[i].reg_type = 0xFF;
      s_modbus_read_array_ctx[i].len = 0;
      s_modbus_read_array_ctx[i].slave_id = 0;
      s_modbus_read_array_ctx[i].start_addr = 0;
      return &s_modbus_read_array_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_read_array_ctx(ModbusReadArrayCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusReadArrayCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusReadArrayCtx *ctx = (ModbusReadArrayCtx *)s_modbus_read_array_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_read_array_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

static inline uint8_t *modbus_read_array_coils_ptr(MODBUS_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (uint8_t *)COILS;
}

static inline int16_t *modbus_read_array_regs_ptr(MODBUS_READ_ARRAY_VARS *vars)
{
  (void)vars;
  return (int16_t *)REGS;
}

static inline void modbus_read_array_clear_outputs(MODBUS_READ_ARRAY_VARS *vars)
{
  uint8_t *coils = modbus_read_array_coils_ptr(vars);
  int16_t *regs = modbus_read_array_regs_ptr(vars);
  for (uint8_t i = 0; i < MODBUS_READ_ARRAY_MAX_ELEMENTS; i++)
  {
    coils[i] = 0;
    regs[i] = 0;
  }
}

static inline void modbus_read_array_copy_results(MODBUS_READ_ARRAY_VARS *vars, const ModbusReadArrayCtx *ctx)
{
  if (!ctx)
    return;

  modbus_read_array_clear_outputs(vars);
  const uint8_t len = ctx->len;
  uint8_t *coils = modbus_read_array_coils_ptr(vars);
  int16_t *regs = modbus_read_array_regs_ptr(vars);
  switch (ctx->reg_type)
  {
  case 0: // COILS
    for (uint8_t i = 0; i < len; i++)
      coils[i] = ctx->coil_buffer[i] ? 1 : 0;
    break;
  case 1: // INPUT STATUS
    for (uint8_t i = 0; i < len; i++)
      coils[i] = ctx->ists_buffer[i] ? 1 : 0;
    break;
  case 2: // HOLDING REGISTERS
    for (uint8_t i = 0; i < len; i++)
      regs[i] = (int16_t)ctx->hreg_buffer[i];
    break;
  case 3: // INPUT REGISTERS
    for (uint8_t i = 0; i < len; i++)
      regs[i] = (int16_t)ctx->ireg_buffer[i];
    break;
  default:
    break;
  }
}

void setup()
{
  DONE = false;
  ERROR = false;
  modbus_read_array_clear_outputs(vars);
}

void loop()
{
  ModbusReadArrayCtx *ctx = get_modbus_read_array_ctx(vars);
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
    reset_modbus_read_array_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_read_array_active == ctx)
      s_modbus_read_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters
  if (REQ && !ctx->last_req)
  {
    ctx->last_req = true;
    DONE = false;
    ERROR = false;
    modbus_read_array_clear_outputs(vars);

    const uint8_t len = (uint8_t)LENGTH;
    if (len == 0 || len > MODBUS_READ_ARRAY_MAX_ELEMENTS)
    {
      ERROR = true;
      DONE = true;
      reset_modbus_read_array_ctx(ctx);
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
      if (!ERROR)
        modbus_read_array_copy_results(vars, ctx);
    }
    return;
  }

  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_read_array_active = ctx;
  bool queued = false;
  switch (ctx->reg_type)
  {
  case 0:
    queued = (io.mb.readCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  case 1:
    queued = (io.mb.readIsts(ctx->slave_id, ctx->start_addr, ctx->ists_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  case 2:
    queued = (io.mb.readHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  case 3:
    queued = (io.mb.readIreg(ctx->slave_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, modbusReadArrayCallback) != 0);
    break;
  default:
    break;
  }

  if (!queued)
  {
    s_modbus_read_array_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}

END_FUNCTION_BLOCK