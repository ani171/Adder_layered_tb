module adder(
  input clk,
  input reset,
  input [3:0] a,
  input [3:0] b,
  output reg [4:0] c
  );
  
  always @ (posedge clk, posedge reset)
  if ( reset )
    c <= 0;
  else
    c <= a+b;
  
endmodule
