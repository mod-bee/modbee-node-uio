# OpenPLC Universal Function Blocks Guide
## Modbus & ModBee for Any Custom Registers

Simple, universal function blocks that work with ANY registers at ANY addresses - not limited to built-in ESP32Modbee I/O.

---

## ⚠️ CRITICAL: Configure Hardware Before Use

**You MUST configure MODBEE_HW_CONFIG.cpp before using any function blocks!**

### Open MODBEE_HW_CONFIG.cpp in OpenPLC Editor

**Edit the ESP32Modbee constructor** with your specific hardware settings:

```cpp
ESP32Modbee io(
  MBEE_REMOTE_IO,     // MODE: MB_NONE, MB_MASTER, MB_SLAVE, MB_REMOTE_IO, MBEE_REMOTE_IO
  16, 15,             // Modbus RX/TX pins (change to match your hardware)
  1,                  // Modbus ID (1-247, must be unique on network)
  18, 17,             // ModBee RX/TX pins (change to match your hardware) 
  1,                  // ModBee Node ID (1-254, must be unique on network)
  115200, SERIAL_8N1, // Modbus baud rate and config
  115200, SERIAL_8N1  // ModBee baud rate and config
);
```

### Operating Mode Reference

Choose the mode that matches your use case:

| Mode | Description | Output Control | Use Case |
|------|-------------|----------------|----------|
| **MB_NONE** | No Modbus, optional ModBee | Local control only | Standalone device |
| **MB_SLAVE** | Modbus slave, optional ModBee | Modbus master controls outputs | Industrial controller slave |
| **MB_MASTER** | Modbus master, optional ModBee | Local control only | Control other Modbus devices |
| **MB_REMOTE_IO** | Modbus remote I/O only | Modbus master controls outputs | PLC remote I/O module |
| **MBEE_REMOTE_IO** | ModBee remote I/O only | ModBee network controls outputs | Distributed I/O network |

### Operating Mode Details

#### `MB_NONE` - Standalone Mode
- **Protocols**: Modbus disabled, ModBee optional
- **Output Control**: Local OpenPLC program has full control
- **Use Case**: Standalone applications with local I/O control
- **RS485 Usage**: Both channels available for custom protocols

#### `MB_SLAVE` - Modbus Slave Mode
- **Protocols**: Modbus slave mode, ModBee optional
- **Output Control**: External Modbus master controls outputs
- **Use Case**: Standard industrial Modbus device controlled by PLC/SCADA
- **RS485 Usage**: CH1 = Modbus RTU, CH2 = ModBee or custom

#### `MB_MASTER` - Modbus Master Mode
- **Protocols**: Modbus master mode, ModBee optional
- **Output Control**: Local OpenPLC program controls outputs
- **Use Case**: Controller that commands other Modbus slave devices
- **RS485 Usage**: CH1 = Modbus RTU, CH2 = ModBee or custom

#### `MB_REMOTE_IO` - Modbus Remote I/O Mode
- **Protocols**: Modbus master mode (special remote I/O), ModBee disabled
- **Output Control**: External Modbus master has exclusive control
- **Use Case**: Remote I/O module for PLC systems
- **RS485 Usage**: CH1 = Modbus RTU for remote I/O protocol

#### `MBEE_REMOTE_IO` - ModBee Remote I/O Mode
- **Protocols**: ModBee protocol required, Modbus disabled
- **Output Control**: ModBee network has exclusive control
- **Use Case**: Distributed I/O in peer-to-peer ModBee networks
- **RS485 Usage**: Both channels used for ModBee protocol

### Output Control Priority System

**Critical**: The remote I/O modes (`MB_REMOTE_IO`, `MBEE_REMOTE_IO`) prevent conflicts by giving **exclusive control** to network protocols:

- **Remote I/O modes**: Network protocols control outputs, local OpenPLC program cannot write to outputs
- **Slave modes**: Modbus master controls outputs, local program can only read inputs
- **Local modes**: OpenPLC program has full control of outputs

