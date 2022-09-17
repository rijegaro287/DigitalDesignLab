module mux_2
#(parameter INPUT_BITS = 2) (E0, E1, S, F);
    input logic [(INPUT_BITS-1):0] E0;
    input logic [(INPUT_BITS-1):0] E1;
    input logic S;

    output logic [(INPUT_BITS-1):0] F;

    always @(*) begin
        case(S)
            1'b0: F <= E0;
            1'b1: F <= E1;
        endcase 
    end
endmodule