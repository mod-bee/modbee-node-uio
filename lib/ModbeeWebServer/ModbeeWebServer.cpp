#include "ModbeeWebServer.h"

#define debugf(...) Serial.printf(__VA_ARGS__)

ModbeeWebServer::ModbeeWebServer(ESP32Modbee& modbee, uint16_t port)
  : _modbee(modbee), _server(port), _ws("/ws"), _lastWsSend(0) {
  debugf("ModbeeWebServer constructor called, port=%d\n", port);
}

void ModbeeWebServer::begin() {
  debugf("ModbeeWebServer::begin started\n");
  
  _initLittleFS();
  _initWiFi();

  // Serve static files from LittleFS
  debugf("Setting up static file server\n");
  _server.serveStatic("/", LittleFS, "/www/").setDefaultFile("index.html");

  // WebSocket setup
  debugf("Setting up WebSocket handler\n");
  _ws.onEvent([this](AsyncWebSocket* server, AsyncWebSocketClient* client, AwsEventType type, void* arg, uint8_t* data, size_t len) {
    _onWsEvent(server, client, type, arg, data, len);
  });
  _server.addHandler(&_ws);

  // Handle Wi-Fi configuration
  debugf("Setting up /wifi POST handler\n");
  _server.on("/wifi", HTTP_POST, [this](AsyncWebServerRequest* request) {
    debugf("Received /wifi POST request\n");
    if (request->hasParam("ssid", true) && request->hasParam("password", true)) {
      String ssid = request->getParam("ssid", true)->value();
      String password = request->getParam("password", true)->value();
      debugf("WiFi config: SSID=%s, Password=%s\n", ssid.c_str(), password.c_str());
      _saveWiFiConfig(ssid, password);
      _connectToWiFi(ssid, password);
      request->send(200, "application/json", "{\"status\":\"Connecting to " + ssid + "\"}");
    } else {
      debugf("Missing SSID or password in /wifi POST\n");
      request->send(400, "application/json", "{\"error\":\"Missing SSID or password\"}");
    }
  });

  // Add a not-found handler to debug 404s
  _server.onNotFound([](AsyncWebServerRequest* request) {
    debugf("404: %s\n", request->url().c_str());
    request->send(404, "text/plain", "Not found");
  });

  // Add a test endpoint
  _server.on("/test", HTTP_GET, [](AsyncWebServerRequest* request) {
    debugf("Test endpoint accessed\n");
    request->send(200, "text/plain", "Test OK");
  });

  debugf("Starting web server\n");
  _server.begin();
  debugf("Web server started, free heap: %d bytes\n", ESP.getFreeHeap());
}

void ModbeeWebServer::update() {
  _ws.cleanupClients();
  if (millis() - _lastWsSend >= WEBSOCKET_INTERVAL) {
    _sendWsUpdate();
    _lastWsSend = millis();
  }
}

void ModbeeWebServer::_initLittleFS() {
  debugf("Initializing LittleFS\n");
  if (!LittleFS.begin(true)) {
    debugf("LittleFS init failed, retrying\n");
    if (!LittleFS.begin(true)) {
      debugf("LittleFS init failed again\n");
      return;
    }
  }
  // List all files in LittleFS
  debugf("Listing LittleFS contents:\n");
  File root = LittleFS.open("/");
  File file = root.openNextFile();
  while (file) {
    debugf("File: %s, size=%d bytes\n", file.name(), file.size());
    file = root.openNextFile();
  }
  // Check for index.html
  file = LittleFS.open("/www/index.html", "r");
  if (!file) {
    debugf("Error: /www/index.html not found\n");
  } else {
    debugf("Found /www/index.html, size=%d bytes\n", file.size());
    file.close();
  }
  // Ensure wifi.json exists
  if (!LittleFS.exists(WIFI_CONFIG_FILE)) {
    debugf("Creating empty %s\n", WIFI_CONFIG_FILE);
    File wifiFile = LittleFS.open(WIFI_CONFIG_FILE, "w");
    if (wifiFile) {
      wifiFile.println("{}");
      wifiFile.close();
      debugf("Empty %s created\n", WIFI_CONFIG_FILE);
    } else {
      debugf("Failed to create %s\n", WIFI_CONFIG_FILE);
    }
  }
}

void ModbeeWebServer::_initWiFi() {
  debugf("Initializing WiFi\n");
  _loadWiFiConfig();
  if (WiFi.status() != WL_CONNECTED) {
    debugf("No WiFi connection, starting AP (SSID=%s)\n", AP_SSID);
    _startAP();
  } else {
    debugf("WiFi connected, IP=%s\n", WiFi.localIP().toString().c_str());
  }
}

