module difficulty_selector(
    input logic rst,
    input logic up_button,
    input logic down_button,
    input logic select_button,
    output logic [1:0] difficulty
);
    parameter UNSET = 2'b00;
    parameter NORMAL = 2'b01;
    parameter HARD = 2'b10;

    logic [1:0] selected_difficulty = UNSET;
    logic [1:0] temp_difficulty = NORMAL;

    always_ff @(posedge select_button or posedge rst) begin
        if (rst) selected_difficulty <= UNSET;
        else selected_difficulty <= temp_difficulty;
    end 

    always_ff @(posedge up_button or posedge down_button) begin
        // if (selected_difficulty == UNSET) begin
            if (up_button) begin
                temp_difficulty = NORMAL;
            end
            else if (down_button) begin
                temp_difficulty = HARD;
            end
            else begin
                temp_difficulty = temp_difficulty;
            end
        // end
    end

    always_comb difficulty = selected_difficulty;
endmodule