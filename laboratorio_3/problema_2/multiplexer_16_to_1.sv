module multiplexer_16_to_1
	#(parameter n=8) 
	(input logic [n-1:0] d0, d1, d2, d3, d4, d5, d6, d7,
								d8, d9, d10, d11, d12, d13, d14, d15,
	input logic [3:0] s, 
	output logic [n-1:0] y);
	
	logic [n-1:0] mux_4_1;
	logic [n-1:0] mux_4_2;
	logic [n-1:0] mux_4_3;
	logic [n-1:0] mux_4_4;
	
	multiplexer_4_to_1 #(n) multiplexer_4_to_1_1(d0, d1, d2, d3, s[1:0], mux_4_1);
	multiplexer_4_to_1 #(n) multiplexer_4_to_1_2(d4, d5, d6, d7, s[1:0], mux_4_2);
	multiplexer_4_to_1 #(n) multiplexer_4_to_1_3(d8, d9, d10, d11, s[1:0], mux_4_3);
	multiplexer_4_to_1 #(n) multiplexer_4_to_1_4(d12, d13, d14, d15, s[1:0], mux_4_4);
	multiplexer_4_to_1 #(n) multiplexer_4_to_1_result(mux_4_1, mux_4_2, mux_4_3, mux_4_4, 
															s[3:2], y);

endmodule
