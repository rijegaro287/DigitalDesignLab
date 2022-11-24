module extend(
  input logic [1:0] imm_src,
  input logic [23:0] imm,
  output logic [31:0] ext_imm
);
  always_comb begin
    case(imm_src) begin
      case 2'b00: ext_imm = 32'(imm[7:0]);
      case 2'b01: ext_imm = 32'(imm[11:0]);
      case 2'b10: ext_imm = 32'(imm[23:0]);
      default: ext_imm = 32'h00000000;
    end
  end
endmodule