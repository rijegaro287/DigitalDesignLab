module and_gate #(parameter n = 8) (input logic [n-1:0] a, b, output logic [n-1:0] c);

	assign c = a & b;

endmodule
