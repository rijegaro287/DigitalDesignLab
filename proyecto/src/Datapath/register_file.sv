module register_file(
  input logic clk,
  input logic rst,
  input logic write_en,
  input logic [3:0] addr_1,
  input logic [3:0] addr_2,
  input logic [3:0] addr_3,
  input logic [31:0] write_data,
  input logic [31:0] r15,
  output logic [31:0] read_data_1,
  output logic [31:0] read_data_2
);
  logic [31:0] registers [14:0];

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin 
      registers <= '{default: '0};
    end
    else begin 
      if (write_en) registers[addr_3] <= write_data;
    end 
  end

  always_comb begin
    read_data_1 = (addr_1 == 4'hF) ? r15 : registers[addr_1];
    read_data_2 = (addr_2 == 4'hF) ? r15 : registers[addr_2];
  end
endmodule