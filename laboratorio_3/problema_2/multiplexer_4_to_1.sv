module multiplexer_4_to_1
	#(parameter n=8) 
	(input logic [n-1:0] d0, d1, d2, d3,
	input logic [1:0] s, 
	output logic [n-1:0] y);
	
	logic [n-1:0] mux_2_1;
	logic [n-1:0] mux_2_2;
	
	multiplexer_2_to_1 #(n) multiplexer_2_to_1_1(d0, d1, s[0], mux_2_1);
	multiplexer_2_to_1 #(n) multiplexer_2_to_1_2(d2, d3, s[0], mux_2_2);
	multiplexer_2_to_1 #(n) multiplexer_2_to_1_result(mux_2_1, mux_2_2, s[1], y);

endmodule
