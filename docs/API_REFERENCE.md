# ModBee Node-UIO API Reference

**Quick reference for actual code examples.** See [SOFTWARE.md](SOFTWARE.md) for detailed explanations.

## Complete Working Example

Start with this complete working code that exercises all features:

```cpp
#include <ESP32Modbee.h>
#include <ModbeeWebServer.h>

// Create the I/O controller
// Parameters: mode, ledPin, SDA, SCL, mbusRx, mbusTx, mbusID, 
//            modBeeRx, modBeeTx, modBeeID, baud1, config1, &Serial1, 
//            baud2, config2, &Serial2
ESP32Modbee io(MB_NONE, 39, 37, 38, 18, 17, 1, 16, 15, 5,
               115200, SERIAL_8N1, &Serial1,
               115200, SERIAL_8N1, &Serial2);

ModbeeWebServer webServer(io, 80);

void setup() {
  Serial.begin(115200);
  delay(1000);  // Let serial init
  
  Serial.println("\n\n=== ModBee Node-UIO Starting ===");
  
  io.begin();         // Initialize all I/O
  webServer.begin();  // Start web interface
  
  // Configure analog channels
  io.setADCMode(0, MODE_VOLTAGE);   // AI01: 0-10V
  io.setADCMode(1, MODE_VOLTAGE);   // AI02: 0-10V
  io.setADCMode(2, MODE_VOLTAGE);   // AI03: 0-10V
  io.setADCMode(3, MODE_VOLTAGE);   // AI04: 0-10V
  io.setDACMode(0, MODE_VOLTAGE);   // AO01: 0-10V output
  io.setDACMode(1, MODE_VOLTAGE);   // AO02: 0-10V output
  
  Serial.println("Firmware ready. Connect to WiFi 'ModbeeAP' or check serial monitor.");
}

void loop() {
  io.update();              // Read all inputs, handle Modbus
  webServer.update();       // Process web requests
  
  // Example 1: Mirror all digital inputs to outputs
  io.DO01 = io.DI01;
  io.DO02 = io.DI02;
  io.DO03 = io.DI03;
  io.DO04 = io.DI04;
  
  // Example 2: Process with conditional logic
  if (io.DI05) {
    io.DO05 = true;        // Set output high
  } else {
    io.DO05 = false;       // Set output low
  }
  
  // Example 3: Read analog inputs and control outputs
  int voltage1 = io.AI01_Scaled;  // Read AI01 in mV
  int voltage2 = io.AI02_Scaled;  // Read AI02 in mV
  
  // Map analog input range to output
  io.AO01_Scaled = voltage1;      // Pass through AI01 to AO01
  io.AO02_Scaled = voltage2 / 2;  // Half of AI02 to AO02
  
  // Print status every 2 seconds
  static unsigned long lastPrint = 0;
  if (millis() - lastPrint > 2000) {
    Serial.printf("DI: %d %d %d %d | AI01: %d mV | AO01: %d mV\n",
                  io.DI01, io.DI02, io.DI03, io.DI04,
                  io.AI01_Scaled, io.AO01_Scaled);
    lastPrint = millis();
  }
}
```

This demonstrates:
- ✅ Initialization
- ✅ Reading digital inputs
- ✅ Writing digital outputs
- ✅ Reading analog inputs
- ✅ Writing analog outputs
- ✅ Timing (non-blocking)
- ✅ Serial output

---

## Digital I/O Examples

### Read All Digital Inputs

```cpp
void loop() {
  io.update();
  
  // Access individual inputs
  if (io.DI01) {
    Serial.println("DI01 is active (HIGH)");
  }
  
  // Read all 8 inputs
  bool inputs[8] = {io.DI01, io.DI02, io.DI03, io.DI04,
                    io.DI05, io.DI06, io.DI07, io.DI08};
  
  for (int i = 0; i < 8; i++) {
    Serial.printf("DI%02d: %d\n", i + 1, inputs[i]);
  }
}
```

### Write Digital Outputs

```cpp
io.DO01 = true;   // Set output 1 HIGH
io.DO02 = false;  // Set output 2 LOW
io.DO03 = !io.DO03;  // Toggle output 3
io.DO04 = io.DI04;   // Mirror input 4 to output 4
```

