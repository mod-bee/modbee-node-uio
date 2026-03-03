FUNCTION_BLOCK MODBUS_READ
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
 *  C/C++ FUNCTION BLOCK - MODBUS_READ (Multi-element, up to 8)
 *
 *  Reads multiple values from Modbus slave with scalar outputs
 *  LENGTH specifies element count (1-8)
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

#define MAX_ELEMENTS 8
#define MAX_INSTANCES 16

// -----------------------------------------------------------------------------
// Shared "one transaction at a time" manager
// NOTE: The underlying ModbusRTU stack cannot safely run multiple in-flight
// requests when different FB instances are issuing async transactions.
// -----------------------------------------------------------------------------
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
  bool ists_buffer[MAX_ELEMENTS];
  uint16_t hreg_buffer[MAX_ELEMENTS];
  uint16_t ireg_buffer[MAX_ELEMENTS];
} ModbusReadCtx;

static ModbusReadCtx s_modbus_read_ctx[MAX_INSTANCES];
static volatile ModbusReadCtx *s_modbus_read_active = nullptr;

static ModbusReadCtx *get_modbus_read_ctx(MODBUS_READ_VARS *vars)
{
  // IMPORTANT: `vars` itself is a stack-local struct in OpenPLC's generated code,
  // so `vars` (and its address) is NOT stable across scan cycles.
  // The pointers inside `vars` *are* stable (they point into the FB instance).
  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.
  // So `vars->REQ` will get macro-expanded and break compilation.
  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).
  void *key = (void *)&REQ;

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (s_modbus_read_ctx[i].in_use && s_modbus_read_ctx[i].key == key)
      return &s_modbus_read_ctx[i];
  }
  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    if (!s_modbus_read_ctx[i].in_use)
    {
      s_modbus_read_ctx[i].in_use = true;
      s_modbus_read_ctx[i].key = key;
      s_modbus_read_ctx[i].last_req = false;
      s_modbus_read_ctx[i].started = false;
      s_modbus_read_ctx[i].queued = false;
      s_modbus_read_ctx[i].completed = false;
      s_modbus_read_ctx[i].success = false;
      s_modbus_read_ctx[i].reg_type = 0xFF;
      s_modbus_read_ctx[i].len = 0;
      s_modbus_read_ctx[i].slave_id = 0;
      s_modbus_read_ctx[i].start_addr = 0;
      return &s_modbus_read_ctx[i];
    }
  }
  return nullptr;
}

static void reset_modbus_read_ctx(ModbusReadCtx *ctx)
{
  ctx->started = false;
  ctx->queued = false;
  ctx->completed = false;
  ctx->success = false;
  ctx->reg_type = 0xFF;
  ctx->len = 0;
}

bool modbusReadCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)
{
  (void)transactionId;
  (void)data;

  ModbusReadCtx *ctx = (ModbusReadCtx *)s_modbus_read_active;
  if (ctx)
  {
    ctx->completed = true;
    ctx->success = (event == Modbus::EX_SUCCESS);
    s_modbus_read_active = nullptr;
    modbee_mb_release(ctx);
  }
  return true;
}

static inline void copy_read_results(MODBUS_READ_VARS *vars, const ModbusReadCtx *ctx)
{
  // OpenPLC generates access macros like `#define COIL_01 (*(vars->COIL_01))`.
  // Those macros require a local variable named `vars` in scope.
  if (!vars || !ctx)
    return;

  const uint8_t len = ctx->len;
  switch (ctx->reg_type)
  {
  case 0: // COILS
    COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;
    COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;
    COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;
    COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;
    COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;
    COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;
    COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;
    COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;
    break;
  case 1: // INPUT STATUS
    COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;
    COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;
    COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;
    COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;
    COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;
    COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;
    COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;
    COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;
    break;
  case 2: // HOLDING REGISTERS
    REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;
    REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;
    REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;
    REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;
    REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;
    REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;
    REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;
    REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;
    break;
  case 3: // INPUT REGISTERS
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

void setup()
{
  DONE = false;
  ERROR = false;
}

void loop()
{
  ModbusReadCtx *ctx = get_modbus_read_ctx(vars);
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
    reset_modbus_read_ctx(ctx);
    DONE = false;
    ERROR = false;
    if (s_modbus_read_active == ctx)
      s_modbus_read_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  // REQ rising edge: latch parameters, begin operation
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
      reset_modbus_read_ctx(ctx);
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

  // Nothing to do unless we're in an active request cycle
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
      if (!ERROR)
        copy_read_results(vars, ctx);
    }
    return;
  }

  // Not queued yet: try to claim the Modbus stack and queue the transaction.
  // If the stack is busy, we just retry on the next scan (no error).
  if (!ctx->started)
    return;

  if (!modbee_mb_claim(ctx))
    return;

  s_modbus_read_active = ctx;
  bool queued = false;
  switch (ctx->reg_type)
  {
  case 0: // COILS
    queued = (io.mb.readCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  case 1: // INPUT STATUS
    queued = (io.mb.readIsts(ctx->slave_id, ctx->start_addr, ctx->ists_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  case 2: // HOLDING REGISTERS
    queued = (io.mb.readHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  case 3: // INPUT REGISTERS
    queued = (io.mb.readIreg(ctx->slave_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, modbusReadCallback) != 0);
    break;
  default:
    break;
  }

  if (!queued)
  {
    s_modbus_read_active = nullptr;
    modbee_mb_release(ctx);
    return;
  }

  ctx->queued = true;
}

END_FUNCTION_BLOCK