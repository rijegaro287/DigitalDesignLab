module VGA_Controller(
	input clk,
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

	logic [31:0] pixel_addr;
	logic [31:0] next_addr;
	D_FF #(.NUM_BITS(32)) 
    pixel_addr_ff(
      .CLK(vga_clk),
      .RST(1'b0),
      .D(next_addr),
      .Q(pixel_addr)
    );

	logic [23:0] pixel_data;
	ImageRom image(
		.addr(pixel_addr),
		.data(pixel_data)
	);

	//Contadores verticales y horizontales
	logic [15:0] h_count_value = 0; 
	logic [15:0] v_count_value = 0;
	logic enable_v_counter = 0;
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
	always begin // Assignación del color al pixel de VGA
		h_limits <= (h_count_value < 784) && (h_count_value > 144);
 		v_limits <= (v_count_value < 515) && (v_count_value > 35);
		hcenter_limits <= (h_count_value < 514) && (h_count_value > 414);
 		vcenter_limits <= (v_count_value < 325) && (v_count_value > 225);

		if(h_limits && v_limits) begin
			if(hcenter_limits  && vcenter_limits) begin
				VGA_R <= pixel_data[23:16];
				VGA_G <= pixel_data[15:8];
				VGA_B <= pixel_data[7:0];
				next_addr <= pixel_addr + 3;
			end
			else begin
				VGA_R <= 8'h00;
				VGA_G <= 8'h00; 
				VGA_B <= 8'h00;
				next_addr <= 0;
			end
		end
		else begin
			VGA_R <= 8'h00;
			VGA_G <= 8'h00;
			VGA_B <= 8'h00;
			next_addr <= 0;
		end
	end

	assign h_syncq = (h_count_value < 96) ? 1'b1 : 1'b0;
	assign v_syncq = (v_count_value < 2)  ? 1'b1 : 1'b0;

	assign sync_n = 1'b0;
	assign blank_n = 1'b1;
endmodule 