#include <ESP32Modbee.h>

// Set mode to master
//#define MB_MODE MB_MASTER

// Initialize ESP32Modbee as master
ESP32Modbee io(
  MB_MASTER,            // mode
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

// Slave configuration for one MB_MODBEE_NODE_UIO node (ID 1)
#define NUM_SLAVES 1
uint8_t slaveIDs[NUM_SLAVES] = {1}; // Slave ID
bool slaveDI[NUM_SLAVES][8];        // Digital inputs
bool slaveDO[NUM_SLAVES][8];        // Digital outputs
int16_t slaveAI[NUM_SLAVES][4];     // Scaled analog inputs
int16_t slaveAO[NUM_SLAVES][2];     // Scaled analog outputs

unsigned long lastPrintTime = 0;
const unsigned long printInterval = 1000;

void setup() {
  Serial.begin(115200);
  io.begin();
  // Configure AI03, AI04, AO01, AO02 for voltage mode (0–10V, 0–10000 mV)
  io.setADCMode(0, MODE_VOLTAGE); // AI01
  io.setADCMode(1, MODE_VOLTAGE); // AI02
  io.setADCMode(2, MODE_VOLTAGE); // AI03
  io.setADCMode(3, MODE_VOLTAGE); // AI04
  io.setDACMode(0, MODE_VOLTAGE); // AO01
  io.setDACMode(1, MODE_VOLTAGE); // AO02

  // Initialize slave I/O arrays
  for (uint8_t i = 0; i < NUM_SLAVES; i++) {
    for (uint8_t j = 0; j < 8; j++) {
      slaveDI[i][j] = false;
      slaveDO[i][j] = false;
    }
    for (uint8_t j = 0; j < 4; j++) {
      slaveAI[i][j] = 0;
    }
    for (uint8_t j = 0; j < 2; j++) {
      slaveAO[i][j] = 0;
    }
  }
}

void pollSlaves() {
  for (uint8_t i = 0; i < NUM_SLAVES; i++) {
    uint8_t slaveId = slaveIDs[i];

    // Read ISTS (8 DI)
    bool diData[8];
    io.mb.readIsts(slaveId, 0, diData, 8);
    for (uint8_t j = 0; j < 8; j++) {
      slaveDI[i][j] = diData[j];
    }

    // Read IREG (4 AI, only need AI03, AI04)
    uint16_t aiData[4];
    io.mb.readIreg(slaveId, 0, aiData, 4);
    for (uint8_t j = 0; j < 4; j++) {
      slaveAI[i][j] = aiData[j];
    }

    // Write COIL (8 DO)
    for (uint8_t j = 0; j < 8; j++) {
      io.mb.writeCoil(slaveId, j, slaveDO[i][j]);
    }

    // Write HREG (2 AO)
    for (uint8_t j = 0; j < 2; j++) {
      io.mb.writeHreg(slaveId, j, slaveAO[i][j]);
    }
  }
}

void updateReciprocalIO() {
  // Slave index (ID 1)
  uint8_t idx = 0;

  // Digital I/O: Slave DI → Master DO, Master DI → Slave DO
  io.DO01 = slaveDI[idx][0]; slaveDO[idx][0] = io.DI01;
  io.DO02 = slaveDI[idx][1]; slaveDO[idx][1] = io.DI02;
  io.DO03 = slaveDI[idx][2]; slaveDO[idx][2] = io.DI03;
  io.DO04 = slaveDI[idx][3]; slaveDO[idx][3] = io.DI04;
  io.DO05 = slaveDI[idx][4]; slaveDO[idx][4] = io.DI05;
  io.DO06 = slaveDI[idx][5]; slaveDO[idx][5] = io.DI06;
  io.DO07 = slaveDI[idx][6]; slaveDO[idx][6] = io.DI07;
  io.DO08 = slaveDI[idx][7]; slaveDO[idx][7] = io.DI08;

  // Analog I/O: Slave AI03, AI04 → Master AO01, AO02; Master AI03, AI04 → Slave AO01, AO02
  io.AO01_Scaled = slaveAI[idx][2]; // Slave AI03_Scaled → Master AO01_Scaled
  io.AO02_Scaled = slaveAI[idx][3]; // Slave AI04_Scaled → Master AO02_Scaled
  slaveAO[idx][0] = io.AI03_Scaled; // Master AI03_Scaled → Slave AO01_Scaled
  slaveAO[idx][1] = io.AI04_Scaled; // Master AI04_Scaled → Slave AO02_Scaled
}

void printIOStatus() {
  // Print master (local) I/O
  Serial.println("Master I/O Status:");
  Serial.printf("DI: %d %d %d %d %d %d %d %d\n", 
                io.DI01, io.DI02, io.DI03, io.DI04, io.DI05, io.DI06, io.DI07, io.DI08);
  Serial.printf("DO: %d %d %d %d %d %d %d %d\n", 
                io.DO01, io.DO02, io.DO03, io.DO04, io.DO05, io.DO06, io.DO07, io.DO08);
  Serial.printf("AI01_Scaled: %d mV, AI02_Scaled: %d mV, AI03_Scaled: %d mV, AI04_Scaled: %d mV\n", 
                io.AI01_Scaled, io.AI02_Scaled, io.AI03_Scaled, io.AI04_Scaled);
  Serial.printf("AO01_Scaled: %d mV, AO02_Scaled: %d mV\n", io.AO01_Scaled, io.AO02_Scaled);

  // Print slave I/O (ID 1)
  Serial.println("Slave I/O Status:");
  Serial.printf("DI: %d %d %d %d %d %d %d %d\n", 
                slaveDI[0][0], slaveDI[0][1], slaveDI[0][2], slaveDI[0][3],
                slaveDI[0][4], slaveDI[0][5], slaveDI[0][6], slaveDI[0][7]);
  Serial.printf("DO: %d %d %d %d %d %d %d %d\n", 
                slaveDO[0][0], slaveDO[0][1], slaveDO[0][2], slaveDO[0][3],
                slaveDO[0][4], slaveDO[0][5], slaveDO[0][6], slaveDO[0][7]);
  Serial.printf("AI01_Scaled: %d mV, AI02_Scaled: %d mV AI03_Scaled: %d mV, AI04_Scaled: %d mV\n", slaveAI[0][0], slaveAI[0][1], slaveAI[0][2], slaveAI[0][3]);
  Serial.printf("AO01_Scaled: %d mV, AO02_Scaled: %d mV\n", slaveAO[0][0], slaveAO[0][1]);
  Serial.println();
}

void loop() {
  io.update();
  pollSlaves();
  updateReciprocalIO();

  // Non-blocking serial prints every 1000ms
  unsigned long currentTime = millis();
  if (currentTime - lastPrintTime >= printInterval) {
    printIOStatus();
    lastPrintTime = currentTime;
  }
}