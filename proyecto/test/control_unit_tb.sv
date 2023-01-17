module control_unit_tb();
  logic clk;
  
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

  control_unit dut(
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

  initial begin
    clk = 0;
    cond = 4'b1110;
    op = 2'b00;
    funct = 6'b000000;
    rd = 4'b0000;
    alu_flags = 4'b0000;
  
    #10;

    // Procesamiento de datos distintas flags
    cond = 4'b0000;
    op = 2'b00;
    funct = 6'b101001; // ADDS 
    rd = 4'b0000;
    alu_flags = 4'b0001;
    #20;
    
    cond = 4'b1110; // CS/HS
    funct = 6'b100101; // SUBS
    alu_flags = 4'b0010;
    #20;
    
    funct = 6'b100001; //ANDS
    alu_flags = 4'b0100;
    #20;
    
    funct = 6'b111001; // ORRS
    alu_flags = 4'b1000;
    #20;
    
    funct = 6'b111011; // LSLS
    alu_flags = 4'b1000;
    #20;
    
    funct = 6'b111101; // LSRS
    alu_flags = 4'b1101;
    #20;
    
    funct = 6'b101001; // ADDS 
    alu_flags = 4'b1011;

    #20;
    
    op = 2'b01;
    cond = 4'b1110; // AL
    funct = 6'b011000; // STR 
    alu_flags = 4'b0000;

    #20;

    cond = 4'b1110; // AL
    funct = 6'b011001; // LDR 

    #20;

    $stop;
  end

  always #10 clk = ~clk;
endmodule

// 1110 00 1 0100 1 0000 0000 0000 00000010 // ADD R0, R0, #0x02
// 1110 00 1 0100 1 0000 0001 0000 00000101 // ADD R1, R0, #0x05
// 1110 00 1 0100 1 0001 0010 0000 00101010 // ADD R2, R1, #0x2A
// 1110 00 0 0100 1 0010 0001 00000 00 0 0000 // ADD R1, R2, R0
// 1110 00 0 0100 1 0010 0010 00000 00 0 0010 // ADD R2, R2, R2

// 1110 01 011000 0000 0010 000000000000; // STR R2, [R0], #0x00
// 1110 01 011000 0101 0001 000000001010; // STR R1, [R5], #0x0A
// 1110 01 011001 0000 0000 000000000000; // LDR R0, [R0], #0x00
// 1110 01 011001 0101 0100 000000001010; // LDR R4, [R5], #0x0A
// 1110 01 011001 0000 0010 000000001000; // LDR R2, [R0], #0x08

// 1110 10 10 111111111111111111110100; // B 0x4 -> primera instrucció