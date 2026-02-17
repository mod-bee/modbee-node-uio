#include "ESP32Modbee.h"
#include "ModbeeProtocolGlobal.h"

// Optional debugging (uncomment to enable)
// #define debugf(...) Serial.printf(__VA_ARGS__)

ESP32Modbee::ESP32Modbee(
  uint8_t mode,
  uint8_t ledPin,
  uint8_t sdaPin,
  uint8_t sclPin,
  uint8_t modbusRxPin,
  uint8_t modbusTxPin,
  uint8_t modbusId,
  uint8_t modbeeRxPin,
  uint8_t modbeeTxPin,
  uint8_t modbeeId,
  uint32_t baudrate1,
  uint32_t serialConfig1,
  HardwareSerial* serialPort1,
  uint32_t baudrate2,
  uint32_t serialConfig2,
  HardwareSerial* serialPort2
) : _mode(mode),
    _ledPin(ledPin),
    _sdaPin(sdaPin),
    _sclPin(sclPin),
    _modbusRxPin(modbusRxPin),
    _modbusTxPin(modbusTxPin),
    _baudrate1(baudrate1),
    _serialConfig1(serialConfig1),
    _serialPort1(serialPort1),
    _modbeeID(modbeeId),
    _modbeeRxPin(modbeeRxPin),
    _modbeeTxPin(modbeeTxPin),
    _baudrate2(baudrate2),
    _serialConfig2(serialConfig2),
    _serialPort2(serialPort2),
    _ads(0x49, &Wire1),
    _dac(RESOLUTION_15_BIT, 0x5F, &Wire1),
    modbusID(modbusId),
    isMaster(mode == MB_MASTER),
    _adsInitialized(false),
    _dacInitialized(false),
    DI01(false),
    DI02(false),
    DI03(false),
    DI04(false),
    DI05(false),
    DI06(false),
    DI07(false),
    DI08(false),
    DO01(false),
    DO02(false),
    DO03(false),
    DO04(false),
    DO05(false),
    DO06(false),
    DO07(false),
    DO08(false),
    AI01_Scaled(0),
    AI02_Scaled(0),
    AI03_Scaled(0),
    AI04_Scaled(0),
    AO01_Scaled(0),
    AO02_Scaled(0) {
  _adcModes[AI01] = MODE_VOLTAGE;
  _adcModes[AI02] = MODE_VOLTAGE;
  _adcModes[AI03] = MODE_VOLTAGE;
  _adcModes[AI04] = MODE_VOLTAGE;
  _dacModes[AO01] = MODE_VOLTAGE;
  _dacModes[AO02] = MODE_VOLTAGE;

  _calZeroOffsetADC[AI01] = 0;
  _calZeroOffsetADC[AI02] = 0;
  _calZeroOffsetADC[AI03] = 0;
  _calZeroOffsetADC[AI04] = 0;
  _calLowADC[AI01] = 0;
  _calLowADC[AI02] = 0;
  _calLowADC[AI03] = 0;
  _calLowADC[AI04] = 0;
  _calHighADC[AI01] = 32767;
  _calHighADC[AI02] = 32767;
  _calHighADC[AI03] = 32767;
  _calHighADC[AI04] = 32767;

  _calZeroOffsetDAC[AO01] = 0;
  _calZeroOffsetDAC[AO02] = 0;
  _calLowDAC[AO01] = 0;
  _calLowDAC[AO02] = 0;
  _calHighDAC[AO01] = 32767;
  _calHighDAC[AO02] = 32767;
}

