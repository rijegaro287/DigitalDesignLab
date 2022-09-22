module bcd_deco(input logic [1:0] NUM,
                output logic [6:0] SEG);

    // orden SEG -> abcdefg
    always @(NUM) begin
        case(NUM)
            4'b00: SEG <= 7'b0000001; // 0
            4'b01: SEG <= 7'b1001111; // 1
            4'b10: SEG <= 7'b0010010; // 2
            4'b11: SEG <= 7'b0000110; // 3
        endcase
    end
endmodule


