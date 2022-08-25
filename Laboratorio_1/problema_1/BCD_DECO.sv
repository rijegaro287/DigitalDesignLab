module BCD_DECO(NUM, BCD);
    input [3:0] NUM;
    output [6:0] BCD; // orden -> abcdefg

    always @(NUM) begin
        case(NUM)
            4'b0000: BCD <= 7'b1111110; // 0
            4'b0001: BCD <= 7'b0110000; // 1
            4'b0010: BCD <= 7'b1101101; // 2
            4'b0011: BCD <= 7'b1111001; // 3
            4'b0100: BCD <= 7'b0110011; // 4
            4'b0101: BCD <= 7'b1011011; // 5
            4'b0110: BCD <= 7'b1011111; // 6
            4'b0111: BCD <= 7'b1110000; // 7
            4'b1000: BCD <= 7'b1111111; // 8
            4'b1001: BCD <= 7'b1111011; // 9
            default: BCD <= 7'b0000001; // -
        endcase
    end
endmodule