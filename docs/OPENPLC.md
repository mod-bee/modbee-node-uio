# OpenPLC Integration Guide

ModBee Node-UIO integrates seamlessly with **openPLC**, an open-source industrial automation framework. This guide shows how to use ModBee Node-UIO as a IOT PLC controller.

## Prerequisites

### Required Software
- **openPLC Editor v4** - Download from: https://github.com/Autonomy-Logic/openplc-editor/releases
  - Must be v4 or later for ESP32-S3 support
- **ModBee Libraries** - Download the library zip from: https://github.com/mod-bee/modbee-libraries

### Required Hardware
- **ModBee Node-UIO device** with ESP32-S3
- **USB C cable** for uploading firmware to the device

## ⚠️ CRITICAL: Configure Function Blocks Before Use

**You MUST customize the function blocks before compiling and uploading to your device!**

### Step 1: Configure MODBEE_HW_CONFIG Block

1. **Open MODBEE_HW_CONFIG.cpp** in OpenPLC Editor
2. **Edit the ESP32Modbee constructor parameters** to match your hardware:

```cpp
ESP32Modbee io(
  MBEE_REMOTE_IO,     // CHANGE THIS: mode - MB_NONE, MB_MASTER, MB_SLAVE, MB_REMOTE_IO, MBEE_REMOTE_IO
  16, 15,             // CHANGE THESE: modbusRxPin, modbusTxPin (your hardware pins)
  1,                  // CHANGE THIS: modbusId (1-247, unique on Modbus network)
  18, 17,             // CHANGE THESE: modbeeRxPin, modbeeTxPin (your hardware pins)
  1,                  // CHANGE THIS: modbeeId (1-254, unique on ModBee network)
  115200, SERIAL_8N1, // CHANGE THESE: baudrate1, serialConfig1 (Modbus serial settings)
  115200, SERIAL_8N1  // CHANGE THESE: baudrate2, serialConfig2 (ModBee serial settings)
);
```

**Common Configurations:**
- **MBEE_REMOTE_IO**: Full I/O + network node (most common) - allows ModBee protocol to control outputs
- **MB_MASTER**: Modbus master only - can control other Modbus devices
- **MB_SLAVE**: Modbus slave only - can be controlled by Modbus master
- **MB_REMOTE_IO**: Remote I/O for Modbus - allows Modbus master to control this node's outputs
- **MB_NONE**: No Modbus, ModBee only - cannot be controlled as remote I/O node

### Operating Mode Details

The mode parameter determines **who controls the node's outputs** and prevents conflicts:

| Mode | Modbus | ModBee | Output Control | Use Case |
|------|--------|--------|----------------|----------|
| **MB_NONE** | ❌ Disabled | ✅ Optional | Local OpenPLC program | Standalone device |
| **MB_SLAVE** | ✅ Slave mode | ✅ Optional | Modbus master | Industrial controller slave |
| **MB_MASTER** | ✅ Master mode | ✅ Optional | Local OpenPLC program | Control other Modbus devices |
| **MB_REMOTE_IO** | ✅ Remote I/O | ❌ Disabled | Modbus master | PLC remote I/O module |
| **MBEE_REMOTE_IO** | ❌ Disabled | ✅ Required | ModBee network | Distributed I/O network |

#### Output Control Priority System

**Critical**: The ModBee Node-UIO implements a **priority system** to prevent multiple protocols from controlling outputs simultaneously:

1. **Remote I/O modes** (`MB_REMOTE_IO`, `MBEE_REMOTE_IO`): Network protocols have **exclusive control** of outputs
2. **Slave modes** (`MB_SLAVE`): Modbus master has control, local OpenPLC program can only read inputs
3. **Local modes** (`MB_NONE`, `MB_MASTER`): Local OpenPLC program has full control

**This prevents conflicts where:**
- A Modbus master tries to control outputs while local OpenPLC code also writes to them
- ModBee network and Modbus both try to control the same outputs
- Multiple masters fight for control of the same device

#### Mode Selection Guide

| Application | Recommended Mode | Why |
|-------------|------------------|-----|
| Standalone sensor/logger | `MB_NONE` | Local control only, no network conflicts |
| PLC controlled device | `MB_SLAVE` | Standard Modbus slave for industrial control |
| Device controller/gateway | `MB_MASTER` | Controls other devices, local output control |
| PLC remote I/O module | `MB_REMOTE_IO` | Modbus master controls outputs exclusively |
| Distributed I/O network | `MBEE_REMOTE_IO` | ModBee network controls outputs exclusively |

**Important Notes:**
- **Remote I/O modes** prevent multiple protocols from controlling outputs simultaneously
- **ModBee can run alongside Modbus** as long as they use different serial ports (except in remote I/O modes)
- **Local I/O reading** is always available in all modes
- **Network communication** works regardless of mode (MB_NONE disables Modbus only)