void ESP32Modbee::begin() {
  // Initialize LED
  FastLED.addLeds<WS2812, LED_PIN, GRB>(_leds, 1);
  _leds[0] = CRGB::Green;
  _leds[0].fadeToBlackBy(DEFAULT_LED_BRIGHTNESS);
  FastLED.show();

  // Initialize I2C
  Wire1.begin(_sdaPin, _sclPin);

  // Initialize ADS1115 (gain=2 for ±2.048V, SINGLE SHOT mode for async, 128 sps)
  if (_ads.begin()) {
    _ads.setGain(2);
    _ads.setMode(1);        // SINGLE SHOT MODE for async operation
    _ads.setDataRate(5);
    _adsInitialized = true;
    
    // Start first async read
    _ads.requestADC(AI01);
  }

  // Initialize DAC (GP8413, 15-bit resolution, 10V range)
  if (_dac.begin() == 0) {
    _dac.setDACOutRange(_dac.eOutputRange10V);
    _dacInitialized = true;
  }

  // Initialize filesystem and load calibration
  _initLittleFS();
  _loadCalibration();

  // Initialize Modbus
  if (_mode != MB_NONE) {
    _serialPort1->begin(_baudrate1, _serialConfig1, _modbusRxPin, _modbusTxPin);
    mb.begin(_serialPort1);

    if (isMaster) {
      mb.master();
    } else {
      mb.slave(modbusID);

      // Initialize Coils
      mb.addCoil(mbDO01);
      mb.addCoil(mbDO02);
      mb.addCoil(mbDO03);
      mb.addCoil(mbDO04);
      mb.addCoil(mbDO05);
      mb.addCoil(mbDO06);
      mb.addCoil(mbDO07);
      mb.addCoil(mbDO08);

      // Initialize Input Status
      mb.addIsts(mbDI01);
      mb.addIsts(mbDI02);
      mb.addIsts(mbDI03);
      mb.addIsts(mbDI04);
      mb.addIsts(mbDI05);
      mb.addIsts(mbDI06);
      mb.addIsts(mbDI07);
      mb.addIsts(mbDI08);

      // Initialize Input Registers
      mb.addIreg(mbAI01_SCALED);
      mb.addIreg(mbAI02_SCALED);
      mb.addIreg(mbAI03_SCALED);
      mb.addIreg(mbAI04_SCALED);
      mb.addIreg(mbAI01_RAW);
      mb.addIreg(mbAI02_RAW);
      mb.addIreg(mbAI03_RAW);
      mb.addIreg(mbAI04_RAW);

      // Initialize Holding Registers (0-based)
      mb.addHreg(mbAO01_SCALED, AO01_Scaled);
      mb.addHreg(mbAO02_SCALED, AO02_Scaled);
      mb.addHreg(mbCAL_ZERO_OFFSET_ADC0, _calZeroOffsetADC[AI01]);
      mb.addHreg(mbCAL_ZERO_OFFSET_ADC1, _calZeroOffsetADC[AI02]);
      mb.addHreg(mbCAL_ZERO_OFFSET_ADC2, _calZeroOffsetADC[AI03]);
      mb.addHreg(mbCAL_ZERO_OFFSET_ADC3, _calZeroOffsetADC[AI04]);
      mb.addHreg(mbCAL_ZERO_OFFSET_DAC0, _calZeroOffsetDAC[AO01]);
      mb.addHreg(mbCAL_ZERO_OFFSET_DAC1, _calZeroOffsetDAC[AO02]);
      mb.addHreg(mbCAL_LOW_ADC0, _calLowADC[AI01]);
      mb.addHreg(mbCAL_LOW_ADC1, _calLowADC[AI02]);
      mb.addHreg(mbCAL_LOW_ADC2, _calLowADC[AI03]);
      mb.addHreg(mbCAL_LOW_ADC3, _calLowADC[AI04]);
      mb.addHreg(mbCAL_HIGH_ADC0, _calHighADC[AI01]);
      mb.addHreg(mbCAL_HIGH_ADC1, _calHighADC[AI02]);
      mb.addHreg(mbCAL_HIGH_ADC2, _calHighADC[AI03]);
      mb.addHreg(mbCAL_HIGH_ADC3, _calHighADC[AI04]);
      mb.addHreg(mbCAL_LOW_DAC0, _calLowDAC[AO01]);
      mb.addHreg(mbCAL_LOW_DAC1, _calLowDAC[AO02]);
      mb.addHreg(mbCAL_HIGH_DAC0, _calHighDAC[AO01]);
      mb.addHreg(mbCAL_HIGH_DAC1, _calHighDAC[AO02]);

      // Initialize Coils
      mb.Coil(mbDO01, 0);
      mb.Coil(mbDO02, 0);
      mb.Coil(mbDO03, 0);
      mb.Coil(mbDO04, 0);
      mb.Coil(mbDO05, 0);
      mb.Coil(mbDO06, 0);
      mb.Coil(mbDO07, 0);
      mb.Coil(mbDO08, 0);

      // Initialize Input Status
      mb.Ists(mbDI01, 0);
      mb.Ists(mbDI02, 0);
      mb.Ists(mbDI03, 0);
      mb.Ists(mbDI04, 0);
      mb.Ists(mbDI05, 0);
      mb.Ists(mbDI06, 0);
      mb.Ists(mbDI07, 0);
      mb.Ists(mbDI08, 0);

      // Initialize Input Registers
      mb.Ireg(mbAI01_SCALED, 0);
      mb.Ireg(mbAI02_SCALED, 0);
      mb.Ireg(mbAI03_SCALED, 0);
      mb.Ireg(mbAI04_SCALED, 0);
      mb.Ireg(mbAI01_RAW, 0);
      mb.Ireg(mbAI02_RAW, 0);
      mb.Ireg(mbAI03_RAW, 0);
      mb.Ireg(mbAI04_RAW, 0);

      // Initialize Holding Registers
      mb.Hreg(mbAO01_SCALED, 0);
      mb.Hreg(mbAO02_SCALED, 0);
    }
  }

  _serialPort2->begin(_baudrate2, _serialConfig2, _modbeeRxPin, _modbeeTxPin);

  modbee.begin(_serialPort2, _modbeeID);

  modbee.addCoil(mbDO01, &DO01);
  modbee.addCoil(mbDO02, &DO02);
  modbee.addCoil(mbDO03, &DO03);
  modbee.addCoil(mbDO04, &DO04);
  modbee.addCoil(mbDO05, &DO05);
  modbee.addCoil(mbDO06, &DO06);
  modbee.addCoil(mbDO07, &DO07);
  modbee.addCoil(mbDO08, &DO08);

  modbee.addIsts(mbDI01, &DI01);
  modbee.addIsts(mbDI02, &DI02);
  modbee.addIsts(mbDI03, &DI03);
  modbee.addIsts(mbDI04, &DI04);
  modbee.addIsts(mbDI05, &DI05);
  modbee.addIsts(mbDI06, &DI06);
  modbee.addIsts(mbDI07, &DI07);
  modbee.addIsts(mbDI08, &DI08);

  modbee.addIreg(mbAI01_SCALED, &AI01_Scaled);
  modbee.addIreg(mbAI02_SCALED, &AI02_Scaled);
  modbee.addIreg(mbAI03_SCALED, &AI03_Scaled);
  modbee.addIreg(mbAI04_SCALED, &AI04_Scaled);
  modbee.addIreg(mbAI01_RAW, &AI01_Raw);
  modbee.addIreg(mbAI02_RAW, &AI02_Raw);
  modbee.addIreg(mbAI03_RAW, &AI03_Raw);
  modbee.addIreg(mbAI04_RAW, &AI04_Raw);

  modbee.addHreg(mbAO01_SCALED, &AO01_Scaled);
  modbee.addHreg(mbAO02_SCALED, &AO02_Scaled);
  modbee.addHreg(mbAO01_RAW, &AO01_Raw);
  modbee.addHreg(mbAO02_RAW, &AO02_Raw);

  // --- Calibration registers ---
  modbee.addHreg(mbCAL_ZERO_OFFSET_ADC0, &_calZeroOffsetADC[AI01]);
  modbee.addHreg(mbCAL_ZERO_OFFSET_ADC1, &_calZeroOffsetADC[AI02]);
  modbee.addHreg(mbCAL_ZERO_OFFSET_ADC2, &_calZeroOffsetADC[AI03]);
  modbee.addHreg(mbCAL_ZERO_OFFSET_ADC3, &_calZeroOffsetADC[AI04]);
  modbee.addHreg(mbCAL_ZERO_OFFSET_DAC0, &_calZeroOffsetDAC[AO01]);
  modbee.addHreg(mbCAL_ZERO_OFFSET_DAC1, &_calZeroOffsetDAC[AO02]);

  modbee.addHreg(mbCAL_LOW_ADC0, &_calLowADC[AI01]);
  modbee.addHreg(mbCAL_LOW_ADC1, &_calLowADC[AI02]);
  modbee.addHreg(mbCAL_LOW_ADC2, &_calLowADC[AI03]);
  modbee.addHreg(mbCAL_LOW_ADC3, &_calLowADC[AI04]);

  modbee.addHreg(mbCAL_HIGH_ADC0, &_calHighADC[AI01]);
  modbee.addHreg(mbCAL_HIGH_ADC1, &_calHighADC[AI02]);
  modbee.addHreg(mbCAL_HIGH_ADC2, &_calHighADC[AI03]);
  modbee.addHreg(mbCAL_HIGH_ADC3, &_calHighADC[AI04]);

  modbee.addHreg(mbCAL_LOW_DAC0, &_calLowDAC[AO01]);
  modbee.addHreg(mbCAL_LOW_DAC1, &_calLowDAC[AO02]);

  modbee.addHreg(mbCAL_HIGH_DAC0, &_calHighDAC[AO01]);
  modbee.addHreg(mbCAL_HIGH_DAC1, &_calHighDAC[AO02]);

  // Initialize digital I/O pins
  for (uint8_t i = 0; i < 8; i++) {
    pinMode(_digitalInputPins[i], INPUT);
    pinMode(_digitalOutputPins[i], OUTPUT);
    digitalWrite(_digitalOutputPins[i], LOW);
  }
}

