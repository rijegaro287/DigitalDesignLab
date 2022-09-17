module sumador_restador
#(parameter NUM_BITS = 2) (Cin, A, B, S, C, V);
    input logic Cin;
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;

    output logic [(NUM_BITS-1):0] S;
    output logic C, V;

    logic [(NUM_BITS-1):0] BXOR;
    generate
        genvar i;
        for (i = 0; i < NUM_BITS; i = i+1) begin : complement_b
            assign BXOR[i] = Cin ^ B[i];
        end
    endgenerate

    logic Co;
    sumador #(.NUM_BITS(NUM_BITS)) sumador (
        .Cin(Cin),
        .A(A),
        .B(BXOR),
        .S(S),
        .C(Co),
        .V(V)
    );

    assign C = Cin ^ Co;
endmodule