# ModBee Protocol: Technical Reference

ModBee is a lightweight, peer-to-peer, multi-master, token-passing protocol for RS485 Serial Communication ( Ethernet UDP to be added to transport layer in the future ). It is specifically designed for microcontrollers (like the ESP32) that feature a UART with **hardware-based RS485 direction control**, which automatically manages the Driver Enable (DE) and Receiver Enable (RE) signals.

The protocol uses a Modbus-like data model for I/O but implements a custom token-passing ring network. This enables decentralized, multi-master communication where any node can initiate communication, eliminating the single point of failure inherent in traditional master-slave architectures.

## 1. Core Features

*   **Decentralized Multi-Master**: Any node can initiate communication once it holds the token.
*   **Collision-Free Token Ring**: A logical token ring ensures deterministic, collision-free access to the RS485 bus.
*   **Hardware RS485 Control**: Optimized for modern UARTs with built-in half-duplex direction control, simplifying hardware and software.
*   **Dynamic Network Management**: Nodes can join the network at any time, and the network automatically heals itself if a node is disconnected.
*   **Failsafe Operation**: If a node disconnects, other nodes will time it out, remove it from the network, and clear any associated I/O data to prevent unsafe states.
*   **Batch Operations**: A single frame can contain multiple Modbus read/write operations intended for different nodes, improving network efficiency.
*   **Pointer-Based Data Mapping**: The local data map uses pointers to link your sketch's variables directly to register addresses, making data exchange seamless and efficient.

## 2. Architecture & Protocol Internals

ModBee combines a Modbus-like data structure with a custom, decentralized network management protocol. It is designed with a **transport-agnostic philosophy**. While the current implementation is built on the Arduino `Stream` class for serial communication, the transport layer is abstracted to allow for future expansion to other communication methods, such as **Ethernet (UDP)** or wireless links or CAN BUS, with minimal to no changes to the core protocol logic.

### 2.1. The Coordinator Role

In a ModBee network, there is no permanent, fixed master. Instead, the **Coordinator** is a dynamic role assumed by whichever active node has the **lowest `nodeID`**.

*   **How it's Determined**: At any time, a node considers itself the Coordinator if its own ID is the lowest among all other nodes it currently knows about on the network.
*   **Dynamic Role Change**: This means the Coordinator role can change. If Node 5 is the Coordinator and a new Node 2 joins, Node 2 will become the new Coordinator once it's fully integrated into the network.
*   **Responsibilities**: The primary responsibility of the Coordinator is to manage the network building process, inviting new nodes to join and integrating them into the token ring. During normal operation, it behaves like any other peer.

### 2.2. Network Building and Joining Sequence

The process for a node to join the network is deterministic and designed to prevent collisions during startup.

1.  **Staggered Initial Listen**: When a new node boots up, it enters an `MBEE_INITIAL_LISTEN` state. It silently listens on the bus for a **deterministic, staggered period** calculated based on its `nodeID`: `(nodeID * 100) + 50` milliseconds. This prevents all nodes from trying to speak at once on power-up.
2.  **Detecting Traffic**:
    *   If the node hears **no traffic** during its listening period, it assumes it's the first (and lowest ID) node, declares itself the Coordinator, and starts the network by creating the token.
    *   If it **hears traffic**, it knows a network already exists and proceeds to the next step.
3.  **Join Request**: The new node broadcasts a frame indicating its desire to join the network.
4.  **Invitation & Integration**: The node that currently holds the token sees the join request. It will then pass the token to the new node, and the frame containing the token pass will also include the "add node" information. This single frame both integrates the new node into the ring and informs all other nodes of its presence, so they can add it to their own lists.

### 2.3. Token Passing and Network Healing

The token ring is the core of ModBee's collision-free communication.

*   **Token Possession**: A node must have the token to transmit a data frame. It can send one frame (which may contain multiple operations for different nodes) per token possession.
*   **Passing**: After its transmission (or if it has no data to send), the node passes the token to the next node in its known nodes list. This is done via a **Token-Only Frame**, which serves both to pass control and to act as a heartbeat, confirming the node is still active even when there are no data operations.
*   **Failsafe & Healing**: If a node (`Node A`) tries to pass the token to its successor (`Node B`) and receives no response or subsequent traffic from `Node B` after several retries, it assumes `Node B` has failed. `Node A` will then remove `Node B` from its list and attempt to pass the token to the *next* node in the sequence (`Node C`). This automatically bypasses the failed node and "heals" the network ring. Other nodes will eventually time out Node B as well, ensuring the entire network remains consistent.

---

## 3. Frame Structure

