module fulladder 
	#(parameter n = 8) 
		(input logic [n-1:0] a, b, 
		 input logic cin, 
		 output logic [n-1:0] c, 
		 output logic cout);

	assign {cout, c} = a + b + cin;	
													
endmodule
