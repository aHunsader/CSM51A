`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:34:30 04/12/2018 
// Design Name: 
// Module Name:    priority_encoder 
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
