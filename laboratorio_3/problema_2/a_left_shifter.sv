module a_left_shifter #(parameter n = 8) (input [n-1:0] a, b, output [n-1:0] s); 

	assign s = a <<< b;

endmodule
