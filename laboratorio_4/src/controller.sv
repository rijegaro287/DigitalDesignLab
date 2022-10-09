module controller (
    input logic clk,
    input logic rst,
    input logic up_button,
    input logic right_button,
    input logic down_button,
    input logic left_button
);
    parameter DIFF_SELECTION_STATE = 2'b00;
    parameter PLAYING_STATE = 2'b01;
    parameter WIN_STATE = 2'b10;
    parameter GAME_OVER_STATE = 2'b11;
    
    parameter MAX_BODY_LENGTH = 32;

    logic [1:0] difficulty = 0;
    logic won = 0;
    logic crashed = 0;

    logic [(MAX_BODY_LENGTH-1):0] snake_body = 0;
    logic [1:0] snake_speed = 0;

    logic [1:0] state = DIFF_SELECTION_STATE;
    logic [1:0] next_state;

    always_ff @(posedge clk or posedge rst) begin
      if (rst) state <= DIFF_SELECTION_STATE;
      else state <= next_state;  
    end

    always_comb begin
      case (state)
        DIFF_SELECTION_STATE: begin
          if (difficulty == difficulty_selector.NORMAL) begin
            snake_speed <= 2;
            snake_body[1:0] <= 2'b11;
            next_state <= PLAYING_STATE;
          end 
          else if (difficulty == difficulty_selector.HARD) begin
            snake_speed <= 3;
            snake_body[1:0] <= 2'b11;
            next_state <= PLAYING_STATE;
          end 
          else begin
            snake_speed <= 0;
            snake_body[1:0] <= 2'b00;
            next_state <= DIFF_SELECTION_STATE;
          end
        end
        PLAYING_STATE: begin
          if (won) next_state <= WIN_STATE;
          else if (crashed) next_state <= GAME_OVER_STATE;
          else next_state <= PLAYING_STATE;
        end
        WIN_STATE: begin
          next_state <= WIN_STATE;
        end
        GAME_OVER_STATE: begin
          next_state <= GAME_OVER_STATE;
        end
        default: next_state <= DIFF_SELECTION_STATE;
      endcase
    end
endmodule
