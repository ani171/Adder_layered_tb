`include "scoreboard.sv"
class environment;
	virtual intf_adr vif;
	mailbox gen2driv, mon2scb;
	generator gen;
	driver driv ;
	monitor mon;
	scoreboard scb;
   
   
	function new ( virtual intf_adr vif );
		this.vif  =  vif;
		gen2driv = new();
		mon2scb = new();
		gen = new ( gen2driv );
		driv = new ( vif, gen2driv );
		mon = new ( vif, mon2scb );
		scb = new (mon2scb );
	endfunction
   
    task pre_run;
		driv.reset();
    endtask
    
    task test;
		fork
		gen.main();
		driv.main();
		mon.main();
		scb.main();
		join
    endtask
    
    task post_run;
		wait ( gen.ended.triggered );
		wait ( gen.repeat_count == driv.no_trans );
		wait ( gen.repeat_count == scb.no_trans );
    endtask
    
    task main;
		pre_run();
		test();
		post_run();
    endtask 
    
endclass
