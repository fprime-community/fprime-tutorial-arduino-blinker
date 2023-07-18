module LedBlinker {

  # ----------------------------------------------------------------------
  # Symbolic constants for port numbers
  # ----------------------------------------------------------------------

    enum Ports_RateGroups {
      rateGroup1
    }

    enum Ports_StaticMemory {
      framer
      deframer
      deframing
    }

  topology LedBlinker {

    # ----------------------------------------------------------------------
    # Instances used in the topology
    # ----------------------------------------------------------------------

    instance cmdDisp
    instance commDriver
    instance deframer
    instance eventLogger
    instance fatalAdapter
    instance fatalHandler
    instance framer
    instance gpioDriver
    instance led
    instance rateDriver
    instance rateGroup1
    instance rateGroupDriver
    instance staticMemory
    instance systemResources
    instance timeHandler
    instance textLogger
    instance tlmSend

    # ----------------------------------------------------------------------
    # Pattern graph specifiers
    # ----------------------------------------------------------------------

    command connections instance cmdDisp

    event connections instance eventLogger

    telemetry connections instance tlmSend

    text event connections instance textLogger

    time connections instance timeHandler

    # ----------------------------------------------------------------------
    # Direct graph specifiers
    # ----------------------------------------------------------------------

    connections Downlink {

      tlmSend.PktSend -> framer.comIn
      eventLogger.PktSend -> framer.comIn

      framer.framedAllocate -> staticMemory.bufferAllocate[Ports_StaticMemory.framer]
      framer.framedOut -> commDriver.send

      commDriver.deallocate -> staticMemory.bufferDeallocate[Ports_StaticMemory.framer]

    }

    connections FaultProtection {
      eventLogger.FatalAnnounce -> fatalHandler.FatalReceive
    }

    connections RateGroups {
      # Block driver
      rateDriver.CycleOut -> rateGroupDriver.CycleIn

      # Rate group 1
      rateGroupDriver.CycleOut[Ports_RateGroups.rateGroup1] -> rateGroup1.CycleIn
      rateGroup1.RateGroupMemberOut[0] -> commDriver.schedIn
      rateGroup1.RateGroupMemberOut[1] -> tlmSend.Run
      rateGroup1.RateGroupMemberOut[2] -> systemResources.run
    }

    connections Uplink {

      commDriver.allocate -> staticMemory.bufferAllocate[Ports_StaticMemory.deframer]
      commDriver.$recv -> deframer.framedIn
      deframer.framedDeallocate -> staticMemory.bufferDeallocate[Ports_StaticMemory.deframer]

      deframer.comOut -> cmdDisp.seqCmdBuff
      cmdDisp.seqCmdStatus -> deframer.cmdResponseIn

      deframer.bufferAllocate -> staticMemory.bufferAllocate[Ports_StaticMemory.deframing]
      deframer.bufferDeallocate -> staticMemory.bufferDeallocate[Ports_StaticMemory.deframing]
      
    }

    connections LedConnections {
      # Rate Group 1 (1Hz cycle) ouput is connected to led's run input
      rateGroup1.RateGroupMemberOut[3] -> led.run
      # led's gpioSet output is connected to gpioDriver's gpioWrite input
      led.gpioSet -> gpioDriver.gpioWrite
    }

    connections LedBlinker {
      # Add here connections to user-defined components
    }

  }

}
