`timescale 1ns/1ns

module video_controller_tb();
  localparam WIDTH = 640;
	localparam HEIGHT = 480;
	localparam ROWS = 10;
	localparam COLS = 10

	logic clock;
	logic [1:0] state;
	logic [(ROWS-1):0][(COLS-1):0] grid;

	logic h_synq;
	logic v_synq;
	logic [7:0] red;
	logic [7:0] green;
	logic [7:0] blue;
	logic clk_25mhz;
	logic sync_n;
	logic blank_n

  video_controller #(
    .WIDTH(WIDTH),
    .HEIGHT(HEIGHT),
    .ROWS(ROWS),
    .COLS(COLS)) 
  dut (
    .clock(clock),
    .state(state),
    .grid(grid),
    .h_synq(h_synq),
    .v_synq(v_synq),
    .red(red),
    .green(green),
    .blue(blue),
    .clk_25mhz(clk_25mhz),
    .sync_n(sync_n),
    .blank_n(blank_n)
  );

  initial begin
    clock = 0;
    state = 1;

    grid[0] = 10'b0000000001;
    grid[1] = 10'b0000000010;
    grid[2] = 10'b0000000100;
    grid[3] = 10'b0000001000;
    grid[4] = 10'b0000010000;
    grid[5] = 10'b0000100000;
    grid[6] = 10'b0001000000;
    grid[7] = 10'b0010000000;
    grid[8] = 10'b0100000000;
    grid[9] = 10'b1000000000;

    #10000;
    
    $stop
  end

  always #10 clock = ~clock;
endmodule