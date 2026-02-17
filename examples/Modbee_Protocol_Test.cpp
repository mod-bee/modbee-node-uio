#include <ESP32Modbee.h>
#include <ModbeeWebServer.h>
#include <ModbeeProtocolGlobal.h>

//Set to 1 to enable Debug
#define DEBUG 1

#if DEBUG == 1
#define debugf Serial.printf

#else
#define debugf
#endif

// Set mode to slave
#define MB_MODE MB_SLAVE
// Target ID of ModBee node
#define ModBeeDestNodeID 1

unsigned long iterationCount = 0;  // Count of loop iterations

// Initialize ESP32Modbee
ESP32Modbee fw(
  MB_SLAVE,           // mode
  LED_PIN,            // ledPin
  37, 38,             // sdaPin, sclPin
  18, 17,             // modbusRxPin, modbusTxPin
  1,                  // modbusId
  16, 15,             // modbeeRxPin, modbeeTxPin 
  5,                  // modbeeId
  115200, SERIAL_8N1, // baudrate1, serialConfig1 //Modbus
  &Serial1,           // serialPort1
  115200, SERIAL_8N1, // baudrate2, serialConfig2 //ModBee
  &Serial2            // serialPort2
);

// Initialize web server
ModbeeWebServer webServer(fw);

// Optional: handle protocol errors and events
void onModbeeError(ModBeeError error, const char* msg) {
    Serial.printf("[ModBee Error/Event] %d - %s\n", error, msg);
}

void onModbeeDebug(const char* category, const char* msg) {
    Serial.printf("[ModBee Debug %s] %s\n", category, msg);
}

unsigned long lastPrintTime = 0;
const unsigned long printInterval = 1000;

bool remoteInputs[8] = {false, false, false, false, false, false, false, false};
bool localInputs[8] = {false, false, false, false, false, false, false, false};
int16_t remoteAnalogInputs[2] = {0, 0};
int16_t localAnalogInputs[2] = {0, 0};

void printIOStatus() {
  // Print slave (local) I/O
  Serial.println("Slave I/O Status:");
  Serial.printf("DI: %d %d %d %d %d %d %d %d\n", 
                fw.DI01, fw.DI02, fw.DI03, fw.DI04, fw.DI05, fw.DI06, fw.DI07, fw.DI08);
  Serial.printf("DO: %d %d %d %d %d %d %d %d\n", 
                fw.DO01, fw.DO02, fw.DO03, fw.DO04, fw.DO05, fw.DO06, fw.DO07, fw.DO08);
  Serial.printf("AI01_Scaled: %d mV, AI02_Scaled: %d mV, AI03_Scaled: %d mV, AI04_Scaled: %d mV\n", 
                fw.AI01_Scaled, fw.AI02_Scaled, fw.AI03_Scaled, fw.AI04_Scaled);
  Serial.printf("AO01_Scaled: %d mV, AO02_Scaled: %d mV\n", fw.AO01_Scaled, fw.AO02_Scaled);
  Serial.println();

  if (DEBUG) {
  debugf("Remote DI -> Local DO: %d %d %d %d %d %d %d %d\n", 
        remoteInputs[0], remoteInputs[1], remoteInputs[2], remoteInputs[3],
        remoteInputs[4], remoteInputs[5], remoteInputs[6], remoteInputs[7]);
  }

  if (DEBUG) {
  debugf("Local DI -> Remote DO: %d %d %d %d %d %d %d %d\n", 
        fw.DI01, fw.DI02, fw.DI03, fw.DI04, fw.DI05, fw.DI06, fw.DI07, fw.DI08);
  }

  if (DEBUG) {
  debugf("Remote AI -> Local AO: %d mV, %d mV\n", remoteAnalogInputs[0], remoteAnalogInputs[1]);
  }

  if (DEBUG) {
  debugf("Local AI -> Remote AO: %d mV, %d mV\n", fw.AI01_Scaled, fw.AI02_Scaled);
  }
  
  Serial.println();
}

