# LED Blinker: Running on Hardware

In order to run on hardware, the deployment needs to be built for the given hardware target (a process called cross-compiling). Then the executable needs to be uploaded to the hardware, and the executable needs to be run connecting back to the host running the F´ GDS. This section will walk the user through cross-compiling, uploading, and running on hardware.

## Cross-Compiling using the Arduino CLI

Now cross-compiling is as easy as building the deployment for a specific platform.

> Users need to generate for each platform they wish to run on.  We previously generated for our host machine.

Here is how to build for the Teensy 4.1:

```bash
# In led-blinker/LedBlinker
fprime-util generate teensy41
fprime-util build teensy41
```
> macOS users must run from within the Docker container in the directory `/project/LedBlinker`

## Running on Hardware

Now it is time to run on hardware. Connect the microcontroller to the host machine via USB.

First, upload the binary/hex file to the board after building. Follow [this guide](./uploading-to-board.md) if the files are not automatically uploading.

Next run the F´ GDS without launching the native compilation (`-n`) and with the dictionary from the build above (`--dictionary ./build-artifacts/<build name>/LedBlinkerTopologyAppDictionary.xml`). Connect it to the USB device by adding the `--comm-adapter`, `--uart-device`, and `--uart-baud` flags

```bash
# In led-blinker
fprime-gds -n --dictionary ./build-artifacts/<build_name>/LedBlinker/dict/LedBlinkerTopologyAppDictionary.xml --comm-adapter uart --uart-device /dev/ttyACM0 --uart-baud 115200
```

For MacOS users, you may have to install `pyserial`: `pip install pyserial`

> Change `<build_name>` to your build (i.e. `teensy41`, `featherM0`, etc.)
> `/dev/ttyACM0` may vary for your system/device. It may also be `/dev/ttyUSB0`. For MacOS, it will be along the lines of `/dev/tty.usbmodem12345`. Change accordingly.
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
