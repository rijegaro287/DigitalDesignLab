module pc_logic(
  input logic [3:0] rd,
  input logic branch,
  input logic reg_w,

  output logic pcs
);
  always_comb begin
    pcs = ((rd == 4'hF) & reg_w) | branch;
  end
endmodule