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

module sign_mag_tb;

	// Inputs
	reg [11:0] D;
	wire S;

	// Outputs
	wire [2:0] mag;

	// Instantiate the Unit Under Test (UUT)
	sign_mag uut (
		.D(D), 
		.S(S),
		.mag(mag)
	);

	initial begin
		//test negative number
		//S = 1
		//mag = 5
		D = -5;
		#5

		//test positive number
		//S = 0
		//mag = 5
		D = 5
		#5

		//test tmin
		//S = 1
		//mag = 2048
		D = -2048
		#5

		//test tmax
		//S = 0
		//mag = 2047
		D = 2047
		#5

		//test 0
		//S = 0
		//mag = 0
		D = 0
		#5


	end
      
endmodule