// ======================================================================
// \title  Main.cpp
// \brief main program for the F' application. Intended for CLI-based systems (Linux, macOS)
//
// ======================================================================
// Used to access topology functions
#include <LedBlinker/Top/LedBlinkerTopology.hpp>
#include <LedBlinker/Top/LedBlinkerTopologyAc.hpp>
// Used for Task Runner
#include <Os/Baremetal/TaskRunner/TaskRunner.hpp>

// Used for logging
#include <Arduino/Os/StreamLog.hpp>
#include <Os/Log.hpp>

// Instantiate a system logger that will handle Fw::Logger::logMsg calls
Os::Log logger;

// Task Runner
Os::TaskRunner taskrunner;

/**
 * \brief setup the program
 *
 * This is an extraction of the Arduino setup() function.
 *
 */
void setup() {
    // Setup Serial
    Serial.begin(115200);
    Os::setArduinoStreamLogHandler(&Serial);
    delay(1000);
    Fw::Logger::logMsg("Program Started\n");

    // Object for communicating state to the reference topology
    LedBlinker::TopologyState inputs;
    inputs.uartNumber = 0;
    inputs.uartBaud = 115200;

    // Setup topology
    LedBlinker::setupTopology(inputs);
}

/**
 * \brief run the program
 *
 * This is an extraction of the Arduino loop() function.
 *
 */
void loop() {
#ifdef USE_BASIC_TIMER
    rateDriver.cycle();
#endif
    taskrunner.run();
}