`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:52:43 04/17/2018
// Design Name:   priority_encoder
// Module Name:   C:/trsh/idkanymore/priority_encoder.v
// Project Name:  idkanymore
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

module priority_encoder_tb;

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
		#100;
		
		//test 0
		//OUT = 0
		IN = 0;
		#20
		
		//test max
		//OUT = 11
		IN = 'b100000000000;
		#20
		
		//test middle
		//OUT = 8
		IN = 'b000100001010;
		#20
		
		//test 1
		//OUT = 0
		IN = 1;
		#20

	end
      
endmodule
