# Synchronous Frequency Divider with Ring Oscillator as clock
This repository presents the design of Synchronous Frequency Divider using Ring Oscillator and 3-bit synchronous counter as a mixed signal circuit.
The Ring Oscillator is designed as an Analog circuit while the 3-bit Counter is designed as a digital circuit. 

## Table of Content []

## Abstract
In this design, a 3-bit synchronous counter is implemented using Verilog code and Ring oscillator is implemented using CMOS logic. The clock frequency of a digital system may not be suitable for operation. Hence, we may need to change it. Module performing this is called frequency divider. Counters can be used for this purpose. The clock pulses for this counter are produced by a Ring Oscillator. A closed-loop cascade connection of any odd number of inverters will display astable behaviour; such circuit are called ring oscillator.

## Reference Circuit Diagram

## Reference Waveform

## Circuit Details
### T-flip flop counter:
The T flip flops are useful when we need to reduce the frequency of the clock signal. If we use the original clock as flip flop clock and keep the T input at logic high then the output changes state once per clock period. This is with the assumption that the flip flop is not sensitive to both clock edges. This makes the output clock frequency as half of the frequency of the input clock. So the T flip flop works as a “Frequency Divider Circuit”.
If we connect three T-type flip-flops, the initial input frequency will be “divided-by-two” by the first flip-flop ( ƒ ÷ 2 ) and then “divided-by-two” again by the second flip-flop ( ƒ ÷ 2 ) ÷ 2, and then “divided by two” again by the third flip-flop ((ƒ ÷ 2 ) ÷ 2) ÷ 2 giving an output frequency which has effectively been divided eight times, then its output frequency becomes one quarter value (12.5%) of the original clock frequency, (  ƒ ÷ 8 ).

### Ring oscillator:
Ring oscillator is an odd number of inverters are connected in a series form with positive feedback & output oscillates between two voltage levels either 1 or zero to measure the speed of the process. The designing of the ring oscillator can be done using three inverters. If the oscillator is employed with a single-stage, then the oscillations & gain are not sufficient. If the oscillator has two inverters, then the oscillation and gain of the system are a little bit more than the single-stage ring oscillator. So this three-stage oscillator has three inverters that are connected in the form of series with a positive feedback system. So the oscillations & the gain of the system are sufficient. This is the reason to choose the three-stage oscillator.
Ring oscillator uses an odd number of inverters to achieve more gain than a single inverting amplifier. The inverter gives a delay to the input signal and if the numbers of inverters are increases then oscillator frequency will be decreased. So the desired oscillator frequency depends on the number of inverter stages of the oscillator.


The s frequency of oscillation formula for this oscillator is f=1/(2nT).

## Working
The ring oscillator generates clock signal. This wace is converted into digital form using ADC and given as inout as external xloxk pulse to the counter. Counter divides the clock frequency by 8. The waveform with new freqency is passed through DAC to get the final output waveform into analog signal.

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

## Steps to generate NgVeri Model
1. Open eSim.
2. Run NpVeri-Makerchip
3. Add top level verilog file in Makerchip Tab
4. Click on NgVeri tab
5. Add dependency files
6. Click on Run Verilog to NgSpice converter
7. Debug if any errors
8. Model created successfully 

