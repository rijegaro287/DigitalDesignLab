module snake
#(
    parameter ROWS = 10,
    parameter COLUMNS = 10,
    parameter BODY_LENGTH = 16
)
(
    input logic clk,
    input logic rst,
    input logic up_button,
    input logic right_button,
    input logic down_button,
    input logic left_button,

    output logic [(ROWS-1):0][(COLUMNS-1):0] grid
);
    localparam UP = 2'b00;
    localparam RIGHT = 2'b01;
    localparam DOWN = 2'b10;
    localparam LEFT = 2'b11;

    typedef struct packed {
        bit active;
        int pos_x;
        int pos_y;
    } snake_part;

    snake_part [(BODY_LENGTH-1):0] snake_body;

    bit [1:0] direction;

    initial reset_everything();

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            reset_everything();
        end
        else begin
            if (up_button) direction = UP;
            else if (right_button) direction = RIGHT;
            else if (down_button) direction = DOWN;
            else if (left_button) direction = LEFT;
            else direction = direction;

            move_snake();
            reset_grid();
            update_grid();
        end
    end

    task reset_everything;
        reset_snake();
        reset_grid();
        update_grid();
    endtask

    task reset_snake;
        direction = RIGHT;

        for (int i = 0; i < BODY_LENGTH; i++) begin
            if (i == 0) snake_body[i].active = 1;
            else snake_body[i].active = 0;
            
            snake_body[i].pos_x = 0;
            snake_body[i].pos_y = 0;
        end
    endtask

    task reset_grid;
        for (int i = 0; i < ROWS; i++) begin
            grid[i] = 0;
        end
    endtask

    task update_grid;
        for (int i = 0; i < BODY_LENGTH; i++) begin
            automatic snake_part part = snake_body[i];
            $display("i: %d, active: %d, pos_x: %d, pos_y: %d", i, part.active, part.pos_x, part.pos_y);
            if (part.active) begin
                grid[part.pos_y][part.pos_x] = 1'b1;
            end
        end
    endtask
    
    task move_snake;
        automatic snake_part part;
        automatic snake_part part_copy;
        automatic snake_part prev_part;
        for (int i = 0; i < BODY_LENGTH; i++) begin
            part = snake_body[i];
            part_copy = part;

            if (part.active) begin
                if (i == 0) begin
                    case(direction)
                        UP: begin
                            if (part.pos_y == 0) part.pos_y = ROWS - 1;
                            else part.pos_y = part.pos_y - 1;
                        end
                        RIGHT: begin
                            if (part.pos_x == (COLUMNS-1)) part.pos_x = 0;
                            else part.pos_x = part.pos_x + 1;
                        end
                        DOWN: begin
                            if (part.pos_y == (ROWS-1)) part.pos_y = 0;
                            else part.pos_y = part.pos_y + 1;
                        end
                        LEFT: begin
                            if (part.pos_x == 0) part.pos_x = (COLUMNS-1);
                            else part.pos_x = part.pos_x - 1;
                        end
                    endcase
                end
                else begin
                    part.pos_y = prev_part.pos_y;
                    part.pos_x = prev_part.pos_x;
                end
            end

            prev_part = part_copy;
            snake_body[i] = part;
        end
    endtask
endmodule