module ALU
#(parameter NUM_BITS = 32)(A, B, S, R, N, Z, C, V);    
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;
    input logic [3:0] S;

    output logic [(NUM_BITS-1):0] R;
    output logic N, Z, C, V;

    logic [(NUM_BITS-1):0] ARITH_RESULT;
    logic [(NUM_BITS-1):0] LOGIC_RESULT;

    logic ua_carry, ua_overflow;
    unidad_aritmetica #(.NUM_BITS(NUM_BITS)) UA(
        .A(A),
        .B(B),
        .S(S[2:0]),
        .R(ARITH_RESULT),
        .C(ua_carry),
        .V(ua_overflow)
    );
 
    unidad_logica #(.NUM_BITS(NUM_BITS)) UL(
        .A(A),
        .B(B),
        .S(S[2:0]),
        .R(LOGIC_RESULT)
    );

    assign R = S[3] ? LOGIC_RESULT : ARITH_RESULT;
    
    assign N = R[NUM_BITS-1];
    assign Z = ~|R;
    assign C = S[3] ? 1'b0 : ua_carry;
    assign V = S[3] ? 1'b0 : ua_overflow;
endmodule