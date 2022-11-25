module ImageRom (
	input [31:0] addr,
	output [23:0] data
);
	logic [7:0] memory [29999:0];
	initial $readmemh("/home/rijegaro/Desktop/RGatgens_ATrejos_digital_design_lab_2022/proyecto/memory_files/image.mem",memory); //poner aquí la imagen que de el profesor
	// initial $readmemh("/home/rijegaro/Desktop/RGatgens_ATrejos_digital_design_lab_2022/proyecto/memory_files/image.mem",memory); //poner aquí la imagen que de el profesor
	
	assign data = {
		memory[addr],
		memory[addr+1],
		memory[addr+2],
	};
endmodule 