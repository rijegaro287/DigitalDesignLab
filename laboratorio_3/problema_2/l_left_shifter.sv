module l_left_shifter #(parameter n = 8) (input logic [n-1:0] a, b, output logic [n-1:0] s); 

	assign s = a << b;

endmodule
