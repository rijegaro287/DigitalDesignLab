`timescale 1ns/1ns

module register_file_tb();
  logic clk;
  logic rst;
  logic write_en;
  logic [3:0] addr_1;
  logic [3:0] addr_2;
  logic [3:0] addr_3;
  logic [31:0] write_data;
  logic [31:0] r15;
  logic [31:0] read_data_1;
  logic [31:0] read_data_2;

  register_file dut(
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .addr_1(addr_1),
    .addr_2(addr_2),
    .addr_3(addr_3),
    .write_data(write_data),
    .r15(r15),
    .read_data_1(read_data_1),
    .read_data_2(read_data_2)
  );

  initial begin
    clk = 0;
    rst = 1;
    
    write_en = 0;
    addr_1 = 4'h0;
    addr_2 = 4'h0;
    addr_3 = 4'h0;

    write_data = 32'h00000000;
    r15 = 32'h00000000;

    #50; rst = 0; #20;

    write_en = 1;
    addr_3 = 4'h0;
    write_data = 32'h000001DA;

    #20;

    addr_3 = 4'h1;
    write_data = 32'h0000FFFF;

    #20;

    write_en = 0;
    write_data = 32'h00000000;
    addr_1 = 4'h0;
    addr_2 = 4'h1;
    addr_3 = 4'h0;

    #20;

    write_en = 1;
    addr_3 = 4'hA;
    write_data = 32'h0A00D3F1;

    #20;

    write_en = 0;
    addr_1 = 4'h1;
    addr_2 = 4'hA;

    #60;

    $stop;
  end

  always #10 clk = ~clk;
endmodule