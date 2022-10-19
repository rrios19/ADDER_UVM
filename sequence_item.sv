class item extends uvm_sequence_item;

	`uvm_object_utils (item)
	
	function new (string name = "item");
		super.new(name);
	endfunction

	rand bit [7:0]in1;
	rand bit [7:0]in2;
	bit 	 [8:0]out;

	virtual function string convert2str();
		return $sformatf("in1=%0d, in2=%0d, out=%0d",in1,in2,out);
	endfunction

endclass
