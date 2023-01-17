`timescale 1ns/1ns

module difficulty_selector_tb();
	logic clk;
	logic rst;
	logic [1:0] state;
	logic up_button;
	logic down_button;
	logic select_button;

	logic [1:0] variable_difficulty;
	logic [1:0] difficulty;

	localparam DIFF_SELECTION_STATE = 2'b00;
	localparam PLAYING_STATE = 2'b01;
	localparam WIN_STATE = 2'b10;
	localparam GAME_OVER_STATE = 2'b11;

	difficulty_selector dut(
		.clk(clk),
		.rst(rst),
		.state(state),
		.up_button(up_button),
		.down_button(down_button),
		.select_button(select_button),
		.variable_difficulty(variable_difficulty),
		.difficulty(difficulty)
	);

	initial begin
		clk = 0;
		rst = 0;
		state = DIFF_SELECTION_STATE;
		up_button = 0;
		down_button = 0;
		select_button = 0;

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
		
		state = PLAYING_STATE;

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
		select_button = 0;
		#10; //posedge clk
		#1; select_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		state = WIN_STATE;

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
		select_button = 0;
		#10; //posedge clk
		#1; select_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		state = GAME_OVER_STATE;
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
		select_button = 0;
		#10; //posedge clk
		#1; select_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		state = DIFF_SELECTION_STATE;

		#10; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		down_button = 0;
		#10; //posedge clk
		#1; down_button = 1;

		#19; //posedge clk
		#40; //posedge clk

		#10; //negedge clk
		select_button = 0;
		#10; //posedge clk
		#1; select_button = 1;

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