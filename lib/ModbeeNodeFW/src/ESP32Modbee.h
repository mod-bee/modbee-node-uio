#ifndef ESP32MODBEE_H
#define ESP32MODBEE_H

#include <Arduino.h>
#include <Wire.h>
#include <LittleFS.h>
#include <FastLED.h>
#include <ModbusRTU.h>
#include <ADS1X15.h>
#include <ModbeeGP8XXX.h>
#include <ArduinoJson.h>
#include <ModBeeProtocol.h>

#define LED_PIN 39
#define DEFAULT_LED_BRIGHTNESS 200
#define SETTINGS_FILE "/config.json"

#define MB_MASTER 1
#define MB_SLAVE 0
#define MB_NONE 2

enum AnalogMode {
  MODE_CURRENT = 20000,
  MODE_VOLTAGE = 10000
};

// Analog input channels for ADC (AI01-AI04)
enum AnalogInputChannel {
  AI01 = 0,
  AI02,
  AI03,
  AI04
};

// Analog output channels for DAC (AO01-AO02)
enum AnalogOutputChannel {
  AO01 = 0,
  AO02
};

// Modbus Coil Registers (mbDO01-mbDO08)
enum CoilReg {
  mbDO01 = 0,
  mbDO02,
  mbDO03,
  mbDO04,
  mbDO05,
  mbDO06,
  mbDO07,
  mbDO08
};

// Modbus Input Status Registers (mbDI01-mbDI08)
enum InputStatusReg {
  mbDI01 = 0,
  mbDI02,
  mbDI03,
  mbDI04,
  mbDI05,
  mbDI06,
  mbDI07,
  mbDI08
};

// Modbus Input Registers (mbAI01-mbAI04 Scaled and Raw)
enum InputReg {
  mbAI01_SCALED = 0,
  mbAI02_SCALED,
  mbAI03_SCALED,
  mbAI04_SCALED,
  mbAI01_RAW,
  mbAI02_RAW,
  mbAI03_RAW,
  mbAI04_RAW
};

// Modbus Holding Registers (0-based addressing)
enum HoldingReg {
  mbAO01_SCALED = 0,
  mbAO02_SCALED,
  mbAO01_RAW,
  mbAO02_RAW,
  mbCAL_ZERO_OFFSET_ADC0,
  mbCAL_ZERO_OFFSET_ADC1,
  mbCAL_ZERO_OFFSET_ADC2,
  mbCAL_ZERO_OFFSET_ADC3,
  mbCAL_ZERO_OFFSET_DAC0,
  mbCAL_ZERO_OFFSET_DAC1,
  mbCAL_LOW_ADC0,
  mbCAL_LOW_ADC1,
  mbCAL_LOW_ADC2,
  mbCAL_LOW_ADC3,
  mbCAL_HIGH_ADC0,
  mbCAL_HIGH_ADC1,
  mbCAL_HIGH_ADC2,
  mbCAL_HIGH_ADC3,
  mbCAL_LOW_DAC0,
  mbCAL_LOW_DAC1,
  mbCAL_HIGH_DAC0,
  mbCAL_HIGH_DAC1
};

class ESP32Modbee {
public:
  ESP32Modbee(
    uint8_t mode,
    uint8_t ledPin = LED_PIN,
    uint8_t sdaPin = 37,
    uint8_t sclPin = 38,
    uint8_t modbusRxPin = 18,
    uint8_t modbusTxPin = 17,
    uint8_t modbusId = 1,
    uint8_t modbeeRxPin = 16,
    uint8_t modbeeTxPin = 15,
    uint8_t modbeeId = 1,
    uint32_t baudrate1 = 9600,
    uint32_t serialConfig1 = SERIAL_8N1,
    HardwareSerial* serialPort1 = &Serial1,
    uint32_t baudrate2 = 9600,
    uint32_t serialConfig2 = SERIAL_8N1,
    HardwareSerial* serialPort2 = &Serial2
  );

  void begin();
  void update();

  void setADCMode(uint8_t channel, AnalogMode mode);
  void setDACMode(uint8_t channel, AnalogMode mode);

  bool DI01, DI02, DI03, DI04, DI05, DI06, DI07, DI08;
  bool DO01, DO02, DO03, DO04, DO05, DO06, DO07, DO08;

  int16_t AI01_Scaled, AI02_Scaled, AI03_Scaled, AI04_Scaled;
  int16_t AO01_Scaled, AO02_Scaled;
  int16_t AI01_Raw, AI02_Raw, AI03_Raw, AI04_Raw;
  int16_t AO01_Raw, AO02_Raw;
  int16_t _calZeroOffsetADC[4];
  int16_t _calLowADC[4];
  int16_t _calHighADC[4];
  int16_t _calZeroOffsetDAC[2];
  int16_t _calLowDAC[2];
  int16_t _calHighDAC[2];

  ModbusRTU mb;
  uint8_t modbusID;
  bool isMaster;

  uint8_t modbeeID;

  void _resetCalibration();

private:
  friend class ModbeeWebServer; // Allow ModbeeWebServer to access private members

  uint8_t _mode;
  uint8_t _ledPin, _sdaPin, _sclPin, _modbusRxPin, _modbusTxPin;
  uint32_t _baudrate1;
  uint32_t _serialConfig1;
  HardwareSerial* _serialPort1;

  uint8_t  _modbeeID, _modbeeRxPin, _modbeeTxPin;
  uint32_t _baudrate2;
  uint32_t _serialConfig2;
  HardwareSerial* _serialPort2;

  CRGB _leds[1];
  ADS1115 _ads;
  ModbeeGP8413 _dac;

  bool _adsInitialized, _dacInitialized;
  AnalogMode _adcModes[4];
  AnalogMode _dacModes[2];

  const uint8_t _analogInputChannels[4] = {0, 1, 2, 3};
  const uint8_t _digitalInputPins[8] = {1, 2, 3, 4, 5, 6, 7, 8};
  const uint8_t _digitalOutputPins[8] = {11, 12, 13, 14, 33, 34, 35, 36};

  JsonDocument _calibrationDoc;

  void _initLittleFS();
  void _loadCalibration();
  void _saveCalibration();
  int16_t _scaleADC(uint8_t channel, int16_t adcValue);
  int16_t _scaleDAC(uint8_t channel, int16_t value);
  int16_t _inverseScaleDAC(uint8_t channel, int16_t rawValue);

  // Add async ADC state tracking
  uint8_t _currentADCChannel = 0;
  bool _adcReadInProgress = false;
};

#endif