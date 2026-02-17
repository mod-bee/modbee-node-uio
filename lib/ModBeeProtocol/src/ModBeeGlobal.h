#pragma once

// =============================================================================
// STANDARD LIBRARY INCLUDES
// =============================================================================
#include <Arduino.h>
#include <Stream.h>
#include <vector>
#include <map>
#include <algorithm>
#include <functional>
#include <stdarg.h>
#include <stdio.h>

// =============================================================================
// FORWARD DECLARATIONS
// =============================================================================
// Forward declarations to prevent circular dependencies
class ModBeeProtocol;
class ModBeeOperations;
class ModbusDataMap;

// =============================================================================
// CORE MODBEE LIBRARY HEADERS
// =============================================================================
// Core ModBee library headers - include all in correct dependency order
#include "ModBeeTypes.h"          // Basic types and constants
#include "ModBeeTransport.h"      // Transport layer interface
#include "ModbusDataMap.h"        // Local data storage
#include "ModbusFrame.h"          // Pure Modbus frame handling
#include "ModBeeOperations.h"     // Operation queue management
#include "ModbusHandler.h"        // Modbus request processing
#include "ModBeeFrame.h"          // ModBee frame handling
#include "ModBeeIO.h"             // IO operations
#include "ModBeeProtocol.h"       // Main protocol class
#include "ModBeeAPI.h"            // High-level API
#include "ModBeeDebug.h"          // Debugging utilities