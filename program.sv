`include "environment.sv"
program test ( intf_adr intf ) ;
	environment env;
	initial begin
	  env = new ( intf ) ;
	  env.gen.repeat_count = 400;
	  env.main();
	end

endprogram
