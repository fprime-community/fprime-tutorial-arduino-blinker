// ======================================================================
// \title  Main.cpp
// \brief main program for the F' application. Intended for CLI-based systems (Linux, macOS)
//
// ======================================================================
// Used to access topology functions
#include <LedBlinker/Top/LedBlinkerTopology.hpp>
#include <LedBlinker/Top/LedBlinkerTopologyAc.hpp>
#include <Os/Console.hpp>
#include <Arduino/Os/Task.hpp>

Os::Arduino::Task::TaskRunner taskrunner;

/**
 * \brief setup the program
 *
 * This is an extraction of the Arduino setup() function.
 *
 */
void setup() {
    // Initialize OSAL
    Os::init();
    
    // Setup Serial
    Serial.begin(115200);
    Os::Task::delay(Fw::TimeInterval(1, 0));

    // Object for communicating state to the reference topology
    LedBlinker::TopologyState inputs;
    inputs.uartNumber = 0;
    inputs.uartBaud = 115200;

    // Setup topology
    LedBlinker::setupTopology(inputs);

    Fw::Logger::log("Program Started\n");
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