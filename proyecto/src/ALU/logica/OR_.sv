module OR_
#(parameter NUM_BITS = 2)(A, B, R);
	input logic [(NUM_BITS-1):0] A;
	input logic [(NUM_BITS-1):0] B;

	output logic [(NUM_BITS-1):0] R;

	assign R = A | B;
endmodule