This prevents multiple protocols from simultaneously controlling the same outputs.

**Key Points:**
- **Remote I/O modes** prevent output conflicts by giving one protocol exclusive control
- **ModBee can coexist with Modbus** using different serial ports (except in remote I/O modes)
- **Local I/O reading** is always available in all modes
- **Network communication** works in all modes (MB_NONE disables Modbus only)

### Optional: Configure MODBEE_CONFIG.cpp

For advanced network tuning, also edit MODBEE_CONFIG.cpp:

```cpp
// Adjust these based on your network type:
io.mbee.MODBEE_MAX_NODES = 5;     // Total nodes in your ModBee network
io.mbee.BASE_TIMEOUT = 100;       // Increase for wireless/slow networks
io.mbee.enableFailSafe = true;    // Recommended: clears I/O on communication loss
```

---

## Quick Start

### Reading Any Register
```
MODBUS_READ or MODBEE_READ block:
  SET: SLAVE_ID/NODE_ID, REG_TYPE, START_ADDR, QUANTITY
  PULSE: TRIGGER (REQ_04 for MODBEE_READ, REQ_03 for MODBUS_READ)
  GET: DONE, ERROR, COIL_OUT[], REG_OUT[]
```

### Writing Any Register
```
MODBUS_WRITE or MODBEE_WRITE block:
  SET: SLAVE_ID/NODE_ID, REG_TYPE, START_ADDR, QUANTITY
  SET: COIL_IN[] or REG_IN[] data
  PULSE: TRIGGER (REQ_05 for MODBEE_WRITE, REQ_04 for MODBUS_WRITE)
  GET: DONE, ERROR
```

### Adding Custom Registers
Edit **MODBEE_HW_CONFIG.cpp** and add your variables:

```cpp
// Add at the top (global scope)
bool my_status_flag = false;
int16_t my_setpoint = 0;

// In setup(), register them
void setup() {
  io.begin();
  
  // Register for ModBee network access
  io.mbee.addCoil(100, &my_status_flag);
  io.mbee.addHreg(101, &my_setpoint);
  
  // OR for Modbus slave access
  // io.mb.addCoil(200, my_status_flag);
  // io.mb.addHreg(201, my_setpoint);
}
```

Then use MODBEE_READ/WRITE or MODBUS_READ/WRITE to access at those addresses.

---

## Function Blocks

### MODBUS_READ
Read any Modbus registers from any slave.

**Inputs:**
- `ENABLE` - Activate block
- `SLAVE_ID` - Target slave (1-247)
- `REG_TYPE` - 0=COILS, 1=ISTS, 2=HREG, 3=IREG
- `START_ADDR` - Starting address (0-65535)
- `QUANTITY` - How many (1-125)
- `TRIGGER` - Pulse HIGH to read

**Outputs:**
- `READ_OK` - Success
- `READ_ERROR` - Failed
- `COIL_OUT[0..124]` - Boolean values
- `REG_OUT[0..124]` - Integer values

**Example:**
```
Read 4 holding registers from slave 2, starting at address 200:
  SLAVE_ID = 2
  REG_TYPE = 2 (HREG)
  START_ADDR = 200
  QUANTITY = 4
  TRIGGER = pulse
  → REG_OUT[0..3] contains the 4 values
```

---

### MODBUS_WRITE
Write any Modbus registers to any slave.

**Inputs:**
- `ENABLE` - Activate block
- `SLAVE_ID` - Target slave (1-247)
- `REG_TYPE` - 0=COILS, 2=HREG (write-only types)
- `START_ADDR` - Starting address (0-65535)
- `QUANTITY` - How many (1-125)
- `COIL_IN[0..124]` - Boolean values to write
- `REG_IN[0..124]` - Integer values to write
- `TRIGGER` - Pulse HIGH to write