void ESP32Modbee::update() {
  if (_mode != MB_NONE) {
    mb.task();
  }

  // Modbee Protocol
  modbee.loop();

  // Digital Inputs
  DI01 = digitalRead(_digitalInputPins[0]);
  DI02 = digitalRead(_digitalInputPins[1]);
  DI03 = digitalRead(_digitalInputPins[2]);
  DI04 = digitalRead(_digitalInputPins[3]);
  DI05 = digitalRead(_digitalInputPins[4]);
  DI06 = digitalRead(_digitalInputPins[5]);
  DI07 = digitalRead(_digitalInputPins[6]);
  DI08 = digitalRead(_digitalInputPins[7]);

  // Digital Outputs    
  digitalWrite(_digitalOutputPins[0], DO01);
  digitalWrite(_digitalOutputPins[1], DO02);
  digitalWrite(_digitalOutputPins[2], DO03);
  digitalWrite(_digitalOutputPins[3], DO04);
  digitalWrite(_digitalOutputPins[4], DO05);
  digitalWrite(_digitalOutputPins[5], DO06);
  digitalWrite(_digitalOutputPins[6], DO07);
  digitalWrite(_digitalOutputPins[7], DO08);

  // Analog Inputs - ASYNC WITH TIMER
  if (_adsInitialized) {
    static unsigned long lastADCCheck = 0;
    
    // Only check ADC every 10ms
    if (millis() - lastADCCheck >= 5) {
      
      if (_ads.isReady()) {
        // Get the result from previous request
        int16_t rawValue = _ads.getValue();
        
        // Process based on current channel
        switch (_currentADCChannel) {
          case AI01:
            AI01_Raw = rawValue;
            if (rawValue < 0) rawValue = 0;
            AI01_Scaled = _scaleADC(AI01, rawValue);
            if (_mode == MB_SLAVE) {
              mb.Ireg(mbAI01_SCALED, AI01_Scaled);
              mb.Ireg(mbAI01_RAW, rawValue);
            }
            break;
            
          case AI02:
            AI02_Raw = rawValue;
            if (rawValue < 0) rawValue = 0;
            AI02_Scaled = _scaleADC(AI02, rawValue);
            if (_mode == MB_SLAVE) {
              mb.Ireg(mbAI02_SCALED, AI02_Scaled);
              mb.Ireg(mbAI02_RAW, rawValue);
            }
            break;
            
          case AI03:
            AI03_Raw = rawValue;
            if (rawValue < 0) rawValue = 0;
            AI03_Scaled = _scaleADC(AI03, rawValue);
            if (_mode == MB_SLAVE) {
              mb.Ireg(mbAI03_SCALED, AI03_Scaled);
              mb.Ireg(mbAI03_RAW, rawValue);
            }
            break;
            
          case AI04:
            AI04_Raw = rawValue;
            if (rawValue < 0) rawValue = 0;
            AI04_Scaled = _scaleADC(AI04, rawValue);
            if (_mode == MB_SLAVE) {
              mb.Ireg(mbAI04_SCALED, AI04_Scaled);
              mb.Ireg(mbAI04_RAW, rawValue);
            }
            break;
        }
        
        // Move to next channel
        _currentADCChannel++;
        if (_currentADCChannel > AI04) {
          _currentADCChannel = AI01;
        }
        
        // Start next async read
        _ads.requestADC(_currentADCChannel);
      }
      
      lastADCCheck = millis();
    }
  }

  // Analog Outputs
  if (_dacInitialized) {
    // If AO01_Scaled changed, update AO01_Raw and DAC
    int16_t new_ao01_raw = _scaleDAC(AO01, AO01_Scaled);
    if (new_ao01_raw != AO01_Raw) {
      AO01_Raw = new_ao01_raw;
      _dac.setDACOutVoltage(AO01_Raw, 0);
    }
    // If AO01_Raw changed (e.g. via Modbus), update AO01_Scaled and DAC
    int16_t new_ao01_scaled = AO01_Scaled;
    if (AO01_Raw != _scaleDAC(AO01, AO01_Scaled)) {
      new_ao01_scaled = _inverseScaleDAC(AO01, AO01_Raw);
      AO01_Scaled = new_ao01_scaled;
      _dac.setDACOutVoltage(AO01_Raw, 0);
    }

    int16_t new_ao02_raw = _scaleDAC(AO02, AO02_Scaled);
    if (new_ao02_raw != AO02_Raw) {
      AO02_Raw = new_ao02_raw;
      _dac.setDACOutVoltage(AO02_Raw, 1);
    }
    int16_t new_ao02_scaled = AO02_Scaled;
    if (AO02_Raw != _scaleDAC(AO02, AO02_Scaled)) {
      new_ao02_scaled = _inverseScaleDAC(AO02, AO02_Raw);
      AO02_Scaled = new_ao02_scaled;
      _dac.setDACOutVoltage(AO02_Raw, 1);
    }
  }

  // Calibration Sync
  static int16_t lastCalZeroOffsetADC[4], lastCalLowADC[4], lastCalHighADC[4];
  static int16_t lastCalZeroOffsetDAC[2], lastCalLowDAC[2], lastCalHighDAC[2];
  static unsigned long lastSave = 0;
  if (_mode == MB_SLAVE && millis() - lastSave >= 1000) {
    bool changed = false;

    // ADC Calibration
    const HoldingReg adcZeroOffsets[] = {
      mbCAL_ZERO_OFFSET_ADC0,
      mbCAL_ZERO_OFFSET_ADC1,
      mbCAL_ZERO_OFFSET_ADC2,
      mbCAL_ZERO_OFFSET_ADC3
    };
    const HoldingReg adcLows[] = {
      mbCAL_LOW_ADC0,
      mbCAL_LOW_ADC1,
      mbCAL_LOW_ADC2,
      mbCAL_LOW_ADC3
    };
    const HoldingReg adcHighs[] = {
      mbCAL_HIGH_ADC0,
      mbCAL_HIGH_ADC1,
      mbCAL_HIGH_ADC2,
      mbCAL_HIGH_ADC3
    };
    const AnalogInputChannel adcChannels[] = {AI01, AI02, AI03, AI04};

    for (uint8_t i = 0; i < 4; i++) {
      AnalogInputChannel ch = adcChannels[i];
      int16_t regZeroOffset = mb.Hreg(adcZeroOffsets[i]);
      if (_calZeroOffsetADC[ch] != regZeroOffset) {
        _calZeroOffsetADC[ch] = regZeroOffset;
        changed = true;
      }
      int16_t regLow = mb.Hreg(adcLows[i]);
      if (_calLowADC[ch] != regLow) {
        _calLowADC[ch] = regLow;
        changed = true;
      }
      int16_t regHigh = mb.Hreg(adcHighs[i]);
      if (_calHighADC[ch] != regHigh) {
        _calHighADC[ch] = regHigh;
        changed = true;
      }
      if (_calZeroOffsetADC[ch] != lastCalZeroOffsetADC[ch] ||
          _calLowADC[ch] != lastCalLowADC[ch] ||
          _calHighADC[ch] != lastCalHighADC[ch]) {
        changed = true;
        lastCalZeroOffsetADC[ch] = _calZeroOffsetADC[ch];
        lastCalLowADC[ch] = _calLowADC[ch];
        lastCalHighADC[ch] = _calHighADC[ch];
      }
    }

    // DAC Calibration
    const HoldingReg dacZeroOffsets[] = {
      mbCAL_ZERO_OFFSET_DAC0,
      mbCAL_ZERO_OFFSET_DAC1
    };
    const HoldingReg dacLows[] = {
      mbCAL_LOW_DAC0,
      mbCAL_LOW_DAC1
    };
    const HoldingReg dacHighs[] = {
      mbCAL_HIGH_DAC0,
      mbCAL_HIGH_DAC1
    };
    const AnalogOutputChannel dacChannels[] = {AO01, AO02};

    for (uint8_t i = 0; i < 2; i++) {
      AnalogOutputChannel ch = dacChannels[i];
      int16_t regZeroOffset = mb.Hreg(dacZeroOffsets[i]);
      if (_calZeroOffsetDAC[ch] != regZeroOffset) {
        _calZeroOffsetDAC[ch] = regZeroOffset;
        changed = true;
      }
      int16_t regLow = mb.Hreg(dacLows[i]);
      if (_calLowDAC[ch] != regLow) {
        _calLowDAC[ch] = regLow;
        changed = true;
      }
      int16_t regHigh = mb.Hreg(dacHighs[i]);
      if (_calHighDAC[ch] != regHigh) {
        _calHighDAC[ch] = regHigh;
        changed = true;
      }
      if (_calZeroOffsetDAC[ch] != lastCalZeroOffsetDAC[ch] ||
          _calLowDAC[ch] != lastCalLowDAC[ch] ||
          _calHighDAC[ch] != lastCalHighDAC[ch]) {
        changed = true;
        lastCalZeroOffsetDAC[ch] = _calZeroOffsetDAC[ch];
        lastCalLowDAC[ch] = _calLowDAC[ch];
        lastCalHighDAC[ch] = _calHighDAC[ch];
      }
    }

    if (changed) {
      _saveCalibration();
      lastSave = millis();
    }
  }
}

