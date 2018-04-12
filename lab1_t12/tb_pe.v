`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:35:47 04/12/2018
// Design Name:   priority_encoder
// Module Name:   /home/dionigi/Downloads/lab1_t12/tb_pe.v
// Project Name:  lab1_t12
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priority_encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_pe;

	// Inputs
	reg [11:0] IN;

	// Outputs
	wire [3:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	priority_encoder uut (
		.IN(IN), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		IN = 756;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	initial
		#100 $finish;
      
endmodule

