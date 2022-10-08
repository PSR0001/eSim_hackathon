# Mixed Signal Circuit Design and Simulation Marathon
# SPWM Generation
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Reference Waveform](#reference-waveform)
- [Circuit Details](#circuit-details)
- [Software Used](#software-used)
  * [eSim](#esim)
  * [NgSpice](#ngspice)
  * [Makerchip](#makerchip)
  * [Verilator](#verilator)
  * [Skywater130 pdk](#Skywater130-pdk )
- [Circuit Diagram in eSim](#circuit-diagram-in-esim)
- [Verilog Code](#verilog-code)
- [Makerchip](#makerchip-1)
- [Makerchip Plots](#makerchip-plots)
- [Netlists](#netlists)
- [NgSpice Plots](#ngspice-plots)
- [Steps to run generate NgVeri Model](#steps-to-run-generate-ngveri-model)
- [Steps to run this project](#steps-to-run-this-project)
- [Acknowlegdements](#acknowlegdements)
- [References](#references)




## Abstract
Sinusoidal Pulse Width Modulation (SPWM) inverter pulse
Generator circuit, which can be used to educate Electronics
Engineering undergraduate students the structure and 
behavior of a SPWM’s inverter pulse generator. The 
developed electronic circuit is implemented using low 
cost and reliable electronic parts. 

## Reference Circuit Diagram
![Circuit](https://user-images.githubusercontent.com/83899035/194705352-ec8af2cb-56fd-45d9-8a84-cc4982980f35.png)
## Reference Waveform
![Wave Form](https://user-images.githubusercontent.com/83899035/194705462-6640e096-1c24-4cd0-b0fe-eca7b5907723.png)
## Circuit Details
Fig 1, Shows the entire circuit Diagram. This circuit actually used to generate SPWM (Sinusoidal Pulse Width Modulation). The circuit has a triangular waveform generator, a comparator and a digital flip-flop. 

Op-amps are used for generating the triangular waveform. Here op-amps are used as an integrator circuit. The frequency of the integrator circuit is determined by, 

Frq = (R5 + VR1) /    4R3C1R4                (1)                                                                     

Whereas, R5 = feedback resistor of second op-amp, VR1 = Voltage between R1, R3 = resistor in non-inverting terminal of first op-amp, C1 = value of C1 capacitor, R4 = value of R4 resistor.

Comparators are the device that compares two analogue voltages or currents and switches it output to indicate which one is larger [1]. 

D flip-flop that can handle data at high- frequencies with low power utility was implemented and succeeded. The detailed D flip-Flip Circuit is Fig 2. To avoid these glitches output of the comparator is passed through a D flipflop.

## Software Used
### eSim
It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD.
</br>
For more details refer:
</br>
https://esim.fossee.in/home

### NgSpice
It is an Open Source Software for Spice Simulations. For more details refer:
</br>
http://ngspice.sourceforge.net/docs.html

### Makerchip
It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. Refer
</br> https://www.makerchip.com/

### Verilator
It is a tool which converts Verilog code to C++ objects. Refer:
https://www.veripool.org/verilator/

### Skywater130 pdk
While the SKY130 process node and the PDK from which this open source release was derived have been used to create many designs that have been successfully manufactured commercially in significant quantities, the open source PDK is not intended to be used for production settings at this current time. It should be usable for doing test chips and initial design verification
https://skywater-pdk.readthedocs.io/en/main/

## Circuit Diagram in eSim
The following is the schematic in eSim:
![Circuit Diagram](https://user-images.githubusercontent.com/83899035/194704937-bcb7237e-6b1f-40b4-9eb0-936470c0089a.png)
## Verilog Code
```verilog
module partha_dff_update_1(D,clk,sync_reset,Q);
input D, clk, sync_reset; 
output reg Q; 
always @(posedge clk) 
begin
 if(sync_reset==1'b1)
  Q <= 1'b0; 
 else 
  Q <= D; 
end 
endmodule

```
## Makerchip
```verilog
\TLV_version 1d: tl-x.org
\SV

//Your Verilog/System Verilog Code Starts Here:
module partha_dff_update_1(D,clk,sync_reset,Q);
input D, clk, sync_reset; 
output reg Q; 
always @(posedge clk) 
begin
 if(sync_reset==1'b1)
  Q <= 1'b0; 
 else 
  Q <= D; 
end 
endmodule


//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  D;//input
		logic  sync_reset;//input
		logic  Q;//output
//The $random() can be replaced if user wants to assign values
		assign D = reset;
		assign sync_reset = reset;
		partha_dff_update_1 partha_dff_update_1(.D(D), .clk(clk), .sync_reset(sync_reset), .Q(Q));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule



```
## Makerchip Plots
![mackerchip](https://user-images.githubusercontent.com/83899035/194705121-8d010976-9281-407c-ad04-861ded7312cc.png)


## Netlists
```verilog
* /home/parthasingharoy166/eSim-Workspace/psr_opamp/psr_opamp.cir

* EESchema Netlist Version 1.1 (Spice format) creation date: Sat 08 Oct 2022 03:37:18 PM IST

* To exclude a component from the Spice Netlist add [Spice_Netlist_Enabled] user FIELD set to: N
* To reorder the component spice node sequence add [Spice_Node_Sequence] user FIELD and define sequence: 2,1,0

* Sheet Name: /
v3  Vdd GND DC		
v2  Vss GND DC		
scmode1  SKY130mode		
X1  Vdd Vss GND Net-_SC1-Pad1_ Net-_SC1-Pad2_ GND avsd_opamp		
U2  input plot_v1		
v1  input GND pulse		
SC2  input Net-_SC1-Pad1_ sky130_fd_pr__cap_mim_m3_2		
SC1  Net-_SC1-Pad1_ Net-_SC1-Pad2_ ? sky130_fd_pr__res_generic_nd		
X2  Vcc Vcc Net-_SC1-Pad2_ Sine ? GND avsdcmp_3v3_sky130		
v5  Vcc GND DC		
v4  Sine GND sine		
U3  FOUT. plot_v1		
v7  reset GND pulse		
U7  SPWM plot_v1		
U6  Net-_U4-Pad4_ SPWM dac_bridge_1		
U5  FOUT. clk reset Net-_U4-Pad1_ Net-_U4-Pad2_ Net-_U4-Pad3_ adc_bridge_3		
v6  clk GND pulse		
U4  Net-_U4-Pad1_ Net-_U4-Pad2_ Net-_U4-Pad3_ Net-_U4-Pad4_ partha_dff_update_1		
v8  FOUT. GND pulse		
U1  Sine plot_v1		
U8  clk plot_v1		

.end


```
## NgSpice Plots
### SPWM
![Screenshot 2022-10-08 113217](https://user-images.githubusercontent.com/83899035/194705624-107e61a7-590d-4b68-838c-4b1d3c59456e.png)

### D Flip-Flop
![D-Flip-Flop](https://user-images.githubusercontent.com/83899035/194704884-48f785af-b311-44da-beb3-ca41e10d8702.png)


## Steps to run generate NgVeri Model
1. Open eSim
2. Run NgVeri-Makerchip 
3. Add top level verilog file in Makerchip Tab
4. Click on NgVeri tab
5. Add dependency files
6. Click on Run Verilog to NgSpice Converter
7. Debug if any errors
8. Model created successfully
## Steps to run this project
1. Open a new terminal
2. Clone this project using the following command:</br>
```git clone https://github.com/PSR0001/eSim_hackathon```</br>
3. Change directory:</br>
```cd eSim_project_files/psr_opamp```</br>
4. Run ngspice:</br>
```ngspice psr_opamp.cir.out```</br>
5. To run the project in eSim:

  - Run eSim</br>
  - Load the project</br>
  - Open eeSchema</br>
## Acknowlegdements
1. http://iitb.ac.in/
2. https://www.google.co.in/
3. https://fossee.in/
4. https://spoken-tutorial.org/
5. https://www.vlsisystemdesign.com/
6. https://www.c2s.gov.in/

## References
1. Khulesh Sahu, Ravi Tewari “Study of different type of comparator”.
2. SPWM Signal : https://youtu.be/XhgV6YUaMZA