void ESP32Modbee::setADCMode(uint8_t channel, AnalogMode mode) {
  if (channel < 4) {
    _adcModes[channel] = mode;
  }
}

void ESP32Modbee::setDACMode(uint8_t channel, AnalogMode mode) {
  if (channel < 2) {
    _dacModes[channel] = mode;
  }
}

void ESP32Modbee::_initLittleFS() {
  if (!LittleFS.begin(true)) {
    // debugf("LittleFS init failed\n");
    LittleFS.begin(true);
  }
}

void ESP32Modbee::_loadCalibration() {
  File file = LittleFS.open(SETTINGS_FILE, "r");
  if (file) {
    DeserializationError error = deserializeJson(_calibrationDoc, file);
    if (!error && _calibrationDoc.is<JsonObject>()) {
      // Check if keys exist and are arrays
      if (_calibrationDoc["adc_zero_offsets"].is<JsonArray>()) {
        JsonArray adcZeroOffsets = _calibrationDoc["adc_zero_offsets"].as<JsonArray>();
        for (uint8_t i = 0; i < 4 && i < adcZeroOffsets.size(); i++) {
          _calZeroOffsetADC[i] = adcZeroOffsets[i].as<int16_t>();
        }
      }
      if (_calibrationDoc["adc_low"].is<JsonArray>()) {
        JsonArray adcLow = _calibrationDoc["adc_low"].as<JsonArray>();
        for (uint8_t i = 0; i < 4 && i < adcLow.size(); i++) {
          _calLowADC[i] = adcLow[i].as<int16_t>();
        }
      }
      if (_calibrationDoc["adc_high"].is<JsonArray>()) {
        JsonArray adcHigh = _calibrationDoc["adc_high"].as<JsonArray>();
        for (uint8_t i = 0; i < 4 && i < adcHigh.size(); i++) {
          _calHighADC[i] = adcHigh[i].as<int16_t>();
        }
      }
      if (_calibrationDoc["dac_zero_offsets"].is<JsonArray>()) {
        JsonArray dacZeroOffsets = _calibrationDoc["dac_zero_offsets"].as<JsonArray>();
        for (uint8_t i = 0; i < 2 && i < dacZeroOffsets.size(); i++) {
          _calZeroOffsetDAC[i] = dacZeroOffsets[i].as<int16_t>();
        }
      }
      if (_calibrationDoc["dac_low"].is<JsonArray>()) {
        JsonArray dacLow = _calibrationDoc["dac_low"].as<JsonArray>();
        for (uint8_t i = 0; i < 2 && i < dacLow.size(); i++) {
          _calLowDAC[i] = dacLow[i].as<int16_t>();
        }
      }
      if (_calibrationDoc["dac_high"].is<JsonArray>()) {
        JsonArray dacHigh = _calibrationDoc["dac_high"].as<JsonArray>();
        for (uint8_t i = 0; i < 2 && i < dacHigh.size(); i++) {
          _calHighDAC[i] = dacHigh[i].as<int16_t>();
        }
      }
    } else {
      _calibrationDoc.clear();
      JsonArray adcZeroOffsets = _calibrationDoc["adc_zero_offsets"].to<JsonArray>();
      JsonArray dacZeroOffsets = _calibrationDoc["dac_zero_offsets"].to<JsonArray>();
      JsonArray adcLow = _calibrationDoc["adc_low"].to<JsonArray>();
      JsonArray adcHigh = _calibrationDoc["adc_high"].to<JsonArray>();
      JsonArray dacLow = _calibrationDoc["dac_low"].to<JsonArray>();
      JsonArray dacHigh = _calibrationDoc["dac_high"].to<JsonArray>();
      for (uint8_t i = 0; i < 4; i++) {
        adcZeroOffsets.add(0);
        adcLow.add(0);
        adcHigh.add(32767);
        _calZeroOffsetADC[i] = 0;
        _calLowADC[i] = 0;
        _calHighADC[i] = 32767;
      }
      for (uint8_t i = 0; i < 2; i++) {
        dacZeroOffsets.add(0);
        dacLow.add(0);
        dacHigh.add(32767);
        _calZeroOffsetDAC[i] = 0;
        _calLowDAC[i] = 0;
        _calHighDAC[i] = 32767;
      }
      File writeFile = LittleFS.open(SETTINGS_FILE, "w");
      if (writeFile) {
        serializeJson(_calibrationDoc, writeFile);
        writeFile.close();
      } else {
        // debugf("Failed to write default config.json\n");
      }
    }
    file.close();
  } else {
    // File doesn't exist, initialize defaults
    _calibrationDoc.clear();
    JsonArray adcZeroOffsets = _calibrationDoc["adc_zero_offsets"].to<JsonArray>();
    JsonArray dacZeroOffsets = _calibrationDoc["dac_zero_offsets"].to<JsonArray>();
    JsonArray adcLow = _calibrationDoc["adc_low"].to<JsonArray>();
    JsonArray adcHigh = _calibrationDoc["adc_high"].to<JsonArray>();
    JsonArray dacLow = _calibrationDoc["dac_low"].to<JsonArray>();
    JsonArray dacHigh = _calibrationDoc["dac_high"].to<JsonArray>();
    for (uint8_t i = 0; i < 4; i++) {
      adcZeroOffsets.add(0);
      adcLow.add(0);
      adcHigh.add(32767);
      _calZeroOffsetADC[i] = 0;
      _calLowADC[i] = 0;
      _calHighADC[i] = 32767;
    }
    for (uint8_t i = 0; i < 2; i++) {
      dacZeroOffsets.add(0);
      dacLow.add(0);
      dacHigh.add(32767);
      _calZeroOffsetDAC[i] = 0;
      _calLowDAC[i] = 0;
      _calHighDAC[i] = 32767;
    }
    File writeFile = LittleFS.open(SETTINGS_FILE, "w");
    if (writeFile) {
      serializeJson(_calibrationDoc, writeFile);
      writeFile.close();
    } else {
      // debugf("Failed to create config.json\n");
    }
  }
}

