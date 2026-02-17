#include <ModBeeGlobal.h>

// =============================================================================
// MODBEE EXAMPLE
// =============================================================================

// Create ModBee API instance
ModBeeAPI modbee;

// =============================================================================
// LOCAL VARIABLES - These will be bound to Modbee Modbus registers
// =============================================================================

// Digital Outputs (Coils 0-7)
bool relay1 = false;
bool relay2 = false;
bool led1 = false;
bool led2 = false;
bool valve1 = false;
bool valve2 = false;
bool pump1 = false;
bool pump2 = false;

// Analog Outputs (Holding Registers 0-3)
int16_t analogOut1 = 0;     // 0-10V output (0-10000 mV)
int16_t analogOut2 = 0;     // 4-20mA output (4000-20000 µA)
int16_t setpoint1 = 0;      // Temperature setpoint
int16_t setpoint2 = 0;      // Pressure setpoint

// Digital Inputs (Discrete Inputs 0-7)
bool button1 = false;
bool button2 = false;
bool sensor1 = false;
bool sensor2 = false;
bool limit1 = false;
bool limit2 = false;
bool alarm1 = false;
bool alarm2 = false;

// Analog Inputs (Input Registers 0-3)
int16_t temperature = 0;    // Temperature sensor (°C * 10)
int16_t pressure = 0;       // Pressure sensor (kPa)
int16_t flow = 0;          // Flow sensor (L/min * 10)
int16_t level = 0;         // Level sensor (% * 10)

// =============================================================================
// REMOTE NODE COMMUNICATION
// =============================================================================

const uint8_t REMOTE_NODE_ID = 2;  // ID of remote node to communicate with

// Arrays for remote operations
bool remoteOutputs[8];      // To send to remote node
int16_t remoteAnalog[4];    // To send to remote node
bool remoteInputs[8];       // Received from remote node
int16_t remoteSensors[4];   // Received from remote node

// =============================================================================
// CALLBACK FUNCTIONS
// =============================================================================

void onModbeeError(ModBeeError error, const char* message) {
    Serial.print("ModBee Error: ");
    Serial.print((int)error);
    Serial.print(" - ");
    Serial.println(message);
}

void onModbeeDebug(const char* category, const char* message) {
    Serial.print("[");
    Serial.print(category);
    Serial.print("] ");
    Serial.println(message);
}

// =============================================================================
// SETUP FUNCTION
// =============================================================================

void setup() {
    Serial.begin(115200);
    Serial.println("ModBee Protocol Example Starting...");
    
    // =============================================================================
    // CONFIGURE MODBEE SETTINGS
    // =============================================================================
    
    // Configure timing parameters (optional but recommended higher values for wireless networks)
    modbee.MODBEE_INTERFRAME_GAP_US = 5000;       // 5000µs between frames (5ms)
    modbee.BASE_TIMEOUT = 100;                    // 100ms token timeout
    modbee.MODBEE_MAX_RETRIES = 2;                // 2 retry attempts

    // Enable fail-safe mode (clears all registers and values on communication loss or node loss)
    modbee.enableFailSafe = true;

    // =============================================================================
    // INITIALIZE MODBEE PROTOCOL
    // =============================================================================
    
    // Start ModBee protocol with Node ID 1
    if (!modbee.begin(&Serial2, 1)) {  // Use Serial2 for RS485 communication
        Serial.println("Failed to initialize ModBee protocol!");
        while (1) delay(1000);
    }
    
    // Register error and debug callbacks
    modbee.onError(onModbeeError);
    modbee.onDebug(onModbeeDebug);
    
    // =============================================================================
    // BIND LOCAL VARIABLES TO MODBUS REGISTERS
    // =============================================================================
    
    // Bind Digital Outputs (Coils) - Writable by remote nodes
    modbee.addCoil(0, &relay1);
    modbee.addCoil(1, &relay2);
    modbee.addCoil(2, &led1);
    modbee.addCoil(3, &led2);
    modbee.addCoil(4, &valve1);
    modbee.addCoil(5, &valve2);
    modbee.addCoil(6, &pump1);
    modbee.addCoil(7, &pump2);
    
    // Bind Analog Outputs (Holding Registers) - Writable by remote nodes
    modbee.addHreg(0, &analogOut1);
    modbee.addHreg(1, &analogOut2);
    modbee.addHreg(2, &setpoint1);
    modbee.addHreg(3, &setpoint2);
    
    // Bind Digital Inputs (Discrete Inputs) - Read-only for remote nodes
    modbee.addIsts(0, &button1);
    modbee.addIsts(1, &button2);
    modbee.addIsts(2, &sensor1);
    modbee.addIsts(3, &sensor2);
    modbee.addIsts(4, &limit1);
    modbee.addIsts(5, &limit2);
    modbee.addIsts(6, &alarm1);
    modbee.addIsts(7, &alarm2);
    
    // Bind Analog Inputs (Input Registers) - Read-only for remote nodes
    modbee.addIreg(0, &temperature);
    modbee.addIreg(1, &pressure);
    modbee.addIreg(2, &flow);
    modbee.addIreg(3, &level);
    
    // =============================================================================
    // CONNECT TO NETWORK
    // =============================================================================
    
    // Connect to the ModBee network
    modbee.connect();
    
    Serial.println("ModBee Protocol initialized successfully!");
    Serial.println("Node ID: 1");
    Serial.println("Waiting for network connection...");
}

// =============================================================================
// MAIN LOOP
// =============================================================================

