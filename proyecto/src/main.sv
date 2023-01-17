module main(
  input logic clk,
  input logic rst
);
  logic [3:0] cond;
  logic [1:0] op;
  logic [5:0] funct;
  logic [3:0] rd;
  logic [3:0] alu_flags;
  logic pc_src;
  logic mem_to_reg;
  logic mem_write;
  logic [3:0] alu_control;
  logic alu_src;
  logic reg_write;
  logic [1:0] reg_src;

  control_unit ctrl_unit(
    .clk(clk),
    .cond(cond),
    .op(op),
    .funct(funct),
    .rd(rd),
    .alu_flags(alu_flags),
    .pc_src(pc_src),
    .mem_to_reg(mem_to_reg),
    .mem_write(mem_write),
    .alu_control(alu_control),
    .alu_src(alu_src),
    .reg_write(reg_write),
    .reg_src(reg_src)
  );

  datapath datapath(
    .clk(clk),
    .rst(rst),
    .pc_src(pc_src),
    .mem_to_reg(mem_to_reg),
    .mem_write(mem_write),
    .alu_control(alu_control),
    .alu_src(alu_src),
    .reg_write(reg_write),
    .reg_src(reg_src),
    .cond(cond),
    .op(op),
    .funct(funct),
    .rd(rd),
    .alu_flags(alu_flags)
  );
endmodule