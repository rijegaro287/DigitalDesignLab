module datapath(
  input logic clk,
  input logic rst,

  // Nuevo valor de pc -> 0 = PC+4, 1 = resultado (alu o memoria)
  input logic pc_src,
  // Valor a escribir en los registros -> 0 = alu, 1 = memoria 
  input logic mem_to_reg, 
  // Habilita la escritura de datos en memoria
  input logic mem_write,
  // Selecciona la operación de la ALU
  input logic [3:0] alu_control,
  // Selecciona el segundo operando de la ALU -> 0 = registros, 1 = inmediato
  input logic alu_src,
  // Habilita la escritura de datos en los registros
  input logic reg_write,
  // Selecciona las direcciones de los registros
  // reg_src[0] controla ra1, reg_src[1] controla ra2
  // reg_src[0] = 0 -> rn, reg_src[0] = 1 -> PC
  // reg_src[1] = 0 -> rm, reg_src[1] = 1 -> rd
  input logic [1:0] reg_src,

	output logic [3:0] cond,
	output logic [1:0] op,
	output logic [5:0] funct,
  output logic [3:0] rd,
  output logic [3:0] alu_flags
);
  logic [31:0] result;
  
  logic [31:0] pc_plus_4;
  logic [31:0] pc_plus_8;

  logic [31:0] pc_next;
  logic [31:0] pc;
  D_FF #(.NUM_BITS(32)) 
    PC(
      .CLK(clk),
      .RST(rst),
      .D(pc_next),
      .Q(pc)
    );

  logic [31:0] instruction;
  InstructionROM inst_mem (
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

  logic [3:0] reg_addr_1;
  logic [3:0] reg_addr_2;
  mux_2 #(.INPUT_BITS(4))
    mux_reg_addr_1(
      .E0(rn),
      .E1(4'hF),
      .S(reg_src[0]),
      .F(reg_addr_1)
    );

  mux_2 #(.INPUT_BITS(4))
    mux_reg_addr_2(
      .E0(rm),
      .E1(rd),
      .S(reg_src[1]),
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
  mux_2 #(.INPUT_BITS(32))
    mux_alu_b(
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
  RAM data_mem (
    .clk(clk),
    .rst(rst),
    .write_en(mem_write),
    .addr(alu_result),
    .write_data(reg_data_2),
    .read_data(mem_data)
  );

  mux_2 #(.INPUT_BITS(32))
    mux_result(
      .E0(alu_result),
      .E1(mem_data),
      .S(mem_to_reg),
      .F(result)
    );

  mux_2 #(.INPUT_BITS(32))
    mux_pc_next(
      .E0(pc_plus_4),
      .E1(result),
      .S(pc_src),
      .F(pc_next)
    );

  assign pc_plus_4 = pc + 4;
  assign pc_plus_8 = pc + 8;
endmodule