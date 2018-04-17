`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:57:12 04/17/2018
// Design Name:   get_exp
// Module Name:   C:/trsh/idkanymore/get_exp_tb.v
// Project Name:  idkanymore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: get_exp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module get_exp_tb;

	// Inputs
	reg [3:0] IN;

	// Outputs
	wire [2:0] exp;

	// Instantiate the Unit Under Test (UUT)
	get_exp uut (
		.first_bit(IN), 
		.exp(exp)
	);

	initial begin
		// Initialize Inputs
				IN = 0;
		#20
		IN = 'b100000010000;
		#20
		IN = 'b000100000000;
		#20
		IN = 'b000000000101;
		#20
		IN = 'b000000000001;
		#20;
		IN = 'b000000001000;
		#20
		IN = 'b010000000000;
		#20

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

