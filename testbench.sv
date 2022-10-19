//`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "adder.sv"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "monitor.sv"
`include "driver.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"



module tb;
	reg clk;

  	always #10 clk =~ clk;
  	dut_if _if (clk);

	adder u0 ( .clk(clk),
		.reset(_if.reset),
		.in1(_if.in1),
		.in2(_if.in2),
		.out(_if.out));


	initial begin
    		clk <= 0;
    		uvm_config_db#(virtual dut_if)::set(null, "uvm_test_top", "dut_vif", _if);
    		run_test("mytest");
  	end
endmodule
