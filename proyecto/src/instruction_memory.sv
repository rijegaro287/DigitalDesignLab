module instruction_memory(
  input logic [31:0] addr,
  output logic [31:0] data
);
  logic [31:0] memory [1023:0];

  initial begin
    // STR
    // memory[0] = 32'b11100101100100000000000000000000; // LDR R0, [R0], #0x00
    // memory[1] = 32'b11100101100100010001000000000001; // LDR R1, [R1], #0x01
    // memory[2] = 32'b11100101100100000010000000000010; // LDR R2, [R0], #0x02

    // ADD
    // memory[0] = 32'b11100000100000000000000000000010; // ADD R0, R0, #0x02
    // memory[1] = 32'b11100000100000000001000000000101; // ADD R1, R0, #0x05
    // memory[2] = 32'b11100000100000010010000000101010; // ADD R2, R1, #0x2A
  end

  always_comb begin
    data = memory[addr[9:0]];
  end
endmodule

//LDR R1, [R10], #0x02 -> 32'b1110 01 011001 1010 0001 000000000010;
//STR R0, [R2], #0x0A -> 32'b1110 01 011000 0010 0001 000000000010;

// ADD R0, R0, #0x02 -> 32'b1110 00 0 0100 0 0000 0000 000000000010;