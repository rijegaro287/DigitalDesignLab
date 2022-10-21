module bcd_deco(
	input logic [3:0] NUM,
	output logic [6:0] SEG
);
	// orden SEG -> abcdefg
	always_comb begin
		case(NUM)
			4'b0000: SEG <= 7'b1000000; // 0
			4'b0001: SEG <= 7'b1111001; // 1
			4'b0010: SEG <= 7'b0100100; // 2
			4'b0011: SEG <= 7'b0110000; // 3
			4'b0100: SEG <= 7'b0011001; // 4
			4'b0101: SEG <= 7'b0010010; // 5
			4'b0110: SEG <= 7'b0000010; // 6
			4'b0111: SEG <= 7'b1111000; // 7
			4'b1000: SEG <= 7'b1111111; // 8
			4'b1001: SEG <= 7'b0011000; // 9
			4'b1001: SEG <= 7'b0001000; // A
			4'b1001: SEG <= 7'b0000011; // b
			4'b1001: SEG <= 7'b1000110; // C
			4'b1001: SEG <= 7'b0100001; // d
			4'b1001: SEG <= 7'b0000110; // E
			4'b1001: SEG <= 7'b0001110; // F
			default: SEG <= 7'b0000000; // off
		endcase
	end
endmodule