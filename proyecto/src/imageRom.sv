module imageRom (input [15:0] address,addressGPU,output [31:0] Q,outputGPU);
	logic [7:0] memory [16383:0];
	initial $readmemh("image.mem",memory); //poner aquí la imagen que de el profesor
	
	

	
	assign Q={24'b0,memory[address]};
	assign outputGPU={24'b0,memory[addressGPU]};

endmodule 