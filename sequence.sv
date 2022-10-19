class mysequence extends uvm_sequence;

	`uvm_object_utils(mysequence);

	function new (string name = "mysequence");
		super.new(name);
	endfunction

	rand int num;

	constraint c1 {soft num inside {[10:20]};}

	virtual task body();
	for(int i=0; i<num; i++)begin
		item m_item = item::type_id::create("m_item");
		start_item(m_item);
		m_item.randomize();
		`uvm_info("Sequence", $sformatf("Nuevo item: %s",m_item.convert2str()),UVM_HIGH);
		finish_item(m_item);
	end	
	`uvm_info("Sequence", $sformatf("Creacion de %0d items", num),UVM_LOW);
	endtask
endclass
