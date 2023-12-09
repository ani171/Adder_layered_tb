module top;
	bit clk, reset;

	always #5 clk = ~clk;

	intf_adr intf_1(clk, reset);
	test test_1(intf_1);
	adder DUT (
	  .clk (intf_1.clk),
	  .reset (intf_1.reset),
	  .a (intf_1.a),
	  .b (intf_1.b),
	  .c (intf_1.c)
	  );
	  
	initial begin
	reset = 1 ; clk = 0; 
	#30; reset = 0;
	end
	  
	initial
	begin
	$dumpfile ("dump.vcd");
	$dumpvars;
	end

endmodule