The ModBee protocol wraps its network management information and one or more Modbus Protocol Data Units (PDUs) into a single, robust frame.

### General Structure

A ModBee frame consists of a header, an optional payload of Modbus sections, and a CRC checksum. **It does not use an end-of-frame delimiter.** The frame length is determined by the receiver based on UART activity.

`[SOF] [Header] [Optional Modbus Sections...] [CRC-16]`

| Field                 | Size (Bytes) | Description                                                                                                                            |
| --------------------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| **SOF**               | 1            | **Start of Frame**: Always `0x7E`.                                                                                                     |
| **Header**            | 4            | Contains network control information. See Header Structure below.                                                                      |
| **Modbus Sections**   | Variable     | Zero or more Modbus operations, each prefixed with a delimiter and destination ID. See Modbus Section Structure below.                 |
| **CRC-16**            | 2            | A 16-bit CRC (Modbus variant) calculated over the entire frame from the SOF to the byte preceding the CRC. The polynomial is `0xA001`. |

### Header Structure

The 4-byte header immediately follows the SOF.

`[SRC] [NEXT] [ADD] [REM]`

| Field   | Size (Bytes) | Description                                                                                             |
| ------- | ------------ | ------------------------------------------------------------------------------------------------------- |
| **SRC** | 1            | **Source Node ID**: The ID of the node sending this frame.                                              |
| **NEXT**| 1            | **Next Master ID**: The ID of the node to which the token is being passed. `0` if the token is not being passed. |
| **ADD** | 1            | **Add Node ID**: The ID of a new node being added to the network. `0` if no node is being added.         |
| **REM** | 1            | **Remove Node ID**: The ID of a node being removed from the network. `0` if no node is being removed.    |

### Modbus Section Structure

If the frame carries data operations, the header is followed by one or more Modbus sections.

`[DELIM] [DEST] [Modbus PDU]`

| Field         | Size (Bytes) | Description                                                                                             |
| ------------- | ------------ | ------------------------------------------------------------------------------------------------------- |
| **DELIM**     | 1            | **Packet Delimiter**: Always `0x7C`. Separates Modbus sections from the header and from each other.       |
| **DEST**      | 1            | **Destination Node ID**: The ID of the node that should process this specific Modbus PDU.               |
| **Modbus PDU**| Variable     | **Modbus Protocol Data Unit**: The standard Modbus request/response (Function Code + Data).               |

---

### Frame Examples (Hexadecimal)

**1. Token-Only Frame**

Node `0x01` passes the token to Node `0x02`. There are no data operations.

*   **Structure**: `[SOF] [SRC] [NEXT] [ADD] [REM] [CRC]`
*   **Example**: `7E 01 02 00 00 E1 9A`
    *   `7E`: SOF
    *   `01`: Source is Node 1
    *   `02`: Token passed to Node 2
    *   `00`: No node added
    *   `00`: No node removed
    *   `E1 9A`: CRC-16

**2. Data Frame with One Operation**

Node `0x01` passes the token to `0x02` AND requests to read 2 holding registers from Node `0x03` starting at address `0x0010`.

*   **Structure**: `[SOF] [SRC] [NEXT] [ADD] [REM] [DELIM] [DEST] [Modbus PDU] [CRC]`
*   **Example**: `7E 01 02 00 00 7C 03 03 00 10 00 02 5B 7B`
    *   `7E 01 02 00 00`: Header (Node 1 to 2, no add/rem)
    *   `7C`: Modbus section delimiter
    *   `03`: The operation is for Node 3
    *   `03 00 10 00 02`: Modbus PDU (Read Holding Registers, address 16, quantity 2)
    *   `5B 7B`: CRC-16

---

## 3. How It Works: A Practical Overview

Using the ModBee library involves a few key steps: initializing the node, mapping local variables to the data registers, and then using the API to queue remote operations.

**The Operational Flow:**

1.  **Instantiation**: Create a global instance of the `ModBeeAPI` class.
2.  **Initialization (`setup()`)**:
    *   Call `modbee.begin()` with the serial port and a unique Node ID.
    *   Use `addHreg()`, `addCoil()`, etc., to map variables in your sketch to the Modbus data map. This makes their values accessible to other nodes.
3.  **Main Loop (`loop()`)**:
    *   Call `modbee.loop()` on every iteration. This is critical as it drives the entire protocol state machine: listening for frames, managing the token, processing operations, and sending queued messages.
    *   Call remote operation functions like `readHreg()` or `writeHreg()`. These functions are **non-blocking**. They don't send a message immediately. Instead, they add an operation to an internal queue.
    *   When your node receives the network token (handled automatically by `modbee.loop()`), it will package the operations from the queue into a data frame and broadcast it on the bus.
    *   When other nodes receive this frame, they process the operations intended for them. If it's a read request, they will queue a response.
    *   When the response is received by the original node, the library automatically updates the local variables that you passed by reference or pointer to the read function.