### Debounced Digital Input

```cpp
// Global state for debouncing
struct DebounceState {
  bool lastState = false;
  unsigned long lastChangeTime = 0;
  const int DEBOUNCE_MS = 50;  // 50ms debounce
};

DebounceState debounce;

bool readDebouncedInput(bool currentInput) {
  if (currentInput != debounce.lastState) {
    debounce.lastChangeTime = millis();
  }
  debounce.lastState = currentInput;
  
  if (millis() - debounce.lastChangeTime >= debounce.DEBOUNCE_MS) {
    return currentInput;
  }
  return false;  // Still bouncing
}

void loop() {
  io.update();
  
  if (readDebouncedInput(io.DI01)) {
    Serial.println("DI01 stable input detected");
    io.DO01 = !io.DO01;  // Toggle output on stable input
  }
}
```

---

## Analog I/O Examples

### Read All Analog Inputs

```cpp
void loop() {
  io.update();
  
  // Read all 4 analog inputs (scaled in mV)
  int ai1 = io.AI01_Scaled;  // 0-10000 mV
  int ai2 = io.AI02_Scaled;
  int ai3 = io.AI03_Scaled;
  int ai4 = io.AI04_Scaled;
  
  Serial.printf("AI: %d, %d, %d, %d mV\n", ai1, ai2, ai3, ai4);
}
```

### Set Analog Outputs

```cpp
void loop() {
  io.update();
  
  // Set outputs in mV (0-10000 mV = 0-10V)
  io.AO01_Scaled = 5000;   // 5V output
  io.AO02_Scaled = 7500;   // 7.5V output
  
  // Or as percentage
  int percentage = 75;
  int voltage = (percentage * 10000) / 100;  // 75% → 7500 mV
  io.AO01_Scaled = voltage;
}
```

### Current Mode Analog I/O

```cpp
void setup() {
  io.begin();
  
  // Configure for current mode (0-20mA)
  io.setADCMode(0, MODE_CURRENT);  // AI01: 0-20mA
  io.setDACMode(0, MODE_CURRENT);  // AO01: 0-20mA output
}

void loop() {
  io.update();
  
  // Read current input (0-20000 µA = 0-20mA)
  int current = io.AI01_Scaled;  // e.g., 15000 = 15mA
  
  // Set current output
  io.AO01_Scaled = 10000;  // 10mA output
}
```

---

## Modbus Examples

### Modbus Slave (Respond to Master)

```cpp
// In global scope
ESP32Modbee io(MB_SLAVE, 39, 37, 38, 18, 17, 1, 16, 15, 5,
               115200, SERIAL_8N1, &Serial1,
               115200, SERIAL_8N1, &Serial2);

void loop() {
  io.update();  // Process incoming Modbus requests automatically
  
  // Your local logic
  io.DO01 = io.DI01;  // Mirror inputs to outputs
}
```

**Modbus register map:**
- **Coils (write)**: 0-7 → DO01-DO08
- **Input Status (read)**: 0-7 → DI01-DI08
- **Input Registers (read)**: 0-3 → AI01-AI04 scaled, 4-7 → AI01-AI04 raw
- **Holding Registers (read/write)**: 0-1 → AO01-AO02 scaled, 2-3 → AO01-AO02 raw

### Modbus Master (Poll Slaves)

```cpp
// In global scope
ESP32Modbee io(MB_MASTER, 39, 37, 38, 18, 17, 1, 16, 15, 5,
               115200, SERIAL_8N1, &Serial1,
               115200, SERIAL_8N1, &Serial2);

#define NUM_SLAVES 2
struct SlaveData {
  uint8_t id;
  bool inputs[8];
  int16_t analog[4];
} slaves[NUM_SLAVES] = {{10}, {20}};

void pollSlaves() {
  for (int i = 0; i < NUM_SLAVES; i++) {
    uint8_t id = slaves[i].id;
    
    // Read digital inputs
    bool diData[8];
    if (io.mb.readIsts(id, 0, diData, 8)) {
      for (int j = 0; j < 8; j++) {
        slaves[i].inputs[j] = diData[j];
      }
    }
    
    // Read analog values (scaled)
    uint16_t aiData[4];
    if (io.mb.readIreg(id, 0, aiData, 4)) {
      for (int j = 0; j < 4; j++) {
        slaves[i].analog[j] = (int16_t)aiData[j];
      }
    }
    
    // Write output to remote device
    int16_t setpoint = io.AI01_Scaled;
    io.mb.writeHreg(id, 0, setpoint);
  }
}

void loop() {
  io.update();
  
  static unsigned long lastPoll = 0;
  if (millis() - lastPoll > 100) {
    pollSlaves();
    lastPoll = millis();
  }
  
  // Use slave data
  Serial.printf("Slave 1 DI01: %d, AI01: %d\n", 
                slaves[0].inputs[0], slaves[0].analog[0]);
}
```

