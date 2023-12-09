`include "monitor.sv"
class scoreboard;
	
	virtual intf_adr vif;
	mailbox mon2scb;
	int no_trans;
	
	// A 5 bit variable to store the Golden File result
	bit [4:0] GoldenFile_Var;
   
	function new ( mailbox mon2scb );
		this.mon2scb = mon2scb;
	endfunction

	task main;
	forever 
	begin
		transaction trans;
		mon2scb.get(trans);
        GoldenFile_Var = trans.a + trans.b;
		// Immediate assertion for output comparison
		$display (  " \t a = %0d, \t b = %0d, \t c = %0d ",  trans.a, trans.b, trans.c ); 
		assert ( (GoldenFile_Var) == trans.c) $display( " Successful addition " ) ;
		else  $error ( " Gone wrong " );
		no_trans++;
	end
	endtask
  
endclass
