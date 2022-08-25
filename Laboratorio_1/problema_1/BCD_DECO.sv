module BCD_DECO(input logic [3:0] NUM,
                output logic [6:0] BCD);

    // orden BCD -> abcdefg
    always @(NUM) begin
        case(NUM)
            4'b0000: BCD <= 7'b0000001; // 0
            4'b0001: BCD <= 7'b1001111; // 1
            4'b0010: BCD <= 7'b0010010; // 2
            4'b0011: BCD <= 7'b0000110; // 3
            4'b0100: BCD <= 7'b1001100; // 4
            4'b0101: BCD <= 7'b0100100; // 5
            4'b0110: BCD <= 7'b0100000; // 6
            4'b0111: BCD <= 7'b0001111; // 7
            4'b1000: BCD <= 7'b0000000; // 8
            4'b1001: BCD <= 7'b0000100; // 9
            4'b1010: BCD <= 7'b0001000; // A
            4'b1011: BCD <= 7'b1100000; // B
            4'b1100: BCD <= 7'b0110001; // C
            4'b1101: BCD <= 7'b1000010; // D
            4'b1110: BCD <= 7'b0110000; // E
            4'b1111: BCD <= 7'b0111000; // F
        endcase
    end
endmodule