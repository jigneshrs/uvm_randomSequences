// class s0 template
class s0 extends uvm_sequence#(itm);
  `uvm_object_utils(s0)

itm mx;

   function new(string name="s0");
      super.new(name);
   endfunction : new

   task doreset(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_reset;
       mx.randomize();
	`uvm_info("Reset task",mx.sprint(),UVM_LOW);
       finish_item(mx);
     end
   endtask : doreset
   
   task donop(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_nop;
       mx.randomize();
	`uvm_info("Nop task",mx.sprint(),UVM_LOW);
       finish_item(mx);
     end
   endtask : donop

	task dopush(input int nr);
	   repeat(nr) begin
		start_item(mx);
		mx.opcode=E_push;
		mx.randomize();
		`uvm_info("Push task",mx.sprint(),UVM_LOW);
		finish_item(mx);
	   end
	endtask : dopush

	task dopushcomplete(input int nr);
	   repeat(nr) begin
		start_item(mx);
		mx.opcode=E_pushcomplete;
		mx.randomize();
		`uvm_info("Push complete task",mx.sprint(),UVM_LOW);
		finish_item(mx);
	   end
	endtask : dopushcomplete
   
// A sequence body template. put tests there
   task body;
     repeat(1) begin
     mx=itm::type_id::create("seq_item");
     doreset(3);
     donop(3);
     dopush(3);
     dopushcomplete(3);

// Try different approach
/*	start_item(mx);
	mx.randomize();
	$display("\n \n \n \n \n");
	//$display(mx);
	`uvm_info("Random Sequence ",mx.sprint(),UVM_LOW);
	$display("\n \n \n \n \n");
	finish_item(mx);
*/
	end
	
     

//
   endtask : body
endclass : s0
