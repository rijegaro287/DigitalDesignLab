module vga_controller(
	input clock,
	input reset,
	input moveUp,
	input moveDown,
	input moveLeft,
	input moveRight,
	input [1:0] dificulty,
	output VGA_CLK,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_BLANK_N,
	output VGA_SYNC_N,
	output VGA_HS,
	output VGA_VS,
	output finish,
	output counting,
	output finish_secs,
	output [6:0] seg
	);

	localparam WIDTH = 640;
	localparam HEIGHT = 480;

	localparam ROWS = 30;
	localparam COLS = 40;
	localparam BODY_LENGTH = 10;
	
	// reg [9:0] block0, block1, block2, block3, block4;
	// reg [9:0] block5, block6, block7, block8, block9;

	logic [(ROWS-1):0][(COLS-1):0] grid; 
	reg [8:0] food_x;
	reg [8:0] food_y;
	reg [1:0] difficulty;
	reg [8:0] time_;

	assign time_ = 1;
	
	timer_secs timer_secs(clock, reset, time_, finish, counting, finish_secs);
	
	snake #(.ROWS(ROWS), .COLS(COLS), .BODY_LENGTH(BODY_LENGTH))
	snakecontroller ( 
		finish,
		reset,
		moveUp,
		moveRight,
		moveDown,
		moveLeft,
		grid
	);

	video_controller #(.WIDTH(WIDTH), .HEIGHT(HEIGHT), .ROWS(ROWS), .COLS(COLS))
	VGA (
		clock,
		grid,
		// block0, block1, block2, block3, block4, 
		// block5, block6, block7, block8, block9,
		VGA_HS, VGA_VS,
		VGA_R, VGA_G, VGA_B,
		VGA_CLK,
		VGA_SYNC_N,
		VGA_BLANK_N
	);

	// always_comb begin
	// 	block1 <= grid[1];
	// 	block2 <= grid[2];
	// 	block3 <= grid[3];
	// 	block4 <= grid[4];
	// 	block5 <= grid[5];
	// 	block6 <= grid[6];
	// 	block7 <= grid[7];
	// 	block8 <= grid[8];
	// 	block9 <= grid[9];
	// end
	
endmodule