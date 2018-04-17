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
module FPCVT(
    input [11:0] D,
    output S,
    output [2:0] E,
    output [3:0] F
    );
	 
	 wire [11:0] mag;
	 //wire first_bit;
	 wire [3:0] first_bit;
	 wire [3:0] f_temp;
	 wire round_bit;
	 wire [2:0] exp;
	
	 get_sign sign1(.D(D), .S(S));
	 
	 assign mag[11:0] = (S) ? (~D + 1) : D;
	 
	 priority_encoder p1(.IN(mag), .OUT(first_bit));
	 
	 get_f_temp gm1(.enc(first_bit), .mag(mag), .ans(f_temp), .round_bit(round_bit));
	 get_exp e1(.first_bit(first_bit), .exp(exp));
	 
	 round r1(.mag(mag), .f_temp(f_temp), .exp(exp), .round_bit(round_bit), .F(F), .E(E));
	 
	 
	
endmodule
	
//get sign 
module get_sign(input [11:0] D, output S);
	assign S = D[11];
endmodule

//get magnitude value
module get_f_temp(input [3:0] enc, input [11:0] mag, output reg [3:0] ans, output reg round_bit);
	always @ (enc, mag) begin
		if (enc <= 3) begin
			ans[3:0] <= mag[3:0];
			round_bit <= 0;
		end
		else begin
			ans[3:0] <= mag[enc -: 4];
			round_bit <= mag[enc-4];
		end
	end
endmodule

//get exponent value
module get_exp(input [3:0] first_bit, output reg [2:0] exp);
	always @ (first_bit) begin
	if (first_bit <= 3)
		exp[2:0] <= 0;
	else
		exp[2:0] <= first_bit[3:0] - 3;
	end

endmodule

module round(input [11:0] mag, input [3:0] f_temp, input [2:0] exp, input round_bit, output [3:0] F, output [2:0] E);
	wire [3:0] f1;
	wire [2:0] e1;
	wire overflow;
	assign overflow = (&f_temp) && round_bit;
	assign f1 = (round_bit && (&f_temp)) ? 4'b1000 : (round_bit ? f_temp + 1 : f_temp);
	
	assign e1 = ((exp >= 7) && overflow) ? 7 : (overflow ? exp + 1 : exp);
	assign F = mag >= 1921 ? 4'b1111 : f1;
	assign E = mag >= 1921 ? 3'b111 : e1;
endmodule
	
//get position of leading 1
module priority_encoder(
	input wire [11:0] IN,
	output reg [3:0] OUT
	);
	
	always @* begin
		if (IN[11]) OUT <= 11;
			
		else if (IN[10]) OUT <= 10;
			
		else if (IN[9]) OUT <= 9;
			
		else if (IN[8]) OUT <= 8;
			
		else if (IN[7]) OUT <= 7;
			
		else if (IN[6]) OUT <= 6;
			
		else if (IN[5]) OUT <= 5;
			
		else if (IN[4]) OUT <= 4;
			
		else if (IN[3]) OUT <= 3;
			
		else if (IN[2]) OUT <= 2;

		else if (IN[1]) OUT <= 1;
			
		else if (IN[0]) OUT <= 0;
		
		else OUT <= 0;
  end
  	
endmodule