void ESP32Modbee::_resetCalibration() {
  _calibrationDoc.clear();
  JsonArray adcZeroOffsets = _calibrationDoc["adc_zero_offsets"].to<JsonArray>();
  JsonArray dacZeroOffsets = _calibrationDoc["dac_zero_offsets"].to<JsonArray>();
  JsonArray adcLow = _calibrationDoc["adc_low"].to<JsonArray>();
  JsonArray adcHigh = _calibrationDoc["adc_high"].to<JsonArray>();
  JsonArray dacLow = _calibrationDoc["dac_low"].to<JsonArray>();
  JsonArray dacHigh = _calibrationDoc["dac_high"].to<JsonArray>();

  adcZeroOffsets.add(0);
  adcZeroOffsets.add(0);
  adcZeroOffsets.add(0);
  adcZeroOffsets.add(0);
  adcLow.add(0);
  adcLow.add(0);
  adcLow.add(0);
  adcLow.add(0);
  adcHigh.add(32767);
  adcHigh.add(32767);
  adcHigh.add(32767);
  adcHigh.add(32767);

  dacZeroOffsets.add(0);
  dacZeroOffsets.add(0);
  dacLow.add(0);
  dacLow.add(0);
  dacHigh.add(32767);
  dacHigh.add(32767);

  _calZeroOffsetADC[AI01] = 0;
  _calZeroOffsetADC[AI02] = 0;
  _calZeroOffsetADC[AI03] = 0;
  _calZeroOffsetADC[AI04] = 0;
  _calLowADC[AI01] = 0;
  _calLowADC[AI02] = 0;
  _calLowADC[AI03] = 0;
  _calLowADC[AI04] = 0;
  _calHighADC[AI01] = 32767;
  _calHighADC[AI02] = 32767;
  _calHighADC[AI03] = 32767;
  _calHighADC[AI04] = 32767;

  _calZeroOffsetDAC[AO01] = 0;
  _calZeroOffsetDAC[AO02] = 0;
  _calLowDAC[AO01] = 0;
  _calLowDAC[AO02] = 0;
  _calHighDAC[AO01] = 32767;
  _calHighDAC[AO02] = 32767;

  File file = LittleFS.open(SETTINGS_FILE, "w");
  if (file) {
    serializeJson(_calibrationDoc, file);
    file.close();
    // debugf("Reset calibration saved to config.json\n");
  } else {
    // debugf("Failed to write reset config.json\n");
  }
}

