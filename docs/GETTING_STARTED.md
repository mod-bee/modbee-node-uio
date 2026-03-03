# ModBee Node-UIO: Getting Started Guide

Welcome to ModBee Node-UIO! This guide will help you set up and run the firmware using the included project structure.

## Prerequisites

- **ModBee Node-UIO Hardware** device
- **USB-C cable** for connection to computer
- **PlatformIO** (recommended) OR **Arduino IDE** 
- **Python 3.7+** (for PlatformIO)
- This GitHub repository cloned to your computer

## Step 1: Clone the Repository

```bash
git clone https://github.com/mod-bee/modbee-node-uio.git
cd modbee-node-uio
```

The project structure includes:

```
modbee-node-uio/
├── src/
│   └── main.cpp              # Main firmware application
├── lib/                       # Pre-included libraries (ready to use)
│   ├── ModbeeNodeFW/         # Core I/O manager
│   ├── ModBeeProtocol/       # Peer-to-peer protocol
│   ├── ArduinoJson/          # JSON handling  
│   ├── ADS1X15/              # ADC driver
│   ├── modbus-esp8266/       # Modbus RTU
│   └── ... (other libraries)
├── data/                      # Web interface files (SPIFFS)
│   └── www/
│       ├── index.html
│       ├── script.js
│       └── styles.css
├── platformio.ini            # PlatformIO configuration
└── README.md                 # Project overview
```

**All dependencies are already included in the `lib/` directory.** No additional library installation needed.

## Step 2: Set Up Development Environment

### Option A: PlatformIO (Recommended)

1. **Install VS Code** (if not already installed)
   - Download: https://code.visualstudio.com/

2. **Install PlatformIO Extension**
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X)
   - Search for "PlatformIO Official"
   - Click Install

3. **Open the Project**
   - File → Open Folder
   - Select the `modbee-node-uio` directory
   - PlatformIO will automatically initialize

4. **Trust the Workspace**
   - You'll see a prompt to trust the workspace - click "Yes"
   - PlatformIO will build the project and prepare the environment

### Option B: Arduino IDE

1. **Install Arduino IDE** (latest version)
   - Download: https://www.arduino.cc/en/software

2. **Install ESP32-S3 Board Support**
   - File → Preferences
   - In "Additional boards manager URLs", add:
     ```
     https://espressif.github.io/arduino-esp32/package_esp32_index.json
     ```
   - Close preferences
   - Tools → Board → Boards Manager
   - Search "esp32"
   - Install "esp32" by Espressif Systems

3. **Copy Libraries to Arduino**
   - From the `lib/` directory, copy all folders to your Arduino libraries folder:
     - Windows: `Documents\Arduino\libraries`
     - Mac: `~/Documents/Arduino/libraries`
     - Linux: `~/Arduino/libraries`

4. **Open the Sketch**
   - File → Open
   - Navigate to `../src/main.cpp`

## Step 3: Connect Your Device

1. **Plug USB-C cable** into the ModBee device
2. **Connect to your computer**
3. The device powers on (LED indicator lights up)
4. Device appears as a USB serial port on your computer

**Find your COM port:**
- **Windows**: Check Device Manager for COM port (e.g., COM5)
- **Mac/Linux**: Run `ls /dev/tty.usb*` in terminal

## Step 4: Configure and Build

### PlatformIO Configuration

The `../platformio.ini` is already configured for ESP32-S3:

```ini
[env:esp32s3]
platform = espressif32
board = esp32s3box
framework = arduino
board_build.filesystem = littlefs
```

**No changes needed** - it's ready to use!

### Arduino IDE Configuration

Set these options:
- **Board**: ESP32-S3 Dev Module (or similar S3 variant)
- **USB Mode**: USB-CDC On Boot
- **Flash Size**: 4MB
- **Partition Scheme**: Default
- **Upload Speed**: 921600
- **Com Port**: Select Your Port

## Step 5: Build and Upload Firmware

### Using PlatformIO

1. **Build Project**
   - Click the PlatformIO icon (alien icon on left sidebar)
   - Or press: `Ctrl+Alt+B`
   - Wait for build to complete

2. **Upload Firmware**
   - Click "Upload" in the PlatformIO menu
   - Or press: `Ctrl+Alt+U`
   - Monitor output for success message

