`timescale 1ns/1ns

module main_tb();
  logic clk;
  logic rst;

  main dut(
    .clk(clk),
    .rst(rst)
  );

  initial begin
    clk = 0;
    rst = 1;

    #50; rst = 0; #19;

    $stop;
  end

  always #10 clk = ~clk;
endmodule