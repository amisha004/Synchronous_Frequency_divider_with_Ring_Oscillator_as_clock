# Synchronous Frequency Divider with Ring Oscillator as clock circuit
This repository presents the design of Synchronous Frequency Divider using Ring Oscillator and 3-bit synchronous counter as a mixed signal circuit.
The Ring Oscillator is designed as an Analog circuit while the 3-bit Counter is designed as a digital circuit. 

## Table of Content

- [Synchronous Frequency Divider with Ring Oscillator as clock circuit](#synchronous-frequency-divider-with-ring-oscillator-as-clock-circuit)
  * [Table of Content](#table-of-content)
  * [Abstract](#abstract)
  * [Reference Circuit Diagram](#reference-circuit-diagram)
    + [Block Diagram](#block-diagram)
    + [Circuit](#circuit)
  * [Reference Waveform](#reference-waveform)
  * [Circuit Details](#circuit-details)
    + [3-bit T-flip flop Synchronous Counter](#3-bit-t-flip-flop-synchronous-counter)
    + [Ring oscillator](#ring-oscillator)
  * [Working](#working)
  * [Software Used](#software-used)
    + [eSim](#esim)
    + [NgSpice](#ngspice)
    + [Makerchip](#makerchip)
  * [Circuit Diagram in eSim](#circuit-diagram-in-esim)
  * [Verilog Code](#verilog-code)
    + [3-bit T-flip flop Synchronous Counter](#3-bit-t-flip-flop-synchronous-counter-1)
    + [Makerchip Code](#makerchip-code)
  * [Observations](#observations)
    + [Makerchip Output](#makerchip-output)
    + [Frequency Divider circuit Output](#frequency-divider-circuit-output)
  * [Generated Netlist](#generated-netlist)
  * [Steps to generate NgVeri Model](#steps-to-generate-ngveri-model)
  * [Steps to Run simulation of my project](#steps-to-run-simulation-of-my-project)
  * [Acknowlegdements](#acknowlegdements)
  * [References](#references)

## Abstract
In this design, a 3-bit synchronous counter is implemented using Verilog code and Ring oscillator is implemented using CMOS logic. The clock frequency of a digital system may not be suitable for operation. Hence, we may need to change it. Module performing this is called frequency divider. Counters can be used for this purpose. The clock pulses for this counter are produced by a Ring Oscillator. A closed-loop cascade connection of any odd number of inverters will display astable behaviour; such circuit are called ring oscillator.

## Reference Circuit Diagram
### Block Diagram
![WhatsApp Image 2022-10-07 at 11 31 21 PM](https://user-images.githubusercontent.com/84026974/194621295-fb090a5c-296e-43f9-87bf-b8ea8cf9355d.jpeg)

### Circuit
![WhatsApp Image 2022-10-07 at 11 18 04 PM](https://user-images.githubusercontent.com/84026974/194619431-5e641680-1ffc-4b4b-a1b0-dc936194e321.jpeg)

## Reference Waveform
![image](https://user-images.githubusercontent.com/84026974/194621411-6eead154-528c-4e2a-a68f-8f2e5b51a850.png)

## Circuit Details
### 3-bit T-flip flop Synchronous Counter
The T flip flops are useful when we need to reduce the frequency of the clock signal. If we use the original clock as flip flop clock and keep the T input at logic high then the output changes state once per clock period. This is with the assumption that the flip flop is not sensitive to both clock edges. This makes the output clock frequency as half of the frequency of the input clock. So the T flip flop works as a “Frequency Divider Circuit”.
If we connect three T-type flip-flops, the initial input frequency will be “divided-by-two” by the first flip-flop ( ƒ ÷ 2 ) and then “divided-by-two” again by the second flip-flop ( ƒ ÷ 2 ) ÷ 2, and then “divided by two” again by the third flip-flop ((ƒ ÷ 2 ) ÷ 2) ÷ 2 giving an output frequency which has effectively been divided eight times, then its output frequency becomes one quarter value (12.5%) of the original clock frequency, (  ƒ ÷ 8 ).

### Ring oscillator
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

## Circuit Diagram in eSim

The following is the schematic in eSim:
![image](https://user-images.githubusercontent.com/84026974/194596033-0b124063-a7d6-4929-b6a3-65bf616dfdff.png)

## Verilog Code
### 3-bit T-flip flop Synchronous Counter

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

### Makerchip Code

```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/ /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/ 

//Your Verilog/System Verilog Code Starts Here:
module amisha_frequency_divider(
    input clk,
    output reg [2:0] Fout
    );
	 //This is the code of 3-bit Synchronous Counter
	 initial
	 Fout = 3'b000;
	 always @(negedge clk)
	 Fout <= Fout + 1'b1;

endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
      logic  [2:0] Fout;//output
//The $random() can be replaced if user wants to assign values
      amisha_frequency_divider amisha_frequency_divider(.clk(clk), .Fout(Fout));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule
```

## Observations
### Makerchip Output
![image](https://user-images.githubusercontent.com/84026974/194626615-bb9b78db-f553-446b-a2af-a0191de4d8c3.png)

### Frequency Divider circuit Output
![image](https://user-images.githubusercontent.com/84026974/194597492-ab7cb4a3-0af2-4790-8261-d33fe021e2ee.png)

## Generated Netlist

```
* c:\users\amisha\esim-workspace\frequency_divider_amisha\frequency_divider_amisha.cir

.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__r+c.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__linear.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__pnp.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__inductors.model.spice"
.lib "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130.lib.spice" tt
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__diode_pd2nw_11v0.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__diode_pw2nd_11v0.model.spice"
xsc2 net-_sc1-pad1_ clk gnd gnd sky130_fd_pr__nfet_01v8 
xsc5 net-_sc4-pad1_ net-_sc1-pad1_ gnd gnd sky130_fd_pr__nfet_01v8 
xsc8 clk net-_sc4-pad1_ gnd gnd sky130_fd_pr__nfet_01v8 
xsc1 net-_sc1-pad1_ clk net-_sc1-pad3_ net-_sc1-pad3_ sky130_fd_pr__pfet_01v8 
xsc4 net-_sc4-pad1_ net-_sc1-pad1_ net-_sc1-pad3_ net-_sc1-pad3_ sky130_fd_pr__pfet_01v8 
xsc7 clk net-_sc4-pad1_ net-_sc1-pad3_ net-_sc1-pad3_ sky130_fd_pr__pfet_01v8 
xsc3 net-_sc1-pad1_ gnd sky130_fd_pr__cap_mim_m3_1 W=110500 L=10000 MF=1
xsc6 net-_sc4-pad1_ gnd sky130_fd_pr__cap_mim_m3_1 W=110500 L=10000 MF=1
xsc9 clk gnd sky130_fd_pr__cap_mim_m3_1 W=110500 L=10000 MF=1
v1 net-_sc1-pad3_ gnd  dc 2.5
* u3  clk net-_u1-pad1_ adc_bridge_1
* u1  net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ amisha_frequency_divider
* u4  net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ a b c dac_bridge_3
* u2  clk plot_v1
* u5  a plot_v1
* u6  b plot_v1
* u7  c plot_v1
* s c m o d e
a1 [clk ] [net-_u1-pad1_ ] u3
a2 [net-_u1-pad1_ ] [net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ ] u1
a3 [net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ ] [a b c ] u4
* Schematic Name:                             adc_bridge_1, NgSpice Name: adc_bridge
.model u3 adc_bridge(in_low=1.0 in_high=2.0 rise_delay=1.0e-9 fall_delay=1.0e-9 ) 
* Schematic Name:                             amisha_frequency_divider, NgSpice Name: amisha_frequency_divider
.model u1 amisha_frequency_divider(rise_delay=1.0e-9 fall_delay=1.0e-9 input_load=1.0e-12 instance_id=1 ) 
* Schematic Name:                             dac_bridge_3, NgSpice Name: dac_bridge
.model u4 dac_bridge(out_low=0.0 out_high=5.0 out_undef=0.5 input_load=1.0e-12 t_rise=1.0e-9 t_fall=1.0e-9 ) 
.tran 50e-03 20e-00 0e-00

* Control Statements 
.control
run
print allv > plot_data_v.txt
print alli > plot_data_i.txt
plot v(clk) v(a)+6 v(b)+12 v(c)+18
.endc
.end
```
### Applications of Frequency divider:


Frequency Divider Circuits or Frequency Dividers are an integral part of many communication and audio based systems like:
- Frequency Synthesizers.
- Audio Equipment.
- Radar and Satellite Communication.
- Military Equipment.
- RF Devices.

## Steps to generate NgVeri Model
1. Open eSim.
2. Run NpVeri-Makerchip
3. Add top level verilog file in Makerchip Tab
4. Click on NgVeri tab
5. Add dependency files
6. Click on Run Verilog to NgSpice converter
7. Debug if any errors
8. Model created successfully 

## Steps to Run simulation of my project
1. Open a new terminal
2. Clone this project using the following command: 
`https://github.com/amisha004/Synchronous_Frequency_divider_with_Ring_Oscillator_as_clock.git`
3. Change directory:
`cd Frequency_divider_amisha`
4. Run ngspice:
`ngspice Frequency_divider_amisha.cir.out`
5. To run the project in eSim:
- Run eSim
- Load the project
- Open eeSchema

## Acknowlegdements
1. FOSSEE, IIT Bombay
2. Steve Hoover, Founder, Redwood EDA
3. Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com 
4. Sumanto Kar, eSim Team, FOSSEE

## References
1. https://dcaclab.com/blog/t-flip-flop-explained-in-detail/ 
