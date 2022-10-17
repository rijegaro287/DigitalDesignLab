module controller (
    input logic clk,
    input logic rst,
    input logic up_button,
    input logic right_button,
    input logic down_button,
    input logic left_button
);
    localparam DIFF_SELECTION_STATE = 2'b00;
    localparam PLAYING_STATE = 2'b01;
    localparam WIN_STATE = 2'b10;
    localparam GAME_OVER_STATE = 2'b11;
    
    localparam MAX_BODY_LENGTH = 32;

    logic [1:0] difficulty = 0;
    logic won = 0;
    logic crashed = 0;

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
            next_state <= PLAYING_STATE;
          end 
          else if (difficulty == difficulty_selector.HARD) begin
            snake_speed <= 3;
            next_state <= PLAYING_STATE;
          end 
          else begin
            snake_speed <= 0;
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
