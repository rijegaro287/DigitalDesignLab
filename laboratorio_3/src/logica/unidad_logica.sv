module unidad_logica
#(parameter NUM_BITS = 2)(A, B, S, R);
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;
    input logic [2:0] S;

    output logic [(NUM_BITS-1):0] R;

    logic [(NUM_BITS-1):0] AND_RESULT;
    logic [(NUM_BITS-1):0] OR_RESULT;
    logic [(NUM_BITS-1):0] XOR_RESULT;
    logic [(NUM_BITS-1):0] LSHIFT_RESULT;
    logic [(NUM_BITS-1):0] RSHIFT_RESULT;

    AND_ #(.NUM_BITS(NUM_BITS)) AND_GATE(
        .A(A),
        .B(B),
        .R(AND_RESULT)
    );

    OR_ #(.NUM_BITS(NUM_BITS)) OR_GATE(
        .A(A),
        .B(B),
        .R(OR_RESULT)
    );

    XOR_ #(.NUM_BITS(NUM_BITS)) XOR_GATE(
        .A(A),
        .B(B),
        .R(XOR_RESULT)
    );

    LSHIFT_ #(.NUM_BITS(NUM_BITS)) LSHIFT(
        .A(A),
        .B(B),
        .R(LSHIFT_RESULT)
    );

    RSHIFT_ #(.NUM_BITS(NUM_BITS)) RSHIFT(
        .A(A),
        .B(B),
        .R(RSHIFT_RESULT)
    );

    mux_8 #(.INPUT_BITS(NUM_BITS)) op_selector(
        .E0(AND_RESULT),
        .E1(OR_RESULT),
        .E2(XOR_RESULT),
        .E3(LSHIFT_RESULT),
        .E4(RSHIFT_RESULT),
        .E5(1'b0),
        .E6(1'b0),
        .E7(1'b0),
        .S(S),
        .F(R)
    );
endmodule