void ESP32Modbee::_saveCalibration() {
  _calibrationDoc.clear();
  JsonArray adcZeroOffsets = _calibrationDoc["adc_zero_offsets"].to<JsonArray>();
  JsonArray dacZeroOffsets = _calibrationDoc["dac_zero_offsets"].to<JsonArray>();
  JsonArray adcLow = _calibrationDoc["adc_low"].to<JsonArray>();
  JsonArray adcHigh = _calibrationDoc["adc_high"].to<JsonArray>();
  JsonArray dacLow = _calibrationDoc["dac_low"].to<JsonArray>();
  JsonArray dacHigh = _calibrationDoc["dac_high"].to<JsonArray>();

  adcZeroOffsets.add(_calZeroOffsetADC[AI01]);
  adcZeroOffsets.add(_calZeroOffsetADC[AI02]);
  adcZeroOffsets.add(_calZeroOffsetADC[AI03]);
  adcZeroOffsets.add(_calZeroOffsetADC[AI04]);

  adcLow.add(_calLowADC[AI01]);
  adcLow.add(_calLowADC[AI02]);
  adcLow.add(_calLowADC[AI03]);
  adcLow.add(_calLowADC[AI04]);

  adcHigh.add(_calHighADC[AI01]);
  adcHigh.add(_calHighADC[AI02]);
  adcHigh.add(_calHighADC[AI03]);
  adcHigh.add(_calHighADC[AI04]);

  dacZeroOffsets.add(_calZeroOffsetDAC[AO01]);
  dacZeroOffsets.add(_calZeroOffsetDAC[AO02]);

  dacLow.add(_calLowDAC[AO01]);
  dacLow.add(_calLowDAC[AO02]);

  dacHigh.add(_calHighDAC[AO01]);
  dacHigh.add(_calHighDAC[AO02]);

  File file = LittleFS.open(SETTINGS_FILE, "w");
  if (file) {
    serializeJson(_calibrationDoc, file);
    file.close();
    // debugf("Calibration saved: ADC Low[1]=%d, DAC High[0]=%d\n", _calLowADC[AI02], _calHighDAC[AO01]);
  } else {
    // debugf("Failed to write config.json\n");
  }
}