---

## Utility Functions

### Print All I/O Status

```cpp
void printAllIO() {
  Serial.println("=== ModBee I/O Status ===");
  
  // Digital
  Serial.printf("Digital Inputs:   %d %d %d %d %d %d %d %d\n",
                io.DI01, io.DI02, io.DI03, io.DI04,
                io.DI05, io.DI06, io.DI07, io.DI08);
  Serial.printf("Digital Outputs:  %d %d %d %d %d %d %d %d\n",
                io.DO01, io.DO02, io.DO03, io.DO04,
                io.DO05, io.DO06, io.DO07, io.DO08);
  
  // Analog
  Serial.printf("Analog Inputs:    %d %d %d %d mV\n",
                io.AI01_Scaled, io.AI02_Scaled,
                io.AI03_Scaled, io.AI04_Scaled);
  Serial.printf("Analog Outputs:   %d %d mV\n",
                io.AO01_Scaled, io.AO02_Scaled);
  Serial.println();
}
```

### Constrain & Map Functions

```cpp
// Map input range to output range (same as Arduino map)
int mappedValue = map(io.AI01_Scaled, 0, 10000, 0, 255);

// Clamp value between min/max
io.AO01_Scaled = constrain(somValue, 0, 10000);

// Average multiple samples
int sampleSum = 0;
for (int i = 0; i < 10; i++) {
  io.update();
  sampleSum += io.AI01_Scaled;
  delay(10);
}
int average = sampleSum / 10;
```

---

## See Also

- **[SOFTWARE.md](SOFTWARE.md)** - Detailed explanations and architecture
- **[HARDWARE.md](HARDWARE.md)** - Pin assignments and electrical specs
- **[../schematics/modbee-node-uio.pdf](../schematics/modbee-node-uio.pdf)** - Electrical schematic

---

## ESP32Modbee

Main class for controlling all I/O on the device.

### Constructor

```cpp
ESP32Modbee(
  uint8_t mode,                        // MB_MASTER, MB_SLAVE, or MB_NONE
  uint8_t ledPin = 39,                 // Status LED pin
  uint8_t sdaPin = 37,                 // I2C SDA (ADC/DAC)
  uint8_t sclPin = 38,                 // I2C SCL
  uint8_t modbusRxPin = 18,            // UART1 RX (Modbus)
  uint8_t modbusTxPin = 17,            // UART1 TX
  uint8_t modbusId = 1,                // Modbus node ID
  uint8_t modbeeRxPin = 16,            // UART2 RX (ModBee)
  uint8_t modbeeTxPin = 15,            // UART2 TX
  uint8_t modbeeId = 1,                // ModBee node ID
  uint32_t baudrate1 = 115200,         // Modbus baud rate
  uint32_t serialConfig1 = SERIAL_8N1, // Modbus serial config
  HardwareSerial* serialPort1 = &Serial1,
  uint32_t baudrate2 = 115200,         // ModBee baud rate
  uint32_t serialConfig2 = SERIAL_8N1, // ModBee serial config
  HardwareSerial* serialPort2 = &Serial2
);
```

### Lifecycle Methods

#### `void begin()`
Initialize all subsystems. **Must be called once in setup().**

```cpp
void setup() {
  io.begin();
}
```

**Initialization order:**
1. I2C (for ADC and DAC)
2. GPIO pins
3. Modbus communication (if not MB_NONE)
4. ModBee protocol (if pins configured)
5. Load calibration from LittleFS
6. Initialize status LED

#### `void update()`
Main processing loop. **Must be called on every loop iteration.**

