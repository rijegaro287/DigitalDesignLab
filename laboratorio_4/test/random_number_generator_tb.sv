`timescale 1ns/1ns

module random_number_generator_tb();
  localparam LIMIT = 15;

  logic clk;
  logic rst;
  logic load;
  logic [($clog2(LIMIT)-1):0] random_number;

  random_number_generator 
  #(
    .LIMIT(LIMIT),
    .SEED(8'hFF)
  )
  dut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .random_number(random_number)
  );

  initial begin 
    clk = 0;
    rst = 0;
    load = 0;
    
    #10;
    #20; 

    load = 1;

    #500;

    $stop;
  end
  always #10 clk = ~clk;
endmodule