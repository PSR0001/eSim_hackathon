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

