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

module e_f_tb;

	// Inputs
        reg [11:0] mag;
	wire [3:0] sig;
	wire [2:0] exp;
	wire fifth_bit;

	// Instantiate the Unit Under Test (UUT)
	round uut (.sig(sig), .exp(exp), .fifth_bit(round_bit), .F(F), .E(E));

	initial begin
        
        //first bit is index 2 or lower
        //exp = 0
        //sig = 111
        //fifth_bit = 0
        mag = 'b111;
        #5

        //first bit is index 2
        //exp = 0
        //sig = 1111
        //fifth_bit = 0
        mag = 'b1111;

        //first bit after index 4
        //exp = 1
        //sig = 1111
        //fifth_bit = 0
        mag = 'b11110;

        //highest possible value
        //exp = 111
        //sig = 1111
        //fifth_bit = 1
        mag = 2048

        //round bit set
        //exp = 10
        //sig = 1110
        //round_bit = 1
        mag = 'b111011;

	end
      
endmodule