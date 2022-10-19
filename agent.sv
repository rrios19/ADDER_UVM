class agent extends uvm_agent;
  	
	`uvm_component_utils(agent)
  	
	function new(string name="agent", uvm_component parent=null);
    		super.new(name, parent);
  	endfunction

	driver   		drv_inst; 		
  	monitor 		mnt_inst; 	
  	uvm_sequencer #(item)	seq_inst;

	virtual function void build_phase(uvm_phase phase);
    		super.build_phase(phase);
    		seq_inst = uvm_sequencer#(item)::type_id::create("seq_inst", this);
    		drv_inst = driver::type_id::create("drv_inst", this);
    		mnt_inst = monitor::type_id::create("mnt_inst", this);
  	endfunction

  	virtual function void connect_phase(uvm_phase phase);
    		super.connect_phase(phase);
    		drv_inst.seq_item_port.connect(seq_inst.seq_item_export);
	endfunction

endclass
