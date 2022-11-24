module mux_2
#(parameter INPUT_BITS = 2) (E0, E1, S, F);
  input logic S;
  input logic [(INPUT_BITS-1):0] E0;
  input logic [(INPUT_BITS-1):0] E1;

  output logic [(INPUT_BITS-1):0] F;

  always_comb begin
    case(S)
      0: F <= E0;
      1: F <= E1;
    endcase 
  end
endmodule