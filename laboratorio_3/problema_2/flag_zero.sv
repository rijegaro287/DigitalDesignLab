module flag_zero #(parameter n = 8) (input logic [n-1:0] result, output logic zero);

	assign zero = ~(result || result);

endmodule
