module unidad_aritmetica
#(parameter NUM_BITS = 2) (A, B, S, R, N, Z, C, V);
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;
    input logic [3:0] S;

    output logic [(NUM_BITS-1):0] R;
    output logic N, Z, C, V;

    logic [(NUM_BITS-1):0] ADDR_RESULT; 
    logic [(NUM_BITS-1):0] MULT_RESULT;
    logic [(NUM_BITS-1):0] DIV_RESULT;
    logic [(NUM_BITS-1):0] MOD_RESULT;

    logic CTRL;
    assign CTRL = !S[3] && !S[2] && !S[1] && S[0];
    sumador_restador #(.NUM_BITS(NUM_BITS)) sumador_restador(
        .Cin(CTRL),
        .A(A),
        .B(B),
        .S(ADDR_RESULT),
        .C(C),
        .V(V)
    );

    logic mult_carry, mult_overflow;
    multiplicador #(.NUM_BITS(NUM_BITS)) multiplicador(
        .A(A),
        .B(B),
        .S(MULT_RESULT),
        .C(mult_carry),
        .V(mult_overflow)
    );

    mux_8 #(.INPUT_BITS(NUM_BITS)) op_selector(
        .E0(ADDR_RESULT),
        .E1(ADDR_RESULT),
        .E2(MULT_RESULT),
        .E3(DIV_RESULT),
        .E4(MOD_RESULT),
        .E5(0),
        .E6(0),
        .E7(0),
        .S(S),
        .F(R)
    );

    assign N = R[NUM_BITS-1];
    assign Z = ~|R;
endmodule