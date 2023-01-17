module InstructionROM(
	input [31:0] addr,
	output [31:0] data
);
	logic [7:0] memory [255:0];

	initial $readmemh("/home/rijegaro/Desktop/RGatgens_ATrejos_digital_design_lab_2022/proyecto/memory_files/instructions.mem", memory);
	//Nombre del archivo con las instrucciones

	assign data = {
		memory[addr[7:0]],
		memory[addr[7:0]+1],
	  memory[addr[7:0]+2],
		memory[addr[7:0]+3]
	};
endmodule 