void setup() {
  Serial.begin(115200);
  fw.begin();
  webServer.begin();

  modbee.MODBEE_INTERFRAME_GAP_US = 5000;
  modbee.enableFailSafe = true; // Enable fail-safe mode

  // Connect to the ModBee network
  modbee.connect();

  // Register the error handlers
  modbee.onError(onModbeeError);
  modbee.onDebug(onModbeeDebug);

  // Configure AI03, AI04, AO01, AO02 for voltage mode (0–10V, 0–10000 mV)
  fw.setADCMode(0, MODE_CURRENT); // AI01
  fw.setADCMode(1, MODE_CURRENT); // AI02
  fw.setADCMode(2, MODE_CURRENT); // AI03
  fw.setADCMode(3, MODE_CURRENT); // AI04
  fw.setDACMode(0, MODE_VOLTAGE); // AO01
  fw.setDACMode(1, MODE_VOLTAGE); // AO02
}

void loop() {

  iterationCount++;

  fw.update();
  webServer.update();

  //*

  // STEP 1: Read remote node's digital inputs and map to our digital outputs
  // --------------------------------------------------------------------
  // The remote node's digital inputs will be read using readIsts() 
  // (discrete input status) as they're connected to the remote node's physical inputs
  modbee.readIsts(ModBeeDestNodeID, 0, remoteInputs);
  
  // Apply remote inputs to our outputs (DI from remote → DO locally)
  
  fw.DO01 = remoteInputs[0];
  fw.DO02 = remoteInputs[1];
  fw.DO03 = remoteInputs[2];
  fw.DO04 = remoteInputs[3];
  fw.DO05 = remoteInputs[4];
  fw.DO06 = remoteInputs[5];
  fw.DO07 = remoteInputs[6];
  fw.DO08 = remoteInputs[7];
  
  //*/

  ///*

  // STEP 2: Send our digital inputs to remote node's digital outputs
  // --------------------------------------------------------------------
  // Our local digital inputs will be written to the remote node's coils (outputs)

  
  localInputs[0] = fw.DI01;
  localInputs[1] = fw.DI02;
  localInputs[2] = fw.DI03;
  localInputs[3] = fw.DI04; 
  localInputs[4] = fw.DI05;
  localInputs[5] = fw.DI06;
  localInputs[6] = fw.DI07;
  localInputs[7] = fw.DI08; 
     

  // Write our DI to remote node's DO (DI locally → Coil/DO remotely)
  //modbee.writeCoil(ModBeeDestNodeID, 0, localInputs);

  //*/


  //*

  // STEP 3: Read remote node's analog inputs and map to our analog outputs
  // --------------------------------------------------------------------
  // The remote node's analog inputs will be read using readIreg()
  // (input registers) as they're connected to the remote node's physical analog inputs
  modbee.readIreg(ModBeeDestNodeID, 0, remoteAnalogInputs);
  
  // Apply remote analog inputs to our analog outputs (AI from remote → AO locally)
  
  fw.AO01_Scaled = remoteAnalogInputs[0];
  fw.AO02_Scaled = remoteAnalogInputs[1];

  //*/

  ///*

  // STEP 4: Send our analog inputs to remote node's analog outputs
  // --------------------------------------------------------------------
  // Our local analog inputs will be written to the remote node's holding registers (analog outputs)
  
  localAnalogInputs[0] = fw.AI01_Scaled;
  localAnalogInputs[1] = fw.AI02_Scaled;
  

  // Write our AI to remote node's AO (AI locally → Hreg/AO remotely)
  //modbee.writeHreg(ModBeeDestNodeID, 0, localAnalogInputs);

  //*/


  // Non-blocking serial prints every 1000ms
  unsigned long currentTime = millis();
  if (currentTime - lastPrintTime >= printInterval) {

    float avgLoopTime = 1000.0 / iterationCount;
    float countPerUs = iterationCount / 1000.0; // Count per microsecond

    Serial.println(iterationCount);
    Serial.println(avgLoopTime);  // Print with 2 decimal places
    Serial.println(countPerUs);    // Print with 2 decimal places

    
    // Reset counter and update last print time
    iterationCount = 0;

    if (DEBUG) {
      printIOStatus();
    }
    lastPrintTime = currentTime;
  }
}