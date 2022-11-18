`timescale 1ns/1ns

module register_file_tb();
  logic clk;
  logic rst;
  logic WE3;
  logic [3:0] A1;
  logic [3:0] A2;
  logic [3:0] A3;
  logic [31:0] WD3;
  logic [31:0] R15;
  logic [31:0] RD1;
  logic [31:0] RD2;

  register_file dut(
    .clk(clk),
    .rst(rst),
    .WE3(WE3),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .R15(R15),
    .RD1(RD1),
    .RD2(RD2)
  );

  initial begin
    clk = 0;
    rst = 1;
    
    WE3 = 0;
    A1 = 4'h0;
    A2 = 4'h0;
    A3 = 4'h0;

    WD3 = 32'h00000000;
    R15 = 32'h00000000;

    #50; rst = 0; #20;

    WE3 = 1;
    A3 = 4'h0;
    WD3 = 32'h000001DA;

    #20;

    A3 = 4'h1;
    WD3 = 32'h0000FFFF;

    #20;

    WE3 = 0;
    WD3 = 32'h00000000;
    A1 = 4'h0;
    A2 = 4'h1;
    A3 = 4'h0;

    #20;

    WE3 = 1;
    A3 = 4'hA;
    WD3 = 32'h0A00D3F1;

    #20;

    WE3 = 0;
    A1 = 4'h1;
    A2 = 4'hA;

    #60;

    $stop;
  end

  always #10 clk = ~clk;
endmodule