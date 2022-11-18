module register_file(
  input logic clk,
  input logic rst,
  input logic WE3,
  input logic [3:0] A1,
  input logic [3:0] A2,
  input logic [3:0] A3,
  input logic [31:0] WD3,
  input logic [31:0] R15,
  output logic [31:0] RD1,
  output logic [31:0] RD2
);
  logic [31:0] registers [14:0];

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin 
      registers <= '{default: '0};
    end
    else begin 
      if (WE3) registers[A3] <= WD3;
    end 
  end

  always_comb begin
    RD1 = (A1 == 4'hF) ? R15 : registers[A1];
    RD2 = (A2 == 4'hF) ? R15 : registers[A2];
  end
endmodule