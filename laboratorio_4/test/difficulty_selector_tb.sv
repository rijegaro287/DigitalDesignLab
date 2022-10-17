`timescale 1ns/1ns

module difficulty_selector_tb();
    logic rst;
    logic up_button;
    logic down_button;
    logic select_button;
    logic [1:0] difficulty;

    difficulty_selector dut(
        .rst(rst),
        .up_button(up_button),
        .down_button(down_button),
        .select_button(select_button),
        .difficulty(difficulty)
    );

    initial begin
        rst = 0;
        up_button = 0;
        down_button = 0;
        select_button = 0;

        #10 up_button = 1;
        #2 up_button = 0;

        #10 down_button = 1;
        #2 down_button = 0;

        #10 select_button = 1;
        #2 select_button = 0;

        #10 rst <= 1;
        #2 rst <= 0;

        #10 down_button = 1;
        #2 down_button = 0;

        #10 up_button = 1;
        #2 up_button = 0;

        #10 select_button = 1;
        #2 select_button = 0;

        #10 rst <= 1;
        #2 rst <= 0;

        #10;
    end
endmodule