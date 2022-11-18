module instruction_memory(
  input logic [31:0] addr,
  output logic [31:0] data
);
  logic [31:0] memory [1023:0];

  initial begin
    memory[0] = 32'b11100101100110100001000000000010;
  end

  always_comb begin
    data = memory[addr[9:0]];
  end
endmodule

//LDR R1, R10, #0x02 ->  32'b1110 01 011001 1010 0001 000000000010;