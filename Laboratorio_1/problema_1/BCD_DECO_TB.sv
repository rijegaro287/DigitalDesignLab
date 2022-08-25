`timescale 10ns/10ns

module BCD_DECO_TB();
    logic [3:0] NUM;
    logic [6:0] BCD;

    BCD_DECO dut (.NUM(NUM), .BCD(BCD));

    initial begin
        NUM <= 4'b0000; // 0
        #10; NUM <= 4'b0001; // 1
        #10; NUM <= 4'b0010; // 2
        #10; NUM <= 4'b0011; // 3
        #10; NUM <= 4'b0100; // 4
        #10; NUM <= 4'b0101; // 5
        #10; NUM <= 4'b0110; // 6
        #10; NUM <= 4'b0111; // 7
        #10; NUM <= 4'b1000; // 8
        #10; NUM <= 4'b1001; // 9

        $stop;
    end
endmodule