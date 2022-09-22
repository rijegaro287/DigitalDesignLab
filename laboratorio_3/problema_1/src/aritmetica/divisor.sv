module divisor
#(parameter NUM_BITS = 2)(A, B, S);
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;

    output logic [(NUM_BITS-1):0] S;

    assign S = A / B;
endmodule