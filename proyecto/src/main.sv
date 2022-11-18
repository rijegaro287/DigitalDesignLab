module main(
  input clk,
  input rst
);
  logic [3:0] cond;
  logic [1:0] op;
  logic [5:0] funct;
  logic [3:0] rd;
  logic [3:0] alu_flags;
  logic pc_src;
  logic mem_to_reg;
  logic mem_write;
  logic alu_control;
  logic alu_src;
  logic imm_src;
  logic reg_write;
  logic reg_src;

  logic [31:0] pc_next;
  logic [31:0] pc;

  logic [31:0] instruction;

  logic reg_write_en;
  logic [3:0] reg_addr_1;
  logic [3:0] reg_addr_2;
  logic [3:0] reg_addr_3;
  logic [31:0] reg_write_data;
  logic [31:0] r15;
  logic [31:0] reg_read_data_1;
  logic [31:0] reg_read_data_2;

  logic [31:0] extend_immediate;

  logic [3:0] alu_ctrl;
  logic [31:0] alu_result;
  logic N, Z, C, V;

  logic mem_write_en;
  logic [31:0] mem_write_data;
  logic [31:0] mem_read_data;

  D_FF PC(
    .CLK(clk),
    .RST(rst),
    .D(pc_next),
    .Q(pc)
  );

  instruction_memory inst_mem (
    .addr(pc),
    .data(instruction)
  );

  register_file reg_file (
    .clk(clk),
    .rst(rst),
    .write_en(reg_write_en),
    .addr_1(reg_addr_1),
    .addr_2(reg_addr_2),
    .addr_3(reg_addr_3),
    .write_data(reg_write_data),
    .r15(r15),
    .read_data_1(reg_read_data_1),
    .read_data_2(reg_read_data_2)
  );

  ALU #(.NUM_BITS(32)) 
    alu(
      .A(reg_read_data_1),
      .B(extend_immediate),
      .S(alu_ctrl),
      .R(alu_result),
      .N(N),
      .Z(Z),
      .C(C),
      .V(V)
    );

  data_memory data_mem (
    .clk(clk),
    .rst(rst),
    .write_en(mem_write_en),
    .addr(alu_result),
    .write_data(mem_write_data),
    .read_data(mem_read_data)
  );

  always_comb begin
    // LDR
    // pc_src = 0;
    // reg_write_en = 1;
    // mem_write_en = 0;
    // alu_ctrl = 4'b0000;
    // imm_src = 1;
    // mem_to_reg = 1;

    //STR
    // pc_src = 0;
    // reg_write_en = 0;
    // mem_write_en = 1;
    // alu_ctrl = 4'b0000;
    // imm_src = 1;
    // mem_to_reg = 1;

    // ADD
    pc_src = 0;
    reg_write_en = 1;
    mem_write_en = 0;
    alu_ctrl = 4'b0000;
    imm_src = 0;
    mem_to_reg = 0;

    reg_addr_1 = instruction[19:16];
    reg_addr_2 = instruction[15:12];
    reg_addr_3 = instruction[15:12];

    extend_immediate = imm_src ? 32'(instruction[11:0]) : 32'(instruction[8:0]);
    reg_write_data = mem_to_reg ? mem_read_data : alu_result;
    mem_write_data = reg_read_data_2;

    pc_next = pc_src ? reg_write_data : (pc + 1);
    r15 = pc + 2;
    // pc_next = pc_src ? reg_write_data : (pc + 4);
    // r15 = pc + 8;
  end
endmodule