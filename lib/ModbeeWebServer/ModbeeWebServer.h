#ifndef MODBEEWEBSERVER_H
#define MODBEEWEBSERVER_H

#include <Arduino.h>
#include <ESPAsyncWebServer.h>
#include <AsyncTCP.h>
#include <LittleFS.h>
#include <ArduinoJson.h>
#include <WiFi.h>
#include <ESP32Modbee.h>

#define WIFI_CONFIG_FILE "/wifi.json"
#define AP_SSID "ModbeeAP"
#define AP_PASSWORD "modbee123"
#define WEBSOCKET_INTERVAL 1000 // ms

class ModbeeWebServer {
public:
  ModbeeWebServer(ESP32Modbee& modbee, uint16_t port = 80);
  void begin();
  void update();

private:
  ESP32Modbee& _modbee;
  AsyncWebServer _server;
  AsyncWebSocket _ws;
  JsonDocument _jsonDoc;
  unsigned long _lastWsSend;

  void _initLittleFS();
  void _initWiFi();
  void _loadWiFiConfig();
  void _saveWiFiConfig(const String& ssid, const String& password);
  void _startAP();
  void _connectToWiFi(const String& ssid, const String& password);
  void _sendWsUpdate();
  void _onWsEvent(AsyncWebSocket* server, AsyncWebSocketClient* client, AwsEventType type, void* arg, uint8_t* data, size_t len);
  void _handleCalibrationUpdate(const JsonObject& calibration);
};

#endif