This queuing mechanism makes the network highly efficient, as multiple operations can be batched into a single transmission.

## 4. API Reference (`ModBeeAPI`)

This is the main class you will interact with in your sketch.

### 4.1. Core Protocol Management

---
#### `ModBeeAPI()`
The constructor for the class. It's recommended to create a single global instance.
```cpp
#include <ModBeeAPI.h>
ModBeeAPI modbee; // Create a global instance
```

---
#### `bool begin(Stream* serial, uint8_t nodeID = 1)`
Initializes the ModBee protocol stack. Call this once in your `setup()` function.
*   `serial`: A pointer to the hardware serial port object to use (e.g., `&Serial2`).
*   `nodeID`: The unique 8-bit ID for this node on the network.
*   **Returns**: `true` if initialization was successful.

```cpp
void setup() {
  Serial.begin(115200); // For debug output
  Serial2.begin(115200, SERIAL_8N1, 2, 3); // For RS485, RX=2, TX=3
  
  // Initialize ModBee on Serial2 with Node ID 1
  if (!modbee.begin(&Serial2, 1)) {
    Serial.println("ModBee initialization failed!");
    while(1);
  }
}
```

---
#### `void loop()`
The main processing function for the protocol. It must be called on every iteration of your main `loop()` to drive all network activity.

```cpp
void loop() {
  modbee.loop();
  // Your other application code
}
```

---
#### `void end()`
Stops the protocol and releases resources.

---
### 4.2. Network and Node Status

---
#### `bool isConnected()`
Checks if the node is currently part of a token-passing network.
*   **Returns**: `true` if the node is connected and knows about at least one other node.

---
#### `bool isNodeKnown(uint8_t nodeID)`
Checks if a specific node is currently in this node's list of known network participants.
*   `nodeID`: The ID of the node to check.
*   **Returns**: `true` if the node is known.

---
#### `uint8_t getNodeID()`
Gets the ID of the local node.
*   **Returns**: The local node's ID.

---
### 4.3. Local Data Map Management

These functions manage the node's local data registers. The pointer-based `add` functions are the most common way to expose your sketch's variables to the network.

---
#### `void addHreg(uint16_t address, int16_t* variable)`
Maps a local `int16_t` variable to a 16-bit Holding Register address.
*   `address`: The Modbus register address (0-65535).
*   `variable`: A pointer to the `int16_t` variable in your sketch.

```cpp
int16_t motorSpeed = 123;
modbee.addHreg(100, &motorSpeed); // Other nodes can now read/write to address 100
```

---
#### `void addCoil(uint16_t address, bool* variable)`
Maps a local `bool` variable to a 1-bit Coil address.
*   `address`: The Modbus coil address (0-65535).
*   `variable`: A pointer to the `bool` variable in your sketch.

```cpp
bool valveOpen = false;
modbee.addCoil(25, &valveOpen); // Other nodes can now read/write to coil 25
```
*(Similar functions exist: `addIreg(address, &variable)` for read-only Input Registers and `addIsts(address, &variable)` for read-only Input Status.)*

---
#### `bool setHreg(uint16_t address, int16_t value)`
Sets the value of a local Holding Register directly, if it has been previously added.
```cpp
// Assuming Hreg 100 was added via addHreg()
modbee.setHreg(100, 456); // Updates the value of the mapped variable
```

---
#### `bool getHreg(uint16_t address, int16_t& value)`
Gets the value of a local Holding Register.
```cpp
int16_t currentValue;
if (modbee.getHreg(100, currentValue)) {
  Serial.printf("Hreg 100 is: %d\n", currentValue);
}
```

---
### 4.4. Remote Data Operations

These functions queue operations to be sent to other nodes. They are all **non-blocking**.

#### **Single Value Operations**

---
#### `bool writeHreg(uint8_t nodeID, uint16_t offset, int16_t value, ...)`
Queues a request to write a single 16-bit value to a Holding Register on a remote node.
*   `nodeID`: The ID of the destination node.
*   `offset`: The register address to write to on the remote node.
*   `value`: The `int16_t` value to write.
*   **Returns**: `true` if the operation was successfully added to the queue.

```cpp
// Tell Node 2 to set its Holding Register 50 to the value 999
modbee.writeHreg(2, 50, 999);
```

