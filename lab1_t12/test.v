// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_itf;

	// Inputs
	reg [11:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [3:0] F;
	reg [7:0] ans;
	reg [7:0] expected;

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		
		#20 D = 'b000000010001; expected = 'b00011001; #20 ans = {S, E, F}; if (ans != expected) $display("%b should be %b\n", D, 00011001);
		#20 D = 'b001111100000; expected = 'b01111000; #20 ans = {S, E, F}; if (ans != expected) $display("%b should be %b\n", D, 00011001);
		#20 D = 'b000000010001; expected = 'b00011001; #20 ans = {S, E, F}; if (ans != expected) $display("%b should be %b\n", D, 00011001);
		#20 D = 'b000000010001; expected = 'b00011001; #20 ans = {S, E, F}; if (ans != expected) $display("%b should be %b\n", D, 00011001);


#20
		$display("end");
		$finish;
	end
	


	
      
endmodule