```cpp
void loop() {
  io.update();
  // Other code...
}
```

**Operations performed:**
- Read ADC values
- Update digital inputs
- Process Modbus packets
- Execute requested DAC/DO updates
- Update ModBee protocol state

### Configuration Methods

#### `void setADCMode(uint8_t channel, AnalogMode mode)`

Set input scaling mode for an ADC channel.

| Parameter | Type | Range | Description |
|-----------|------|-------|---|
| `channel` | uint8_t | 0-3 | AI01-AI04 |
| `mode` | AnalogMode | `MODE_VOLTAGE` or `MODE_CURRENT` | Scaling mode |

**MODE_VOLTAGE**: 0-10V range → 0-10000 mV  
**MODE_CURRENT**: 0-20mA range → 0-20000 µA

```cpp
io.setADCMode(0, MODE_VOLTAGE);    // AI01: voltage input
io.setADCMode(2, MODE_CURRENT);    // AI03: current input
```

#### `void setDACMode(uint8_t channel, AnalogMode mode)`

Set output scaling mode for a DAC channel.

| Parameter | Type | Range | Description |
|-----------|------|-------|---|
| `channel` | uint8_t | 0-1 | AO01-AO02 |
| `mode` | AnalogMode | `MODE_VOLTAGE` or `MODE_CURRENT` | Scaling mode |

```cpp
io.setDACMode(0, MODE_VOLTAGE);    // AO01: voltage output
io.setDACMode(1, MODE_CURRENT);    // AO02: current output
```

### Public Properties

#### Digital Inputs (Read-Only)
```cpp
bool DI01, DI02, DI03, DI04, DI05, DI06, DI07, DI08;

// Usage:
if (io.DI01 == true) {
  Serial.println("Input 1 is HIGH");
}
```

#### Digital Outputs (Read-Write)
```cpp
bool DO01, DO02, DO03, DO04, DO05, DO06, DO07, DO08;

// Usage:
io.DO01 = true;   // Set output HIGH
io.DO02 = false;  // Set output LOW
bool state = io.DO03;  // Read current state
```

#### Analog Inputs - Scaled (Read-Only)
```cpp
int16_t AI01_Scaled, AI02_Scaled, AI03_Scaled, AI04_Scaled;

// Range depends on configured mode:
// MODE_VOLTAGE: 0-10000 (0V-10V)
// MODE_CURRENT: 0-20000 (0mA-20mA)

// Usage:
int voltage_mV = io.AI01_Scaled;  // e.g., 5000 = 5.0V
Serial.printf("AI01: %d mV\n", voltage_mV);
```

#### Analog Inputs - Raw (Read-Only)
```cpp
int16_t AI01_Raw, AI02_Raw, AI03_Raw, AI04_Raw;

// Raw 16-bit ADC values (0-32767)
// Before scaling and calibration
```

#### Analog Outputs - Scaled (Read-Write)
```cpp
int16_t AO01_Scaled, AO02_Scaled;

// Range depends on configured mode:
// MODE_VOLTAGE: 0-10000 (0V-10V)
// MODE_CURRENT: 0-20000 (0mA-20mA)

// Usage:
io.AO01_Scaled = 5000;   // Set to 5V
io.AO02_Scaled = 10000;  // Set to 10V (max voltage)
io.AO02_Scaled = 12000;  // Set to 12mA (if configured as current)
```

#### Analog Outputs - Raw (Read-Write)
```cpp
int16_t AO01_Raw, AO02_Raw;

// 16-bit DAC value to write (0-32767)
// Before scaling and calibration conversion
```

### Modbus Properties

#### `ModbusRTU mb`
Direct access to Modbus RTU object for master operations.

```cpp
// Available only when mode is MB_MASTER
io.mb.readIsts(slaveId, address, buffer, count);
io.mb.readIreg(slaveId, address, buffer, count);
io.mb.writeCoil(slaveId, address, value);
io.mb.writeHreg(slaveId, address, value);
```

#### `uint8_t modbusID`
Current Modbus node ID.

```cpp
Serial.println(io.modbusID);  // e.g., 1
```

#### `bool isMaster`
True if operating as Modbus master.

```cpp
if (io.isMaster) {
  // Poll slave devices
}
```

