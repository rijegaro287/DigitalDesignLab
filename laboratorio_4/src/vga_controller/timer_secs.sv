module timer_secs (
  input reg clock,
  input reg reset,
  input reg time_,
  output reg finish,
  output reg counting,
  output reg finish_secs
  );
  
reg [8:0] accum = 0;
reg status = 1'b1;

timer sec_one(clock,finish,counting);

always @(posedge clock or negedge reset) begin
	 if (~reset) begin
			accum = 0;
			finish_secs <= 1'b0;	
		end
	 else if (accum == time_) begin 
				finish_secs <= 1'b1;
				accum = accum +1;
			end
	 else if (accum == (time_ + 2)) begin
				finish_secs <= 1'b0;
				accum = 0;
			end
	 
	 else if(status == 1'b1 && finish == 1'b1) begin
			status = 1'b0;
			accum = accum +1;
		end
	 
	 else if(status == 1'b0 && finish == 1'b0) begin
			status = 1'b1;
			accum = accum +1;
		end
end

endmodule