### Step 2: Configure MODBEE_CONFIG Block (Optional but Recommended)

1. **Open MODBEE_CONFIG.cpp** in OpenPLC Editor
2. **Adjust network parameters** based on your network type:

```cpp
// For wired RS485 networks (default):
io.mbee.MODBEE_MAX_NODES = 5;     // Number of nodes in your network
io.mbee.BASE_TIMEOUT = 100;       // 100ms for 115200 baud

// For wireless networks (LoRa, radio):
io.mbee.MODBEE_MAX_NODES = 3;     // Fewer nodes for wireless
io.mbee.BASE_TIMEOUT = 500;       // Longer timeout for wireless latency
io.mbee.MODBEE_INTERFRAME_GAP_US = 10000; // 10ms gap for wireless

// Enable fail-safe mode (recommended)
io.mbee.enableFailSafe = true;
```

**Network Type Guidelines:**
- **RS485 wired**: Default settings work well
- **Wireless/LoRa**: Increase timeouts, reduce max nodes
- **Large networks**: Increase MODBEE_MAX_NODES, may need slower baud rates

### Step 3: Verify Your Changes

- **Double-check pin assignments** match your hardware
- **Ensure unique IDs** on your network (no duplicate node/modbus IDs)
- **Test serial settings** match your devices
- **Save and recompile** after making changes

## Installation

### Step 1: Install openPLC Editor v4

Install openPLC Editor first, as it creates the necessary Arduino CLI configuration and library directories.