void loop() {
    // =============================================================================
    // MODBEE PROTOCOL PROCESSING
    // =============================================================================
    
    // Process ModBee protocol (MUST be called every loop)
    modbee.loop();
    
    // =============================================================================
    // READ LOCAL INPUTS
    // =============================================================================
    
    // Read digital inputs (simulate with random values for demo)
    static unsigned long lastInputRead = 0;
    if (millis() - lastInputRead > 100) {  // Read every 100ms
        // In real application, read actual GPIO pins:
        // button1 = digitalRead(BUTTON1_PIN);
        // sensor1 = digitalRead(SENSOR1_PIN);
        
        // For demo, simulate changing inputs
        button1 = (millis() / 1000) % 2;
        sensor1 = (millis() / 2000) % 2;
        alarm1 = (millis() / 5000) % 2;
        
        lastInputRead = millis();
    }
    
    // Read analog inputs (simulate with changing values for demo)
    static unsigned long lastAnalogRead = 0;
    if (millis() - lastAnalogRead > 500) {  // Read every 500ms
        // In real application, read actual ADC:
        // temperature = (analogRead(TEMP_PIN) * 100) / 1024;  // Convert to °C * 10
        
        // For demo, simulate sensor readings
        temperature = 250 + (sin(millis() / 10000.0) * 50);  // 20-30°C
        pressure = 1000 + (cos(millis() / 8000.0) * 200);    // 800-1200 kPa
        flow = 150 + (sin(millis() / 6000.0) * 50);          // 10-20 L/min
        level = 500 + (cos(millis() / 12000.0) * 300);       // 20-80%
        
        lastAnalogRead = millis();
    }
    
    // =============================================================================
    // APPLY LOCAL OUTPUTS
    // =============================================================================
    
    // Apply digital outputs to physical pins
    // digitalWrite(RELAY1_PIN, relay1);
    // digitalWrite(RELAY2_PIN, relay2);
    // digitalWrite(LED1_PIN, led1);
    
    // Apply analog outputs to DACs/PWM
    // analogWrite(ANALOG_OUT1_PIN, map(analogOut1, 0, 10000, 0, 4095));
    
    // =============================================================================
    // COMMUNICATE WITH REMOTE NODES (if connected)
    // =============================================================================
    
    if (modbee.isConnected()) {
        static unsigned long lastRemoteComm = 0;
        
        if (millis() - lastRemoteComm > 1000) {  // Communicate every 1 second
            
            // =============================================================================
            // SEND DATA TO REMOTE NODE
            // =============================================================================
            
            // Prepare data to send to remote node
            remoteOutputs[0] = button1;      // Send our button state as remote output
            remoteOutputs[1] = sensor1;      // Send our sensor state as remote output
            remoteOutputs[2] = false;        // Other outputs off
            remoteOutputs[3] = false;
            
            remoteAnalog[0] = temperature;   // Send our temperature as remote setpoint
            remoteAnalog[1] = pressure;      // Send our pressure as remote setpoint
            
            // Send digital outputs to remote node (coils)
            if (modbee.writeCoil(REMOTE_NODE_ID, 0, remoteOutputs)) {
                Serial.println("Sent digital outputs to remote node");
            }
            
            // Send analog values to remote node (holding registers)
            if (modbee.writeHreg(REMOTE_NODE_ID, 0, remoteAnalog)) {
                Serial.println("Sent analog values to remote node");
            }
            
            // =============================================================================
            // READ DATA FROM REMOTE NODE
            // =============================================================================
            
            // Read remote digital inputs (discrete inputs)
            if (modbee.readIsts(REMOTE_NODE_ID, 0, remoteInputs)) {
                Serial.print("Remote digital inputs: ");
                for (int i = 0; i < 8; i++) {
                    Serial.print(remoteInputs[i] ? "1" : "0");
                    Serial.print(" ");
                }
                Serial.println();
            }
            
            // Read remote analog inputs (input registers)
            if (modbee.readIreg(REMOTE_NODE_ID, 0, remoteSensors)) {
                Serial.print("Remote analog inputs: ");
                for (int i = 0; i < 4; i++) {
                    Serial.print(remoteSensors[i]);
                    Serial.print(" ");
                }
                Serial.println();
            }
            
            lastRemoteComm = millis();
        }
    }
    
    // =============================================================================
    // STATUS MONITORING
    // =============================================================================
    
    static unsigned long lastStatus = 0;
    if (millis() - lastStatus > 5000) {  // Print status every 5 seconds
        
        Serial.println("=== ModBee Status ===");
        Serial.print("Node ID: ");
        Serial.println(modbee.getNodeID());
        Serial.print("Connected: ");
        Serial.println(modbee.isConnected() ? "YES" : "NO");
        Serial.print("Pending Operations: ");
        Serial.println(modbee.getPendingOpCount());
        
        // Print local values
        Serial.println("--- Local Values ---");
        Serial.print("Digital Outputs: ");
        Serial.print(relay1); Serial.print(" ");
        Serial.print(relay2); Serial.print(" ");
        Serial.print(led1); Serial.print(" ");
        Serial.print(led2); Serial.println();
        
        Serial.print("Analog Outputs: ");
        Serial.print(analogOut1); Serial.print(" ");
        Serial.print(analogOut2); Serial.print(" ");
        Serial.print(setpoint1); Serial.print(" ");
        Serial.print(setpoint2); Serial.println();
        
        Serial.print("Digital Inputs: ");
        Serial.print(button1); Serial.print(" ");
        Serial.print(sensor1); Serial.print(" ");
        Serial.print(alarm1); Serial.println();
        
        Serial.print("Analog Inputs: ");
        Serial.print(temperature); Serial.print(" ");
        Serial.print(pressure); Serial.print(" ");
        Serial.print(flow); Serial.print(" ");
        Serial.print(level); Serial.println();
        
        Serial.println("=====================");
        
        lastStatus = millis();
    }
    
    // Small delay to prevent overwhelming the system
    delay(10);
}