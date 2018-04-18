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

module round_tb;

	// Inputs
	reg [3:0] sig;
	reg [2:0] exp;
	reg round_bit;

	// Outputs
	wire [3:0] F;
	wire [2:0] E;

	// Instantiate the Unit Under Test (UUT)
	round uut (.sig(sig), .exp(exp), .fifth_bit(round_bit), .F(F), .E(E));

	initial begin
		#100;
        
        //past highest number
        //F = 1111
        //E = 111
        sig = 'b1111;
        exp = 'b111;
        round_bit = 1;
        #5


        //test standard value
        //F = 0001
        //E = 000
        sig = 1;
        exp = 0;
        round_bit = 0;
        #5

        //test round round_bit increases sig, with sig overflow
        //F = 1000
        //E = 010
        exp = 1;
        sig = 'b1111;
        round_bit = 1;
        #5

        //test round_bit increases sig, without sig overflow
        //F = 1001
        //E = 001
        exp = 1;
        sig = 'b1000;
        round_bit = 1;
        #5

	end
      
endmodule