module main_controller (
  input logic clk,
  input logic rst,
  input logic up_button,
  input logic right_button,
  input logic down_button,
  input logic left_button,

  output VGA_CLK,
  output [7:0] VGA_R,
  output [7:0] VGA_G,
  output [7:0] VGA_B,
  output VGA_BLANK_N,
  output VGA_SYNC_N,
  output VGA_HS,
  output VGA_VS,
  output [6:0] score
);

  /* PARÁMETROS DE JUEGO */
  localparam DIFF_SELECTION_STATE = 2'b00;
  localparam PLAYING_STATE = 2'b01;
  localparam WIN_STATE = 2'b10;
  localparam GAME_OVER_STATE = 2'b11;
  
  localparam WIDTH = 640;
  localparam HEIGHT = 480;

  // localparam ROWS = 15;
  // localparam COLS = 20;
  localparam ROWS = 10;
  localparam COLS = 10;
  localparam BODY_LENGTH = 16;

  /* VARIABLES DE CONTROL */
  logic won = 0; // Si es 1, el jugador ha ganado, se calcula en el módulo de la serpiente
  logic crashed = 0; // Si es 1, el jugador ha perdido, se calcula en el módulo de la serpiente

  reg [9:0] block0, block1, block2, block3, block4;
  reg [9:0] block5, block6, block7, block8, block9;

  logic [(ROWS-1):0][(COLS-1):0] grid; 

  /* MÁQUINA DE ESTADOS */
  logic [1:0] state = DIFF_SELECTION_STATE;
  logic [1:0] next_state;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) state <= DIFF_SELECTION_STATE;
    else state <= next_state;  
  end

  always_comb begin
    case (state)
      DIFF_SELECTION_STATE: begin
        if (difficulty == difficulty_selector.UNSET) begin
          next_state <= DIFF_SELECTION_STATE;
        end 
        else begin
          next_state <= PLAYING_STATE;
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

  /* COMUNICACIÓN CON LOS OTROS MÓDULOS */
  logic snake_clk;
  logic not_snake_clk;
  timer movement_timer (
    .clock(clk),
    // .reset(rst),
    .finish(snake_clk),
    .counting(not_snake_clk)
  );

  snake_controller #(.ROWS(ROWS), .COLS(COLS), .BODY_LENGTH(BODY_LENGTH))
  snake_ctrl ( 
    .clk(snake_clk),
    .rst(rst),
    // .state(state),
    .up_button(up_button),
    .right_button(right_button),
    .down_button(down_button),
    .left_button(left_button),
    .grid(grid)
    // .grid(grid),
    // .won(won),
    // .crashed(crashed)
  );

  video_controller #(.WIDTH(WIDTH), .HEIGHT(HEIGHT), .ROWS(ROWS), .COLS(COLS))
  VGA (
    clk,
    // rst,
    // state,
    // grid,
    block0, block1, block2, block3, block4, 
    block5, block6, block7, block8, block9,
    VGA_HS, VGA_VS,
    VGA_R, VGA_G, VGA_B,
    VGA_CLK,
    VGA_SYNC_N,
    VGA_BLANK_N
  );

  always_comb begin
		block1 <= grid[1];
		block2 <= grid[2];
		block3 <= grid[3];
		block4 <= grid[4];
		block5 <= grid[5];
		block6 <= grid[6];
		block7 <= grid[7];
		block8 <= grid[8];
		block9 <= grid[9];
	end
endmodule