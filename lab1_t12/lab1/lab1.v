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
    wire [2:0] exp;
    wire [3:0] sig;
    wire fifth_bit;
	 
	sign_mag s(.D(D), .S(S), .mag(mag));
	e_f e(.mag(mag), .exp(exp), .sig(sig), .fifth_bit(fifth_bit));
	round r(.exp(exp), .sig(sig), .fifth_bit(fifth_bit), .E(E), .F(F));
	
endmodule
	
//get sign 
module sign_mag(input [11:0] D, output S, output [11:0] mag);
	assign S = D[11];
	assign mag = D[11] ? (~D + 1) : D;
endmodule


module e_f(input [11:0] mag, output reg [2:0] exp, output reg [3:0] sig, output reg fifth_bit);
	wire [3:0] first_bit;
	priority_encoder p(.IN(mag), .OUT(first_bit));

	always @ (mag, first_bit) begin
		if (first_bit <= 3) begin
			sig[3:0] <= mag[3:0];
			fifth_bit <= 0;
			exp[2:0] <= 0;
		end
		else begin
			sig[3:0] <= (first_bit == 11) ? 'b1111 : mag[first_bit -: 4];
			fifth_bit <= mag[first_bit-4];
			exp[2:0] <= (first_bit == 11) ? 7 : first_bit[3:0] - 3;
		end
	end

endmodule


module round(input [2:0] exp, input [3:0] sig, input fifth_bit, output [2:0] E, output [3:0] F);
	wire [4:0] f_temp;
	wire [3:0] e_temp;
	wire [4:0] temp;
	assign f_temp = fifth_bit ? sig + 1 : sig;
	assign e_temp = (f_temp == 'b10000) ? exp + 1 : exp;
	assign E = (e_temp == 'b1000) ? 'b111 : e_temp;
	assign temp = (f_temp == 'b10000) ? 'b1000 : f_temp;
	assign F = ((f_temp == 'b10000) && (e_temp == 'b1000)) ? 'b1111 : temp;
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