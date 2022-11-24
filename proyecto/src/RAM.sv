module RAM(
  input clk,
  input rst,
  input logic write_en,
  input logic [31:0] addr,
  input logic [31:0] write_data,
  output logic [31:0] read_data
);
  logic [31:0] memory [1023:0];

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      memory <= '{ default: '0 };
    end 
    else begin
      if (write_en) memory[addr] <= write_data;
    end
  end

  always_comb begin
    read_data = memory[addr];
  end
endmodule