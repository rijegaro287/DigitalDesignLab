`define NUM_BITS 2

module deco_alu(LD, A, B, S, R, Z, N, C, V);
    input logic LD;
    input logic [(`NUM_BITS-1):0] A;
    input logic [(`NUM_BITS-1):0] B;
    input logic [3:0] S;

    output logic [6:0] R;
    output logic Z, N, C, V;

    logic [(`NUM_BITS-1):0] input_A;
    logic [(`NUM_BITS-1):0] input_B;
    logic [3:0] input_S;

    always @(posedge LD) begin
        input_A <= A;
        input_B <= B;
        input_S <= S;
    end

    logic [(`NUM_BITS-1):0] alu_result;
    ALU #(.NUM_BITS(`NUM_BITS)) alu(
        .A(input_A),
        .B(input_B),
        .S(input_S),
        .R(alu_result),
        .Z(Z),
        .N(N),
        .C(C),
        .V(V)
    );

    bcd_deco deco(
        .NUM(alu_result),
        .SEG(R)
    );
endmodule