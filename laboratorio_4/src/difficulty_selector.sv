module difficulty_selector(
	input logic clk,
	input logic rst,
	input logic [1:0] state,
	input logic up_button,
	input logic down_button,
	input logic select_button,

	output logic [1:0] variable_difficulty,
	output logic [1:0] difficulty
);
	localparam UNSET = 2'b00;
	localparam NORMAL = 2'b01;
	localparam HARD = 2'b10;

	logic [1:0] selected_difficulty = UNSET;
	logic [1:0] tmp_difficulty = NORMAL;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			selected_difficulty <= UNSET;
		end
		else if (state == 2'b00) begin
			if (!select_button) selected_difficulty <= tmp_difficulty;
			else if (!up_button) tmp_difficulty <= NORMAL;
			else if (!down_button) tmp_difficulty <= HARD;
			else tmp_difficulty <= tmp_difficulty;
		end
		else begin
			selected_difficulty <= selected_difficulty;
		end
	end 

	always_comb begin
		variable_difficulty <= tmp_difficulty;
		difficulty <= selected_difficulty;
	end
endmodule