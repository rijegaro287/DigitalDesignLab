`timescale 1ns / 1ns

module main_controller_tb();
  logic clk;
  logic rst;
  logic up_button;
  logic right_button;
  logic down_button;
  logic left_button;

  logic VGA_CLK;
  logic [7:0] VGA_R;
  logic [7:0] VGA_G;
  logic [7:0] VGA_B;
  logic VGA_BLANK_N;
  logic VGA_SYNC_N;
  logic VGA_HS;
  logic VGA_VS;
  logic [6:0] score;

  logic [1:0] difficulty;
  logic [1:0] variable_difficulty;
  logic snake_clk;
  logic [(5-1):0][((640 / 480) * 5):0] grid;

  main_controller dut(
    .clk(clk),
    .rst(rst),
    .up_button(up_button),
    .right_button(right_button),
    .down_button(down_button),
    .left_button(left_button),
    .VGA_CLK(VGA_CLK),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_BLANK_N(VGA_BLANK_N),
    .VGA_SYNC_N(VGA_SYNC_N),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .score(score),

    .difficulty(difficulty),
    .variable_difficulty(variable_difficulty),
    .snake_clk(snake_clk),
    .grid(grid)
  );

  initial begin
    clk = 0;
    rst = 0;
    up_button = 1;
    right_button = 1;
    down_button = 1;
    left_button = 1;

    /* ------> Seleccionar dificultad <------*/
    #10; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		down_button = 0;
		#10; //posedge clk
		#1; down_button = 1;

    #19; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		up_button = 0;
		#10; //posedge clk
		#1; up_button = 1;

    #19; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		left_button = 0;
		#10; //posedge clk
		#1; left_button = 1;

    #19; //posedge clk
		#40; //posedge clk

    /* ------> Movimiento <------*/
		#19; //posedge clk
		#40; //posedge clk

		#10; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		down_button = 0;
		#10; //posedge clk
		#1; down_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		left_button = 0;
		#10; //posedge clk
		#1; left_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		up_button = 0;
		#10; //posedge clk
		#1; up_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		rst = 1;
		#10; //posedge clk
		#1; rst = 0;

		#19; //posedge clk
		#40; //posedge clk
    
    $stop;
  end

  always #10 clk = ~clk;
endmodule