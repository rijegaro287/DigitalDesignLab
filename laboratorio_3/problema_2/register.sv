module register #(parameter n = 8) (
	input logic rst, clk, 
	input logic [n*2-1:0] ab,
//	input logic enable, 
	output logic [n*2-1:0] out);
	

//logic [n-1:0] a, b;
//logic [n*2-1:0] temp;
always_ff @(posedge clk, posedge rst) begin
		if (rst)
		
			out <= 0;
			
		else begin
			out <= ab;
//			if(enable) begin
//				out <= {a, b};
//			end
//			
//			else if(load == 0)begin
//				a <= value;
//			end
//			
//			else begin
//				b <= value;
//			end
			
		end
end

//always_comb begin
//	case(enable)
//		1'b0 : out = temp;
//		default : out = 'z;
//	endcase
//
//end


endmodule 