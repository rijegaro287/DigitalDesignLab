module not_gate #(parameter n = 8) (input logic [n-1:0] a, output logic [n-1:0] c);

	assign c = ~a;

endmodule
