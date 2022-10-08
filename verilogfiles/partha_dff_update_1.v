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
