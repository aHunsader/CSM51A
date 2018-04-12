`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:50 04/10/2018 
// Design Name: 
// Module Name:    int_to_float.v 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module priority_encoder(
	input wire [11:0] IN,
	output reg [3:0] OUT
	);
	
	always @* begin
		OUT = 0; // default value
		if (IN[11]) OUT = 11;
			
		else if (IN[10]) OUT = 10;
			
		else if (IN[9]) OUT = 9;
			
		else if (IN[8]) OUT = 8;
			
		else if (IN[7]) OUT = 7;
			
		else if (IN[6]) OUT = 6;
			
		else if (IN[5]) OUT = 5;
			
		else if (IN[4]) OUT = 4;
			
		else if (IN[3]) OUT = 3;
			
		else if (IN[2]) OUT = 2;

		else if (IN[1]) OUT = 1;
			
		else if (IN[0]) OUT = 0;
		
		else;
  end
  	
endmodule

module int_to_float(
    input [11:0] D,
    output S,
    output [2:0] E,
    output [3:0] F
    );
	 
	 wire [11:0] mag;
	 wire [3:0] leading_one;
	 //wire first_bit;
	 reg [3:0] first_bits = 0;
	 assign S = D[11];
	 
	 assign mag[11:0] = (S) ? (~D + 1) : D;

	priority_encoder p_encoder ( .IN(mag), .OUT(leading_one) );
	
	always @ (leading_one) begin
		if (leading_one < 3)
			first_bits[3:0] <= D[3:0];
		else
			first_bits[3:0] <= D[leading_one -: 4];
	end

//	 always @ (mag) begin
//		leading_one[3:0] = leading_one[3:0];//mag[leading_one-3 +: 3];
//	 end
	 
	 assign F[3:0] = first_bits[3:0];
	 assign E[2:0] = 0;
	 
	always @ (mag) begin
	
	end
	 
endmodule
