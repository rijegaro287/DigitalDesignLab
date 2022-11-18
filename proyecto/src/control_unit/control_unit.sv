module control_unit(
  input logic [3:0] cond,
  input logic [1:0] op,
  input logic [5:0] funct,
  input logic [3:0] rd,
  input logic [3:0] alu_flags,
  output logic pc_src,
  output logic mem_to_reg,
  output logic mem_write,
  output logic alu_control,
  output logic alu_src,
  output logic imm_src,
  output logic reg_write,
  output logic reg_src
);
  
endmodule