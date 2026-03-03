# Communication Protocols Guide
## ModBee Node-UIO

A comprehensive guide to Modbus RTU, ModBee peer-to-peer protocol, and RemoteIO operations.

---

## Table of Contents
1. [Quick Reference](#quick-reference)
2. [Modbus RTU Protocol](#modbus-rtu-protocol)
   - [Master Mode](#master-mode)
   - [Slave Mode](#slave-mode)
   - [Register Map](#modbus-register-map)
3. [ModBee Protocol](#modbee-protocol)
   - [Overview](#modbee-overview)
   - [Register System](#modbee-register-system)
   - [API Commands](#modbee-api-commands)
4. [RemoteIO Modes](#remoteio-modes)
   - [Transparent I/O Linking](#transparent-io-linking)
   - [Cross-Node Operations](#cross-node-operations)
5. [Examples](#examples-and-patterns)

---

## Quick Reference

### Operating Modes

The ModBee Node-UIO supports **five distinct operating modes** that control how the device's outputs can be controlled and which protocols have access. These modes prevent conflicts where multiple protocols try to control the same outputs simultaneously.

#### Mode Overview

| Mode | Modbus RTU | ModBee Protocol | Output Control | Use Case |
|------|------------|-----------------|---------------|----------|
| `MB_NONE` | ❌ Disabled | ✅ Optional | Local only | Standalone device |
| `MB_SLAVE` | ✅ Slave mode | ✅ Optional | Modbus master | Industrial controller |
| `MB_MASTER` | ✅ Master mode | ✅ Optional | Local only | Control other devices |
| `MB_REMOTE_IO` | ✅ Master mode | ❌ Disabled | Modbus master | Remote I/O for PLC |
| `MBEE_REMOTE_IO` | ❌ Disabled | ✅ Required | ModBee network | Distributed I/O network |

#### Detailed Mode Explanations

**`MB_NONE` - Standalone Mode**
- **Modbus RTU**: Completely disabled
- **ModBee Protocol**: Can be enabled (optional)
- **Output Control**: Local application only
- **Use Case**: Standalone device with local control, no network protocols
- **RS485 Usage**: Both channels available for custom serial protocols

**`MB_SLAVE` - Modbus Slave Mode**
- **Modbus RTU**: Slave mode (responds to master requests)
- **ModBee Protocol**: Can be enabled (optional)
- **Output Control**: Modbus master controls outputs
- **Use Case**: Standard industrial Modbus device controlled by PLC/SCADA
- **RS485 Usage**: CH1 = Modbus RTU, CH2 = ModBee or custom serial

**`MB_MASTER` - Modbus Master Mode**
- **Modbus RTU**: Master mode (polls slave devices)
- **ModBee Protocol**: Can be enabled (optional)
- **Output Control**: Local application only
- **Use Case**: Controller that commands other Modbus devices
- **RS485 Usage**: CH1 = Modbus RTU, CH2 = ModBee or custom serial

**`MB_REMOTE_IO` - Modbus Remote I/O Mode**
- **Modbus RTU**: Master mode with special remote I/O behavior
- **ModBee Protocol**: Disabled (conflicts with Modbus)
- **Output Control**: Modbus master controls outputs
- **Use Case**: Remote I/O module for PLC systems
- **RS485 Usage**: CH1 = Modbus RTU (remote I/O protocol)

**`MBEE_REMOTE_IO` - ModBee Remote I/O Mode**
- **Modbus RTU**: Disabled (conflicts with ModBee)
- **ModBee Protocol**: Required and enabled
- **Output Control**: ModBee network controls outputs
- **Use Case**: Distributed I/O in ModBee peer-to-peer networks
- **RS485 Usage**: Both channels used for ModBee protocol

#### Output Control Priority System

The ModBee Node-UIO implements a **priority system** to prevent multiple protocols from controlling outputs simultaneously:

1. **Remote I/O modes** (`MB_REMOTE_IO`, `MBEE_REMOTE_IO`): Network protocols have exclusive control
2. **Slave modes** (`MB_SLAVE`): Modbus master has control, local code can only read
3. **Local modes** (`MB_NONE`, `MB_MASTER`): Local application has full control

**This prevents conflicts where:**
- A Modbus master tries to control outputs while local code also writes to them
- ModBee network and Modbus both try to control the same outputs
- Multiple masters fight for control of the same device

### Communication Hardware

- **Port 1 (Modbus)**: UART1 at GPIO 18 (RX) / GPIO 17 (TX) - RS485 with hardware flow control
- **Port 2 (ModBee)**: UART2 at GPIO 16 (RX) / GPIO 15 (TX) - RS485 for peer-to-peer mesh
- **Baud Rate**: Configurable (default 115200 for both)
- **Configuration**: 8 data bits, 1 stop bit, no parity (8N1)

---

# MODBUS RTU PROTOCOL

Modbus RTU is the standard industrial communication protocol. ModBee Node-UIO supports both Master (controlling multiple slaves) and Slave (responding to master requests) modes.

## Master Mode

**When to use**: You need to control one or more Modbus slave devices.

### Setup

```cpp
#include <ESP32Modbee.h>

ESP32Modbee io(
  MB_MASTER,            // Enable Modbus Master mode
  LED_PIN,              // Status LED
  37, 38,               // I2C pins (SDA, SCL)
  18, 17,               // Modbus UART (RX, TX)
  1,                    // Master Node ID
  16, 15,               // ModBee UART (not used in pure Modbus)
  5,                    // ModBee Node ID (not used)
  115200, SERIAL_8N1,   // Modbus: 115200 baud, 8N1
  &Serial1,
  115200, SERIAL_8N1,
  &Serial2
);

void setup() {
  Serial.begin(115200);
  io.begin();
  
  // Configure local analog inputs as needed
  io.setADCMode(0, MODE_VOLTAGE);
  io.setDACMode(0, MODE_VOLTAGE);
}

void loop() {
  io.update();  // MUST call update() to process Modbus
  
  // Your master logic here
}
```

### Reading from Slaves

The master reads input data from slave devices. These operations are non-blocking and return `true` on success.

#### Read Digital Inputs (Discrete Input Status - Function Code 0x02)

Reads the 8 digital inputs (DI01-DI08) from a slave device.

```cpp
uint8_t slaveID = 2;           // Target slave node ID
bool inputs[8];                // Array to store results
bool success = io.mb.readIsts(slaveID, 0, inputs, 8);

if (success) {
  Serial.printf("Slave %d - DI: ", slaveID);
  for (int i = 0; i < 8; i++) {
    Serial.printf("%d ", inputs[i]);
  }
  Serial.println();
}

// Access individual values
bool di01_status = inputs[0];  // First digital input
```

#### Read Analog Inputs (Input Registers - Function Code 0x04)

Reads scaled analog input values (AI01-AI04) from a slave. Values are in mV (0-10000 for voltage) or µA (0-20000 for current).

```cpp
uint8_t slaveID = 2;
int16_t analogInputs[4];  // Array for 4 analog inputs
bool success = io.mb.readIreg(slaveID, 0, analogInputs, 4);

if (success) {
  Serial.printf("Slave %d - Analog Inputs (mV/µA): ", slaveID);
  for (int i = 0; i < 4; i++) {
    Serial.printf("%d ", analogInputs[i]);
  }
  Serial.println();
}

// Individual access
int16_t ai01_scaled = analogInputs[0];  // First analog input
```

#### Read Single Register

Read a single holding register value from a slave.

```cpp
uint8_t slaveID = 2;
int16_t value = 0;
bool success = io.mb.readHreg(slaveID, 100, value);  // Read from address 100

if (success) {
  Serial.printf("Value: %d\n", value);
}
```

### Writing to Slaves

The master writes commands to slave devices to control outputs and set parameters.

#### Write Digital Outputs (Function Code 0x05 or 0x0F)

Controls the 8 digital outputs (DO01-DO08) on a slave device.

```cpp
uint8_t slaveID = 2;
bool outputs[8];
outputs[0] = true;   // Set DO01 high
outputs[1] = false;  // Set DO02 low
outputs[2] = true;   // Set DO03 high
// ... set remaining outputs ...

bool success = io.mb.writeCoil(slaveID, 0, outputs, 8);

if (success) {
  Serial.println("Digital outputs written successfully");
}
```

Or write individual outputs one at a time:

```cpp
bool success = io.mb.writeCoil(slaveID, 0, true);   // Set DO01 high
success = io.mb.writeCoil(slaveID, 1, false);       // Set DO02 low
success = io.mb.writeCoil(slaveID, 2, true);        // Set DO03 high
```

#### Write Analog Outputs (Function Code 0x06 or 0x10)

Controls the analog outputs (AO01-AO02) on a slave device. Values should be in mV (0-10000) or µA (0-20000) depending on configuration.

```cpp
uint8_t slaveID = 2;
int16_t analogOutputs[2];
analogOutputs[0] = 5000;   // AO01: 5V = 5000 mV
analogOutputs[1] = 10000;  // AO02: 10V = 10000 mV

bool success = io.mb.writeHreg(slaveID, 0, analogOutputs, 2);

if (success) {
  Serial.println("Analog outputs written successfully");
}
```

Or write individual registers:

```cpp
int16_t voltage = 5000;     // 5V = 5000 mV
bool success = io.mb.writeHreg(slaveID, 0, voltage);
```

### Master Mode Example: Bidirectional Mirroring

Mirror a slave's inputs to your local outputs, and your inputs to the slave's outputs:

```cpp
#include <ESP32Modbee.h>

ESP32Modbee io(MB_MASTER, LED_PIN, 37, 38, 18, 17, 1, 16, 15, 5,
               115200, SERIAL_8N1, &Serial1, 115200, SERIAL_8N1, &Serial2);

#define SLAVE_ID 2
bool slaveDI[8];
bool slaveDO[8];
int16_t slaveAI[4];
int16_t slaveAO[2];

unsigned long lastPoll = 0;
const unsigned long POLL_INTERVAL = 100;  // Poll every 100ms

void setup() {
  Serial.begin(115200);
  io.begin();
  io.setADCMode(0, MODE_VOLTAGE);
  io.setDACMode(0, MODE_VOLTAGE);
}

void loop() {
  io.update();
  
  // Non-blocking: only poll at intervals
  unsigned long now = millis();
  if (now - lastPoll < POLL_INTERVAL) return;
  lastPoll = now;
  
  // Read from slave
  io.mb.readIsts(SLAVE_ID, 0, slaveDI, 8);
  io.mb.readIreg(SLAVE_ID, 0, slaveAI, 4);
  
  // Write to slave
  io.mb.writeCoil(SLAVE_ID, 0, io.DI01);  // Mirror your DI01 to slave DO01
  io.mb.writeCoil(SLAVE_ID, 1, io.DI02);
  // ... more mirrors ...
  
  // Mirror slave inputs to your outputs
  io.DO01 = slaveDI[0];
  io.DO02 = slaveDI[1];
  // ... more mirrors ...
  
  // Mirror analog signals
  io.AO01_Scaled = slaveAI[0];
  io.AO02_Scaled = slaveAI[1];
}
```

---

## Slave Mode

**When to use**: An external Modbus master (PLC, SCADA, another ModBee Node-UIO) needs to control this device.

### Setup

```cpp
#include <ESP32Modbee.h>

ESP32Modbee io(
  MB_SLAVE,             // Enable Modbus Slave mode
  LED_PIN,
  37, 38,               // I2C pins
  18, 17,               // Modbus UART
  1,                    // Slave Node ID (matches master's slave address)
  16, 15,               // ModBee UART (optional)
  5,                    // ModBee Node ID (optional)
  115200, SERIAL_8N1,
  &Serial1,
  115200, SERIAL_8N1,
  &Serial2
);

void setup() {
  Serial.begin(115200);
  io.begin();
  
  // Configure analog inputs/outputs
  io.setADCMode(0, MODE_VOLTAGE);
  io.setDACMode(0, MODE_VOLTAGE);
}

void loop() {
  io.update();  // Process incoming Modbus requests
  
  // Your application logic using io.DI01-08, io.DO01-08, etc.
}
```

### How Slave Mode Works

In slave mode, your device automatically responds to Modbus requests from a master. The master sends requests and you respond with data.

**What the master can do:**
- **Read Digital Inputs** (DI01-DI08): Your device sends the current state of these inputs
- **Read Analog Inputs** (AI01-AI04 scaled/raw): Your device sends analog input values
- **Write Digital Outputs** (DO01-DO08): Master controls these outputs
- **Write Analog Outputs** (AO01-AO02: Master controls these analog outputs
- **Read/Write Calibration Registers**: Master can adjust calibration values

**Your application code:**
```cpp
void loop() {
  io.update();  // MUST call to process requests
  
  // Your code can still read and set outputs
  // Master requests are automatically handled
  
  if (io.DI01) {
    io.DO01 = true;  // Mirror input to output
  }
  
  // Master can write DO01 at any time - it will override this
  // after the next io.update() call
}
```

### Slave Mode Example: Local Logic with External Control

```cpp
void loop() {
  io.update();  // Process Modbus requests from master
  
  // Local logic: Mirror DI to DO if DO is not being controlled by master
  io.DO01 = io.DI01;  // This can be overridden by master
  io.DO02 = io.DI02;
  
  // Analog processing
  // Master can write to AO01/AO02, or you can set them locally
  io.AO01_Scaled = io.AI01_Scaled / 2;  // Half of input
}
```

---

## Modbus Register Map

This table shows all available Modbus registers and what they control. Understanding the register addresses is essential for master-to-slave communication.

### Digital Outputs (Coil Registers - Write)

**Register Type**: Coil  
**Access**: Read/Write from master  
**Address Range**: 100-107  
**Data Type**: Boolean (0 or 1)

| Address | Name | Description | Access | Initial Value |
|---------|------|-------------|--------|---|
| 100 | mbDO01 | Digital Output 1 | Master Write / Local Read | false |
| 101 | mbDO02 | Digital Output 2 | Master Write / Local Read | false |
| 102 | mbDO03 | Digital Output 3 | Master Write / Local Read | false |
| 103 | mbDO04 | Digital Output 4 | Master Write / Local Read | false |
| 104 | mbDO05 | Digital Output 5 | Master Write / Local Read | false |
| 105 | mbDO06 | Digital Output 6 | Master Write / Local Read | false |
| 106 | mbDO07 | Digital Output 7 | Master Write / Local Read | false |
| 107 | mbDO08 | Digital Output 8 | Master Write / Local Read | false |

Note: HAT power is controlled locally only (not exposed over Modbus/ModBee).

**Modbus Function Codes**: 0x05 (Write Single Coil), 0x0F (Write Multiple Coils)

**Example from Master**:
```cpp
io.mb.writeCoil(slaveID, 100, true);   // Turn on DO01
io.mb.writeCoil(slaveID, 103, false);  // Turn off DO04
```

**Example from Local Slave Code**:
```cpp
io.update();
Serial.println(io.DO01);  // Read what master wrote
io.DO01 = true;           // Override - set to true locally
```

---

### Digital Inputs (Input Status Registers - Read)

**Register Type**: Discrete Input  
**Access**: Master Read Only  
**Address Range**: 100-107  
**Data Type**: Boolean (0 or 1)

| Address | Name | Description | Source |
|---------|------|-------------|--------|
| 100 | mbDI01 | Digital Input 1 | GPIO pin from sensor/switch |
| 101 | mbDI02 | Digital Input 2 | GPIO pin from sensor/switch |
| 2 | mbDI03 | Digital Input 3 | GPIO pin from sensor/switch |
| 3 | mbDI04 | Digital Input 4 | GPIO pin from sensor/switch |
| 4 | mbDI05 | Digital Input 5 | GPIO pin from sensor/switch |
| 5 | mbDI06 | Digital Input 6 | GPIO pin from sensor/switch |
| 6 | mbDI07 | Digital Input 7 | GPIO pin from sensor/switch |
| 7 | mbDI08 | Digital Input 8 | GPIO pin from sensor/switch |

**Modbus Function Code**: 0x02 (Read Discrete Inputs)

**Example from Master**:
```cpp
bool inputs[8];
io.mb.readIsts(slaveID, 0, inputs, 8);
// inputs[0] = DI01, inputs[1] = DI02, etc.

if (inputs[0]) {
  Serial.println("Slave DI01 is HIGH");
}
```

---

### Analog Inputs (Input Registers - Read)

**Register Type**: Input Register  
**Access**: Master Read Only  
**Address Range**: 100-107  
**Data Type**: Signed 16-bit integer (-32768 to 32767)

| Address | Name | Description | Value Range | Unit |
|---------|------|-------------|-------------|------|
| 100 | mbAI01_SCALED | AI01 Scaled Value | 0-10000 | mV or µA* |
| 101 | mbAI02_SCALED | AI02 Scaled Value | 0-10000 | mV or µA* |
| 102 | mbAI03_SCALED | AI03 Scaled Value | 0-10000 | mV or µA* |
| 103 | mbAI04_SCALED | AI04 Scaled Value | 0-10000 | mV or µA* |
| 104 | mbAI01_RAW | AI01 Raw ADC Value | 0-32767 | Raw counts |
| 105 | mbAI02_RAW | AI02 Raw ADC Value | 0-32767 | Raw counts |
| 106 | mbAI03_RAW | AI03 Raw ADC Value | 0-32767 | Raw counts |
| 107 | mbAI04_RAW | AI04 Raw ADC Value | 0-32767 | Raw counts |

***Unit depends on channel configuration:*
- **Voltage Mode (MODE_VOLTAGE)**: 0-10V = 0-10000 mV
- **Current Mode (MODE_CURRENT)**: 0-20mA = 0-20000 µA

**Modbus Function Code**: 0x04 (Read Input Registers)

**Example from Master**:
```cpp
int16_t analogValues[4];
io.mb.readIreg(slaveID, 0, analogValues, 4);
// analogValues[0] = AI01 scaled
// analogValues[1] = AI02 scaled
// analogValues[2] = AI03 scaled
// analogValues[3] = AI04 scaled

Serial.printf("AI01: %d mV\n", analogValues[0]);

// Read raw values
io.mb.readIreg(slaveID, 4, analogValues, 4);
// analogValues[0] = AI01 raw, etc.
```

---

### Analog Outputs (Holding Registers - Read/Write)

**Register Type**: Holding Register  
**Access**: Read/Write from master  
**Address Range**: 100-103 (+ calibration registers)  
**Data Type**: Signed 16-bit integer

| Address | Name | Description | Value Range | Unit | Access |
|---------|------|-------------|-------------|------|--------|
| 100 | mbAO01_SCALED | AO01 Scaled Output | 0-10000 | mV or µA* | Master Write / Local Read |
| 101 | mbAO02_SCALED | AO02 Scaled Output | 0-10000 | mV or µA* | Master Write / Local Read |
| 102 | mbAO01_RAW | AO01 Raw DAC Value | 0-4095 | Raw counts | Master Write / Local Read |
| 103 | mbAO02_RAW | AO02 Raw DAC Value | 0-4095 | Raw counts | Master Write / Local Read |

***Unit depends on channel configuration (see Analog Inputs section above)

**Modbus Function Code**: 0x06 (Write Single Register), 0x10 (Write Multiple Registers)

**Example from Master**:
```cpp
int16_t outputs[2];
outputs[0] = 5000;   // Set AO01 to 5V (voltage mode)
outputs[1] = 10000;  // Set AO02 to 10V

io.mb.writeHreg(slaveID, 100, outputs, 2);

// Or write single values
io.mb.writeHreg(slaveID, 0, 5000);  // Set AO01 to 5V
```

**Example from Local Slave Code**:
```cpp
io.update();
int voltage = io.AO01_Scaled;  // Read what master wrote
io.AO01_Scaled = 5000;         // Override locally
```

---

### Calibration Registers (Holding Registers - Advanced)

**Address Range**: 104-121

These registers store calibration parameters for accurate analog measurements. Most users don't need to modify these - calibration is typically done via the web interface.

| Address | Name | Description | Valid Range | Function |
|---------|------|-------------|-------------|----------|
| 104 | mbCAL_ZERO_OFFSET_ADC0 | AI01 Zero Offset | -500 to 500 | Calibration |
| 105 | mbCAL_ZERO_OFFSET_ADC1 | AI02 Zero Offset | -500 to 500 | Calibration |
| 106 | mbCAL_ZERO_OFFSET_ADC2 | AI03 Zero Offset | -500 to 500 | Calibration |
| 107 | mbCAL_ZERO_OFFSET_ADC3 | AI04 Zero Offset | -500 to 500 | Calibration |
| 108 | mbCAL_ZERO_OFFSET_DAC0 | AO01 Zero Offset | -500 to 500 | Calibration |
| 109 | mbCAL_ZERO_OFFSET_DAC1 | AO02 Zero Offset | -500 to 500 | Calibration |
| 110 | mbCAL_LOW_ADC0 | AI01 Low Point | 0-32767 | Calibration |
| 111 | mbCAL_LOW_ADC1 | AI02 Low Point | 0-32767 | Calibration |
| 112 | mbCAL_LOW_ADC2 | AI03 Low Point | 0-32767 | Calibration |
| 113 | mbCAL_LOW_ADC3 | AI04 Low Point | 0-32767 | Calibration |
| 114 | mbCAL_HIGH_ADC0 | AI01 High Point | 0-32767 | Calibration |
| 115 | mbCAL_HIGH_ADC1 | AI02 High Point | 0-32767 | Calibration |
| 116 | mbCAL_HIGH_ADC2 | AI03 High Point | 0-32767 | Calibration |
| 117 | mbCAL_HIGH_ADC3 | AI04 High Point | 0-32767 | Calibration |
| 118 | mbCAL_LOW_DAC0 | AO01 Low Point | 0-4095 | Calibration |
| 119 | mbCAL_LOW_DAC1 | AO02 Low Point | 0-4095 | Calibration |
| 120 | mbCAL_HIGH_DAC0 | AO01 High Point | 0-4095 | Calibration |
| 121 | mbCAL_HIGH_DAC1 | AO02 High Point | 0-4095 | Calibration |

**Note**: Calibration registers are typically managed via the web interface. Manual register access is supported but not recommended without understanding the full calibration system.

---

# MODBEE PROTOCOL

The ModBee protocol enables decentralized peer-to-peer mesh networking between multiple ModBee Node-UIO devices. Unlike Modbus which requires a master/slave architecture, ModBee creates a self-healing token-passing network where multiple nodes can communicate directly with each other.

## ModBee Overview

### When to Use ModBee

- **Multiple independent devices** that need to communicate with each other
- **Resilient networks** that auto-heal when a node fails
- **Decentralized control** without a central master
- **Distributed I/O** - read inputs and control outputs across devices

### How ModBee Works

ModBee uses a token-passing protocol to coordinate multi-master communication:

1. **Node Discovery**: Nodes listen for presence and automatically discover each other
2. **Token Ring**: A single "token" passes between nodes, granting exclusive transmission rights
3. **Coordinator Role**: The lowest-numbered node acts as coordinator during network formation
4. **Auto-Healing**: If a node fails, the network automatically reforms around it
5. **Register Synchronization**: Each node maintains a data map of registers from all known nodes

### ModBee Advantages

```
Modbus (Master-Slave):          ModBee (Token-Ring):
       Master                          Node 1
      /  |  \                         / | \
    S1  S2  S3              Node2 --- Node3 --- Node4
  (Linear chain)            (Self-healing mesh)
  
Master failure = network down   Node failure = network adapts
Single point of failure         No single point of failure
```

---

## ModBee Register System

In ModBee, each node maintains its own set of registers (Coils, Holding Registers, Input Registers, Input Status) that can be read and written by other nodes in the network.

### Register Types

ModBee uses the same Modbus register types:

| Type | Modbus Function | Read Access | Write Access | Purpose |
|------|------------|---|---|---------|
| **Coils** | 0x01/0x05/0x0F | All nodes | Node owning register | Digital outputs |
| **Input Status** | 0x02 | All nodes | Read-only | Digital inputs |
| **Holding Registers** | 0x03/0x06/0x10 | All nodes | Node owning register | Analog outputs, config |
| **Input Registers** | 0x04 | All nodes | Read-only | Analog inputs, status |

### ESP32Modbee ModBee Register Bindings

When you call `io.begin()` on a device using ESP32Modbee in ModBee mode, the I/O automatically binds to ModBee registers:

```cpp
// These are automatically bound to ModBee registers
// You can read/write them, and other nodes can access them over the network

// Digital Outputs (Coils)
io.DO01, io.DO02, ..., io.DO08   // Written by remote nodes via ModBee
io.hatPower                        // HAT power control

// Digital Inputs (Input Status)
io.DI01, io.DI02, ..., io.DI08   // Read by remote nodes via ModBee

// Analog Outputs (Holding Registers)
io.AO01_Scaled, io.AO02_Scaled   // Written by remote nodes
io.AO01_Raw, io.AO02_Raw

// Analog Inputs (Input Registers)
io.AI01_Scaled, io.AI02_Scaled, io.AI03_Scaled, io.AI04_Scaled
io.AI01_Raw, io.AI02_Raw, io.AI03_Raw, io.AI04_Raw
```

**Automatic Register Addresses**:
- **Coils (DO)**: Addresses 100-108
- **Input Status (DI)**: Addresses 100-107
- **Input Registers (AI)**: Addresses 100-107
- **Holding Registers (AO + Calibration)**: Addresses 100-123

---

## ModBee API Commands

ModBeeAPI provides methods to read and write registers on remote nodes in the network.

### Initialization

#### `bool begin(Stream* serialPort, uint8_t nodeID = 1)`

Initialize the ModBee protocol.

**Parameters**:
- `Stream* serialPort`: Hardware serial port (usually `&Serial2`)
- `uint8_t nodeID`: Unique ID for this node (1-254, default 1)

**Returns**: `true` if initialization successful, `false` if failed

**Required**: Must call in `setup()` before using ModBee operations.

```cpp
#include <ModBeeProtocol.h>

ModBeeAPI modbee;

void setup() {
  Serial.begin(115200);
  
  // Initialize ModBee protocol
  if (!modbee.begin(&Serial2, 1)) {
    Serial.println("ModBee init failed!");
  }
}

void loop() {
  modbee.loop();  // MUST call in every loop iteration
}
```

#### `void loop()`

Main ModBee processing loop. Handles frame reception, token passing, and operation processing.

**Returns**: void

**Required**: Must call on every loop iteration for ModBee to function.

```cpp
void loop() {
  modbee.loop();  // Process all ModBee events
  
  // Your application code here
}
```

#### `void end()`

Stop ModBee operations and disconnect from network.

```cpp
modbee.end();  // Clean shutdown
```

#### `bool isInitialized()`

Check if ModBee has been initialized.

```cpp
if (modbee.isInitialized()) {
  Serial.println("ModBee is ready");
}
```

---

### Network Management

#### `uint8_t getNodeID()`

Get this node's ID.

```cpp
uint8_t myID = modbee.getNodeID();
Serial.printf("My Node ID: %d\n", myID);
```

#### `bool isConnected()`

Check if this node is connected to the ModBee network.

```cpp
if (modbee.isConnected()) {
  Serial.println("Connected to ModBee network");
} else {
  Serial.println("Waiting to connect...");
}
```

#### `bool isNodeKnown(uint8_t nodeID)`

Check if another node is known in the network.

**Parameters**:
- `uint8_t nodeID`: Node ID to check

**Returns**: `true` if node is in the network, `false` otherwise

```cpp
if (modbee.isNodeKnown(2)) {
  Serial.println("Node 2 is online");
} else {
  Serial.println("Node 2 is offline");
}
```

#### `void connect()`

Initiate connection to the ModBee network.

```cpp
modbee.connect();
```

#### `void disconnect()`

Disconnect from the ModBee network.

```cpp
modbee.disconnect();
```

---

### Local Data Map Management

Each node maintains a local data map of its own registers. You bind your variables to this map so other nodes can read/write them.

#### `void addCoil(uint16_t address, bool* variable)`

Bind a boolean variable to a coil register address.

**Parameters**:
- `uint16_t address`: Register address (0-254)
- `bool* variable`: Pointer to your boolean variable

**Usage**: Other nodes can write to this address, updating your variable.

```cpp
bool my_output_1 = false;
bool my_output_2 = false;

void setup() {
  modbee.begin(&Serial2, 1);
  
  // Remote nodes can write to these addresses
  modbee.addCoil(0, &my_output_1);   // Coil address 0
  modbee.addCoil(1, &my_output_2);   // Coil address 1
}

void loop() {
  modbee.loop();
  
  // my_output_1 and my_output_2 are updated automatically
  // when remote nodes write to these addresses
  
  digitalWrite(OUTPUT_PIN_1, my_output_1);
  digitalWrite(OUTPUT_PIN_2, my_output_2);
}
```

#### `void addHreg(uint16_t address, int16_t* variable)`

Bind an integer variable to a holding register address.

**Parameters**:
- `uint16_t address`: Register address (0-254)
- `int16_t* variable`: Pointer to your 16-bit integer variable

```cpp
int16_t my_setpoint = 0;

void setup() {
  modbee.begin(&Serial2, 1);
  modbee.addHreg(0, &my_setpoint);  // Setpoint at address 0
}

void loop() {
  modbee.loop();
  
  // my_setpoint is updated when remote nodes write to address 0
  if (my_setpoint > 5000) {
    // Setpoint is above 5V
  }
}
```

#### `void addIsts(uint16_t address, bool* variable)`

Bind a boolean variable to an input status register (read-only from remote).

**Parameters**:
- `uint16_t address`: Register address (0-254)
- `bool* variable`: Pointer to your boolean variable

**Usage**: Remote nodes can only READ this value, they cannot write to it.

```cpp
bool sensor1 = false;
bool sensor2 = false;

void setup() {
  modbee.begin(&Serial2, 1);
  modbee.addIsts(0, &sensor1);
  modbee.addIsts(1, &sensor2);
}

void loop() {
  modbee.loop();
  
  // Update from physical sensors
  sensor1 = digitalRead(SENSOR1_PIN);
  sensor2 = digitalRead(SENSOR2_PIN);
  
  // Remote nodes can read these via readIsts()
}
```

#### `void addIreg(uint16_t address, int16_t* variable)`

Bind an integer variable to an input register (read-only from remote).

**Parameters**:
- `uint16_t address`: Register address (0-254)
- `int16_t* variable`: Pointer to your 16-bit integer variable

```cpp
int16_t temperature = 0;

void setup() {
  modbee.begin(&Serial2, 1);
  modbee.addIreg(0, &temperature);
}

void loop() {
  modbee.loop();
  
  // Update temperature from sensor
  temperature = readTemperatureSensor();
  
  // Remote nodes can read this via readIreg()
}
```

#### `bool removeCoil(uint16_t address)`
#### `bool removeHreg(uint16_t address)`
#### `bool removeIsts(uint16_t address)`
#### `bool removeIreg(uint16_t address)`

Remove a register binding.

```cpp
modbee.removeCoil(0);  // Stop sharing coil at address 0
```

---

### Reading from Remote Nodes

#### Array Read Functions (Template-Based)

Auto-detect array size from the data type.

##### `readCoil(uint8_t nodeID, uint16_t offset, bool (&values)[N])`

Read coil (digital output) registers from a remote node.

**Parameters**:
- `uint8_t nodeID`: Target node ID
- `uint16_t offset`: Starting register address
- `bool (&values)[N]`: Fixed-size array to receive values (size determines count)

**Returns**: `true` on success, `false` on timeout/error

```cpp
bool remote_outputs[8];  // Array size determines quantity to read

if (modbee.readCoil(2, 0, remote_outputs)) {
  Serial.println("Successfully read 8 coils from node 2");
  for (int i = 0; i < 8; i++) {
    Serial.printf("Coil %d: %d\n", i, remote_outputs[i]);
  }
}
```

##### `readHreg(uint8_t nodeID, uint16_t offset, int16_t (&values)[N])`

Read holding registers (analog outputs, settings) from a remote node.

```cpp
int16_t remote_settings[4];  // Read 4 holding registers

if (modbee.readHreg(2, 0, remote_settings)) {
  Serial.println("Read settings from node 2:");
  for (int i = 0; i < 4; i++) {
    Serial.printf("HR%d: %d\n", i, remote_settings[i]);
  }
}
```

##### `readIsts(uint8_t nodeID, uint16_t offset, bool (&values)[N])`

Read discrete input status (digital inputs) from a remote node.

```cpp
bool remote_inputs[8];

if (modbee.readIsts(2, 0, remote_inputs)) {
  Serial.println("Digital inputs from node 2:");
  for (int i = 0; i < 8; i++) {
    Serial.printf("DI%d: %d\n", i, remote_inputs[i]);
  }
}
```

##### `readIreg(uint8_t nodeID, uint16_t offset, int16_t (&values)[N])`

Read input registers (analog inputs, sensor data) from a remote node.

```cpp
int16_t remote_sensors[4];  // Read 4 analog inputs

if (modbee.readIreg(2, 0, remote_sensors)) {
  Serial.println("Analog inputs from node 2 (mV/µA):");
  for (int i = 0; i < 4; i++) {
    Serial.printf("AI%d: %d\n", i, remote_sensors[i]);
  }
}
```

#### Single Value Read Functions

For reading individual register values.

##### `readCoil(uint8_t nodeID, uint16_t offset, bool& value)`

Read a single coil from a remote node.

```cpp
bool output_value = false;
if (modbee.readCoil(2, 0, output_value)) {
  Serial.printf("Remote output 0: %d\n", output_value);
}
```

##### `readHreg(uint8_t nodeID, uint16_t offset, int16_t& value)`

Read a single holding register.

```cpp
int16_t setpoint = 0;
if (modbee.readHreg(2, 0, setpoint)) {
  Serial.printf("Remote setpoint: %d\n", setpoint);
}
```

##### `readIsts(uint8_t nodeID, uint16_t offset, bool& value)`

Read a single discrete input.

```cpp
bool input_value = false;
if (modbee.readIsts(2, 3, input_value)) {
  Serial.printf("Remote DI4: %d\n", input_value);
}
```

##### `readIreg(uint8_t nodeID, uint16_t offset, int16_t& value)`

Read a single input register.

```cpp
int16_t sensor_value = 0;
if (modbee.readIreg(2, 1, sensor_value)) {
  Serial.printf("Remote analog input: %d mV\n", sensor_value);
}
```

---

### Writing to Remote Nodes

#### `writeCoil(uint8_t nodeID, uint16_t offset, const bool (&values)[N])`

Write coil (digital output) registers to a remote node.

**Parameters**:
- `uint8_t nodeID`: Target node ID
- `uint16_t offset`: Starting register address
- `const bool (&values)[N]`: Fixed-size array of values to write

**Returns**: `true` on success, `false` on timeout/error

**Example: Control remote outputs**:
```cpp
bool outputs[8];
outputs[0] = true;   // Turn on remote DO01
outputs[1] = false;  // Turn off remote DO02
outputs[2] = true;   // Turn on remote DO03
// ... rest are false ...

if (modbee.writeCoil(2, 0, outputs)) {
  Serial.println("Successfully wrote 8 coils to node 2");
} else {
  Serial.println("Write failed - node 2 offline?");
}
```

**Example: Single output**:
```cpp
bool single_output[1] = {true};
modbee.writeCoil(2, 0, single_output);  // Write to address 0 only
```

#### `writeHreg(uint8_t nodeID, uint16_t offset, const int16_t (&values)[N])`

Write holding registers (analog outputs, parameters) to a remote node.

```cpp
int16_t outputs[2];
outputs[0] = 5000;   // Set remote AO01 to 5V
outputs[1] = 10000;  // Set remote AO02 to 10V

if (modbee.writeHreg(2, 0, outputs)) {
  Serial.println("Analog outputs set on remote node");
}
```

#### Single Value Write Functions

##### `writeCoil(uint8_t nodeID, uint16_t offset, bool value)`

Write a single coil value to a remote node.

```cpp
modbee.writeCoil(2, 0, true);   // Set remote output 0 to ON
modbee.writeCoil(2, 1, false);  // Set remote output 1 to OFF
```

##### `writeHreg(uint8_t nodeID, uint16_t offset, int16_t value)`

Write a single holding register to a remote node.

```cpp
modbee.writeHreg(2, 0, 5000);  // Set remote register 0 to 5000
```

---

### Synchronization and Status

#### `uint16_t getPendingOpCount()`

Get the number of operations waiting to be processed.

```cpp
uint16_t pending = modbee.getPendingOpCount();
if (pending > 10) {
  Serial.println("Many operations pending - network may be busy");
}
```

#### `void clearPendingOps()`

Clear all pending operations.

```cpp
modbee.clearPendingOps();
```

---

## ModBee Practical Examples

### Example 1: Simple Remote Input/Output Mirroring

Node 1 mirrors its local inputs to Node 2's outputs, and vice versa:

```cpp
#include <ModBeeProtocol.h>

ModBeeAPI modbee;

// Local I/O variables
bool my_inputs[8];
bool my_outputs[8];

void setup() {
  Serial.begin(115200);
  
  // Initialize as Node 1
  modbee.begin(&Serial2, 1);
  
  // Bind our outputs to be controlled by remote nodes
  for (int i = 0; i < 8; i++) {
    modbee.addCoil(i, &my_outputs[i]);
  }
}

void loop() {
  modbee.loop();
  
  // Step 1: Read local inputs from GPIO
  for (int i = 0; i < 8; i++) {
    my_inputs[i] = digitalRead(INPUT_PINS[i]);
  }
  
  // Step 2: Check if Node 2 exists and write our inputs to its outputs
  if (modbee.isNodeKnown(2)) {
    modbee.writeCoil(2, 0, my_inputs);  // Node 2 will control its outputs
  }
  
  // Step 3: Update our physical outputs with values from remote control
  for (int i = 0; i < 8; i++) {
    digitalWrite(OUTPUT_PINS[i], my_outputs[i]);
  }
  
  delay(100);  // Poll interval
}
```

### Example 2: Distributed Sensor Monitoring

Multiple nodes report sensor values to a central logger:

```cpp
#include <ModBeeProtocol.h>

ModBeeAPI modbee;

// Local sensor values
int16_t temperature = 0;
int16_t pressure = 0;
int16_t humidity = 0;

void setup() {
  Serial.begin(115200);
  modbee.begin(&Serial2, 1);
  
  // Share our sensor readings with other nodes
  modbee.addIreg(0, &temperature);
  modbee.addIreg(1, &pressure);
  modbee.addIreg(2, &humidity);
}

void loop() {
  modbee.loop();
  
  // Update local sensors
  temperature = readTempSensor();
  pressure = readPressureSensor();
  humidity = readHumiditySensor();
  
  // Node 1 reads sensor values from all nodes
  if (modbee.getNodeID() == 1) {
    int16_t remote_temps[5];  // Array for nodes 2-5
    
    // Read node 2's temperature
    if (modbee.readIreg(2, 0, remote_temps)) {
      Serial.printf("Node 2 temperature: %d\n", remote_temps[0]);
    }
  }
  
  delay(1000);
}
```

### Example 3: Network Synchronization with Retries

Read from a remote node with automatic retry on failure:

```cpp
bool readWithRetry(uint8_t nodeID, uint16_t address, int16_t& value, uint8_t retries = 3) {
  for (int i = 0; i < retries; i++) {
    if (modbee.readIreg(nodeID, address, value)) {
      return true;
    }
    delay(50);  // Wait before retry
  }
  return false;
}

void setup() {
  modbee.begin(&Serial2, 1);
}

void loop() {
  modbee.loop();
  
  int16_t remote_value = 0;
  if (readWithRetry(2, 0, remote_value)) {
    Serial.printf("Successfully read value: %d\n", remote_value);
  } else {
    Serial.println("Failed to read from node 2 after 3 retries");
  }
  
  delay(500);
}
```

---

# REMOTEIO MODES

RemoteIO is a specialized operating mode that creates a transparent I/O link between nodes. One node acts as a master controller, and another acts as a remote I/O expander.

## Transparent I/O Linking

In RemoteIO mode, inputs from one node control outputs on another node, with minimal latency and no complex API calls needed.

### Setup Comparison

**Standard Master-Slave Approach** (requires explicit read/write):
```cpp
// Node 1 (Master) - Lots of code
bool inputs[8];
io.mb.readIsts(slaveID, 0, inputs, 8);  // Read
io.mb.writeCoil(slaveID, 0, inputs, 8);  // Write
```

**RemoteIO Approach** (automatic synchronization):
```cpp
// Node 1 - RemoteIO automatically handles all sync
// Just use the I/O normally
io.DO01 = io.DI01;  // Your DI01 controls remote node's DO01
```

### ESP32Modbee RemoteIO Modes

Two RemoteIO variants are available:

#### MB_REMOTE_IO (Modbus-based RemoteIO)

Uses Modbus RTU for transparent I/O synchronization.

```cpp
ESP32Modbee io(
  MB_REMOTE_IO,       // Enable RemoteIO via Modbus
  LED_PIN,
  37, 38,             // I2C
  18, 17,             // Modbus UART
  1,                  // Modbus ID
  16, 15,             // ModBee UART (optional)
  5,                  // ModBee Node ID (optional)
  115200, SERIAL_8N1,
  &Serial1,
  115200, SERIAL_8N1,
  &Serial2
);

void setup() {
  io.begin();
  // Modbus automatically handles synchronization
}

void loop() {
  io.update();
  
  // Your I/O is automatically synchronized with remote node
  // No explicit read/write commands needed
}
```

#### MBEE_REMOTE_IO (ModBee-based RemoteIO)

Uses ModBee protocol for transparent I/O synchronization across mesh network.

```cpp
ESP32Modbee io(
  MBEE_REMOTE_IO,     // Enable RemoteIO via ModBee
  LED_PIN,
  37, 38,
  18, 17,
  1,
  16, 15,             // ModBee UART
  5,                  // ModBee Node ID
  115200, SERIAL_8N1,
  &Serial1,
  115200, SERIAL_8N1,
  &Serial2
);

void setup() {
  io.begin();
  // ModBee automatically handles synchronization
}

void loop() {
  io.update();
  
  // Your I/O is automatically synchronized via ModBee
}
```

---

### RemoteIO with ModBeeAPI

For finer control using ModBeeAPI directly with RemoteIO:

```cpp
#include <ModBeeProtocol.h>

ModBeeAPI modbee;

// These arrays hold remote node's I/O
bool remoteInputs[8];
bool remoteOutputs[8];
int16_t remoteAnalog[4];

void setup() {
  Serial.begin(115200);
  modbee.begin(&Serial2, 1);
  
  // Bind local variables so remote nodes can write to our outputs
  for (int i = 0; i < 8; i++) {
    modbee.addCoil(i, &remoteOutputs[i]);  // Remote can control these
  }
}

void loop() {
  modbee.loop();
  
  unsigned long lastSync = 0;
  
  // Synchronize every 100ms
  if (millis() - lastSync > 100) {
    lastSync = millis();
    
    // Read remote node's digital inputs
    if (modbee.readIsts(2, 0, remoteInputs)) {
      // Control our outputs based on remote inputs
      for (int i = 0; i < 8; i++) {
        digitalWrite(OUTPUT_PINS[i], remoteInputs[i]);
      }
    }
    
    // Read remote node's analog inputs
    if (modbee.readIreg(2, 0, remoteAnalog, 4)) {
      // Use remote analog values here
    }
  }
}
```

---

## Cross-Node Operations

### Reading Remote I/O

The fundamental operation in RemoteIO is reading a remote node's inputs and using those values locally:

```cpp
bool remoteInputs[8];

// Read digital inputs from Node 2
if (modbee.readIsts(2, 0, remoteInputs, 8)) {
  // Map to local outputs
  io.DO01 = remoteInputs[0];
  io.DO02 = remoteInputs[1];
  // ... etc ...
}

// Read analog inputs from Node 2
int16_t remoteAI[4];
if (modbee.readIreg(2, 0, remoteAI, 4)) {
  io.AO01_Scaled = remoteAI[0];
  io.AO02_Scaled = remoteAI[1];
}
```

### Writing Remote I/O

Send your I/O values to control a remote node's outputs:

```cpp
// Send your digital inputs to remote node 2's outputs
bool send[8];
for (int i = 0; i < 8; i++) {
  send[i] = io.DI01;  // All send your DI01 value
}
modbee.writeCoil(2, 0, send, 8);

// Send your analog inputs to remote node 2's outputs
int16_t sendAnalog[2];
sendAnalog[0] = io.AI01_Scaled;
sendAnalog[1] = io.AI02_Scaled;
modbee.writeHreg(2, 0, sendAnalog, 2);
```

### Full Bidirectional Example

Create full bidirectional I/O link between two nodes:

```cpp
#include <ModBeeProtocol.h>

ModBeeAPI modbee;

#define REMOTE_NODE 2
#define SYNC_INTERVAL 100  // ms

bool local_inputs[8];
bool local_outputs[8];
int16_t local_analog[4];

bool remote_inputs[8];
bool remote_outputs[8];
int16_t remote_analog[4];

unsigned long lastSync = 0;

void setup() {
  Serial.begin(115200);
  modbee.begin(&Serial2, 1);
  
  // Let remote node control our outputs
  for (int i = 0; i < 8; i++) {
    modbee.addCoil(i, &local_outputs[i]);
  }
}

void loop() {
  modbee.loop();
  
  // Synchronize I/O periodically
  if (millis() - lastSync > SYNC_INTERVAL) {
    lastSync = millis();
    
    // Update local inputs from GPIO
    for (int i = 0; i < 8; i++) {
      local_inputs[i] = digitalRead(INPUT_PINS[i]);
    }
    
    // Read remote node's data
    modbee.readIsts(REMOTE_NODE, 0, remote_inputs, 8);
    modbee.readIreg(REMOTE_NODE, 0, remote_analog, 4);
    
    // Write to remote node
    modbee.writeCoil(REMOTE_NODE, 0, local_inputs, 8);
    modbee.writeHreg(REMOTE_NODE, 0, local_analog, 2);
    
    // Update local physical outputs
    for (int i = 0; i < 8; i++) {
      digitalWrite(OUTPUT_PINS[i], local_outputs[i]);
    }
  }
}
```

---

# EXAMPLES AND PATTERNS

## Complete Modbus Master Example

```cpp
#include <ESP32Modbee.h>

ESP32Modbee io(
  MB_MASTER,            // Modbus Master mode
  LED_PIN,
  37, 38,               // I2C
  18, 17,               // Modbus UART
  1,                    // Master ID
  16, 15,               // ModBee UART
  5,                    // ModBee ID
  115200, SERIAL_8N1, &Serial1,
  115200, SERIAL_8N1, &Serial2
);

#define SLAVE_1 1
#define SLAVE_2 2
#define POLL_INTERVAL 100  // ms

unsigned long lastPoll = 0;

// Store remote data
bool slave1_inputs[8];
int16_t slave1_analog[4];
bool slave2_inputs[8];
int16_t slave2_analog[4];

void setup() {
  Serial.begin(115200);
  io.begin();
  io.setADCMode(0, MODE_VOLTAGE);
  io.setDACMode(0, MODE_VOLTAGE);
}

void loop() {
  io.update();
  
  unsigned long now = millis();
  if (now - lastPoll < POLL_INTERVAL) return;
  lastPoll = now;
  
  // Poll SLAVE_1
  io.mb.readIsts(SLAVE_1, 0, slave1_inputs, 8);
  io.mb.readIreg(SLAVE_1, 0, slave1_analog, 4);
  
  // Control SLAVE_1
  io.mb.writeCoil(SLAVE_1, 0, io.DI01);
  io.mb.writeHreg(SLAVE_1, 0, io.AI01_Scaled);
  
  // Poll SLAVE_2
  io.mb.readIsts(SLAVE_2, 0, slave2_inputs, 8);
  io.mb.readIreg(SLAVE_2, 0, slave2_analog, 4);
  
  // Control SLAVE_2
  io.mb.writeCoil(SLAVE_2, 0, io.DI02);
  io.mb.writeHreg(SLAVE_2, 0, io.AI02_Scaled);
  
  // Use data
  io.DO01 = slave1_inputs[0];
  io.AO01_Scaled = slave1_analog[0];
}
```

## Complete ModBee Network Example

```cpp
#include <ModBeeProtocol.h>

ModBeeAPI modbee;

// Configuration
#define MY_NODE_ID 1
#define REMOTE_NODE 2
#define POLL_INTERVAL 100

// Local readings
int16_t temperatureSensor = 0;
int16_t pressureSensor = 0;
bool alarmActive = false;

// Remote readings
int16_t remoteTemp = 0;
int16_t remotePressure = 0;
bool remoteAlarm = false;

unsigned long lastSync = 0;

void setup() {
  Serial.begin(115200);
  
  if (!modbee.begin(&Serial2, MY_NODE_ID)) {
    Serial.println("ModBee init failed!");
    while(1);
  }
  
  // Expose our sensors to the network
  modbee.addIreg(0, &temperatureSensor);
  modbee.addIreg(1, &pressureSensor);
  modbee.addIsts(0, &alarmActive);
}

void loop() {
  modbee.loop();
  
  // Check network
  if (!modbee.isConnected()) {
    Serial.println("Waiting to connect...");
    delay(1000);
    return;
  }
  
  unsigned long now = millis();
  if (now - lastSync < POLL_INTERVAL) return;
  lastSync = now;
  
  // Read local sensors
  temperatureSensor = readTempSensor();
  pressureSensor = readPressureSensor();
  alarmActive = checkAlarm();
  
  // Try to read remote data
  if (modbee.isNodeKnown(REMOTE_NODE)) {
    modbee.readIreg(REMOTE_NODE, 0, remoteTemp);
    modbee.readIreg(REMOTE_NODE, 1, remotePressure);
    modbee.readIsts(REMOTE_NODE, 0, remoteAlarm);
    
    // Use remote data
    Serial.printf("Remote - Temp: %d, Pressure: %d, Alarm: %d\n",
                  remoteTemp, remotePressure, remoteAlarm);
  }
}
```

---

## Quick Start Checklist

### For Modbus Master
- [ ] Initialize with `MB_MASTER` mode
- [ ] Call `io.update()` in every loop
- [ ] Use `io.mb.readIsts()` to read slave inputs
- [ ] Use `io.mb.readIreg()` to read slave analog
- [ ] Use `io.mb.writeCoil()` to control slave outputs
- [ ] Use `io.mb.writeHreg()` to control slave analog
- [ ] Check return values for communication errors

### For Modbus Slave
- [ ] Initialize with `MB_SLAVE` mode
- [ ] Call `io.update()` in every loop
- [ ] Read/write `io.DO01-08`, `io.AO01_Scaled`, etc. in your code
- [ ] Master can automatically read/write these variables

### For ModBee Network
- [ ] Initialize with `modbee.begin(&Serial2, nodeID)`
- [ ] Call `modbee.loop()` in every loop
- [ ] Bind local variables with `modbee.addCoil()`, `modbee.addHreg()`, etc.
- [ ] Use `modbee.readCoil()`, `modbee.readHreg()`, etc. to read remote nodes
- [ ] Use `modbee.writeCoil()`, `modbee.writeHreg()` to write to remote nodes
- [ ] Always check `modbee.isNodeKnown()` before reading/writing

### For RemoteIO
- [ ] Choose RemoteIO mode: `MB_REMOTE_IO` or `MBEE_REMOTE_IO`
- [ ] Call `io.update()` in every loop
- [ ] Use I/O normally - synchronization is automatic
- [ ] No explicit read/write commands needed

---

## Troubleshooting

### Modbus Issues

**Problem**: Master can't read from slave
- Check slave is configured as `MB_SLAVE`
- Verify same Modbus ID on master's query as slave's initialization
- Check RS485 wiring and termination (120Ω on each end)
- Verify baud rate matches on both devices (default 115200)

**Problem**: Slave receiving nothing from master
- Verify master is `MB_MASTER` mode
- Check master is polling with correct slave ID
- Confirm RS485 connection

### ModBee Issues

**Problem**: Nodes not discovering each other
- Verify both have `modbee.begin()` called
- Check RS485 CH2 connections
- Ensure different Node IDs (1-254)
- Look at serial output for discovery messages

**Problem**: Slow network performance
- Reduce poll frequency (increase interval between reads/writes)
- Reduce number of operations queued
- Check for noise on RS485 cable

---

## Register Reference Quick Look-Up

### Modbus Coil Registers (Write DI)
- Address 100-107: DO01-DO08
- Address 108: HAT Power

### Modbus Input Registers (Read AI)
- Address 100-103: AI01-AI04 (Scaled)
- Address 104-107: AI01-AI04 (Raw)

### Modbus Holding Registers (Write AO)
- Address 100-101: AO01-AO02 (Scaled)
- Address 2-3: AO01-AO02 (Raw)
- Address 4-23: Calibration (advanced)

### ModBee Automatic Bindings (ESP32Modbee)
All the above registers are automatically available via ModBee protocol with the  same addresses.

---

## Additional Resources

- [API_REFERENCE.md](API_REFERENCE.md) - Complete C++ API documentation
- [SOFTWARE.md](SOFTWARE.md) - Detailed firmware architecture
- [GETTING_STARTED.md](GETTING_STARTED.md) - Initial setup guide
- [HARDWARE.md](HARDWARE.md) - Pin definitions and electrical specs

