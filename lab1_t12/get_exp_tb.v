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
		
		#100;
		
		//test 0
		//exp = 000
		IN = 0;
		#20
		
		//test last non-exponent value
		//exp = 000
		IN = 3;
		#20
		
		//test first exponent value
		//exp = 001
		IN = 4;
		#20
		
		//test value in middle
		//exp = 011
		IN = 6;
		#20
		
		//test max
		//exp = 111
		IN = 11;
		#20

	end
      
endmodule

