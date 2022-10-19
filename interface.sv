interface dut_if(input bit clk);
	logic reset;
	logic [7:0]in1;
	logic [7:0]in2;
	logic [8:0]out;

	clocking cb @(posedge clk);
		default input #1step output #3ns;
		input out;
		output in1;
		output in2;
	endclocking
endinterface
