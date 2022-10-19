class monitor extends uvm_monitor;
	
	`uvm_component_utils(monitor)
	
	function new(string name = "monitor", uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	uvm_analysis_port #(item) mon_analysis_port;
	virtual dut_if vif;

	virtual function void build_phase(uvm_phase phase);
    		super.build_phase(phase);
   		if (!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vif", vif))
			`uvm_fatal("Monitor", "Error no se encontro  vif")
		mon_analysis_port = new ("mon_analysis_port", this);
  	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever begin
			@(vif.cb);
				if (vif.reset) begin
					item m_item = item::type_id::create("m_item");
					m_item.in1 = vif.in1;
					m_item.in2 = vif.in2;
					m_item.out = vif.cb.out;
					mon_analysis_port.write(m_item);
              				`uvm_info("Monitor", $sformatf("Item %s", m_item.convert2str()), UVM_HIGH)
			end
		 end
	endtask		
endclass
