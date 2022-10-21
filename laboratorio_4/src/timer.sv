module timer (
  input logic clk,
	input logic rst,
	input logic [1:0] difficulty,
  output logic out_clk
);
	int period;
	int accum = 0;
	bit pps;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			accum <= 0;
		end
		else if(period > 0) begin
			accum <= (pps ? period : accum) - 1;

			if (pps) begin
				if (out_clk) out_clk <= 1'b0;
				else out_clk <= 1'b1;
			end
		end
		else begin
			out_clk <= 1'b0;
		end
	end

	always_comb begin
		pps <= (accum == 0);

		case (difficulty)
			2'b01: period <= 3_000_000 * 2;
			2'b10: period <= 1_500_000 * 2;

			/* Para el testbench */
			// 2'b01: period <= 2 * 2;
			// 2'b10: period <= 1 * 2;
			default: period <= 0;
		endcase
	end
endmodule