---
#### `bool writeCoil(uint8_t nodeID, uint16_t offset, bool value, ...)`
Queues a request to write a single boolean value to a Coil on a remote node.
```cpp
// Tell Node 2 to turn on its Coil 10
modbee.writeCoil(2, 10, true);
```

---
#### `bool readHreg(uint8_t nodeID, uint16_t offset, int16_t& value, ...)`
Queues a request to read a single Holding Register from a remote node. The result will be placed in the `value` variable automatically.
*   `value`: A reference to a local variable where the result will be stored.

```cpp
int16_t remoteSensorValue;
// Request the value of Hreg 200 from Node 3
modbee.readHreg(3, 200, remoteSensorValue);
// Later, remoteSensorValue will be updated with the response
```

---
#### **Array Operations (Auto-Sized)**

---
#### `template<size_t N> bool writeHreg(uint8_t nodeID, uint16_t offset, const int16_t (&values)[N], ...)`
Queues a request to write an array of `int16_t` values to a remote node. The number of registers to write is determined automatically by the size of the array.
*   `values`: A reference to a local array containing the data to write.

```cpp
int16_t configurationData[4] = {10, 20, 30, 40};
// Write the 4 values to Node 2, starting at Hreg 1000
modbee.writeHreg(2, 1000, configurationData);
```

---
#### `template<size_t N> bool readHreg(uint8_t nodeID, uint16_t offset, int16_t (&values)[N], ...)`
Queues a request to read multiple Holding Registers from a remote node into a local array.
*   `values`: A reference to a local array where the results will be stored.

```cpp
// Prepare an array to hold 4 sensor readings from Node 3
int16_t remoteSensors[4];
// Read 4 registers starting at address 300 from Node 3
modbee.readHreg(3, 300, remoteSensors);
// The remoteSensors array will be filled with data upon response
```
*(Similar template functions exist for `readCoil`, `writeCoil`, `readIreg`, and `readIsts`.)*

---

## 5. Key Configuration Parameters

The `ModBeeAPI` class exposes several `static` variables that allow you to fine-tune the protocol's behavior. You should set these **before** calling `modbee.begin()`. It is recommended to set them via your class instance.

```cpp
#include <ModBeeAPI.h>
ModBeeAPI modbee;

void setup() {
  // Example: Customizing parameters before initialization
  modbee.MODBEE_MAX_NODES = 5;
  modbee.BASE_TIMEOUT = 100; // ms, calculated for 115200 baud
  modbee.enableFailSafe = true;
  
  modbee.begin(&Serial2, 1);
}
```

### `MODBEE_MAX_NODES`
This is the most critical setting. It defines the maximum number of nodes the protocol should expect on the network.
*   **Importance**: This value is used in several internal timeout calculations. Setting it too high for a small network can make the network feel sluggish when a node fails, as the timeouts will be unnecessarily long.
*   **Recommendation**: Set this to the number of nodes you plan to have, or slightly larger to allow for future expansion. Do not leave it at a very high value if your network is small.

### `BASE_TIMEOUT` (milliseconds)
This is the fundamental timeout used for a single frame transmission, and it should be configured based on your bus speed (baud rate). It needs to be long enough for a full-sized frame (512 bytes) to be sent and received.

*   **Recommendation for 115200 baud**: A value of **100ms** is a safe and reliable starting point.
*   **For other baud rates**, use the formula below.

#### Calculating `BASE_TIMEOUT`
You can calculate the minimum required time with the following formula, which assumes a standard serial format of 10 bits per byte (1 start bit, 8 data bits, 1 stop bit).

`Time (ms) = (Frame Size in Bytes * 10 * 1000) / Baud Rate`

For a full 512-byte frame at 115200 baud:
`Time (ms) = (512 * 10 * 1000) / 115200 = 44.4ms`

The `BASE_TIMEOUT` should be at least **twice** this value to account for a full send and receive transaction, plus a safety margin.

`Recommended BASE_TIMEOUT = (Calculated Time * 2) + Safety Margin (e.g., 20ms)`

#### Note on Wireless Networks
For wireless transports (like LoRa or other radio modules), you should not use the baud rate. Instead, the calculation must be based on the **air data rate** provided by the manufacturer. Wireless links often have higher and more variable latency, so a significantly larger safety margin for the `BASE_TIMEOUT` is highly recommended.

### `MODBEE_INTERFRAME_GAP_US` (microseconds)
This sets a minimum silent period on the bus between frames. It can be used to intentionally slow down the network to accommodate slower devices or to reduce CPU load. For high-speed applications, this can typically be left at its default value.

### `enableFailSafe`
A `bool` that enables or disables the failsafe mechanism.
