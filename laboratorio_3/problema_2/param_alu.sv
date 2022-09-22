module param_alu #(parameter n = 3) (input logic [n-1:0] a, b, 
												 input logic [3:0] s,
												 output logic [n-1:0] c,
												 output logic zero, negative, _carry, overflow);
	logic [n-1:0] not_b;
	logic [n-1:0] b_mux;
	logic [n-1:0] sum;
	logic [n-1:0] and_result;
	logic [n-1:0] or_result;
	logic [n-1:0] xor_result;
	logic [n-1:0] multi_result;
	logic [n-1:0] divi_result;
	logic [n-1:0] lrs_result;
	logic [n-1:0] lls_result;
	logic [n-1:0] ars_result;
	logic [n-1:0] als_result;
	logic cout;
	not_gate #(n) not_op(b, not_b);
	multiplexer_2_to_1 #(n) b_multiplexer(b, not_b, s[0], b_mux);
	fulladder #(n) adder(a, b_mux, s[0], sum, cout);
	and_gate #(n) and_op(a, b, and_result);
	or_gate #(n) or_op(a, b, or_result);
	xor_gate #(n) xor_op(a, b, xor_result);
	
	multiplication #(n) multi_op(a, b, multi_result);
	division #(n) divi_op(a, b, divi_result);
	
	
	l_right_shifter #(n) logic_right_shift_op(a, b, lrs_result);
	l_left_shifter #(n) logic_left_shift_op(a, b, lls_result);
	a_right_shifter #(n) aritmetic_right_shift_op(a, b, ars_result);
	a_left_shifter #(n) aritmetic_left_shift_op(a, b, als_result);
	
	multiplexer_16_to_1 #(n) op_selector(
													and_result,   //D0
													or_result, 	  //D1
													xor_result,   //D2
													lls_result,   //D3
													lrs_result,   //D4
													0,            //D5
													0,            //D6
													0,            //D7
													sum,          //D8
													sum, 	        //D9
													multi_result, //D10
													divi_result,  //D11
													als_result,   //D12
													ars_result,   //D13
													0, 			  //D14
													0, 			  //D15
													s, 
													c);
	
	flag_zero #(n) zero_conditions(c, zero);
	flag_negative negative_conditions(c[n-1], s[3], negative);
	flag_carry carry_conditions(cout, s, _carry);
	flag_overflow overflow_conditions(a[n-1], b[n-1], sum[n-1], s, overflow);

endmodule
