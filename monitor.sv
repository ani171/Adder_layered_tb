`include "driver.sv"
class monitor;
   virtual intf_adr vif;
   mailbox mon2scb;
   
   function new ( virtual intf_adr vif, mailbox mon2scb);
     this.vif = vif;
     this.mon2scb = mon2scb;
   endfunction
   
   task main;
     forever
     begin
       transaction trans;
       trans = new();
       @ (posedge vif.clk)
       trans.a = vif.a;
       trans.b = vif.b;
       trans.c = vif.c;
       mon2scb.put(trans);
     end
   endtask
   
 endclass