**Outputs:**
- `WRITE_OK` - Success
- `WRITE_ERROR` - Failed

**Example:**
```
Write 4 coils to slave 1, starting at address 50:
  SLAVE_ID = 1
  REG_TYPE = 0 (COILS)
  START_ADDR = 50
  QUANTITY = 4
  COIL_IN[0] = TRUE
  COIL_IN[1] = FALSE
  COIL_IN[2] = TRUE
  COIL_IN[3] = FALSE
  TRIGGER = pulse
  → Remote coils 50,51,52,53 are now set
```

---

### MODBEE_READ
Read any ModBee registers from any network node.

**Inputs:**
- `REQ_04` - Activate block (pulse HIGH to trigger read)
- `NODE_ID_04` - Target node (1-254)
- `REG_TYPE_04` - 0=COILS, 1=ISTS, 2=HREG, 3=IREG
- `START_ADDR_04` - Starting address (0-65535)
- `LENGTH_04` - How many (1-8)

**Outputs:**
- `DONE_04` - Operation completed successfully
- `ERROR_04` - Operation failed
- `NODE_ONLINE_04` - Node is on network
- `COIL_01_04` - `COIL_08_04` - Boolean values
- `REG_01_04` - `REG_08_04` - Integer values

**Example:**
```
Read 2 custom holding registers from node 2, addresses 100-101:
  NODE_ID_04 = 2
  REG_TYPE_04 = 2 (HREG)
  START_ADDR_04 = 100
  LENGTH_04 = 2
  REQ_04 = pulse
  → When DONE_04 = TRUE, REG_01_04 and REG_02_04 contain the values
```

---

### MODBEE_WRITE
Write any ModBee registers to any network node.

**Inputs:**
- `REQ_05` - Activate block (pulse HIGH to trigger write)
- `NODE_ID_05` - Target node (1-254)
- `REG_TYPE_05` - 0=COILS, 2=HREG (write-only)
- `START_ADDR_05` - Starting address (0-65535)
- `LENGTH_05` - How many (1-8)
- `COIL_01_05` - `COIL_08_05` - Boolean values to write
- `REG_01_05` - `REG_08_05` - Integer values to write

**Outputs:**
- `DONE_05` - Operation completed successfully
- `ERROR_05` - Operation failed
- `NODE_ONLINE_05` - Node is online

**Example:**
```
Write custom setpoint to node 3, address 101:
  NODE_ID_05 = 3
  REG_TYPE_05 = 2 (HREG)
  START_ADDR_05 = 101
  LENGTH_05 = 1
  REG_01_05 = 5000 (your setpoint)
  REQ_05 = pulse
  → When DONE_05 = TRUE, node 3's register at address 101 is updated
```

---

## Setup: Registering Custom Registers

The **MODBEE_HW_CONFIG.cpp** block is where you declare and register your custom variables.

### ⚠️ IMPORTANT: Configure Hardware First

**Before adding custom registers, you MUST edit MODBEE_HW_CONFIG.cpp** to set your correct:
- Serial pins (modbusRx/Tx, modbeeRx/Tx)
- Node IDs (modbusId, modbeeId) 
- Operating mode (MBEE_REMOTE_IO, etc.)
- Baud rates and serial configurations

The default values in the function block template will not work with your hardware!

### Step 1: Declare Global Variables

```cpp
// At the top of MODBEE_CONFIG.cpp (inside the file)
bool custom_flag = false;
int16_t custom_value = 0;
bool another_flag = false;
```

### Step 2: Register in setup()

```cpp
void setup() {
  io.begin();
  
  // For ModBee network access
  io.mbee.addCoil(100, &custom_flag);     // Address 100
  io.mbee.addHreg(101, &custom_value);    // Address 101
  io.mbee.addCoil(102, &another_flag);    // Address 102
  
  // For Modbus slave access (if using MB_SLAVE mode)
  // io.mb.addCoil(200, custom_flag);
  // io.mb.addHreg(201, custom_value);
}
```

