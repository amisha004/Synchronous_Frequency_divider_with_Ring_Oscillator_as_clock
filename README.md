# Synchronous Frequency Divider with Ring Oscillator as clock

This repository presents the design of Synchronous Frequency Divider using Ring Oscillator and 3-bit synchronous counter as a mixed signal circuit.
The Ring Oscillator is designed as an Analog circuit while the 3-bit Counter is designed as a digital circuit. 

## Abstract
In this design, a 3-bit synchronous counter is implemented using Verilog code and Ring oscillator is implemented using CMOS logic. The clock frequency of a digital system may not be suitable for operation. Hence, we may need to change it. Module performing this is called frequency divider. Counters can be used for this purpose. The clock pulses for this counter are produced by a Ring Oscillator. A closed-loop cascade connection of any odd number of inverters will display astable behaviour; such circuit are called ring oscillator.
