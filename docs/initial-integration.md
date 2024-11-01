# LED Blinker: Initial Component Integration

In this section, perform the initial integration the LED component into their deployment. This deployment will automatically include the basic command and data handling setup needed to interact with the component. Wiring the `Led` component to the GPIO driver component will be covered in a later section after the component implementation has finished.

> Users must have created the [initial Led component implementation](./component-implementation-1.md) in order to run through this section. Users may continue to define commands, events, telemetry, and ports after this initial integration.

## Adding `Led` Component To The Deployment

The component can now be added to the deployment's topology effectively adding this component to the running system. This is done by modifying `instances.fpp` and `topology.fpp` in the `Top` directory.

Add the following to `led-blinker/LedBlinker/Top/instances.fpp`.  Typically, this is added to the "Passive component instances" section of that document.

```
  instance led: Components.Led base id 0x10000
```

This defines an instance of the `Led` component called `led`.

Next, the topology needs to use the above definition. This is done by adding the following to the list of instances defined in `led-blinker/LedBlinker/Top/topology.fpp`.

```
  topology LedBlinker {
    ...
    instance ...
    instance led
    ...
  }
```

> No port connections need to be added because thus far the component only defines standard ports and those are connected automatically.

> This includes the large project (e.g. `Components`) in this deployment's build.

## Conclusion

Congratulations! You have now integrated your component and tested that integration.

This tutorial will return to the component implementation before finishing the integration of the component and testing on hardware.

### Next Step: [Continuing Component Implementation](./component-implementation-2.md).