#### `uint8_t modbeeID`
Current ModBee node ID.

```cpp
Serial.println(io.modbeeID);  // e.g., 5
```

### Calibration Properties

These properties store calibration data. Typically configured via web interface.

```cpp
// ADC calibration (per channel)
int16_t _calZeroOffsetADC[4];  // Zero offset for each ADC
int16_t _calLowADC[4];         // Raw value at low point
int16_t _calHighADC[4];        // Raw value at high point

// DAC calibration (per channel)
int16_t _calZeroOffsetDAC[2];  // Zero offset for each DAC
int16_t _calLowDAC[2];         // Raw value at low point
int16_t _calHighDAC[2];        // Raw value at high point

// Reset to defaults
void _resetCalibration();
```

---

## Digital I/O

### Quick Reference Table

| Channel | GPIO | Type | Description |
|---------|------|------|---|
| DI01 | 1 | Input | Read-only digital input |
| DI02 | 2 | Input | Read-only digital input |
| DI03 | 3 | Input | Read-only digital input |
| DI04 | 4 | Input | Read-only digital input |
| DI05 | 5 | Input | Read-only digital input |
| DI06 | 6 | Input | Read-only digital input |
| DI07 | 7 | Input | Read-only digital input |
| DI08 | 8 | Input | Read-only digital input |
| DO01 | 11 | Output | Controllable digital output |
| DO02 | 12 | Output | Controllable digital output |
| DO03 | 13 | Output | Controllable digital output |
| DO04 | 14 | Output | Controllable digital output |
| DO05 | 33 | Output | Controllable digital output |
| DO06 | 34 | Output | Controllable digital output |
| DO07 | 35 | Output | Controllable digital output |
| DO08 | 36 | Output | Controllable digital output |

### Reading Digital Inputs

```cpp
// Check single input
if (io.DI01) {
  io.DO01 = true;  // Set output if input active
}

// Loop through inputs
for (int i = 0; i < 8; i++) {
  // Access via array would require additional code
  // Use individual variables instead
}

// Efficient input reading
bool inputs[] = {io.DI01, io.DI02, io.DI03, io.DI04,
                 io.DI05, io.DI06, io.DI07, io.DI08};

for (int i = 0; i < 8; i++) {
  Serial.printf("DI%02d: %d\n", i+1, inputs[i]);
}
```

### Writing Digital Outputs

```cpp
// Set single output
io.DO01 = true;   // HIGH
io.DO01 = false;  // LOW

// Toggle output
io.DO02 = !io.DO02;

// Set multiple outputs based on inputs
io.DO01 = io.DI01;
io.DO02 = io.DI02;
io.DO03 = io.DI03;
io.DO04 = io.DI04;
io.DO05 = io.DI05;
io.DO06 = io.DI06;
io.DO07 = io.DI07;
io.DO08 = io.DI08;
```

### Application Patterns

#### Pattern 1: Debounced Input Reading
```cpp
unsigned long lastChangeTime = 0;
const unsigned long debounceDelay = 50;  // 50ms debounce

bool readDebouncedInput(bool currentInput, bool& lastState) {
  if (currentInput != lastState) {
    lastChangeTime = millis();
  }
  
  if (millis() - lastChangeTime >= debounceDelay) {
    return currentInput;
  }
  
  return lastState;
}

void loop() {
  io.update();
  
  static bool lastDI01 = false;
  io.DO01 = readDebouncedInput(io.DI01, lastDI01);
}
```

#### Pattern 2: Output Pulse
```cpp
unsigned long pulseStartTime = 0;
const unsigned long pulseDuration = 100;  // 100ms pulse
bool pulseActive = false;

void startPulse() {
  pulseActive = true;
  pulseStartTime = millis();
  io.DO01 = true;
}

void loop() {
  io.update();
  
  if (pulseActive) {
    if (millis() - pulseStartTime >= pulseDuration) {
      io.DO01 = false;
      pulseActive = false;
    }
  }
}
```

---

## Analog I/O

### Quick Reference Table

