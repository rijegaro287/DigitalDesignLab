`timescale 1ns / 1ns

module snake_tb();
    localparam ROWS = 10;
    localparam COLUMNS = 10;
    localparam BODY_LENGTH = 16;

    logic clk;
    logic rst;
    logic up_button;
    logic right_button;
    logic down_button;
    logic left_button;

    logic [(ROWS-1):0][(COLUMNS-1):0] grid;

    snake #(
        .ROWS(ROWS),
        .COLUMNS(COLUMNS),
        .BODY_LENGTH(BODY_LENGTH)
    )
    dut (
        .clk(clk),
        .rst(rst),
        .up_button(up_button),
        .right_button(right_button),
        .down_button(down_button),
        .left_button(left_button),
        .grid(grid)
    );

    initial begin
        clk = 0;
        rst = 0;
        up_button = 0;
        right_button = 0;
        down_button = 0;
        left_button = 0;

        #10; //posedge clk
        #40; //posedge clk

        #10; //negedge clk
        down_button = 1;
        #10; //posedge clk
        #1; down_button = 0;

        #19; //posedge clk
        #40; //posedge clk

        #10; //negedge clk
        left_button = 1;
        #10; //posedge clk
        #1; left_button = 0;

        #19; //posedge clk
        #40; //posedge clk

        #10; //negedge clk
        up_button = 1;
        #10; //posedge clk
        #1; up_button = 0;

        #19; //posedge clk
        #40; //posedge clk
        
        $stop;
    end

    always #10 clk = ~clk;
endmodule