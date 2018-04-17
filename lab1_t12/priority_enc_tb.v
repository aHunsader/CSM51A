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

module priority_encoder;

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

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule
