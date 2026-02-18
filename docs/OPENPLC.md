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
- **MODBEE_CONFIG** - Initialize ModBee communication and connection management
- **MODBEE_INPUTS** - Read all digital (DX01-DX08) and analog (AX01_Scaled-AX04_Scaled) inputs
- **MODBEE_OUTPUTS** - Write all digital (YX01-YX08) and analog (YX01_Scaled-YX02_Scaled) outputs

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
- Pre-configured function blocks for ModBee I/O
- Recommended organization for input/output handling
- Ready-to-use logic structure

### Option 2: Add Function Blocks to Your Project

If you have an existing openPLC project, you can add ModBee function blocks:

1. **Copy function blocks** from the repository:
   - Copy `MODBEE_CONFIG.cpp`, `MODBEE_INPUTS.cpp`, and `MODBEE_OUTPUTS.cpp` from `openPLC/function-blocks/`
   - Paste them into your project's **POUS** folder under **function-blocks**

2. **Create two tasks in Resources**:

   **Task 1: MODBEE_CONFIG (1ms cycle)**
   - In openPLC Editor: **Resources** → Create new task
   - Set **Period**: 1ms
   - Assign **Program/Function Block**: MODBEE_CONFIG
   - This handles initialization and communication

   **Task 2: MAIN or your control program (20ms cycle)**
   - Create your application logic
   - Add instances of MODBEE_INPUTS and MODBEE_OUTPUTS
   - Call MODBEE_INPUTS at the beginning to read fresh data
   - Call MODBEE_OUTPUTS at the end to write commands
   - Set **Execution Order**: Run after MODBEE_CONFIG task

3. **Wire your logic**:
   - Use outputs from MODBEE_INPUTS (DX01-DX08, AX01_Scaled-AX04_Scaled) in your control logic
   - Set inputs to MODBEE_OUTPUTS (YX01-YX08, YX01_Scaled-YX02_Scaled) based on your logic

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

#### MODBEE_CONFIG
- Initializes ModBee communication
- Runs continuously in the 1ms dedicated task
- Handles connection management and device communication
- Can be customized for advanced functionality (see "Customizing Function Blocks" below)

#### MODBEE_INPUTS
- **Outputs**:
  - `DX01` - `DX08` (bool) - Digital inputs 1-8
  - `AX01_Scaled` - `AX04_Scaled` (real) - Analog inputs 1-4 (mV or mA)

#### MODBEE_OUTPUTS
- **Inputs**:
  - `YX01` - `YX08` (bool) - Digital outputs 1-8
  - `YX01_Scaled` - `YX02_Scaled` (real) - Analog outputs 1-2 (mV or mA)

### Data Range Reference

| Channel | Type | Range | Unit |
|---------|------|-------|------|
| Digital Input 1-8 (DX01-DX08) | bool | 0-1 | - |
| Analog Input 1-4 (AX01_Scaled-AX04_Scaled) | real | 0-10000 | mV (voltage mode) |
| Analog Input 1-4 (AX01_Scaled-AX04_Scaled) | real | 0-20000 | µA (current mode) |
| Digital Output 1-8 (YX01-YX08) | bool | 0-1 | - |
| Analog Output 1-2 (YX01_Scaled-YX02_Scaled) | real | 0-10000 | mV (voltage mode) |
| Analog Output 1-2 (YX01_Scaled-YX02_Scaled) | real | 0-20000 | µA (current mode) |

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

1. **MODBEE_CONFIG Task (1ms period)**
   - Runs continuously to maintain ModBee communication
   - Must complete before other tasks

2. **Your Main Program Task (20ms typical)**
   - Call MODBEE_INPUTS at the beginning to read fresh sensor data
   - Execute your control logic  
   - Set output variables (YX01-YX08, YX01_Scaled-YX02_Scaled)
   - Call MODBEE_OUTPUTS at the end to write commands to device

## Troubleshooting

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

- Verify MODBEE_CONFIG task is set to 1ms period
- Check task execution order (MODBEE_CONFIG runs first)
- Confirm MODBEE_INPUTS and MODBEE_OUTPUTS are instantiated in your main program
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
