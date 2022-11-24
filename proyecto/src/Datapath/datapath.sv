module datapath(
  input logic clk,
  input logic rst,

  input logic pc_src,
  input logic mem_to_reg,
  input logic mem_write,
  input logic [3:0] alu_control,
  input logic alu_src,
  input logic reg_write,
  input logic [1:0] reg_src,

	output logic [3:0] cond,
	output logic [1:0] op,
	output logic [5:0] funct,
  output logic [3:0] rd,
  output logic [4:0] alu_flags
);
  logic [31:0]empty;

  logic [31:0] pc_next;
  logic [31:0] pc;
  D_FF PC(
    .CLK(clk),
    .RST(rst),
    .D(pc_next),
    .Q(pc)
  );

  logic [31:0] instruction;
  InstructionRom inst_mem (
    .addr(pc),
    .data(instruction)
  );

  logic [3:0] rn;
  logic [3:0] rm;
  logic [31:0] immediate;
  InstructionDecoder inst_decoder(
    .instruction(instruction),
    .cond(cond),
    .op(op),
    .funct(funct),
    .Rn(rn),
    .Rm(rm),
    .Rd(rd),
    .imm(immediate)
  );

  logic reg_addr_1;
  logic reg_addr_2;
  mux_2 mux_reg_addr_1(
    .E0(rn),
    .E1(4'hF),
    .S(reg_src[1]),
    .F(reg_addr_1)
  );

  mux_2 mux_reg_addr_2(
    .E0(rm),
    .E1(rd),
    .S(reg_src[0]),
    .F(reg_addr_2)
  );

  logic [31:0] reg_data_1;
  logic [31:0] reg_data_2;
  register_file reg_file (
    .clk(clk),
    .rst(rst),
    .write_en(reg_write),
    .addr_1(reg_addr_1),
    .addr_2(reg_addr_2),
    .addr_3(rd),
    .write_data(result),
    .r15(pc_plus_8),
    .read_data_1(reg_data_1),
    .read_data_2(reg_data_2)
  );

  logic [31:0] alu_src_b;
  mux_2 mux_alu_b(
    .E0(reg_data_2),
    .E1(immediate),
    .S(alu_src),
    .F(alu_src_b)
  );

  logic [31:0] alu_result;
  ALU #(.NUM_BITS(32)) 
    alu(
      .A(reg_data_1),
      .B(alu_src_b),
      .S(alu_control),
      .R(alu_result),
      .N(alu_flags[3]),
      .Z(alu_flags[2]),
      .C(alu_flags[1]),
      .V(alu_flags[0])
    );

  logic [31:0] mem_data;
  data_memory data_mem (
    .clk(clk),
    .rst(rst),
    .write_en(mem_write),
    .addr(alu_result),
    .write_data(reg_data_2),
    .read_data(mem_data)
  );

  logic [31:0] result;
  mux_2 mux_result(
    .E0(alu_result),
    .E1(mem_data),
    .S(mem_to_reg),
    .F(result)
  );
  
  logic [31:0] pc_plus_4;
  logic [31:0] pc_plus_8;
  mux_2 mux_pc_next(
    .E0(pc_plus_4),
    .E1(result),
    .S(pc_src),
    .F(pc_next)
  );

  assign pc_plus_4 = pc + 4;
  assign pc_plus_8 = pc + 8;
endmodule