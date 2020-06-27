`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:19:27 06/27/2020
// Design Name:   clock_frequency_divider_ckt
// Module Name:   S:/Github Uploads/BlinkLEDs/tb_clock_freq_divider.v
// Project Name:  BlinkLEDs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_frequency_divider_ckt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_clock_freq_divider;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire led;

	// Instantiate the Unit Under Test (UUT)
	clock_frequency_divider_ckt uut (
		.clk(clk), 
		.reset(reset), 
		.led(led)
	);
	
	always      
	 
	 #5 clk = ~clk ;
	 
	

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#10 reset = 0 ; 
		// Wait 100 ns for global reset to finish
		#100; 
        
		// Add stimulus here

	end
      
endmodule

