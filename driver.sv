`include "generator.sv"
class driver;
  virtual intf_adr vif;
  mailbox gen2driv;
  int no_trans;
  
  
  function new (virtual intf_adr vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task reset;
    wait ( vif.reset );
    vif.a <= 0;
    vif.b <= 0;
    wait ( !vif.reset );
  endtask
  
  task main;
    forever 
    begin
      transaction trans;
      gen2driv.get(trans);
      
      @ (posedge vif.clk)
      vif.a <= trans.a;
      vif.b <= trans.b;
      //@ (posedge vif.clk)
      trans.c = vif.c;
     // @ (posedge vif.clk)                                           
      no_trans++;
    end
  endtask
  
endclass
