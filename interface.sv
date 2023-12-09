interface intf_adr( input logic clk, reset);
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] c;
  
  covergroup cg @ (posedge clk);
    cov_a : coverpoint a;
    cov_b : coverpoint b;
    cov_c : coverpoint c;
  endgroup 
  
  cg cg_1 = new();
  
  
endinterface
