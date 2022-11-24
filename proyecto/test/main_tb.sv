`timescale 1ns/1ns

module main_tb();
  logic clk;
  logic rst;
  logic reg_alu_src;

  main dut(
    .clk(clk),
    .rst(rst),
    .reg_alu_src(reg_alu_src)
  );

  initial begin
    clk = 0;
    rst = 1;
    reg_alu_src = 1;

    #50; rst = 0; 
    
    #20;

    #20;

    #20; 
    
    #20; reg_alu_src = 0; 

    #20;
    
    #20;

    #19;

    $stop;
  end

  always #10 clk = ~clk;
endmodule