void ModbeeWebServer::_loadWiFiConfig() {
  debugf("Loading WiFi config from %s\n", WIFI_CONFIG_FILE);
  if (!LittleFS.exists(WIFI_CONFIG_FILE)) {
    debugf("No WiFi config found, using AP mode\n");
    return;
  }
  File file = LittleFS.open(WIFI_CONFIG_FILE, "r");
  if (!file) {
    debugf("Failed to open %s\n", WIFI_CONFIG_FILE);
    return;
  }
  DeserializationError error = deserializeJson(_jsonDoc, file);
  if (error) {
    debugf("JSON parsing error: %s\n", error.c_str());
    file.close();
    return;
  }
  if (_jsonDoc.is<JsonObject>()) {
    String ssid = _jsonDoc["ssid"] | "";
    String password = _jsonDoc["password"] | "";
    debugf("Loaded WiFi config: SSID=%s\n", ssid.c_str());
    if (ssid.length() > 0) {
      _connectToWiFi(ssid, password);
    }
  }
  file.close();
}

void ModbeeWebServer::_saveWiFiConfig(const String& ssid, const String& password) {
  debugf("Saving WiFi config: SSID=%s\n", ssid.c_str());
  _jsonDoc.clear();
  _jsonDoc["ssid"] = ssid;
  _jsonDoc["password"] = password;
  File file = LittleFS.open(WIFI_CONFIG_FILE, "w");
  if (!file) {
    debugf("Failed to open %s for writing\n", WIFI_CONFIG_FILE);
    return;
  }
  serializeJson(_jsonDoc, file);
  file.close();
  debugf("WiFi config saved\n");
}

void ModbeeWebServer::_startAP() {
  debugf("Starting AP: SSID=%s\n", AP_SSID);
  WiFi.mode(WIFI_AP);
  WiFi.softAP(AP_SSID, AP_PASSWORD);
  debugf("AP started, IP=%s\n", WiFi.softAPIP().toString().c_str());
}

void ModbeeWebServer::_connectToWiFi(const String& ssid, const String& password) {
  debugf("Connecting to WiFi: SSID=%s\n", ssid.c_str());
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid.c_str(), password.c_str());
  unsigned long startTime = millis();
  while (WiFi.status() != WL_CONNECTED && millis() - startTime < 10000) {
    delay(500);
    debugf("WiFi connecting...\n");
  }
  if (WiFi.status() != WL_CONNECTED) {
    debugf("WiFi connection failed, starting AP\n");
    _startAP();
  } else {
    debugf("WiFi connected, IP=%s\n", WiFi.localIP().toString().c_str());
  }
}

void ModbeeWebServer::_sendWsUpdate() {
  debugf("Sending WebSocket update, free heap: %d bytes\n", ESP.getFreeHeap());
  _jsonDoc.clear();
  JsonObject io = _jsonDoc.createNestedObject("io");
  JsonArray di = io.createNestedArray("di");
  JsonArray do_ = io.createNestedArray("do");
  JsonArray ai_scaled = io.createNestedArray("ai_scaled");
  JsonArray ao_scaled = io.createNestedArray("ao_scaled");

  di.add(_modbee.DI01); di.add(_modbee.DI02); di.add(_modbee.DI03); di.add(_modbee.DI04);
  di.add(_modbee.DI05); di.add(_modbee.DI06); di.add(_modbee.DI07); di.add(_modbee.DI08);
  do_.add(_modbee.DO01); do_.add(_modbee.DO02); do_.add(_modbee.DO03); do_.add(_modbee.DO04);
  do_.add(_modbee.DO05); do_.add(_modbee.DO06); do_.add(_modbee.DO07); do_.add(_modbee.DO08);
  ai_scaled.add(_modbee.AI01_Scaled); ai_scaled.add(_modbee.AI02_Scaled);
  ai_scaled.add(_modbee.AI03_Scaled); ai_scaled.add(_modbee.AI04_Scaled);
  ao_scaled.add(_modbee.AO01_Scaled); ao_scaled.add(_modbee.AO02_Scaled);

  JsonObject calibration = _jsonDoc.createNestedObject("calibration");
  JsonArray adc_zero_offsets = calibration.createNestedArray("adc_zero_offsets");
  JsonArray adc_low = calibration.createNestedArray("adc_low");
  JsonArray adc_high = calibration.createNestedArray("adc_high");
  JsonArray dac_zero_offsets = calibration.createNestedArray("dac_zero_offsets");
  JsonArray dac_low = calibration.createNestedArray("dac_low");
  JsonArray dac_high = calibration.createNestedArray("dac_high");

  for (uint8_t i = 0; i < 4; i++) {
    adc_zero_offsets.add(_modbee._calZeroOffsetADC[i]);
    adc_low.add(_modbee._calLowADC[i]);
    adc_high.add(_modbee._calHighADC[i]);
  }
  for (uint8_t i = 0; i < 2; i++) {
    dac_zero_offsets.add(_modbee._calZeroOffsetDAC[i]);
    dac_low.add(_modbee._calLowDAC[i]);
    dac_high.add(_modbee._calHighDAC[i]);
  }

  JsonObject network = _jsonDoc.createNestedObject("network");
  network["mode"] = WiFi.getMode() == WIFI_AP ? "AP" : "STA";
  network["ssid"] = WiFi.getMode() == WIFI_AP ? AP_SSID : WiFi.SSID();
  network["ip"] = WiFi.getMode() == WIFI_AP ? WiFi.softAPIP().toString() : WiFi.localIP().toString();

  String json;
  serializeJson(_jsonDoc, json);
  _ws.textAll(json);
  debugf("WebSocket update sent\n");
}

