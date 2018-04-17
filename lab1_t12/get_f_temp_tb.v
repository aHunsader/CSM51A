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

module get_f_temp_tb;

	// Inputs
	reg [11:0] mag;
	reg [3:0] first_bit;

	// Outputs
	wire [3:0] ans;
    wire round_bit;

	// Instantiate the Unit Under Test (UUT)
get_f_temp uut (.enc(first_bit), .mag(mag), .ans(ans), .round_bit(round_bit));

	initial begin
		#100;

        //test first_bit = 11
        //ans = 1000
        //round_bit = 0
        mag = 'b100000000000;
        first_bit = 11;
        #20

        //test first_bit <= 3
        //ans = 0101
        //round_Bit = 0
        mag = 'b000000000101;
        first_bit = 3;
        #20

        //test first_bit = 4
        //ans = 1000
        //round_bit = 0
        mag = 'b000000001000;
        first_bit = 4;
        #20

        //test first_bit > 3
        //ans = 0100
        //round_bit = 0
        mag = '010000000000;
        first_bit = 10;
        #20

        //test round bit
        //ans = 1100
        //round_bit = 1
        mag = 'b011001000000;
        first_bit = 10;
        #20

	end
      
endmodule