module timer (
  input reg clock,
  output reg finish,
  output reg counting
);
	reg [25:0] accum = 0;
	wire pps = (accum == 0);

	always @(posedge clock) begin
		accum <= (pps ? 6_000_000 : accum) - 1;
		
		if (pps) begin
			if (finish == 1'b1) begin
					finish <= 1'b0;
					counting <= 1'b1;
			end
			else begin
					finish <= 1'b1;
					counting <= 1'b0;
			end
		end
	end
endmodule