`include "transaction.sv"
class generator;
  mailbox gen2driv;
  event ended;
  int repeat_count;
  transaction trans;
  
  function new ( mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    repeat(repeat_count)
    
    begin
      trans = new();
      if ( !trans.randomize()) $fatal ( "Gen randomization failed" ) ;
      gen2driv.put(trans);
    end
    -> ended;
  endtask
  
endclass