| Channel | Range | Mode | Default Config | Description |
|---------|-------|------|---|---|
| AI01 | 0-10000 mV | Voltage | 0-10V | 16-bit ADC input |
| AI02 | 0-10000 mV | Voltage | 0-10V | 16-bit ADC input |
| AI03 | 0-10000 mV | Voltage | 0-10V | 16-bit ADC input |
| AI04 | 0-20000 µA | Current | 0-20mA | 16-bit ADC input |
| AO01 | 0-10000 mV | Voltage | 0-10V | 12-bit DAC output |
| AO02 | 0-10000 mV | Voltage | 0-10V | 12-bit DAC output |

### Voltage Mode

Range: 0-10V → scaled to 0-10000 mV

```cpp
io.setADCMode(0, MODE_VOLTAGE);   // Configure AI01 for voltage

void loop() {
  io.update();
  
  int voltage = io.AI01_Scaled;  // e.g., 5000 = 5.0V
  
  if (voltage > 7500) {  // If > 7.5V
    io.AO01_Scaled = 10000;  // Output 10V
  } else if (voltage < 2500) {  // If < 2.5V
    io.AO01_Scaled = 0;  // Output 0V
  } else {
    io.AO01_Scaled = voltage;  // Pass through
  }
}
```

### Current Mode

Range: 0-20mA → scaled to 0-20000 µA

```cpp
io.setADCMode(3, MODE_CURRENT);   // Configure AI04 for current
io.setDACMode(1, MODE_CURRENT);   // Configure AO02 for current

void loop() {
  io.update();
  
  int current = io.AI04_Scaled;  // e.g., 15000 = 15.0mA
  
  // Output proportional to input
  io.AO02_Scaled = (current / 2);  // Half the input current
}
```

### Reading Analog Inputs

```cpp
// Read scaled (calibrated) values
int v1 = io.AI01_Scaled;  // 0-10000 mV
int v2 = io.AI02_Scaled;  // 0-10000 mV
int i3 = io.AI03_Scaled;  // 0-20000 µA
int i4 = io.AI04_Scaled;  // 0-20000 µA

// Read raw values (before calibration)
int raw = io.AI01_Raw;    // 0-32767

// Average multiple samples
const int numSamples = 10;
int sum = 0;
for (int i = 0; i < numSamples; i++) {
  io.update();
  sum += io.AI01_Scaled;
  delay(10);
}
int average = sum / numSamples;
```

### Writing Analog Outputs

```cpp
// Set to specific voltage/current
io.AO01_Scaled = 5000;   // Set AO01 to 5V
io.AO02_Scaled = 12000;  // Set AO02 to 12mA

// Scale input to output (e.g., 4-20mA to 0-10V)
int input_mA = io.AI04_Scaled;  // 4000-20000 µA
int output_V = map(input_mA, 4000, 20000, 0, 10000);  // 0-10V
io.AO01_Scaled = output_V;

// Ramp to target value
void rampOutput(int target, int stepSize, int delayMs) {
  int current = io.AO01_Scaled;
  while (current != target) {
    if (current < target) {
      current += stepSize;
      if (current > target) current = target;
    } else {
      current -= stepSize;
      if (current < target) current = target;
    }
    io.AO01_Scaled = current;
    io.update();
    delay(delayMs);
  }
}
```

### Calibration (Web Interface)

Configure via web dashboard at `http://192.168.4.1/`:

1. **Zero Offset**: Baseline offset for the channel
2. **Low Point**: Raw ADC value at lower reference measurement
3. **High Point**: Raw ADC value at upper reference measurement

Calibration formula:
```
Scaled = (Raw - ZeroOffset) × (MaxScaled / (HighRaw - LowRaw))
```

---

## Modbus RTU

### Operating as Master

```cpp
ESP32Modbee io(MB_MASTER, ...);  // Initialize as master

void loop() {
  io.update();  // Process Modbus communication
  
  // Your master logic
}
```

### Modbus Registers

#### Slave Register Map

| Register Type | Address | Channel | Access | Description |
|---|---|---|---|---|
| Coil | 0-7 | DO01-DO08 | Write | Digital outputs |
| Input Status | 0-7 | DI01-DI08 | Read | Digital inputs |
| Input Register | 0-3 | AI01-AI04 (Scaled) | Read | Analog inputs (scaled) |
| Input Register | 4-7 | AI01-AI04 (Raw) | Read | Analog inputs (raw) |
| Holding Register | 0-1 | AO01-AO02 (Scaled) | Read/Write | Analog outputs (scaled) |
| Holding Register | 2-3 | AO01-AO02 (Raw) | Read/Write | Analog outputs (raw) |
| Holding Register | 4-13 | Calibration | Read/Write | ADC calibration data |
| Holding Register | 14-21 | Calibration | Read/Write | DAC calibration data |

