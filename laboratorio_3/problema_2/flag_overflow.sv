module flag_overflow (input logic a, b, result_n,
													input logic [3:0] op,
												   output logic overflow);
													
	logic condition_1;
	logic condition_2;
	logic condition_3;
	logic condition_4;
	logic condition_5;
	logic condition_6;
	logic condition_7;
	
	xor_gate #(1) overflow_condition_1(a, b, condition_1);
	xor_gate #(1) overflow_condition_2(condition_1, op[0], condition_2);
	not_gate #(1) overflow_condition_3(condition_2, condition_3);
	xor_gate #(1) overflow_condition_4(a, result_n, condition_4);
	not_gate #(1) overflow_condition_5(op[1], condition_5);
	and_gate #(1) overflow_condition_6(condition_5, op[3], condition_6);
	and_gate #(1) overflow_condition_7(condition_3, condition_4, condition_7);
	and_gate #(1) overflow_condition_8(condition_6, condition_7, overflow);
	
endmodule
