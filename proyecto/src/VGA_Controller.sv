module VGA_Controller(
	input clk,
	// input[7:0] colorEntrada,
	// output [15:0] nextAddress,
	output logic vga_clk,
	output logic h_syncq,  
	output logic v_syncq,
	output logic sync_n,
	output logic blank_n,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B
);
	clock_divider clock_divider(.clk(clk), .divided_clk(vga_clk));

	//Lógiga del siguiente pixel
	// logic[15:0] nextPixel = 0;

	logic [15:0] h_count_value = 0; 
	logic [15:0] v_count_value = 0;
	logic enable_v_counter = 0;

	//Contadores verticales y horizontales
	always_ff @(posedge vga_clk) begin
		if(h_count_value < 799) begin
			h_count_value++;
			enable_v_counter <= 0;
		end
		else begin
			h_count_value <= 0;
			enable_v_counter <= 1;
		end

		if(enable_v_counter == 1'b1) begin
			if(v_count_value < 525) v_count_value++;
			else v_count_value <= 0;
		end
	end

	logic h_limits, v_limits;
	logic hcenter_limits, vcenter_limits;
	// Assignación del color al pixel de VGA
	always begin
		h_limits = (h_count_value < 784) && (h_count_value > 144);
 		v_limits = (v_count_value < 515) && (v_count_value > 35);
		hcenter_limits = (h_count_value < 564) && (h_count_value > 364);
 		vcenter_limits = (v_count_value < 375) && (v_count_value > 175);

		if(h_limits && v_limits) begin
			if(hcenter_limits && vcenter_limits) begin
				VGA_R = 8'hDD;
				VGA_G = 8'h11; 
				VGA_B = 8'hFF;
			end
			else begin
				VGA_R = 8'h00;
				VGA_G = 8'h00; 
				VGA_B = 8'h00;
			end
		end
		else begin
			VGA_R = 8'h00;
			VGA_G = 8'h00;
			VGA_B = 8'h00;
		end
	end

	//Contador para el siguiente pixel 
	// always_ff @(posedge clk or posedge rst)
	// 	begin 
	// 		if(rst)
	// 			begin
	// 				nextPixel = 0;
	// 			end
	// 		else
	// 			begin
	// 				if((h_count_value > 144 && h_count_value < 245) && (v_count_value > 35 && v_count_value < 136))
	// 					begin
	// 						if (nextPixel <= 9999)
	// 							begin
	// 								nextPixel = nextPixel + 1;
	// 							end
	// 						if (nextPixel > 9999)
	// 							begin
	// 								nextPixel = 0;
	// 							end
	// 					end
	// 			end
	// 	end

	// assign VGA_clk = clk;
	// assign nextAddress = nextPixel;
	assign h_syncq = (h_count_value < 96) ? 1'b1 : 1'b0;
	assign v_syncq = (v_count_value < 2)  ? 1'b1 : 1'b0;

	assign sync_n = 1'b0;
	assign blank_n = 1'b1;
endmodule 