module mux_8
#(parameter INPUT_BITS = 2) (E0, E1, E2, E3, E4, E5, E6, E7, S, F);
    input logic [(INPUT_BITS-1):0] E0;
    input logic [(INPUT_BITS-1):0] E1;
    input logic [(INPUT_BITS-1):0] E2;
    input logic [(INPUT_BITS-1):0] E3;
    input logic [(INPUT_BITS-1):0] E4;
    input logic [(INPUT_BITS-1):0] E5;
    input logic [(INPUT_BITS-1):0] E6;
    input logic [(INPUT_BITS-1):0] E7;
    input logic [2:0] S;

    output logic [(INPUT_BITS-1):0] F;

    always @(*) begin
        case(S)
            3'b000: F <= E0;
            3'b001: F <= E1;
            3'b010: F <= E2;
            3'b011: F <= E3;
            3'b100: F <= E4;
            3'b101: F <= E5;
            3'b110: F <= E6;
            3'b111: F <= E7;
        endcase 
    end


endmodule