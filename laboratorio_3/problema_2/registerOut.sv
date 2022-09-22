module registerOut #(parameter n = 8) (input logic rst, clk, input logic [n-1:0] din, output logic [n-1:0] dout);

always @(negedge clk)
		if (rst)
			dout=0;
		else
			dout<=din;

endmodule 