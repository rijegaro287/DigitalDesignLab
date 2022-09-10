module unidad_aritmetica
#(parameter NUM_BITS = 2) (A, B, S, R, N, Z, C, V);
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;
    input logic [3:0] S;

    output logic [(NUM_BITS-1):0] R;
    output logic N, Z, C, V;

    logic GND;
    assign GND = 0;

    logic ADDR_CTRL;
    assign ADDR_CTRL = ~S[3] & ~S[2] & S[0];

    logic [(NUM_BITS-1):0] ADDR_RESULT;
    logic [(NUM_BITS-1):0] MULT_RESULT;
    logic [(NUM_BITS-1):0] DIV_RESULT;
    logic [(NUM_BITS-1):0] MOD_RESULT;

    sumador_restador #(.NUM_BITS(NUM_BITS))
        sumador_restador_0(.A(A), .B(B), .CTRL(ADDR_CTRL), .Cout(C), .R(ADDR_RESULT));

    mux_8 #(.INPUT_BITS(NUM_BITS)) 
        op_selector(
            .E0(ADDR_RESULT),
            .E1(ADDR_RESULT),
            .E2(MULT_RESULT),
            .E3(DIV_RESULT),
            .E4(MOD_RESULT),
            .E5(GND),
            .E6(GND),
            .E7(GND),
            .S(S),
            .F(R)
        );
endmodule