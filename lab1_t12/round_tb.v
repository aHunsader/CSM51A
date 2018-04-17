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
	reg [11:0] mag;
	reg [3:0] temp;
	reg [2:0] exp;
	reg round_bit;

	// Outputs
	wire [3:0] F;
	wire [2:0] E;

	// Instantiate the Unit Under Test (UUT)
	round uut (.mag(mag), .f_temp(f_temp), .exp(exp), .round_bit(round_bit), .F(F), .E(E));

	initial begin
		#100;
        
        //test mag = 2047
        //F = 1111
        //E = 111
        mag = 'b011111111111;
        f_temp = 'b1111;
        exp = 'b111;
        round_bit = 1;
        #20

        //test mag = 1920
        //F = 1111
        //E = 111
        mag = 'b011110000000;
        f_temp = 'b1111;
        exp = 'b111;
        round_bit = 0;
        #20

        //test mag = 1921
        //F  = 1111
       	//E = 111
       	mag = 'b011110000001;
       	f_temp = 'b1111;
       	exp = 'b111;
       	round_bit = 1;
       	#20


        //test standard value
        //F = 0001
        //E = 000
        mag = 1;
        f_temp = 1;
        exp = 0;
        round_bit = 0;
        #20

        //test round overflows f_temp
        //F = 1000
        //E = 010
        mag = 'b000000011111;
        exp = 1;
        f_temp = 'b1111;
        round_bit = 1;
        #20

        //test round doesn't overflow f_temp
        //F = 1001
        //E = 001
        mag = 'b000000010001;
        exp = 1;
        f_temp = 'b1000;
        round_bit = 1;
        #20

	end
      
endmodule
