# ModBee Node-UIO Software Documentation

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Firmware Setup and Initialization](#firmware-setup-and-initialization)
3. [Operating Modes](#operating-modes)
4. [ESP32Modbee API Reference](#esp32modbee-api-reference)
5. [ModBee Protocol Overview](#modbee-protocol-overview)
6. [Web Server Interface](#web-server-interface)
7. [Calibration System](#calibration-system)
8. [Examples and Usage Patterns](#examples-and-usage-patterns)
9. [Configuration and Deployment](#configuration-and-deployment)

---

## Architecture Overview

### Core Components

The ModBee Node-UIO firmware is built on several key layers:

```
┌─────────────────────────────────────────────────┐
│          User Application / Main Loop            │
├─────────────────────────────────────────────────┤
│          ESP32Modbee (I/O Manager)              │
├─────────────────────────────────────────────────┤
│  ┌──────────────────────┬──────────────────────┐ │
│  │  Modbus Handler      │  ModBee Protocol     │ │
│  │  (Master/Slave)      │  (Peer-to-Peer)     │ │
│  └──────────────────────┴──────────────────────┘ │
├─────────────────────────────────────────────────┤
│  ┌──────────────┬──────────────┬──────────────┐ │
│  │  I2C Layer   │  Serial (2x) │  Web Server  │ │
│  │  (ADC, DAC)  │  (UART1/2)   │  (LittleFS) │ │
│  └──────────────┴──────────────┴──────────────┘ │
├─────────────────────────────────────────────────┤
│     ESP32 Hardware (GPIO, I2C, UART)            │
└─────────────────────────────────────────────────┘
```

### Main Classes

#### **ESP32Modbee**
The primary interface for managing all I/O operations. Handles:
- Digital input/output control
- Analog input/output scaling and conversion
- Modbus communication (master/slave roles)
- ModBee network protocol
- Hardware initialization (ADC, DAC, LEDs)

#### **ModBeeProtocol**
Implements the decentralized token-passing protocol for mesh networking:
- Node discovery and joining
- Token ring management
- Automatic failover and network healing
- Data map storage for cross-node communication

#### **ModbeeWebServer**
Provides HTTP/WebSocket interface for:
- Real-time I/O monitoring
- Calibration management
- WiFi configuration
- Network status display

---

## Firmware Setup and Initialization

### Basic Initialization

```cpp
#include <ESP32Modbee.h>
#include <ModbeeWebServer.h>

// Create instance with standalone mode (no Modbus)
ESP32Modbee io(
  MB_NONE,              // mode: MB_MASTER, MB_SLAVE, or MB_NONE
  LED_PIN,              // GPIO 39
  37, 38,               // I2C pins (SDA, SCL) for ADC/DAC
  18, 17,               // Modbus UART (RX, TX)
  1,                    // Modbus node ID
  16, 15,               // ModBee UART (RX, TX)
  5,                    // ModBee node ID
  115200, SERIAL_8N1,   // Modbus: baud rate, serial config
  &Serial1,             // Modbus serial port
  115200, SERIAL_8N1,   // ModBee: baud rate, serial config
  &Serial2              // ModBee serial port
);

// Optional: Create web server for control
ModbeeWebServer webServer(io, 80);  // Port 80

void setup() {
  Serial.begin(115200);  // Monitor/debug port
  
  io.begin();            // Initialize I/O system
  webServer.begin();     // Initialize web server (optional)
  
  // Configure analog channels for your application
  io.setADCMode(0, MODE_VOLTAGE);   // AI01: Voltage mode (0-10V -> 0-10000 mV)
  io.setADCMode(1, MODE_VOLTAGE);   // AI02
  io.setADCMode(2, MODE_CURRENT);   // AI03: Current mode (0-20mA -> 0-20000 µA)
  io.setADCMode(3, MODE_CURRENT);   // AI04
  
  io.setDACMode(0, MODE_VOLTAGE);   // AO01: Voltage mode
  io.setDACMode(1, MODE_VOLTAGE);   // AO02
}

void loop() {
  io.update();              // Update all I/O
  webServer.update();       // Update web server
  
  // Your application logic here
}
```

### Interrupt-Based Initialization (Alternative)

For applications requiring event-driven I/O:

```cpp
void setup() {
  Serial.begin(115200);
  io.begin();
  
  // Configure specific pins only
  io.setADCMode(0, MODE_VOLTAGE);
  io.setDACMode(0, MODE_VOLTAGE);
  
  // Optional: Callback-based handlers can be added to ModBee protocol
}

void loop() {
  io.update();
  // Main application logic with non-blocking operations
}
```

---

## Operating Modes

The device can operate in three distinct Modbus modes **independent of ModBee networking**. Choose the Modbus mode that fits your application:

**Important Note:** The ModBee peer-to-peer protocol is entirely **optional**. You can:
- Run **Modbus RTU only** (standard industrial mode) without enabling ModBee
- Use ModBee networking for peer-to-peer device communication
- Use RS485 CH2 as a generic serial interface alongside Modbus on CH1
- Use MB_NONE mode to disable Modbus and use RS485 for custom protocols

### Mode 1: Standalone (MB_NONE)
- **Use Case**: Local I/O control only, no Modbus communication
- **Features**:
  - Direct access to all I/O via C++ objects
  - Web interface for remote monitoring
  - Modbus UART disabled
  - Optional: RS485 CH2 can be used as generic serial port
- **Configuration**: `io = ESP32Modbee(..., MB_NONE, ...)`

```cpp
// Standalone mode usage
io.DO01 = 1;              // Set digital output
if (io.DI01) {            // Read digital input
  int voltage = io.AI01_Scaled;  // Read analog input (mV)
  io.AO01_Scaled = 5000;         // Write analog output (5V)
}
```

### Mode 2: Modbus Slave (MB_SLAVE)
- **Use Case**: Controlled by external Modbus master
- **Features**:
  - Responds to Modbus read/write requests
  - Example: PLC or industrial controller as master
  - Modbus UART active with Slave role
- **Configuration**: `io = ESP32Modbee(..., MB_SLAVE, ...)`

```cpp
// Slave mode: Respond to Modbus requests
// External master reads our registers and controls our outputs
io.update();  // Process incoming Modbus requests
```

**Modbus Register Map for Slave:**
- **Coil Registers (writes)**: DO01-DO08 (addresses 0-7)
- **Input Status Registers (reads)**: DI01-DI08 (addresses 0-7)
- **Input Registers (reads)**: AI01-AI04 scaled/raw (addresses 0-7)
- **Holding Registers (writes)**: AO01-AO02 scaled/raw (addresses 0-3)

### Mode 3: Modbus Master (MB_MASTER)
- **Use Case**: Control multiple slave nodes
- **Features**:
  - Poll and command multiple devices
  - Read/write to Modbus slave registers
  - Modbus UART active with Master role
- **Configuration**: `io = ESP32Modbee(..., MB_MASTER, ...)`

```cpp
// Master mode: Poll slaves and control them
void loop() {
  io.update();
  
  uint8_t slaveId = 2;
  
  // Read coils (digital inputs) from slave
  bool inputs[8];
  io.mb.readIsts(slaveId, 0, inputs, 8);
  
  // Write coils (digital outputs) to slave
  for (int i = 0; i < 8; i++) {
    io.mb.writeCoil(slaveId, i, inputs[i]);
  }
  
  // Read input registers (analog inputs)
  uint16_t aiData[4];
  io.mb.readIreg(slaveId, 0, aiData, 4);
  
  // Write holding registers (analog outputs)
  int16_t aoValue = 5000;  // 5V
  io.mb.writeHreg(slaveId, 0, aoValue);
}
```

---

## ESP32Modbee API Reference

### Constructor

```cpp
ESP32Modbee(
  uint8_t mode,                      // MB_MASTER, MB_SLAVE, or MB_NONE
  uint8_t ledPin = LED_PIN,          // GPIO 39
  uint8_t sdaPin = 37,               // I2C SDA
  uint8_t sclPin = 38,               // I2C SCL
  uint8_t modbusRxPin = 18,          // UART1 RX
  uint8_t modbusTxPin = 17,          // UART1 TX
  uint8_t modbusId = 1,              // Modbus node ID
  uint8_t modbeeRxPin = 16,          // UART2 RX
  uint8_t modbeeTxPin = 15,          // UART2 TX
  uint8_t modbeeId = 1,              // ModBee node ID
  uint32_t baudrate1 = 115200,       // Modbus baud
  uint32_t serialConfig1 = SERIAL_8N1,
  HardwareSerial* serialPort1 = &Serial1,
  uint32_t baudrate2 = 115200,       // ModBee baud
  uint32_t serialConfig2 = SERIAL_8N1,
  HardwareSerial* serialPort2 = &Serial2
);
```

### Lifecycle Methods

#### `void begin()`
Initialize all I/O systems:
- Configures I2C for ADS1115 (ADC) and ModbeeGP8413 (DAC)
- Initializes GPIO pins for digital I/O
- Sets up Modbus communication (if not MB_NONE)
- Loads calibration data from LittleFS
- Initializes status LED

**Must be called in `setup()`**

```cpp
void setup() {
  io.begin();
}
```

#### `void update()`
Main update loop - must be called frequently in main loop:
- Reads all digital and analog inputs
- Processes Modbus communication
- Updates output drivers
- Handles calibration data

**Must be called in `loop()` on every iteration**

```cpp
void loop() {
  io.update();
}
```

### Digital I/O Access

```cpp
// Inputs (read-only)
bool DI01, DI02, DI03, DI04, DI05, DI06, DI07, DI08;

// Outputs (read-write)
bool DO01, DO02, DO03, DO04, DO05, DO06, DO07, DO08;

// Usage:
io.DI01 = false;  // Compiler error - read-only
bool state = io.DI01;
io.DO01 = true;   // Set output high
```

### Analog I/O Access

```cpp
// Analog Inputs - Scaled Values (read-only)
// Returns values in mV (0-10000 mV for voltage mode, 0-20000 µA for current mode)
int16_t AI01_Scaled, AI02_Scaled, AI03_Scaled, AI04_Scaled;

// Analog Inputs - Raw ADC Values (read-only)
int16_t AI01_Raw, AI02_Raw, AI03_Raw, AI04_Raw;

// Analog Outputs - Scaled Values (read-write)
// Set values in mV (0-10000 mV for voltage mode, 0-20000 µA for current mode)
int16_t AO01_Scaled, AO02_Scaled;

// Analog Outputs - Raw DAC Values (read-write)
int16_t AO01_Raw, AO02_Raw;

// Usage:
int voltage = io.AI01_Scaled;      // Get current: 2500 = 2.5V
io.AO01_Scaled = 5000;             // Set output to 5V
io.AO02_Scaled = 10000;            // Set output to 10V (max)

// For current outputs:
io.AO01_Scaled = 15000;            // Set to 15 mA
```

### Analog Configuration

#### `void setADCMode(uint8_t channel, AnalogMode mode)`
Configure input scaling for a specific ADC channel.

**Parameters:**
- `channel`: 0-3 (AI01-AI04)
- `mode`: `MODE_VOLTAGE` or `MODE_CURRENT`

**Effects:**
- `MODE_VOLTAGE`: 0-10000 mV range (0-10V)
- `MODE_CURRENT`: 0-20000 µA range (0-20mA)

```cpp
io.setADCMode(0, MODE_VOLTAGE);   // AI01: 0-10V -> 0-10000 mV
io.setADCMode(2, MODE_CURRENT);   // AI03: 0-20mA -> 0-20000 µA
```

#### `void setDACMode(uint8_t channel, AnalogMode mode)`
Configure output scaling for a specific DAC channel.

**Parameters:**
- `channel`: 0-1 (AO01-AO02)
- `mode`: `MODE_VOLTAGE` or `MODE_CURRENT`

```cpp
io.setDACMode(0, MODE_VOLTAGE);   // AO01: 0-10V output
io.setDACMode(1, MODE_CURRENT);   // AO02: 0-20mA output
```

### Calibration Data Access

```cpp
// Calibration offsets for inputs (set via web server typically)
int16_t _calZeroOffsetADC[4];     // Zero offset for each ADC channel
int16_t _calLowADC[4];             // Low calibration points
int16_t _calHighADC[4];            // High calibration points

// Calibration offsets for outputs
int16_t _calZeroOffsetDAC[2];     // Zero offset for each DAC channel
int16_t _calLowDAC[2];             // Low calibration points
int16_t _calHighDAC[2];            // High calibration points

// Reset calibration to defaults
void _resetCalibration();
```

### Modbus Properties

```cpp
// Modbus RTU object for master operations
ModbusRTU mb;

// Current Modbus node ID
uint8_t modbusID;

// Is this node operating as Modbus master?
bool isMaster;

// ModBee network node ID
uint8_t modbeeID;
```

**Modbus Master Methods** (when operating as MB_MASTER):

```cpp
// Read digital inputs (Input Status registers)
bool io.mb.readIsts(uint8_t slaveId, uint16_t address, bool* values, uint16_t count);

// Read analog inputs (Input Registers)
bool io.mb.readIreg(uint8_t slaveId, uint16_t address, uint16_t* values, uint16_t count);

// Write digital outputs (Coils)
bool io.mb.writeCoil(uint8_t slaveId, uint16_t address, bool value);
bool io.mb.writeCoils(uint8_t slaveId, uint16_t address, bool* values, uint16_t count);

// Write analog outputs (Holding Registers)
bool io.mb.writeHreg(uint8_t slaveId, uint16_t address, uint16_t value);
bool io.mb.writeHregs(uint8_t slaveId, uint16_t address, uint16_t* values, uint16_t count);
```

---

## ModBee Protocol Overview

### Important: ModBee is Optional

**You do NOT need to use ModBee** to operate the ModBee Node-UIO device. Choose your approach:

| Use Case | Modbus Mode | ModBee Enabled? | CH1 (RS485) | CH2 (RS485) |
|----------|-------------|-----------------|-------------|-------------|
| Standard Modbus (typical) | MB_SLAVE or MB_MASTER | No | Modbus RTU | Unused |
| Standalone device | MB_NONE | No | Disabled | Unused |
| Custom dual-protocol | MB_SLAVE | No | Modbus RTU | Custom serial |
| Peer-to-peer network | MB_NONE | Yes | ModBee | ModBee |

**For most industrial applications, standard Modbus RTU (MB_SLAVE or MB_MASTER) is sufficient and doesn't require ModBee.**

### What is ModBee?

ModBee is a **decentralized, peer-to-peer protocol** for RS485 networks. Unlike traditional Modbus (which uses a master-slave architecture), ModBee implements a **token-passing ring** where:

- **Any node can be a master** once it holds the token
- **No single point of failure** - the network self-heals
- **Automatic node discovery** - new devices join dynamically
- **Deterministic operation** - token ensures collision-free communication

### Key Features

#### Decentralized Multi-Master
- Unlike Modbus, ModBee doesn't require a dedicated master
- Any node holding the "token" can transmit data
- Multiple nodes can share responsibility for network management

#### Token Passing Ring
- Nodes form a logical ring based on node IDs
- Token passes around the ring: Node1 → Node2 → Node3 → Node1 → ...
- Only token-holding node can transmit
- Even without data, token acts as a "heartbeat"

#### Dynamic Network Management
- New nodes automatically join when they detect the network
- **Coordinator** (lowest node ID) manages the joining process
- No manual configuration needed for new devices
- Nodes timeout and automatically remove disconnected peers

#### Automatic Failover
- If token holder doesn't respond, next node assumes responsibility
- Disconnected nodes removed from all nodes' known-node lists
- Network quickly self-heals and continues operation

### Network Building Process

1. **Power-Up (Initial Listen Phase)**
   - Node waits a randomized time: `(nodeID × 100) + 50` milliseconds
   - Listens for existing network activity
   - Staggered startup prevents collisions

2. **First Node Initialization**
   - If no traffic detected, becomes Coordinator
   - Creates token and is now network master
   - Can begin accepting other nodes

3. **Subsequent Nodes Joining**
   - Detects token on bus
   - Sends join request
   - Coordinator extends token ring
   - New node added with single frame transmission (efficient)

4. **Normal Operation**
   - Token circulates: Node1 → Node2 → Node3 → Node1 → ...
   - Each node sends one frame (max) while holding token
   - Frame includes data **and** token control information
   - Token automatically passed to next node in ring

### Using ModBee Protocol

**Basic Initialization:**
```cpp
// ModBee automatically active on UART2 (Serial2)
// No special initialization needed - runs in background of io.update()

uint8_t modbeeId = 5;  // Set in constructor
ESP32Modbee io(
  MB_NONE,              // Don't use Modbus
  ...
  16, 15,               // ModBee UART2 pins
  modbeeId,             // This node's ID on ModBee network
  ...
);

void setup() {
  io.begin();  // Starts ModBee automatically
}

void loop() {
  io.update();  // ModBee protocol runs here
}
```

**Network Example:**
```
Three devices connected to same RS485 bus:
- Device 1: nodeID = 1 (becomes Coordinator)
- Device 2: nodeID = 2
- Device 3: nodeID = 3

Token ring: 1 → 2 → 3 → 1 → 2 → 3 → ...

Each device can send when it has the token.
If Device 2 fails:
  Ring auto-adjusts: 1 → 3 → 1 → 3 → ...
```

### ModBee vs Modbus

| Feature | Modbus | ModBee |
|---------|--------|--------|
| **Architecture** | Master-Slave | Peer-to-Peer |
| **Single Master** | Required | Not required |
| **Node Failure** | Master failure = network down | Auto-recovers |
| **Complexity** | Simple | More robust |
| **Deterministic** | Yes, but depends on master | Yes, guaranteed |
| **Use Case** | Traditional industrial | Modern, resilient networks |

---

## Web Server Interface

### Accessing the Web Interface

**Default Access:**
- **URL**: `http://192.168.4.1/` (AP mode)
- **Port**: 80
- **Protocol**: HTTP + WebSocket (for real-time updates)

### Initialization

```cpp
#include <ModbeeWebServer.h>

ModbeeWebServer webServer(io, 80);  // Port optional (default: 80)

void setup() {
  io.begin();
  webServer.begin();  // Initialize web server
}

void loop() {
  io.update();
  webServer.update();  // Must be called regularly
}
```

### Web Interface Features

#### 1. Network Status Panel
- **Mode**: AP (Access Point) or STA (Station)
- **SSID**: Current WiFi network name
- **IP Address**: Device IP for connection from other devices
- **WiFi Configuration**: Connect to external WiFi

#### 2. I/O Status Display
**Real-time monitoring** (updates via WebSocket):
- **Digital Inputs**: DI01-DI08 current state (0 or 1)
- **Digital Outputs**: DO01-DO08 current state (0 or 1)
- **Analog Inputs**: AI01-AI04 scaled values (mV)
- **Analog Outputs**: AO01-AO02 scaled values (mV)

#### 3. Calibration Interface
Configure three-point calibration for each channel:

**ADC Calibration (for each AI01-AI04):**
- Zero Offset: Offset from true zero
- Low Point: Raw ADC value at lower measurement point
- High Point: Raw ADC value at upper measurement point

**DAC Calibration (for each AO01-AO02):**
- Similar three-point calibration
- Ensures accurate voltage/current output

### Web Server API Endpoints

#### WebSocket (Real-Time Updates)
```javascript
// Browser connects to ws://192.168.4.1/ws for real-time I/O updates
ws = new WebSocket('ws://192.168.4.1/ws');

ws.onmessage = function(event) {
  const data = JSON.parse(event.data);
  // data contains current I/O state
  console.log('DI01:', data.DI01);
  console.log('AI01:', data.AI01_Scaled);
};
```

#### HTTP REST API (Implicit via Web Interface)
- **GET** `/`: Serves index.html
- **GET** `/styles.css`: CSS for web interface
- **GET** `/script.js`: JavaScript for web interface
- **WebSocket** `/ws`: Real-time data stream

### Custom Web Integration

```html
<!-- Example: Custom dashboard -->
<html>
<head>
  <script>
    const ws = new WebSocket('ws://' + window.location.host + '/ws');
    
    ws.onmessage = function(event) {
      const ioData = JSON.parse(event.data);
      
      // Update display elements
      document.getElementById('di01').textContent = ioData.DI01 ? 'ON' : 'OFF';
      document.getElementById('ai01').textContent = ioData.AI01_Scaled + ' mV';
    };
  </script>
</head>
<body>
  <h1>ModBee Monitor</h1>
  <p>DI01: <span id="di01">-</span></p>
  <p>AI01: <span id="ai01">-</span></p>
</body>
</html>
```

---

## Calibration System

### Concepts

The calibration system uses three-point linear calibration to convert between raw ADC values and physical quantities (voltage, current).

**Formula:**
```
Scaled Value = (Raw Value - ZeroOffset) × (MaxScaled / (HighRaw - LowRaw))
Raw Value = (Scaled Value / MaxScaled) × (HighRaw - LowRaw) + ZeroOffset
```

### Calibration Window Ranges

#### Voltage Mode
- **Raw Range**: 0-32767 (16-bit ADC)
- **Scaled Range**: 0-10000 mV (0-10V)
- **Default Mapping**: Raw = Scaled (1:1, no calibration)

#### Current Mode
- **Raw Range**: 0-32767
- **Scaled Range**: 0-20000 µA (0-20mA)
- **Default Mapping**: Raw = Scaled × 1.6384 (approximately)

### Performing Manual Calibration

#### Via Web Interface (Recommended)
1. Open `http://192.168.4.1/`
2. Navigate to **Calibration** section
3. Apply known signals to each input/output channel
4. Record raw and scaled values
5. Enter into calibration table
6. Apply and save

#### Programmatic Calibration
```cpp
// Directly access calibration data
io._calZeroOffsetADC[0] = 0;      // AI01 zero offset
io._calLowADC[0] = 100;            // AI01 raw value at 0mV
io._calHighADC[0] = 32000;         // AI01 raw value at 10000mV

// Similar for outputs
io._calZeroOffsetDAC[0] = 0;
io._calLowDAC[0] = 0;
io._calHighDAC[0] = 32767;

// Save to flash
io._saveCalibration();  // Private method (if using friend class)
```

### Stored Calibration

Calibration data stored in `/config.json`:
```json
{
  "calibration": {
    "adc": {
      "zero_offset": [0, 0, 0, 0],
      "low": [0, 0, 0, 0],
      "high": [32767, 32767, 32767, 32767]
    },
    "dac": {
      "zero_offset": [0, 0],
      "low": [0, 0],
      "high": [32767, 32767]
    }
  }
}
```

---

## Examples and Usage Patterns

### Example 1: Standalone I/O Mirror

Mirror all digital inputs to outputs and map analog inputs to outputs:

```cpp
#include <ESP32Modbee.h>

ESP32Modbee io(MB_NONE, LED_PIN, 37, 38, 18, 17, 1, 16, 15, 5,
               115200, SERIAL_8N1, &Serial1,
               115200, SERIAL_8N1, &Serial2);

void setup() {
  Serial.begin(115200);
  io.begin();
  
  io.setADCMode(0, MODE_VOLTAGE);
  io.setADCMode(1, MODE_VOLTAGE);
  io.setDACMode(0, MODE_VOLTAGE);
  io.setDACMode(1, MODE_VOLTAGE);
}

void loop() {
  io.update();
  
  // Mirror digital I/O
  io.DO01 = io.DI01;
  io.DO02 = io.DI02;
  io.DO03 = io.DI03;
  io.DO04 = io.DI04;
  io.DO05 = io.DI05;
  io.DO06 = io.DI06;
  io.DO07 = io.DI07;
  io.DO08 = io.DI08;
  
  // Map analog inputs to outputs
  io.AO01_Scaled = io.AI01_Scaled;
  io.AO02_Scaled = io.AI02_Scaled;
  
  delay(10);  // Non-blocking preferred
}
```

### Example 2: Modbus Master with Multiple Slaves

```cpp
#include <ESP32Modbee.h>

ESP32Modbee io(MB_MASTER, LED_PIN, 37, 38, 18, 17, 1, 16, 15, 5,
               115200, SERIAL_8N1, &Serial1,
               115200, SERIAL_8N1, &Serial2);

#define NUM_SLAVES 3
uint8_t slaveIds[NUM_SLAVES] = {10, 20, 30};
int16_t slaveTemps[NUM_SLAVES];
bool slaveAlarms[NUM_SLAVES];

void setup() {
  Serial.begin(115200);
  io.begin();
}

void pollSlave(uint8_t slaveIndex) {
  uint8_t slaveId = slaveIds[slaveIndex];
  
  // Read temperature (AI01 from slave)
  uint16_t tempRaw;
  if (io.mb.readIreg(slaveId, 0, &tempRaw, 1)) {
    slaveTemps[slaveIndex] = tempRaw;
  }
  
  // Read alarm state (DI01 from slave)
  bool alarm;
  if (io.mb.readIsts(slaveId, 0, &alarm, 1)) {
    slaveAlarms[slaveIndex] = alarm;
    
    // If alarm, trigger local alarm output
    if (alarm) {
      io.DO01 = true;
    }
  }
  
  // Write setpoint to slave (AO01)
  int16_t setpoint = 5000;  // 50°C equivalent
  io.mb.writeHreg(slaveId, 0, setpoint);
}

void loop() {
  io.update();
  
  // Poll each slave in sequence
  static uint8_t pollIndex = 0;
  pollSlave(pollIndex);
  pollIndex = (pollIndex + 1) % NUM_SLAVES;
  
  delay(100);
}
```

### Example 3: ModBee Network Peer

Devices automatically join ModBee network and share data:

```cpp
#include <ESP32Modbee.h>

// Node 1 - Low ID (becomes Coordinator)
ESP32Modbee io1(MB_NONE, 39, 37, 38, 18, 17, 1, 16, 15, 1,
                115200, SERIAL_8N1, &Serial1,
                115200, SERIAL_8N1, &Serial2);

// In separate sketch on different device:
// Node 2 - Higher ID (joins network)
// ESP32Modbee io2(MB_NONE, 39, 37, 38, 18, 17, 1, 16, 15, 2, ...)

void setup() {
  Serial.begin(115200);
  io1.begin();
  // ModBee network formation automatic
}

void loop() {
  io1.update();  // ModBee protocol runs here
  
  // All nodes can now share data via the token ring
  io1.DO01 = io1.DI01;
  
  Serial.println("ModBee node running...");
  delay(1000);
}
```

---

## Configuration and Deployment

### Building and Uploading

#### Using PlatformIO

```bash
# Build project
pio run -e esp32s3

# Upload to device
pio run -e esp32s3 -t upload

# Open serial monitor
pio device monitor -e esp32s3
```

#### Using Arduino IDE

1. Install ESP32 board support
2. Select **ESP32-S3** as board
3. Configure:
   - **USB Mode**: USB-CDC on Boot
   - **Flash Size**: 4MB
   - **Baud Rate**: 115200
4. Sketch → Upload

### Configuration Files

#### `/config.json` (Calibration & Settings)
```json
{
  "calibration": {
    "adc": {...},
    "dac": {...}
  },
  "modes": {
    "adc": [0, 0, 20000, 20000],
    "dac": [0, 0]
  }
}
```

#### `/wifi.json` (WiFi Configuration)
```json
{
  "ssid": "MyNetwork",
  "password": "MyPassword"
}
```

### Customization

#### Changing Pin Assignments
Edit constructor parameters:
```cpp
ESP32Modbee io(
  MB_NONE,
  GPIO_NUM_39,        // Custom LED pin
  GPIO_NUM_37,        // Custom SDA
  GPIO_NUM_38,        // Custom SCL
  GPIO_NUM_18,        // Custom Modbus RX
  GPIO_NUM_17,        // Custom Modbus TX
  ...
);
```

#### Changing Baud Rates
```cpp
ESP32Modbee io(
  MB_SLAVE,
  ...,
  9600,               // Modbus baud (reduced for long distances)
  SERIAL_8N1,
  &Serial1,
  9600,               // ModBee baud
  SERIAL_8N1,
  &Serial2
);
```

#### Changing Serial Ports
```cpp
ESP32Modbee io(
  MB_NONE,
  ...,
  9600, SERIAL_8N1, &Serial0,  // Use Serial0 instead of Serial1
  9600, SERIAL_8N1, &Serial2
);
```

### Troubleshooting

#### Issue: Modbus communication failures
- Check baud rate matches slave device
- Verify RS485 termination (120Ω at cable ends)
- Check RX/TX connections and direction control
- Monitor serial traffic with logic analyzer

#### Issue: Analog readings unstable
- Calibrate ADC using known signals
- Check cable shielding and grounding
- Reduce cable length or use differential inputs
- Add RC filter to analog inputs: R=1kΩ, C=100nF

#### Issue: ModBee network won't form
- Check that devices have different node IDs
- Verify RS485 connections correct and terminated
- Check baud rates match between all nodes
- Monitor serial output for protocol errors

#### Issue: Web server not responding
- Check WiFi connection (look for SSID "ModbeeAP")
- Verify correct IP address (default 192.168.4.1)
- Ensure WebSocket support enabled in browser
- Check LittleFS space availability

---

## Performance Specifications

### I/O Characteristics
- **Digital I/O**: Refresh rate ~100 Hz
- **Analog I/O**: ADC sample rate ~128 Hz, DAC update ~100 Hz
- **Modbus**: Up to 10 transactions/second per master
- **ModBee**: Token cycle time ~100-200 ms (3+ nodes)

### Memory Usage
- **Flash**: ~500 KB application code
- **SRAM**: ~200 KB available for user application
- **LittleFS**: 50-100 KB for configuration

### Network Capabilities
- **Maximum Modbus Slaves**: Limited by scanning time (~20-30 typical)
- **Maximum ModBee Peers**: Theoretical 254, practical ~20
- **Max Cable Length**: 1000m for RS485 at 115200 baud

---

