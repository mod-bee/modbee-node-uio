#include <ESP32Modbee.h>

// Initialize ESP32Modbee as slave
ESP32Modbee io(
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

unsigned long lastPrintTime = 0;
const unsigned long printInterval = 1000;

void printIOStatus() {
  // Print slave (local) I/O
  Serial.println("Slave I/O Status:");
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
  // Configure AI03, AI04, AO01, AO02 for voltage mode (0–10V, 0–10000 mV)
  io.setADCMode(0, MODE_VOLTAGE); // AI01
  io.setADCMode(1, MODE_VOLTAGE); // AI02
  io.setADCMode(2, MODE_VOLTAGE); // AI03
  io.setADCMode(3, MODE_VOLTAGE); // AI04
  io.setDACMode(0, MODE_VOLTAGE); // AO01
  io.setDACMode(1, MODE_VOLTAGE); // AO02
}

void loop() {
  io.update();

  // Non-blocking serial prints every 1000ms
  unsigned long currentTime = millis();
  if (currentTime - lastPrintTime >= printInterval) {
    printIOStatus();
    lastPrintTime = currentTime;
  }
}