3. **Open Serial Monitor**
   - Click "Serial Monitor" in PlatformIO menu
   - Or press: `Ctrl+Alt+S`
   - Set baud rate to **115200**

### Using Arduino IDE

1. **Verify Sketch**
   - Sketch → Verify/Compile
   - Wait for completion

2. **Upload**
   - Sketch → Upload
   - Or press: Ctrl+U
   - Watch upload progress in status bar

3. **Open Serial Monitor**
   - Tools → Serial Monitor
   - Set baud rate to **115200** (bottom-right dropdown)

## Step 6: Upload Web Interface Files (SPIFFS)

The device includes a web interface accessible at `http://192.168.4.1/`. The HTML, CSS, and JavaScript files need to be uploaded to the device's flash filesystem.

### Upload with PlatformIO

1. **Build and Upload SPIFFS**
   - In PlatformIO main menu, find "Upload Filesystem Image"
   - Or run in terminal: `pio run --target uploadfs -e esp32s3`
   - This uploads all files from `data/www/` to device flash

2. **Verify Upload**
   - Open serial monitor
   - You should see initialization messages
   - Device is ready to use

### Upload with Arduino IDE (Using Tools)

Arduino IDE doesn't have built-in SPIFFS upload, so use **esptool.py**:

1. **Install esptool.py** (if not installed)
   ```bash
   pip install esptool
   ```

2. **Upload SPIFFS Image**
   - First, create the SPIFFS image using PlatformIO: `platformio run --target buildfs -e esp32s3`
   - Then upload with esptool:
   ```bash
   esptool.py --chip esp32s3 --port COM5 --baud 921600 write_flash -z 0x340000 .pio/build/esp32s3/spiffs.bin
   ```
   - Replace `COM5` with your actual port

## Step 7: Test the Firmware

### Via Serial Monitor

After upload completes, you should see output like:

```
Standalone I/O Status:
DI: 0 0 0 0 0 0 0 0
DO: 0 0 0 0 0 0 0 0
AI01_Scaled: 0 mV, AI02_Scaled: 0 mV, ...
AO01_Scaled: 0 mV, AO02_Scaled: 0 mV
```

Output appears every 1000ms.

### Test Digital I/O

See [HARDWARE.md](HARDWARE.md) for connector information. The device has digital inputs and outputs - test these by:
1. Connecting test signals to DI01-DI08
2. Observing corresponding DO01-DO08 activity
3. Using web interface to see real-time status

### Test Analog I/O

The device reads 4 analog inputs (AI01-AI04) and controls 2 analog outputs (AO01-AO02):
1. Connect an analog signal to AI01-AI04 (0-10V or configurable to 0-20mA)
2. Monitor readings via serial or web interface
3. Set output values via code: `io.AO01_Scaled = 5000;` (5V)

### Access Web Interface

1. **Connect to Device WiFi**
   - Scan for WiFi network: "ModbeeAP"
   - Password: "modbee123"

2. **Open Browser**
   - Navigate to: `http://192.168.4.1/`
   - Dashboard loads showing:
     - Real-time I/O status (DI, DO, AI, AO)
     - Analog calibration controls
     - WiFi configuration
     - Network information

3. **Control Outputs (Optional)**
   - Connect additional hardware to test output capability
   - Use web interface to toggle digital outputs
   - Set analog output values

## Step 8: Modify the Firmware (Optional)

The firmware in `src/main.cpp` is a complete working example. You can modify it:

```cpp
void setup() {
  Serial.begin(115200);
  io.begin();
  webServer.begin();  // Start web interface
  
  // Configure analog channels
  io.setADCMode(0, MODE_VOLTAGE);   // AI01: 0-10V
  io.setDACMode(0, MODE_VOLTAGE);   // AO01: 0-10V output
}

void loop() {
  io.update();         // Read inputs, process Modbus
  webServer.update();  // Handle web requests
  
  // Your custom logic here
  io.DO01 = io.DI01;   // Mirror DI01 to DO01
  io.AO01_Scaled = io.AI01_Scaled;  // Map analog
}
```

After any changes:
- **PlatformIO**: Press `Ctrl+Alt+U` to rebuild and upload
- **Arduino IDE**: Click Upload arrow

## Troubleshooting

### Device Won't Upload

