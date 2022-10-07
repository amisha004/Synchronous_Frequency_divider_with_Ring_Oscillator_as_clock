# Synchronous Frequency Divider with Ring Oscillator as clock circuit
This repository presents the design of Synchronous Frequency Divider using Ring Oscillator and 3-bit synchronous counter as a mixed signal circuit.
The Ring Oscillator is designed as an Analog circuit while the 3-bit Counter is designed as a digital circuit. 

## Abstract
In this design, a 3-bit synchronous counter is implemented using Verilog code and Ring oscillator is implemented using CMOS logic. The clock frequency of a digital system may not be suitable for operation. Hence, we may need to change it. Module performing this is called frequency divider. Counters can be used for this purpose. The clock pulses for this counter are produced by a Ring Oscillator. A closed-loop cascade connection of any odd number of inverters will display astable behaviour; such circuit are called ring oscillator.

## Reference Circuit Diagram
### Block Diagram:
![WhatsApp Image 2022-10-07 at 11 31 21 PM](https://user-images.githubusercontent.com/84026974/194621295-fb090a5c-296e-43f9-87bf-b8ea8cf9355d.jpeg)

### Circuit:
![WhatsApp Image 2022-10-07 at 11 18 04 PM](https://user-images.githubusercontent.com/84026974/194619431-5e641680-1ffc-4b4b-a1b0-dc936194e321.jpeg)

## Reference Waveform
![image](https://user-images.githubusercontent.com/84026974/194621411-6eead154-528c-4e2a-a68f-8f2e5b51a850.png)

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