### Master Read Operations

#### Read Digital Inputs (ISTS)
```cpp
bool inputs[8];
if (io.mb.readIsts(slaveId, 0, inputs, 8)) {
  for (int i = 0; i < 8; i++) {
    Serial.printf("Slave %d DI%d: %d\n", slaveId, i+1, inputs[i]);
  }
}
```

| Parameter | Type | Description |
|---|---|---|
| slaveId | uint8_t | Modbus slave ID (1-247) |
| 0 | uint16_t | Starting address (0-7 for DI) |
| inputs | bool* | Array to store results |
| 8 | uint16_t | Number of coils to read |
| **return** | bool | true if successful |

#### Read Analog Inputs (IREG)
```cpp
uint16_t values[4];
if (io.mb.readIreg(slaveId, 0, values, 4)) {
  for (int i = 0; i < 4; i++) {
    Serial.printf("AI%d: %u\n", i+1, values[i]);
  }
}
```

| Parameter | Type | Description |
|---|---|---|
| slaveId | uint8_t | Modbus slave ID |
| 0 | uint16_t | Starting address (0-7) |
| values | uint16_t* | Array to store results |
| 4 | uint16_t | Number of registers to read |
| **return** | bool | true if successful |

### Master Write Operations

#### Write Digital Output (COIL)
```cpp
// Write single coil
bool status = io.mb.writeCoil(slaveId, 0, true);  // Set DO01

// Write multiple coils
bool doValues[8] = {true, false, true, false, false, false, false, false};
bool status = io.mb.writeCoils(slaveId, 0, doValues, 8);
```

| Method | Parameters | Return | Description |
|---|---|---|---|
| `writeCoil` | (id, addr, value) | bool | Write single coil |
| `writeCoils` | (id, addr, values, count) | bool | Write multiple coils |

#### Write Analog Output (HREG)
```cpp
// Write single register
int16_t value = 5000;  // 5V
bool status = io.mb.writeHreg(slaveId, 0, value);  // Set AO01

// Write multiple registers
int16_t aoValues[2] = {5000, 10000};  // AO01=5V, AO02=10V
bool status = io.mb.writeHregs(slaveId, 0, aoValues, 2);
```

| Method | Parameters | Return | Description |
|---|---|---|---|
| `writeHreg` | (id, addr, value) | bool | Write single register |
| `writeHregs` | (id, addr, values, count) | bool | Write multiple registers |

### Modbus Example: Multi-Slave Polling

```cpp
#define NUM_SLAVES 3

struct SlaveData {
  uint8_t id;
  bool inputs[8];
  bool outputs[8];
  int16_t aiValues[4];
} slaves[NUM_SLAVES] = {
  {.id = 10},
  {.id = 20},
  {.id = 30}
};

void pollAllSlaves() {
  for (int i = 0; i < NUM_SLAVES; i++) {
    uint8_t slaveId = slaves[i].id;
    
    // Read inputs
    io.mb.readIsts(slaveId, 0, slaves[i].inputs, 8);
    
    // Read analog values
    uint16_t aiData[4];
    io.mb.readIreg(slaveId, 0, aiData, 4);
    for (int j = 0; j < 4; j++) {
      slaves[i].aiValues[j] = (int16_t)aiData[j];
    }
    
    // Write outputs based on some logic
    bool outputs[8];
    for (int j = 0; j < 8; j++) {
      outputs[j] = slaves[i].inputs[j];  // Echo inputs
    }
    io.mb.writeCoils(slaveId, 0, outputs, 8);
  }
}

void loop() {
  static unsigned long lastPoll = 0;
  if (millis() - lastPoll >= 100) {  // Poll every 100ms
    pollAllSlaves();
    lastPoll = millis();
  }
  
  io.update();
}
```

---

## ModbeeWebServer

Web interface for monitoring and configuration.

### Constructor

