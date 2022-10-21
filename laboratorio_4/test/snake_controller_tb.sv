`timescale 1ns / 1ns

module snake_controller_tb();
	localparam ROWS = 10;
	localparam COLS = 10;
	localparam BODY_LENGTH = 16;

	localparam DIFF_SELECTION_STATE = 2'b00;
	localparam PLAYING_STATE = 2'b01;
	localparam WIN_STATE = 2'b10;
	localparam GAME_OVER_STATE = 2'b11;

	logic clk;
	logic rst;
	logic [1:0] state;
	logic up_button;
	logic right_button;
	logic down_button;
	logic left_button;

	logic [(ROWS-1):0][(COLS-1):0] grid;

	snake_controller #(
		.ROWS(ROWS),
		.COLS(COLS),
		.BODY_LENGTH(BODY_LENGTH)
	)
	dut (
		.clk(clk),
		.rst(rst),
		.state(state),
		.up_button(up_button),
		.right_button(right_button),
		.down_button(down_button),
		.left_button(left_button),
		.grid(grid)
	);

	initial begin
		clk = 0;
		rst = 0;
		state = DIFF_SELECTION_STATE;
		up_button = 0;
		right_button = 1;
		down_button = 1;
		left_button = 0;

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
		
		state = PLAYING_STATE;

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
		
		state = WIN_STATE;

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
		
		state = GAME_OVER_STATE;

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
		
		$stop;
	end

	always #10 clk = ~clk;
endmodule