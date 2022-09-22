module flag_negative (input logic result_n, op, output logic negative);

	and_gate #(1) negative_condition(result_n, op, negative);

endmodule
