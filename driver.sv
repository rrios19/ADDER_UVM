class driver extends uvm_driver #(item);
	
	`uvm_component_utils(driver)
	
	function new(string name = "driver", uvm_component parent=null);
		super.new(name, parent);
  	endfunction

 	virtual dut_if vif;

  	virtual function void build_phase(uvm_phase phase);
    		super.build_phase(phase);
    		if (!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vif", vif))
      			`uvm_fatal("Driver", "Error no se encontro vif")
  	endfunction

  	virtual task run_phase(uvm_phase phase); // Le quitamos el virtual
    		super.run_phase(phase);
    	
		forever begin
      			item m_item;
      			`uvm_info("Driver", $sformatf("Esperando item"), UVM_HIGH)
      			seq_item_port.get_next_item(m_item);
      			drive_item(m_item);
      			seq_item_port.item_done();
    		end
  	endtask

	virtual task drive_item(item m_item);
    		@(vif.cb);
      			vif.cb.in1 <= m_item.in1;
      			vif.cb.in2 <= m_item.in2;
  	endtask
endclass
