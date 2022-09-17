`define NUM_BITS 4

module ALU(A, B, S, R, N, Z, C, V);    
    input logic [(`NUM_BITS-1):0] A;
    input logic [(`NUM_BITS-1):0] B;
    input logic [3:0] S;

    output logic [(`NUM_BITS-1):0] R;
    output logic N, Z, C, V;

    logic [(`NUM_BITS-1):0] ARITH_RESULT;
    logic [(`NUM_BITS-1):0] LOGIC_RESULT;

    unidad_aritmetica #(.NUM_BITS(`NUM_BITS)) 
        UA( .A(A), .B(B), .S(S[2:0]), .R(ARITH_RESULT), .N(N), .Z(Z), .C(C), .V(V) );

    mux_2 #(.INPUT_BITS(`NUM_BITS)) 
        op_selector( 
            .E0(ARITH_RESULT),
            .E1(LOGIC_RESULT),
            .S(S[3]),
            .F(R) 
        );
endmodule