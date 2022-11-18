module main(
  input clk,
  input rst
);
  logic [31:0] pc_next;
  logic [31:0] pc;

  logic [31:0] instruction;

  logic reg_write_en = 1;
  logic [3:0] addr_1;
  logic [3:0] addr_2;
  logic [3:0] addr_3;
  logic [31:0] reg_write_data;
  logic [31:0] r15;
  logic [31:0] read_data_1;
  logic [31:0] read_data_2;

  logic [31:0] extend_immediate;

  logic [3:0] alu_ctrl = 4'b0000;
  logic [31:0] alu_result;
  logic N, Z, C, V;

  logic mem_write_en = 0;
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
    .addr_1(addr_1),
    .addr_2(addr_2),
    .addr_3(addr_3),
    .write_data(mem_read_data),
    // .write_data(reg_write_data),
    .r15(r15),
    .read_data_1(read_data_1),
    .read_data_2(read_data_2)
  );

  ALU #(.NUM_BITS(32)) 
    alu(
      .A(read_data_1),
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
    addr_1 = instruction[19:16];
    addr_3 = instruction[15:12];
    extend_immediate = 32'(instruction[11:0]);

    // reg_write_data = mem_read_data;

    pc_next = pc + 4;
  end
endmodule