### Step 3: Access via Blocks

Now other nodes can read/write your registers:

```
MODBEE_READ:
  NODE_ID_04 = your node ID
  REG_TYPE_04 = 0 for coils, 2 for hregs
  START_ADDR_04 = 100, 101, 102, etc.
  LENGTH_04 = how many to read
  REQ_04 = pulse to trigger

MODBEE_WRITE:
  NODE_ID_05 = your node ID
  REG_TYPE_05 = 0 for coils, 2 for hregs
  START_ADDR_05 = 100, 101, 102, etc.
  LENGTH_05 = how many to write
  COIL_01_05/REG_01_05 = values to write
  REQ_05 = pulse to trigger
```

---

## Complete Example: Two-Node Mirror

**Node 1 Setup (MODBEE_HW_CONFIG.cpp):**
```cpp
bool node1_status = false;
int16_t node1_setpoint = 0;

void setup() {
  io.begin();
  io.mbee.addCoil(10, &node1_status);
  io.mbee.addHreg(11, &node1_setpoint);
}
```

**Node 2 PLC Program:**
```
Read node 1's status:
  FB: MODBEE_READ
  NODE_ID_04 = 1
  REG_TYPE_04 = 0 (COILS)
  START_ADDR_04 = 10
  LENGTH_04 = 1
  REQ_04 = tick_every_100ms
  → When DONE_04 = TRUE, COIL_01_04 contains node1_status

Write to node 1's setpoint:
  FB: MODBEE_WRITE
  NODE_ID_05 = 1
  REG_TYPE_05 = 2 (HREG)
  START_ADDR_05 = 11
  LENGTH_05 = 1
  REG_01_05 = my_local_setpoint
  REQ_05 = on_change
  → When DONE_05 = TRUE, node 1's setpoint is updated
```

---

## Register Type Reference

| Type | Code | Direction | Description |
|------|------|-----------|-------------|
| COILS | 0 | Read/Write | Digital outputs |
| INPUT STATUS | 1 | Read-only | Digital inputs |
| HOLDING REG | 2 | Read/Write | Integer values (analog out, settings) |
| INPUT REG | 3 | Read-only | Integer values (analog in, sensors) |

---

## Tips

1. **Start Small**: Test with 1-2 registers before adding many
2. **Unique Addresses**: Don't overlap register addresses
3. **Data Types**: Coils/ISTS = boolean, HREG/IREG = signed 16-bit int (-32768 to 32767)
4. **Polling Rate**: Don't read too frequently (100-500ms typical)
5. **Reserved Ranges**: The ESP32Modbee built-in I/O uses specific addresses - document your custom ranges separately

---

## Troubleshooting

**"It doesn't work at all":**
- **Did you configure MODBEE_HW_CONFIG.cpp?** This is the most common issue. The default pin assignments, IDs, and modes will not work with your hardware. Open the function block in OpenPLC Editor and edit the ESP32Modbee constructor parameters.

**ERROR_04 on MODBEE_READ:**
- Check NODE_ID_04 is correct and target node exists
- Verify network connection and NODE_ONLINE_04 status
- Ensure register addresses are actually registered on target node
- Check LENGTH_04 doesn't exceed available registers (max 8)
- Wait for DONE_04 = TRUE before using results

**ERROR_05 on MODBEE_WRITE:**
- Check NODE_ID_05 is correct and target node exists
- Verify network connection and NODE_ONLINE_05 status
- For MODBEE, ensure NODE_ONLINE_05 is TRUE before writing
- Ensure addresses are registered for writing on target node
- Check LENGTH_05 doesn't exceed 8 elements

**NODE_ONLINE_04/NODE_ONLINE_05 is FALSE:**
- Wait a few seconds for network discovery after startup
- Check RS485 connections and termination
- Verify both nodes have io.begin() called in MODBEE_HW_CONFIG
- Check node IDs are unique and within valid range (1-254)

