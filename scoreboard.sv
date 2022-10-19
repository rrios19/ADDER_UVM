class scoreboard extends uvm_scoreboard;
	
	`uvm_component_utils(scoreboard)
  	
	function new(string name="scoreboard", uvm_component parent=null);
    		super.new(name, parent);
  	endfunction

	bit 	[8:0]exp_out;
	
	uvm_analysis_imp #(item, scoreboard) m_analysis_imp;

	virtual function void build_phase(uvm_phase phase);
    		super.build_phase(phase);
    		m_analysis_imp = new("m_analysis_imp", this);
  	endfunction

	virtual function write(item m_item);
    		exp_out = m_item.in1 + m_item.in2;

		if (m_item.out != exp_out) begin
      			`uvm_error("Scoreboard", $sformatf("ERROR ! in1=%0d in2=%0d out=%0d exp=%0d",
			m_item.in1,m_item.in2,m_item.out,exp_out))
    		end else begin
      			`uvm_info("Scoreboard", $sformatf("PASS ! in1=%0d in2=%0d out=%0d exp=%0d",
                        m_item.in1,m_item.in2,m_item.out,exp_out), UVM_HIGH)
    		end
  	endfunction
endclass
