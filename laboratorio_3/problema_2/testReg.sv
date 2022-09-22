module testReg();
	logic clk, rst;
	logic [3:0] value;
	logic enable, load;
	logic [7:0]out;
	
	register #(4) r(rst, clk, value, enable, load, out);
	
	always begin
		clk = ~clk; #5;
	end
	
	initial begin
		rst = 1; #10; rst = 0;
		clk = 0;
		//Valor inicial
		enable = 0;
		load = 0; //Guarde en a
		value = 4'b1111;
		#10;
		
		load = 1; //Guarde en b
		value = 4'b0000;
		
		#10;
		enable = 1; //Cargamos
		
	end
	
endmodule