**Problem:** "No module named 'esptool'" or upload fails
- **Solution (PlatformIO)**: Run `pip install esptool`, then retry upload
- **Solution (Arduino IDE)**: Use USB 2.0 port, not USB 3.0; try different USB cable

**Problem:** "Board not found" or COM port not detected
- **Solution**: Install USB driver (ESP32-S3 devices usually auto-detect via USB-C)
- **Solution**: Try different USB cable and port
- **Solution**: Check Device Manager for unidentified devices

### Serial Monitor Shows Garbage

**Problem:** Output is unreadable (random characters)
- **Solution**: Make sure baud rate is set to **115200**
- **Solution**: Device defaults to 115200 - do NOT change
- **Solution**: Close other serial monitor windows that might be using the port

### Web Interface Not Accessible

**Problem:** Can't connect to `http://192.168.4.1/`
- **Solution**: Make sure SPIFFS files were uploaded (Step 6)
- **Solution**: Reconnect to "ModbeeAP" WiFi network
- **Solution**: Try incognito/private browser mode
- **Solution**: Check browser supports WebSocket (Chrome/Firefox recommended)

**Problem:** IP address is different than 192.168.4.1
- **Solution**: Check your router - device may have gotten different IP in STA mode
- **Solution**: Connect to AP mode first: SSID "ModbeeAP", password "modbee123"

### Analog Readings Are Unstable

**Problem:** AI values jump around or don't correspond to input
- **Solution**: Use web interface to calibrate ADC
- **Solution**: Check analog signal cables for noise (use shielded cable)
- **Solution**: Add 100nF capacitor across analog input
- **Solution**: See [HARDWARE.md](HARDWARE.md) for grounding requirements

### Modbus Communication Issues

**Problem:** Modbus reads/writes timeout
- **Solution**: Verify RS485 termination (120Ω resistor at cable end)
- **Solution**: Check cable A, B, GND connections
- **Solution**: Verify baud rates match (115200 typical)
- **Solution**: Monitor serial output for protocol errors

## Using the Modbus Feature

The firmware supports Modbus RTU for connecting to external devices:

### As a Slave (Other device is master)
```cpp
ESP32Modbee io(MB_SLAVE, ...);  // In constructor

// Device responds automatically to Modbus requests
// Register map in SOFTWARE.md documentation
```

### As a Master (Control other devices)
```cpp
ESP32Modbee io(MB_MASTER, ...);  // In constructor

void loop() {
  io.update();
  
  // Read digital inputs from slave ID 2, address 0
  bool inputs[8];
  io.mb.readIsts(2, 0, inputs, 8);
  
  // Write digital output to slave
  io.mb.writeCoil(2, 0, true);
}
```

See [API_REFERENCE.md](API_REFERENCE.md) for complete Modbus API.

## Operating Modes

The ModBee Node-UIO supports **five distinct operating modes** that control how outputs are controlled and which protocols have access. These modes prevent conflicts where multiple protocols try to control the same outputs simultaneously.

### Mode Overview

| Mode | Modbus RTU | ModBee Protocol | Output Control | Use Case |
|------|------------|-----------------|---------------|----------|
| `MB_NONE` | ❌ Disabled | ✅ Optional | Local only | Standalone device |
| `MB_SLAVE` | ✅ Slave mode | ✅ Optional | Modbus master | Industrial controller |
| `MB_MASTER` | ✅ Master mode | ✅ Optional | Local only | Control other devices |
| `MB_REMOTE_IO` | ✅ Master mode | ❌ Disabled | Modbus master | Remote I/O for PLC |
| `MBEE_REMOTE_IO` | ❌ Disabled | ✅ Required | ModBee network | Distributed I/O network |

### Detailed Mode Explanations

#### `MB_NONE` - Standalone Mode
- **Modbus RTU**: Completely disabled
- **ModBee Protocol**: Can be enabled (optional)
- **Output Control**: Local application only
- **Use Case**: Standalone device with local control, no network protocols
- **RS485 Usage**: Both channels available for custom serial protocols

#### `MB_SLAVE` - Modbus Slave Mode
- **Modbus RTU**: Slave mode (responds to master requests)
- **ModBee Protocol**: Can be enabled (optional)
- **Output Control**: Modbus master controls outputs
- **Use Case**: Standard industrial Modbus device controlled by PLC/SCADA
- **RS485 Usage**: CH1 = Modbus RTU, CH2 = ModBee or custom serial

