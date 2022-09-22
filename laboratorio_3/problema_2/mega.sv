module mega();
	logic [7:0] ab;
	logic [3:0] s;
	logic rst, clk;
	logic [3:0] resultado;
	
	ruta_critica #(4) DUT(ab, s, clk, rst, resultado);
	
	always begin
		clk = ~clk; #5;
	end
	
	initial begin
		rst = 1; #10; rst = 0;
		clk = 0;
		
		//Valor inicial
		ab = 8'b01010101;
//		b = 4'b0011;
		s = 4'b1000;// suma
		#10;
		
	end
	
endmodule