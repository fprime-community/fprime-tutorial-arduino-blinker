# F´ LED Blinker Tutorial for Arduinos

This project is an implementation of the [F´ LED Blinker ARM Linux Tutorial](https://github.com/fprime-community/fprime-workshop-led-blinker.git) which will allow you to test on Arduino-based microcontrollers using the [`fprime-arduino` toolchain](https://github.com/fprime-community/fprime-arduino.git) instead of `fprime-arm-linux`. 

This version uses a scaled down deployment of F´ to account for the limited resources available on baremetal hardware.

## Prerequisites

In order to run through this tutorial, users should first do the following:

1. Follow the [Hello World Tutorial](https://nasa.github.io/fprime/Tutorials/HelloWorld/Tutorial.html)
2. Ensure F´ tools have been [bootstrapped](https://nasa.github.io/fprime/Tutorials/HelloWorld/NewProject.html#bootstrapping-f)
3. Acquire and set up the appropriate [hardware](docs/hardware.md) for this tutorial
4. Follow the [arduino-cli installation guide](docs/arduino-cli-install.md)

## Tutorial Steps

This tutorial is composed of the following steps:

1. [Project Setup](docs/project-setup.md)
2. [Building for Arduino](docs/building-for-arduino.md)
3. [Component Design and Initial Implementation](docs/component-implementation-1.md)
4. [Initial Component Integration](docs/initial-integration.md)
5. [Continuing Component Implementation](docs/component-implementation-2.md)
6. [Full System Integration](docs/full-integration.md)
7. [Running on Hardware](docs/running-on-hardware.md)

### First Step: [Project Setup](./docs/project-setup.md)