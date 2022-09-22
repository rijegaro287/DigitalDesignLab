module flag_carry(input logic cout, input logic [3:0] op,
												output logic _carry);

	logic condition_1;
	logic condition_2;
												
	not_gate #(1) carry_condition_1(op[1], condition_1);
	and_gate #(1) carry_condition_2(condition_1, op[3], condition_2);
	and_gate #(1) carry_condition_3(condition_2, cout, _carry);

endmodule
