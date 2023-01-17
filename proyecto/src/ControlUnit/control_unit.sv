module control_unit(
  input logic clk,

  input logic [3:0] cond,
  input logic [1:0] op,
  input logic [5:0] funct,
  input logic [3:0] rd,
  input logic [3:0] alu_flags,

  output logic pc_src,
  output logic mem_to_reg,
  output logic mem_write,
  output logic [3:0] alu_control,
  output logic alu_src,
  output logic reg_write,
  output logic [1:0] reg_src
);
  logic reg_w;
  logic mem_w;
  logic branch;
  logic alu_op;
  main_decoder main_deco (
    .op(op),
    .funct(funct),
    .reg_w(reg_w),
    .mem_w(mem_w),
    .mem_to_reg(mem_to_reg),
    .alu_src(alu_src),
    .reg_src(reg_src),
    .branch(branch),
    .alu_op(alu_op)
  );

  logic [1:0] flag_w;
  alu_decoder alu_deco (
    .funct(funct),
    .alu_op(alu_op),
    .alu_control(alu_control),
    .flag_w(flag_w)
  );

  logic pcs;
  pc_logic pc(
    .rd(rd),
    .branch(branch),
    .reg_w(reg_w),
    .pcs(pcs)
  );

  conditional_logic cond_logic(
    .clk(clk),
    .cond(cond),
    .alu_flags(alu_flags),
    .flag_w(flag_w),
    .pcs(pcs),
    .reg_w(reg_w),
    .mem_w(mem_w),
    .pc_src(pc_src),
    .reg_write(reg_write),
    .mem_write(mem_write)
  );
endmodule