#### `MB_MASTER` - Modbus Master Mode
- **Modbus RTU**: Master mode (polls slave devices)
- **ModBee Protocol**: Can be enabled (optional)
- **Output Control**: Local application only
- **Use Case**: Controller that commands other Modbus devices
- **RS485 Usage**: CH1 = Modbus RTU, CH2 = ModBee or custom serial

#### `MB_REMOTE_IO` - Modbus Remote I/O Mode
- **Modbus RTU**: Master mode with special remote I/O behavior
- **ModBee Protocol**: Disabled (conflicts with Modbus)
- **Output Control**: Modbus master controls outputs
- **Use Case**: Remote I/O module for PLC systems
- **RS485 Usage**: CH1 = Modbus RTU (remote I/O protocol)

#### `MBEE_REMOTE_IO` - ModBee Remote I/O Mode
- **Modbus RTU**: Disabled (conflicts with ModBee)
- **ModBee Protocol**: Required and enabled
- **Output Control**: ModBee network controls outputs
- **Use Case**: Distributed I/O in ModBee peer-to-peer networks
- **RS485 Usage**: Both channels used for ModBee protocol

### Output Control Priority System

The ModBee Node-UIO implements a **priority system** to prevent multiple protocols from controlling outputs simultaneously:

1. **Remote I/O modes** (`MB_REMOTE_IO`, `MBEE_REMOTE_IO`): Network protocols have exclusive control
2. **Slave modes** (`MB_SLAVE`): Modbus master has control, local code can only read
3. **Local modes** (`MB_NONE`, `MB_MASTER`): Local application has full control

**This prevents conflicts where:**
- A Modbus master tries to control outputs while local code also writes to them
- ModBee network and Modbus both try to control the same outputs
- Multiple masters fight for control of the same device

### Choosing the Right Mode

| Application | Recommended Mode | Why |
|-------------|------------------|-----|
| Standalone sensor/logger | `MB_NONE` | Local control only, no network conflicts |
| PLC controlled device | `MB_SLAVE` | Standard Modbus slave for industrial control |
| Device controller/gateway | `MB_MASTER` | Controls other devices, local output control |
| PLC remote I/O module | `MB_REMOTE_IO` | Modbus master controls outputs exclusively |
| Distributed I/O network | `MBEE_REMOTE_IO` | ModBee network controls outputs exclusively |

## ModBee Protocol is Optional

The ModBee peer-to-peer protocol is entirely **optional**. You can:
- Run **Modbus RTU only** (standard industrial mode) without enabling ModBee
- Use ModBee networking for peer-to-peer device communication
- Use RS485 CH2 as a generic serial interface alongside Modbus on CH1
- Use MB_NONE mode to disable Modbus and use RS485 for custom protocols

**To use ModBee networking, see [SOFTWARE.md](SOFTWARE.md) for protocol details.**

## Documentation References

- **[README.md](README.md)** - Project overview
- **[HARDWARE.md](HARDWARE.md)** - Hardware specifications and pinout
- **[SOFTWARE.md](SOFTWARE.md)** - Software architecture and detailed usage
- **[API_REFERENCE.md](API_REFERENCE.md)** - Complete API documentation  
- **[../schematics/modbee-node-uio.pdf](../schematics/modbee-node-uio.pdf)** - Electrical schematic and PCB layout

## Next Steps

1. **Experiment with I/O** - Test all 18 channels (8 DI + 8 DO + 4 AI + 2 AO)
2. **Calibrate Analog** - Use web interface to calibrate ADC/DAC
3. **Connect to Network** - Add more devices, test Modbus or ModBee
4. **Deploy** - Integrate into your automation system

## Getting Help

1. Check the relevant documentation file:
   - Hardware questions → [HARDWARE.md](HARDWARE.md)
   - Software/API questions → [SOFTWARE.md](SOFTWARE.md) or [API_REFERENCE.md](API_REFERENCE.md)
   - Electrical specs → [../schematics/modbee-node-uio.pdf](../schematics/modbee-node-uio.pdf)

2. Review example code in `../examples/` directory

3. Check the main.cpp example - it demonstrates how to use all features

4. Monitor serial output at 115200 baud for debug messages

Happy building! 🚀