```cpp
ModbeeWebServer(ESP32Modbee& modbee, uint16_t port = 80);
```

### Lifecycle Methods

#### `void begin()`
Initialize web server and initialize LittleFS filesystem.

```cpp
void setup() {
  io.begin();
  webServer.begin();
}
```

#### `void update()`
Process web server events. Must be called regularly.

```cpp
void loop() {
  io.update();
  webServer.update();
}
```

### Web Interface Access

**Default:** `http://192.168.4.1/`

Features:
- Real-time I/O display (WebSocket)
- Calibration adjustment
- WiFi configuration
- Network status

### Programmatic Access

The web server automatically exposes I/O data via WebSocket:

```javascript
// Browser-side JavaScript
const ws = new WebSocket('ws://' + window.location.host + '/ws');

ws.onmessage = function(event) {
  const ioData = JSON.parse(event.data);
  // ioData contains all current I/O values
};
```

---

## Data Types & Enums

### AnalogMode Enum

Specifies the measurement range for analog channels.

```cpp
enum AnalogMode {
  MODE_CURRENT = 20000,   // 0-20mA → 0-20000 units
  MODE_VOLTAGE = 10000    // 0-10V → 0-10000 units
};
```

### Modbus Mode Enum

Specifies the operating mode for the device.

```cpp
#define MB_MASTER 1   // Master role
#define MB_SLAVE  0   // Slave role
#define MB_NONE   2   // No Modbus (standalone or ModBee only)
```

### Serial Configuration

Standard Arduino serial configuration constants:

```cpp
#define SERIAL_8N1  0  // 8 bits, no parity, 1 stop bit
```

---

## Common Patterns and Recipes

### Recipe 1: Read All I/O and Print

```cpp
void printIOStatus() {
  Serial.println("=== I/O Status ===");
  
  // Digital
  Serial.printf("DI: %d %d %d %d %d %d %d %d\n",
    io.DI01, io.DI02, io.DI03, io.DI04,
    io.DI05, io.DI06, io.DI07, io.DI08);
  
  Serial.printf("DO: %d %d %d %d %d %d %d %d\n",
    io.DO01, io.DO02, io.DO03, io.DO04,
    io.DO05, io.DO06, io.DO07, io.DO08);
  
  // Analog
  Serial.printf("AI: %d %d %d %d\n",
    io.AI01_Scaled, io.AI02_Scaled,
    io.AI03_Scaled, io.AI04_Scaled);
  
  Serial.printf("AO: %d %d\n",
    io.AO01_Scaled, io.AO02_Scaled);
}
```

### Recipe 2: Implement Watchdog Timer

```cpp
class Watchdog {
  unsigned long timeout;
  unsigned long lastPet;
  
public:
  Watchdog(unsigned long timeoutMs) : timeout(timeoutMs), lastPet(0) {}
  
  void pet() {
    lastPet = millis();
  }
  
  bool isAlive() {
    return (millis() - lastPet) < timeout;
  }
};

Watchdog dog(5000);  // 5-second timeout

void loop() {
  io.update();
  
  if (received_valid_command) {
    dog.pet();
  }
  
  if (!dog.isAlive()) {
    // Safety shutdown
    io.DO01 = false;
    io.DO02 = false;
    // etc.
  }
}
```

---

## Troubleshooting API Issues

### Common Compilation Errors

**Error:** `'io' was not declared`  
**Solution:** Make sure `#include <ESP32Modbee.h>` is at the top of your sketch

**Error:** `cannot pass `std::vector...' as argument`  
**Solution:** Use the correct method signature for Modbus operations (see API above)

### Runtime Issues

**Analog readings not updating:**  
- Call `io.update()` every loop iteration
- Check ADC channel is in correct mode
- Verify calibration isn't too aggressive

**Modbus communication fails:**  
- Check RX/TX pin connections
- Verify baud rates match (usually 115200)
- Check RS485 termination (120Ω at ends)

**Web interface not responding:**  
- Verify you're using correct IP (usually 192.168.4.1)
- Check browser supports WebSocket
- Monitor serial output for errors

---

For detailed examples and usage patterns, see:
- [SOFTWARE.md](SOFTWARE.md) - Complete software guide
- [examples/](../examples/) directory - Working code examples