1. Download openPLC Editor v4 from: https://github.com/Autonomy-Logic/openplc-editor/releases
2. Extract and install the application
3. This creates the Arduino library directory structure used by Arduino CLI:
   - **Windows**: Creates `Documents\Arduino\libraries\`
   - **macOS**: Creates `~/Documents/Arduino/libraries/`
   - **Linux**: Creates `~/Arduino/libraries/`

> **Note**: If the library directory is not created automatically by openPLC Editor installation, you can create it manually in the locations above.

### Step 2: Install ModBee Libraries

Add the ModBee libraries to your Arduino libraries directory:

1. Download the library zip from: https://github.com/mod-bee/modbee-libraries
2. Extract the contents into your Arduino libraries directory:
   - **Windows**: `Documents\Arduino\libraries\`
   - **macOS**: `~/Documents/Arduino/libraries/`
   - **Linux**: `~/Arduino/libraries/`

3. openPLC Editor will automatically find these libraries when compiling

### Step 3: Access ModBee Function Blocks

The ModBee Node-UIO provides pre-built function blocks for openPLC:

**Location**: `openPLC/function-blocks/`

Available function blocks:
- **MODBEE_HW_CONFIG** - Initialize hardware I/O system with ESP32Modbee
- **MODBEE_HW_INPUTS** - Read all digital (DX01-DX08) and analog (AX01_Scaled-AX04_Scaled) inputs
- **MODBEE_HW_OUTPUTS** - Write all digital (DY01-DY08) and analog (AY01_Scaled-AY02_Scaled) outputs
- **MODBEE_READ** - Read any registers from ModBee network nodes (universal)
- **MODBEE_WRITE** - Write any registers to ModBee network nodes (universal)
- **MODBUS_READ** - Read any registers from Modbus slaves (universal)
- **MODBUS_WRITE** - Write any registers to Modbus slaves (universal)
- **MODBEE_ADD_REGISTER** - Register custom variables for ModBee network access
- **MODBUS_ADD_REGISTER** - Register custom variables for Modbus slave access

These function blocks are available in the Modbee-Example project and can be copied into your own projects. They are implemented as C/C++ function blocks that run synchronously with the PLC runtime.

## Setup Options

### Option 1: Use Modbee-Example Project (Recommended)

The simplest way to get started is using the pre-configured test project.

1. **Load the project**:
   - In openPLC Editor: **File** → **Open Project**
   - Navigate to: `openPLC/projects/Modbee-Example/`
   - Open the project

2. **Configure device settings**:
   - Go to **Device and Configuration**
   - Select **ESP32S3** as the board type
   - Configure serial port and other settings as needed

3. **Add libraries** (if not already referenced):
   - Libraries should be in your Arduino libraries directory
   - openPLC will detect them automatically during compilation

4. **Generate and compile**:
   - Click **Generate Code** (PLC → Generate Code)
   - This uses Arduino CLI to compile for ESP32-S3
   - Upload the generated firmware to ModBee Node-UIO via USB

**What Modbee-Example contains**:
- Pre-configured MODBEE_HW_CONFIG block for hardware initialization
- MODBEE_HW_INPUTS and MODBEE_HW_OUTPUTS blocks for direct hardware I/O access
- MODBEE_READ and MODBEE_WRITE blocks for network communication
- Recommended task organization with proper execution order
- Ready-to-use logic structure for hardware control

### Option 2: Add Function Blocks to Your Project

If you have an existing openPLC project, you can add ModBee function blocks:

1. **Copy function blocks** from the repository:
   - Copy all `MODBEE_*.cpp` files from `openPLC/function-blocks/`
   - Paste them into your project's **POUS** folder under **function-blocks**

2. **Create two tasks in Resources**:

   **Task 1: MODBEE_HW_CONFIG (1ms cycle)**
   - In openPLC Editor: **Resources** → Create new task
   - Set **Period**: 1ms
   - Assign **Program/Function Block**: MODBEE_HW_CONFIG
   - This initializes the hardware I/O system and network communication

   **Task 2: MAIN or your control program (20ms cycle)**
   - Create your application logic
   - Add instances of MODBEE_HW_INPUTS and MODBEE_HW_OUTPUTS for hardware I/O
   - Add MODBEE_READ/MODBEE_WRITE blocks for network communication
   - Call MODBEE_HW_INPUTS at the beginning to read fresh sensor data
   - Set output variables and call MODBEE_HW_OUTPUTS at the end
   - Set **Execution Order**: Run after MODBEE_HW_CONFIG task

3. **Wire your logic**:
   - Use outputs from MODBEE_HW_INPUTS (DX01-DX08, AX01_Scaled-AX04_Scaled) in your control logic
   - Set inputs to MODBEE_HW_OUTPUTS (DY01-DY08, AY01_Scaled-AY02_Scaled) based on your logic
   - Use MODBEE_READ/MODBEE_WRITE for communication with other network nodes

## Configuration Details

### Device Configuration

In openPLC Editor **Device and Configuration**:

1. **Board Selection**:
   - Select: **ESP32S3** (ensures correct GPIO/serial mapping)

2. **Serial Configuration**:
   - Set **Serial Port** to the COM port where ModBee Node-UIO is connected (USB)
   - Set **Baud Rate**: 115200 (default for ModBee Node-UIO)

3. **Library Dependencies**:
   - Ensure ModBee libraries are in your Arduino libraries directory
   - openPLC will automatically include them during compilation

### Function Block Details

#### MODBEE_HW_CONFIG
- Initializes the complete ESP32Modbee hardware I/O system
- Runs continuously in a dedicated task (1ms cycle recommended)
- Handles all hardware initialization, Modbus communication, and ModBee network management
- Must be instantiated once per project and run before other MODBEE_HW_* blocks

#### MODBEE_HW_INPUTS
- **Outputs**:
  - `DX01` - `DX08` (bool) - Digital inputs 1-8
  - `AX01_Scaled` - `AX04_Scaled` (real) - Analog inputs 1-4 (mV or mA)

#### MODBEE_HW_OUTPUTS
- **Inputs**:
  - `DY01` - `DY08` (bool) - Digital outputs 1-8
  - `AY01_Scaled` - `AY02_Scaled` (real) - Analog outputs 1-2 (mV or mA)

#### MODBEE_READ
- **Inputs**:
  - `REQ_04` (bool) - Trigger read operation (rising edge)
  - `NODE_ID_04` (byte) - Target ModBee node ID (1-254)
  - `REG_TYPE_04` (byte) - Register type (0=COILS, 1=ISTS, 2=HREG, 3=IREG)
  - `START_ADDR_04` (word) - Starting register address
  - `LENGTH_04` (byte) - Number of registers to read (1-8)
- **Outputs**:
  - `DONE_04` (bool) - Operation completed successfully
  - `ERROR_04` (bool) - Operation failed
  - `NODE_ONLINE_04` (bool) - Target node is online
  - `COIL_01_04` - `COIL_08_04` (bool) - Boolean register values
  - `REG_01_04` - `REG_08_04` (int) - Integer register values

#### MODBEE_WRITE
- **Inputs**:
  - `REQ_05` (bool) - Trigger write operation (rising edge)
  - `NODE_ID_05` (byte) - Target ModBee node ID (1-254)
  - `REG_TYPE_05` (byte) - Register type (0=COILS, 2=HREG)
  - `START_ADDR_05` (word) - Starting register address
  - `LENGTH_05` (byte) - Number of registers to write (1-8)
  - `COIL_01_05` - `COIL_08_05` (bool) - Boolean values to write
  - `REG_01_05` - `REG_08_05` (int) - Integer values to write
- **Outputs**:
  - `DONE_05` (bool) - Operation completed successfully
  - `ERROR_05` (bool) - Operation failed
  - `NODE_ONLINE_05` (bool) - Target node is online

### Data Range Reference

| Channel | Type | Range | Unit | Variable Name |
|---------|------|-------|------|---------------|
| Digital Input 1-8 | bool | 0-1 | - | DX01-DX08 |
| Analog Input 1-4 | real | 0-10000 | mV (voltage mode) | AX01_Scaled-AX04_Scaled |
| Analog Input 1-4 | real | 0-20000 | µA (current mode) | AX01_Scaled-AX04_Scaled |
| Digital Output 1-8 | bool | 0-1 | - | DY01-DY08 |
| Analog Output 1-2 | real | 0-10000 | mV (voltage mode) | AY01_Scaled-AY02_Scaled |
| Analog Output 1-2 | real | 0-20000 | µA (current mode) | AY01_Scaled-AY02_Scaled |

## Customizing Function Blocks

### Editing MODBEE_CONFIG for Extended Functionality

The MODBEE_CONFIG function block can be customized directly in openPLC Editor. You can:

- Add initialization logic beyond the default setup
- Implement watchdog timers or health monitoring
- Add custom error handling
- Configure additional ModBee parameters
- Access the full ModBee API for advanced features

Refer to the [SOFTWARE.md](../docs/SOFTWARE.md) and [API_REFERENCE.md](../docs/API_REFERENCE.md) documentation for complete ModBee API details.

### Creating Custom Function Blocks

You're not limited to the pre-built blocks. You can create your own function blocks to:

- Implement custom control logic
- Access additional ModBee API functions
- Create specialized input/output processing
- Develop application-specific behavior

All ModBee Node-UIO C++ APIs are available within custom function blocks. Reference the project library headers and [SOFTWARE.md](../docs/SOFTWARE.md) for the complete API surface.

## Programming Guidelines

### Execution Order

The task execution order is essential for reliable operation:

1. **MODBEE_HW_CONFIG Task (1ms period)**
   - Runs continuously to maintain hardware I/O and network communication
   - Must complete before other tasks

2. **Your Main Program Task (20ms typical)**
   - Call MODBEE_HW_INPUTS at the beginning to read fresh sensor data
   - Execute your control logic using DX01-DX08 and AX01_Scaled-AX04_Scaled inputs
   - Set output variables (DY01-DY08, AY01_Scaled-AY02_Scaled)
   - Call MODBEE_HW_OUTPUTS at the end to write commands to hardware
   - Use MODBEE_READ/MODBEE_WRITE blocks for network communication as needed

## Troubleshooting

### Configuration Issues

1. **"Nothing works at all":**
   - **Did you configure MODBEE_HW_CONFIG.cpp?** This is the most critical step. Open the function block in OpenPLC Editor and edit the ESP32Modbee constructor parameters (pins, IDs, modes, baud rates) to match your hardware.
   - Check that your pin assignments match your actual hardware connections
   - Verify node IDs are unique on your network (no duplicates)

2. **Network communication fails:**
   - Check MODBEE_CONFIG.cpp settings match your network type (wired RS485 vs wireless)
   - For wireless networks, increase BASE_TIMEOUT and reduce MODBEE_MAX_NODES
   - Verify RS485 termination and bias resistors are properly installed

### Code Generation Issues

1. **Compilation fails**:
   - Verify ModBee libraries are in your Arduino libraries directory
   - Check that Arduino CLI can find the libraries during build
   - Ensure ESP32-S3 board support is available in Arduino CLI

2. **Upload fails**:
   - Verify USB cable is connected to ModBee Node-UIO
   - Check that serial port is correctly selected in Device and Configuration
   - Ensure no other application is using the serial port
   - Try a different USB cable or port

### Function Block Not Running

- Verify MODBEE_HW_CONFIG task is set to 1ms period
- Check task execution order (MODBEE_HW_CONFIG runs first)
- Confirm MODBEE_HW_INPUTS and MODBEE_HW_OUTPUTS are instantiated in your main program
- Verify all tasks have correct "Execution Order" priority in Resources

### No I/O Response

- Check ModBee Node-UIO is powered via USB
- Verify device is communicating (check device status lights)
- Ensure all inputs/outputs are properly configured on the device
- Reference [HARDWARE.md](../docs/HARDWARE.md) for device configuration instructions

## Resources

- **ModBee Function Blocks**: Located in `openPLC/function-blocks/`
- **Example Project**: `openPLC/projects/Modbee-Example/`
- **openPLC Editor**: https://github.com/Autonomy-Logic/openplc-editor/releases
- **ModBee Libraries**: https://github.com/mod-bee/modbee-libraries
- **ModBee Node-UIO Hardware Docs**: [HARDWARE.md](../docs/HARDWARE.md)
- **ModBee Node-UIO API Reference**: [SOFTWARE.md](../docs/SOFTWARE.md)
- **API Code Examples**: [API_REFERENCE.md](../docs/API_REFERENCE.md)

---