int16_t ESP32Modbee::_scaleADC(uint8_t channel, int16_t adcValue) {
  // channel: 0=AI01, 1=AI02, 2=AI03, 3=AI04
  int32_t outLow = 0;
  int32_t outHigh = _adcModes[channel];
  int32_t rawLow = _calLowADC[channel];
  int32_t rawHigh = _calHighADC[channel];

  if (rawHigh == rawLow) {
    int32_t scaled = (int32_t)adcValue * _adcModes[channel] / 32767;
    scaled += _calZeroOffsetADC[channel];
    if (scaled < 0) scaled = 0;
    if (scaled > _adcModes[channel]) scaled = _adcModes[channel];
    return (int16_t)scaled;
  }

  int32_t scaled = outLow + (int64_t)(adcValue - rawLow) * (outHigh - outLow) / (rawHigh - rawLow);
  scaled += _calZeroOffsetADC[channel];
  if (scaled < 0) scaled = 0;
  if (scaled > _adcModes[channel]) scaled = _adcModes[channel];
  return (int16_t)scaled;
}

int16_t ESP32Modbee::_scaleDAC(uint8_t channel, int16_t value) {
  // channel: 0=AO01, 1=AO02
  int32_t outLow = 0;
  int32_t outHigh = _dacModes[channel];
  int32_t rawLow = _calLowDAC[channel];
  int32_t rawHigh = _calHighDAC[channel];

  if (rawHigh == rawLow) {
    int32_t adjusted = (int32_t)value + _calZeroOffsetDAC[channel];
    if (adjusted < 0) adjusted = 0;
    if (adjusted > _dacModes[channel]) adjusted = _dacModes[channel];
    uint16_t raw = (uint16_t)((adjusted * 32767) / _dacModes[channel]);
    return raw;
  }

  int32_t raw = rawLow + (int64_t)(value - outLow) * (rawHigh - rawLow) / (outHigh - outLow);
  raw += _calZeroOffsetDAC[channel];
  if (raw < 0) raw = 0;
  if (raw > 32767) raw = 32767;
  return (uint16_t)raw;
}

int16_t ESP32Modbee::_inverseScaleDAC(uint8_t channel, int16_t rawValue) {
  // Implement the inverse of _scaleDAC here
  int32_t outLow = 0;
  int32_t outHigh = _dacModes[channel];
  int32_t rawLow = _calLowDAC[channel];
  int32_t rawHigh = _calHighDAC[channel];

  if (rawHigh == rawLow) {
    int32_t scaled = (int32_t)rawValue * outHigh / 32767;
    scaled -= _calZeroOffsetDAC[channel];
    if (scaled < 0) scaled = 0;
    if (scaled > outHigh) scaled = outHigh;
    return (int16_t)scaled;
  }

  int32_t scaled = outLow + (int64_t)(rawValue - rawLow) * (outHigh - outLow) / (rawHigh - rawLow);
  scaled -= _calZeroOffsetDAC[channel];
  if (scaled < 0) scaled = 0;
  if (scaled > outHigh) scaled = outHigh;
  return (int16_t)scaled;
}