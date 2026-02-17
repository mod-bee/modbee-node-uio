#pragma once
#include "ModBeeGlobal.h"

// =============================================================================
// ABSTRACT TRANSPORT INTERFACE
// =============================================================================
// Abstract transport interface for ModBee protocol
// This abstraction allows supporting different transport methods (Serial, UDP, etc.)
class ModBeeTransport {
public:
    virtual ~ModBeeTransport() = default;
    
    // Initialize the transport
    virtual bool begin() = 0;
    
    // Check if data is available to read
    virtual int available() = 0;
    
    // Read a single byte
    virtual int read() = 0;
    
    // Write data to the transport
    virtual size_t write(const uint8_t* buffer, size_t size) = 0;
    
    // Write a single byte
    virtual size_t write(uint8_t data) = 0;
    
    // Flush outgoing data
    virtual void flush() = 0;
    
    // Check if connected
    virtual bool isConnected() const = 0;
};

// =============================================================================
// SERIAL TRANSPORT IMPLEMENTATION
// =============================================================================
// Serial transport implementation for ModBee protocol
class SerialTransport : public ModBeeTransport {
private:
    Stream* _stream;
    
public:
    // Constructor
    SerialTransport(Stream* stream) : _stream(stream) {}
    
    bool begin() override {
        return _stream != nullptr;
    }
    
    int available() override {
        return _stream ? _stream->available() : 0;
    }
    
    int read() override {
        return _stream ? _stream->read() : -1;
    }
    
    size_t write(const uint8_t* buffer, size_t size) override {
        return _stream ? _stream->write(buffer, size) : 0;
    }
    
    size_t write(uint8_t data) override {
        return _stream ? _stream->write(data) : 0;
    }
    
    void flush() override {
        if (_stream) _stream->flush();
    }
    
    bool isConnected() const override {
        return _stream != nullptr;
    }
};

// =============================================================================
// FACTORY FUNCTIONS
// =============================================================================
// Factory function for creating transport instances
inline ModBeeTransport* createSerialTransport(Stream* stream) {
    return new SerialTransport(stream);
}