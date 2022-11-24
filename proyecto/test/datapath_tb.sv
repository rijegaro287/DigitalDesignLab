`timescale 1ns / 1ns

module datapath_tb();
  logic clk;
  logic rst;

  logic pc_src;
  logic mem_to_reg;
  logic mem_write;
  logic [3:0] alu_control;
  logic alu_src;
  logic reg_write;
  logic [1:0] reg_src;

	logic [3:0] cond;
	logic [1:0] op;
	logic [5:0] funct;
  logic [3:0] rd;
  logic [4:0] alu_flags;

  datapath dut(
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

  initial begin
    clk = 0;
    rst = 1;

    pc_src = 0;
    mem_to_reg = 0;
    mem_write = 0;
    alu_control = 0;
    alu_src = 0;
    reg_write = 0;
    reg_src = 0;

    #50; rst = 0; 

    // Instrucción vacía

    #21; // Espera antes de setear las flags

    alu_src = 1;
    reg_write = 1;
    reg_src[1] = 1;
    // 1110 00 1 0100 0 0000 0000 0000 00000010 // ADD R0, R0, #0x02

    #19; 

    // 1110 00 1 0100 0 0000 0001 0000 00000101 // ADD R1, R0, #0x05

    #20;

    // 1110 00 1 0100 0 0001 0010 0000 00101010 // ADD R2, R1, #0x2A

    #21;

    alu_src = 0;
    reg_src[1] = 0;
    // 1110 00 0 0100 0 0010 0001 00000 00 0 0000 // ADD R1, R2, R0

    #19;

    // 1110 00 0 0100 0 0010 0010 00000 00 0 0010 // ADD R2, R2, R2

    #21;

    mem_write = 1;
    reg_write = 0;
    alu_src = 1;
    reg_src[1] = 1;
    // 1110 01 011000 0000 0010 000000000000; // STR R2, [R0], #0x00

    #19;

    // 1110 01 011000 0101 0001 000000001010; // STR R1, [R5], #0x0A

    #21;

    mem_write = 0;
    reg_write = 1;
    mem_to_reg = 1;
    // 1110 01 011001 0000 0000 000000000000; // LDR R0, [R0], #0x00

    #19;

    // 1110 01 011001 0101 0100 000000001010; // LDR R4, [R5], #0x0A

    #20;

    // 1110 01 011001 0000 0010 000000001000; // LDR R2, [R0], #0x08

    #21;

    pc_src = 1;
    mem_to_reg = 0;
    reg_write = 0;
    reg_src[0] = 1;
    // 1110 10 10 111111111111111111110100; // B 0x4 -> primera instrucción

    #19;

    #19; // Antes de ejecutar la siguiente instrucción

    $stop;
  end

  always #10 clk = ~clk;
endmodule