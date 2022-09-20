module multiplicador
#(parameter NUM_BITS = 2)(A, B, S, C, V);
    input [(NUM_BITS-1):0] A;
    input [(NUM_BITS-1):0] B;

    output [(NUM_BITS-1):0] S;
    output C, V;

    logic [(NUM_BITS-1):0] co [(NUM_BITS-1):0];
    logic [(NUM_BITS-1):0] sum [(NUM_BITS-1):0];
    generate
        genvar i, j;
        for (i = 0; i < NUM_BITS; i = i+1) begin : array_multiplier 
            for (j = 0; j < NUM_BITS; j = j+1) begin : cols
                sumador_completo sumador_completo_i(
                    .Cin(i == 0 ? 0 : co[i-1][j]),
                    .A(j == 0 ? 0 :
                        (i == (NUM_BITS-1) ? co[i][j-1] :
                            sum[i+1][j-1])),
                    .B(A[j] && B[i]),
                    .Cout(co[i][j]),
                    .S(sum[i][j])
                );
            end
        end
    endgenerate

    logic [(NUM_BITS-1):0] P0;
    logic [(NUM_BITS-1):0] P1;

    assign P0 = sum[0];
    generate
        genvar k;
        for (i = 1; i < NUM_BITS; i = i+1) begin : array_sum
            assign P1[i] = (i == NUM_BITS-1 ? co[NUM_BITS-1][NUM_BITS-1] : sum[i][NUM_BITS-1]);
        end
    endgenerate

    assign S = P0;
    assign C = |P1;
    assign V = C;
endmodule