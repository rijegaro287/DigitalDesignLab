module sumador
#(parameter NUM_BITS = 2)(Cin, A, B, S, C, V);
    input logic Cin;
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;

    output logic [(NUM_BITS-1):0] S;
    output logic C, V;

    logic [(NUM_BITS-1):0] carry;
    generate
        genvar i;
        for (i = 0; i < NUM_BITS; i = i + 1) begin : sumador_n
            sumador_completo sumador_i(
                .Cin(i == 0 ? Cin : carry[i-1]),
                .A(A[i]),
                .B(B[i]),
                .Cout(carry[i]),
                .S(S[i])
            );
        end
    endgenerate

    assign C = carry[NUM_BITS-1];
    assign V = carry[NUM_BITS-1] ^ carry[NUM_BITS-2];
endmodule