module multiplexer_2_to_1
	#(parameter n=8) 
	(input logic [n-1:0] d0, d1,
	input logic s, 
	output logic [n-1:0] y);
	
	assign y = s ? d1:d0;
	

endmodule
