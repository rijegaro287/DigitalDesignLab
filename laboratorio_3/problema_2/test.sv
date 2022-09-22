module test();
	logic [3:0] value; 
	logic [3:0] s;
	logic [3:0] resultado;
	logic rst, clk, enable, load;
	ruta_critica #(4) DUT(value,s,clk,rst,enable,load,resultado);
	
	always begin
		clk = ~clk; #5;
	end
	
	// s = seleccion, por lo tanto aleatorio para probar
	initial begin
		
		rst = 1; #10; rst = 0;
		clk = 0;
		enable = 0;
		load = 0; //meta en a
		value = 4'b1110;
		#10 clk=0;
		#10 clk=1;
		load = 1; //meta en b
		value = 4'b0001;
//		b = $random;
		s = 4'b1000;// suma
		#10 clk=0;
		#10 clk=1;
		enable = 1;
		
		#10 clk=0;
		#10 clk=1;
//		$display(" a=%0d,b=%0d ",a,b);
//		#10 clk=0;
//		#10 clk=1;
//		$display(" resultado=%0d",resultado);
//		if( a + b != resultado )
//		$display(" ERROR ");
	end
endmodule
