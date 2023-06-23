# Uploading Binary File to Hardware

## Teensy

The Teensyduino application should have appeared after running `fprime-util build` and the hex file should already be loaded. If you do not see the hex file, choose the hex file to load into Teensyduino located in `./build-artifacts/<teensy build name>/LedBlinker/bin/`. Manually press the reset button on the Teensy to upload the program.

Note: Change `<teensy build name>` to your build (i.e. `teensy41`, `teensy32`, etc.).

## Adafruit Feather M0

Double press on the reset button on the Feather to set it to programming mode. Then run the following commands below.

```sh
# Linux
~/.arduino15/packages/adafruit/tools/bossac/1.8.0-48-gb176eee/bossac -i -d --port=ttyACM0 -U -i --offset=0x2000 -w -v ./build-artifacts/featherM0/LedBlinker/bin/LedBlinker.bin -R

# MacOS
~/Library/Arduino15/packages/adafruit/tools/bossac/1.8.0-48-gb176eee/bossac -i -d --port=tty.usbmodem12345 -U -i --offset=0x2000 -w -v ./build-artifacts/featherM0/LedBlinker/bin/LedBlinker.bin -R

```

Note:
  - If you have more than one device connected, or if you are using a different OS, `ttyACM0` may differ for your system.
      - On MacOS, it may look like `tty.usbmodem12345`
      - To view your list of devices, run: `ls /dev/tty*`