void ModbeeWebServer::_onWsEvent(AsyncWebSocket* server, AsyncWebSocketClient* client, AwsEventType type, void* arg, uint8_t* data, size_t len) {
  if (type == WS_EVT_CONNECT) {
    debugf("WebSocket client connected: %u\n", client->id());
    _sendWsUpdate();
  } else if (type == WS_EVT_DISCONNECT) {
    debugf("WebSocket client disconnected: %u\n", client->id());
  } else if (type == WS_EVT_DATA) {
    debugf("WebSocket data received, len=%d\n", len);
    AwsFrameInfo* info = (AwsFrameInfo*)arg;
    if (info->final && info->index == 0 && info->len == len && info->opcode == WS_TEXT) {
      _jsonDoc.clear();
      DeserializationError error = deserializeJson(_jsonDoc, data, len);
      if (error) {
        debugf("WebSocket JSON error: %s\n", error.c_str());
        return;
      }
      if (_jsonDoc.is<JsonObject>()) {
        if (_jsonDoc.containsKey("calibration")) {
          debugf("Processing calibration update\n");
          _handleCalibrationUpdate(_jsonDoc["calibration"]);
        }
      }
    }
  }
}

void ModbeeWebServer::_handleCalibrationUpdate(const JsonObject& calibration) {
  debugf("Handling calibration update\n");
  if (calibration.containsKey("adc_zero_offsets")) {
    JsonArray arr = calibration["adc_zero_offsets"];
    for (uint8_t i = 0; i < 4 && i < arr.size(); i++) {
      _modbee._calZeroOffsetADC[i] = arr[i].as<int16_t>();
    }
  }
  if (calibration.containsKey("adc_low")) {
    JsonArray arr = calibration["adc_low"];
    for (uint8_t i = 0; i < 4 && i < arr.size(); i++) {
      _modbee._calLowADC[i] = arr[i].as<int16_t>();
    }
  }
  if (calibration.containsKey("adc_high")) {
    JsonArray arr = calibration["adc_high"];
    for (uint8_t i = 0; i < 4 && i < arr.size(); i++) {
      _modbee._calHighADC[i] = arr[i].as<int16_t>();
    }
  }
  if (calibration.containsKey("dac_zero_offsets")) {
    JsonArray arr = calibration["dac_zero_offsets"];
    for (uint8_t i = 0; i < 2 && i < arr.size(); i++) {
      _modbee._calZeroOffsetDAC[i] = arr[i].as<int16_t>();
    }
  }
  if (calibration.containsKey("dac_low")) {
    JsonArray arr = calibration["dac_low"];
    for (uint8_t i = 0; i < 2 && i < arr.size(); i++) {
      _modbee._calLowDAC[i] = arr[i].as<int16_t>();
    }
  }
  if (calibration.containsKey("dac_high")) {
    JsonArray arr = calibration["dac_high"];
    for (uint8_t i = 0; i < 2 && i < arr.size(); i++) {
      _modbee._calHighDAC[i] = arr[i].as<int16_t>();
    }
  }
  _modbee._saveCalibration();
  if (_modbee._mode == MB_SLAVE) {
    for (uint8_t i = 0; i < 4; i++) {
      _modbee.mb.Hreg(mbCAL_ZERO_OFFSET_ADC0 + i, _modbee._calZeroOffsetADC[i]);
      _modbee.mb.Hreg(mbCAL_LOW_ADC0 + i, _modbee._calLowADC[i]);
      _modbee.mb.Hreg(mbCAL_HIGH_ADC0 + i, _modbee._calHighADC[i]);
    }
    for (uint8_t i = 0; i < 2; i++) {
      _modbee.mb.Hreg(mbCAL_ZERO_OFFSET_DAC0 + i, _modbee._calZeroOffsetDAC[i]);
      _modbee.mb.Hreg(mbCAL_LOW_DAC0 + i, _modbee._calLowDAC[i]);
      _modbee.mb.Hreg(mbCAL_HIGH_DAC0 + i, _modbee._calHighDAC[i]);
    }
  }
  debugf("Calibration updated\n");
}