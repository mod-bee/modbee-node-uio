#include <ESP32Modbee.h>
#include <ModbeeWebServer.h>

// Initialize ESP32Modbee for standalone use
ESP32Modbee io(
  MB_NONE,            // mode
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

// Initialize ModbeeWebServer
ModbeeWebServer webServer(io, 80);

unsigned long lastPrintTime = 0;
const unsigned long printInterval = 1000;

void printIOStatus() {
  // Print all I/O statuses
  Serial.println("Standalone I/O Status:");
  Serial.printf("DI: %d %d %d %d %d %d %d %d\n", 
                io.DI01, io.DI02, io.DI03, io.DI04, io.DI05, io.DI06, io.DI07, io.DI08);
  Serial.printf("DO: %d %d %d %d %d %d %d %d\n", 
                io.DO01, io.DO02, io.DO03, io.DO04, io.DO05, io.DO06, io.DO07, io.DO08);
  Serial.printf("AI01_Scaled: %d mV, AI02_Scaled: %d mV, AI03_Scaled: %d mV, AI04_Scaled: %d mV\n",
                io.AI01_Scaled, io.AI02_Scaled, io.AI03_Scaled, io.AI04_Scaled);
  Serial.printf("AO01_Scaled: %d mV, AO02_Scaled: %d mV\n", io.AO01_Scaled, io.AO02_Scaled);
  Serial.println();
}

void setup() {
  Serial.begin(115200);
  io.begin();
  webServer.begin();  // Initialize webserver
  // Configure AI01–AI04, AO01–AO02 for voltage mode (0–10V, 0–10000 mV), current mode (0-20ma 0-20000ua)
  io.setADCMode(0, MODE_VOLTAGE); // AI01
  io.setADCMode(1, MODE_VOLTAGE); // AI02
  io.setADCMode(2, MODE_VOLTAGE); // AI03
  io.setADCMode(3, MODE_VOLTAGE); // AI04
  io.setDACMode(0, MODE_VOLTAGE); // AO01
  io.setDACMode(1, MODE_VOLTAGE); // AO02
}

void loop() {
  io.update();
  webServer.update();  // Update webserver

  // Example reciprocal I/O
  io.DO01 = io.DI01; // Mirror DI01 to DO01
  io.DO02 = io.DI02; // Mirror DI02 to DO02
  io.DO03 = io.DI03; // Mirror DI03 to DO03
  io.DO04 = io.DI04; // Mirror DI04 to DO04
  io.DO05 = io.DI05; // Mirror DI05 to DO05
  io.DO06 = io.DI06; // Mirror DI06 to DO06
  io.DO07 = io.DI07; // Mirror DI07 to DO07
  io.DO08 = io.DI08; // Mirror DI08 to DO08
  io.AO01_Scaled = io.AI03_Scaled; // Map AI03 to AO01
  io.AO02_Scaled = io.AI04_Scaled; // Map AI04 to AO02

  // Non-blocking serial prints every 1000ms
  unsigned long currentTime = millis();
  if (currentTime - lastPrintTime >= printInterval) {
    printIOStatus();
    lastPrintTime = currentTime;
  }
}