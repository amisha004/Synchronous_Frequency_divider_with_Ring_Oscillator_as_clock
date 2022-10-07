# Synchronous Frequency Divider with Ring Oscillator as clock

This repository presents the design of Synchronous Frequency Divider using Ring Oscillator and 3-bit synchronous counter as a mixed signal circuit.
The Ring Oscillator is designed as an Analog circuit while the 3-bit Counter is designed as a digital circuit. 

## Abstract
In this design, a 3-bit synchronous counter is implemented using Verilog code and Ring oscillator is implemented using CMOS logic. The clock frequency of a digital system may not be suitable for operation. Hence, we may need to change it. Module performing this is called frequency divider. Counters can be used for this purpose. The clock pulses for this counter are produced by a Ring Oscillator. A closed-loop cascade connection of any odd number of inverters will display astable behaviour; such circuit are called ring oscillator.

## Reference Circuit Diagram

## Reference Waveform

## Software Used
### eSim
It is an Open Source EDA developed by FOSSEE, IIT Bombay.
It is used for electronic circuit simulation. It is made by the combination of other two software namely NgSpice and KiCAD.
For more details refer: https://esim.fossee.in/home 

### NgSpice
It is an Open Source Software for Spice Simulation.
For more details refer: https://ngspice.sourceforge.io/docs.html 

### Makerchip
It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation.
For more details refer: https://www.makerchip.com/ 

### Verilator
It is a tool which converts Verilog code to C++ objects.
For more details refer: https://www.veripool.org/verilator/ 

## Circuit Diagram in eSim

The following is the schematic in eSim:
![image](https://user-images.githubusercontent.com/84026974/194596033-0b124063-a7d6-4929-b6a3-65bf616dfdff.png)

## Verilog Code
### 3-bit Synchronous Counter

```
module amisha_frequency_divider(
    input clk,
    output reg [2:0] Fout
    );
	 
initial
Fout = 3'b000;
always @(negedge clk)
Fout <= Fout + 1'b1;

endmodule
```
## Observations
![image](https://user-images.githubusercontent.com/84026974/194597492-ab7cb4a3-0af2-4790-8261-d33fe021e2ee.png)


