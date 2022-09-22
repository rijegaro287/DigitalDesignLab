module a_right_shifter #(parameter n = 8) (input signed [n-1:0] a, b, output signed [n-1:0] s); 

	assign s = a >>> b;

endmodule
