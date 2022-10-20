module video_controller 
#(
	parameter WIDTH = 640,
	parameter HEIGHT = 480,
	parameter ROWS = 10,
	parameter COLS = 10
)
(
	input clock,
	input reg [9:0] block0,
	input reg [9:0] block1,
	input reg [9:0] block2,
	input reg [9:0] block3,
	input reg [9:0] block4,
	input reg [9:0] block5,
	input reg [9:0] block6,
	input reg [9:0] block7,
	input reg [9:0] block8,
	input reg [9:0] block9,
	// input logic [(ROWS-1):0][(COLS-1):0] grid,
	output logic h_synq,
	output logic v_synq,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue,
	output logic clk_25mhz,
	output logic sync_n,
	output logic blank_n
	);

	localparam CELL_WIDTH = WIDTH / COLS;
	localparam CELL_HEIGHT = HEIGHT / ROWS;
	
	// VGA variables de control 
	logic enable_v_counter;
	logic [15:0] h_count_value;
	logic [15:0] v_count_value;
	
	// variables de sprite/imagen 
	logic [7:0] xr;
	logic [7:0] xg;
	logic [7:0] xb;
	logic [7:0] circulor;
	logic [7:0] circulog;
	logic [7:0] circulob;
	logic [7:0] white;
	logic [7:0] black;
	logic [7:0] grassR;
	logic [7:0] grassG;
	logic [7:0] grassB;
	logic [15:0] address;
	
	// Clock divider
	clock_divider vga_clock_gen(clock, clk_25mhz);
	
	// Counters
	horizontal_counter vga_horizontal (clk_25mhz, enable_v_counter, h_count_value);
	vertical_counter vga_Vertical (clk_25mhz, enable_v_counter, v_count_value);
	
	// vertical y horizontal sync basados en los estandares 
	assign h_synq = (h_count_value < 96) ? 1'b1 : 1'b0;
	assign v_synq = (v_count_value < 2) ? 1'b1 : 1'b0;
	
	// imagen de (X) 
	
	//Importar imágnes
	
	// Colors white black
	assign white = 8'hFF;
	assign black = 8'h00;
	assign grassR = 8'h63;
	assign grassG = 8'hA3;
	assign grassB = 8'h56;
	
	// always begin
	// 	for (int i = 0; i < ROWS; i++) begin
	// 		for (int j = 0; j < COLS; j++) begin
	// 			if (v_count_value >= (i * CELL_HEIGHT + 35) && v_count_value < ((i+1) * CELL_HEIGHT + 35) &&
	// 				h_count_value >= (j * CELL_WIDTH + 144) && h_count_value < ((j+1) * CELL_WIDTH + 144)
	// 			) begin
	// 				case(grid[i][j])
	// 					1'b0: begin
	// 						red <= black;
	// 						green <= black;
	// 						blue <= black;	
	// 					end
	// 					1'b1: begin
	// 						red <= grassR;
	// 						green <= grassG;
	// 						blue <= grassB;
	// 					end
	// 				endcase
	// 			end
	// 		end
	// 	end
	// end

	always @*
	begin		
		// Block 0
		if(h_count_value < 784 && h_count_value > 144 && v_count_value < 83 && v_count_value > 34) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block0[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block0[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block0[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block0[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block0[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block0[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block0[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block0[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block0[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block0[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
		 end
		
		// Block 1
		 else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 131 && v_count_value > 83) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block1[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block1[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block1[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block1[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block1[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block1[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block1[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block1[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block1[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block1[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
		 end
	
		// Block 2
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 179 && v_count_value > 131) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block2[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block2[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block2[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block2[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end  
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block2[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block2[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block2[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block2[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block2[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block2[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
		 end

		// Block 3
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 227 && v_count_value > 179) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block3[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block3[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block3[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block3[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block3[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block3[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end  
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block3[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block3[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block3[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end  
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block3[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
		 end
	
		// Block 4
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 275 && v_count_value > 227) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block4[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block4[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block4[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block4[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block4[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block4[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block4[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block4[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block4[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block4[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
		 end
		// Block 5
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 323 && v_count_value > 275) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block5[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block5[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block5[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block5[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block5[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block5[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block5[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block5[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block5[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block5[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
		 end
	
		// Block 6
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 371 && v_count_value > 323) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block6[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block6[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block6[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end  
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block6[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block6[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block6[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block6[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block6[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block6[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block6[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
		 end
		
		// Block 7
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 419 && v_count_value > 371) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block7[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block7[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block7[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block7[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block7[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block7[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block7[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block7[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end  
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block7[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block7[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
		 end

		// Block 8
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 467 && v_count_value > 419) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block8[0])
						1'b01 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block8[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block8[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block8[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								end  
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block8[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block8[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block8[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block8[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block8[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block8[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
		 end

		// Block 9
		else if(h_count_value < 784 && h_count_value > 144 && v_count_value < 515 && v_count_value > 467) begin
			if (h_count_value < 208 && h_count_value > 144) begin
					case (block9[0])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 272 && h_count_value > 208) begin
					case (block9[1]) 
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b1 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 336 && h_count_value > 272) begin
					case (block9[2])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 400 && h_count_value > 336) begin
					case (block9[3])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 464 && h_count_value > 400) begin
					case (block9[4])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 528 && h_count_value > 464) begin
					case (block9[5])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 592 && h_count_value > 528) begin
					case (block9[6])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 656 && h_count_value > 592) begin
					case (block9[7])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end
					  endcase 
				end
			
			else if (h_count_value < 720 && h_count_value > 656) begin
					case (block9[8])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
			
			else if (h_count_value < 784 && h_count_value > 720) begin
					case (block9[9])
						1'b1 : begin
									red = grassR;
									green = grassG;
									blue = grassB;
								end 
						1'b0 : begin
									red = black;
									green = black;
									blue = black;
								 end 
					  endcase 
				end
		end		
	end
		
	assign sync_n = 1'b0;
	assign blank_n = 1'b1;
endmodule
