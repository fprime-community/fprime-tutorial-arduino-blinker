# LED Blinker: Running on Hardware

Now it is time to run on hardware. Connect the microcontroller to the host machine via USB.

First, upload the binary/hex file to the board after building. Follow [this guide](./uploading-to-board.md) if the files are not automatically uploading.

Next run the F´ GDS without launching the native compilation (`-n`) and with the dictionary from the build above (`--dictionary ./build-artifacts/<build name>/LedBlinkerTopologyAppDictionary.xml`). Connect it to the USB device by adding the `--communication-selection`, `--uart-device`, and `--uart-baud` flags

```bash
# In the project root
fprime-gds -n --dictionary ./build-artifacts/teensy41/LedBlinker/dict/LedBlinkerTopologyAppDictionary.xml --communication-selection uart --uart-device /dev/ttyACM0 --uart-baud 115200
```

For MacOS users, you may have to install `pyserial`: `pip install pyserial`

> Change `teensy41` to your build if it is not for the Teensy 4.1 (i.e. `teensy32`, `featherM0`, `esp32`, etc.)

> `/dev/ttyACM0` may vary for your system/device. It may also be `/dev/ttyUSB0`. For MacOS, it will be along the lines of `/dev/tty.usbmodem12345`. Change accordingly.
> To view the list of your connected devices, run: `ls /dev/tty*`.

> The green circle should now appear on the top right of F´ GDS.

## Testing the Topology

Test the component integration with the following steps:

1. Verify connection: confirm that there is a green circle and not a red X in the upper right corner.
2. Send a Command: select the 'Commanding' tab, search for led.BLINKING_ON_OFF and send it with the argument set to ON.
3. Verify Event: select the 'Events' tab and verify that the SetBlinkingState event reports the blinking state was set to ON.
4. Repeat steps 2 and 3 to turn the LED OFF.
5. Verify Telemetry: select the 'Channels' tab and verify that the LedBlinker telemetries appear.


# Conclusion

Congratulations you've now run on hardware.
