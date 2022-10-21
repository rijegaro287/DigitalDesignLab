module main_controller (
  input logic clk,
  input logic rst,
  input logic up_button,
  input logic right_button,
  input logic down_button,
  input logic left_button,

  output logic VGA_CLK,
  output logic [7:0] VGA_R,
  output logic [7:0] VGA_G,
  output logic [7:0] VGA_B,
  output logic VGA_BLANK_N,
  output logic VGA_SYNC_N,
  output logic VGA_HS,
  output logic VGA_VS,
  output logic [6:0] score

  /* Para simulacion */
  // output logic [1:0] difficulty,
  // output logic [1:0] variable_difficulty,
  // output logic snake_clk,
  // output logic [(5-1):0][((640 / 480) * 5):0] grid
);
  /* PARÁMETROS DE JUEGO */
  localparam DIFF_SELECTION_STATE = 2'b00;
  localparam PLAYING_STATE = 2'b01;
  localparam WIN_STATE = 2'b10;
  localparam GAME_OVER_STATE = 2'b11;
  
  localparam WIDTH = 640;
  localparam HEIGHT = 480;

  localparam ROWS = 5;
  localparam COLS = (WIDTH / HEIGHT) * ROWS; // Para que las celdas sean cuadradas
  localparam BODY_LENGTH = 16;

  /* VARIABLES DE CONTROL */
  logic [1:0] difficulty;
  logic [1:0] variable_difficulty;
  logic [($clog2(BODY_LENGTH)-1):0] score_bin;
  logic [(ROWS-1):0][(COLS-1):0] grid; 
  logic won;
  logic lost;

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
        if (difficulty == 2'b00) begin
          next_state <= DIFF_SELECTION_STATE;
        end 
        else begin
          next_state <= PLAYING_STATE;
        end
      end
      PLAYING_STATE: begin
        if (won) next_state <= WIN_STATE;
        else if (lost) next_state <= GAME_OVER_STATE;
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
  difficulty_selector difficulty_selector_inst (
    .clk(clk),
    .rst(rst),
    .state(state),
    .up_button(up_button),
    .down_button(down_button),
    .select_button(left_button),
    .variable_difficulty(variable_difficulty), 
    .difficulty(difficulty)
  );

  logic snake_clk;
  timer movement_timer (
    .clk(clk),
    .rst(rst),
    .difficulty(difficulty),
    .out_clk(snake_clk)
  );

  snake_controller #(.ROWS(ROWS), .COLS(COLS), .BODY_LENGTH(BODY_LENGTH))
  snake_ctrl ( 
    .clk(snake_clk),
    .rst(rst),
    .state(state),
    .up_button(up_button),
    .right_button(right_button),
    .down_button(down_button),
    .left_button(left_button),
    .grid(grid),
    .score(score_bin),
    .won(won),
    .lost(lost)
  );

  video_controller #(.WIDTH(WIDTH), .HEIGHT(HEIGHT), .ROWS(ROWS), .COLS(COLS))
  vga_ctrl (
    .clock(clk),
    // rst,
    .state(state),
    .grid(grid),
    .h_synq(VGA_HS), .v_synq(VGA_VS),
    .red(VGA_R), .green(VGA_G), .blue(VGA_B),
    .clk_25mhz(VGA_CLK),
    .sync_n(VGA_SYNC_N),
    .blank_n(VGA_BLANK_N)
  );

  bcd_deco score_decoder(
    .NUM(score_bin),
    .SEG(score)
	);
endmodule