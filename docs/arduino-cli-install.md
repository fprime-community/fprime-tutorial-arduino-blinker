# Arduino CLI Installation Guide

## Install arduino-cli
```shell
mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/.local/bin sh
```

## Install arduino-cli-wrapper
```shell
cd ~/.local/bin
git clone https://github.com/SterlingPeet/arduino-cli-cmake-wrapper.git
cd arduino-cli-cmake-wrapper
git checkout update/refactor
pip install .
```

## Add `~/.local/bin` to PATH
```shell
sudo nano ~/.bashrc
```

Add the following line at the end of the file:
```
export PATH=~/.local/bin:$PATH
```

Save, exit, and run the following:
```shell
source ~/.bashrc  # or restart your terminal
```

## Setup arduino-cli for select Arduino boards

The following list of boards were tested. You are free to add your own board manager URL to your configuration if you are using a board that is not listed here:
  - PJRC Teensy (Teensy 3.2, Teensy 4.0, Teensy 4.1)
  - Adafruit Feather M0
  - ESP32 Dev Module
  - Raspberry Pi Pico W (RP2040)
  - Adafruit Feather RP2040
  - SparkFun Thing Plus RP2040
  - ATmega128 (with external memory, not the stock 2K memory)

Initialize the arduino-cli configuration file.
```shell
arduino-cli config init
```

Below are board manager URLs for select Arduino boards. You are not required to add all of these boards, but you are free to do so.
```shell
arduino-cli config add board_manager.additional_urls https://www.pjrc.com/teensy/package_teensy_index.json
arduino-cli config add board_manager.additional_urls https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
arduino-cli config add board_manager.additional_urls https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json
arduino-cli config add board_manager.additional_urls https://mcudude.github.io/MegaCore/package_MCUdude_MegaCore_index.json
arduino-cli config add board_manager.additional_urls https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json
```

Install the new board packages. Only install the ones you have added to your board manager in the previous step.
```shell
arduino-cli core update-index
arduino-cli core install teensy:avr
arduino-cli core install adafruit:samd
arduino-cli core install esp32:esp32
arduino-cli core install MegaCore:avr
arduino-cli core install rp2040:rp2040
```

## Adding udev rules (Linux Only)
Add udev rules. Download/save the `.rules` files located [here](./rules/) for your selected board(s) into `/etc/udev/rules.d/`.
