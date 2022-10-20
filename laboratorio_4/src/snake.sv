module snake
#(
    parameter ROWS = 10,
    parameter COLS = 10,
    parameter BODY_LENGTH = 10
)
(
    input logic clk,
    input logic rst,
    input logic up_button,
    input logic right_button,
    input logic down_button,
    input logic left_button,

    // grid[i] da las filas
    // grid[i][j] da las casillas
    // grid[0] es block0, grid[1] es block1, etc
    // La comida va incluida en el grid
    output logic [(ROWS-1):0][(COLS-1):0] grid 
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

    typedef struct packed {
        int x;
        int y;
    } food;

    snake_part [(BODY_LENGTH-1):0] snake_body;
    food food_pos;
    int score;

    bit [1:0] direction;

    initial reset_everything();

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            reset_everything();
        end
        else begin
            if (~up_button && (direction != DOWN)) direction = UP;
            else if (~right_button && (direction != LEFT)) direction = RIGHT;
            else if (~down_button && (direction != UP)) direction = DOWN;
            else if (~left_button && (direction != RIGHT)) direction = LEFT;
            else direction = direction;

            move_snake();
            check_food_collision();
            reset_grid();
            update_grid();
        end
    end

    task reset_everything;
        score = 0;
        direction = RIGHT;
        reset_snake();
        generate_food();
        reset_grid();
        update_grid();
    endtask

    task reset_snake;
        for (int i = 0; i < BODY_LENGTH; i++) begin
            if (i == 0) snake_body[i].active = 1;
            else snake_body[i].active = 0;
            
            snake_body[i].pos_x = 0;
            snake_body[i].pos_y = 1;
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

        $display("food_pos.x: %d, food_pos.y: %d", food_pos.x, food_pos.y);
        grid[food_pos.y][food_pos.x] = 1'b1;
    endtask
    
    task move_snake;
        automatic snake_part part;
        automatic snake_part part_copy;
        automatic snake_part prev_part;
        for (int i = 0; i < BODY_LENGTH; i++) begin
            part = snake_body[i];
            part_copy = part;

            if (i == 0) begin
                case(direction)
                    UP: begin
                        if (part.pos_y == 0) part.pos_y = ROWS - 1;
                        else part.pos_y = part.pos_y - 1;
                    end
                    RIGHT: begin
                        if (part.pos_x == (COLS-1)) part.pos_x = 0;
                        else part.pos_x = part.pos_x + 1;
                    end
                    DOWN: begin
                        if (part.pos_y == (ROWS-1)) part.pos_y = 0;
                        else part.pos_y = part.pos_y + 1;
                    end
                    LEFT: begin
                        if (part.pos_x == 0) part.pos_x = (COLS-1);
                        else part.pos_x = part.pos_x - 1;
                    end
                endcase
            end
            else begin
                part.pos_y = prev_part.pos_y;
                part.pos_x = prev_part.pos_x;
            end

            prev_part = part_copy;
            snake_body[i] = part;
        end
    endtask

    task generate_food;
        food_pos.x = 4;
        food_pos.y = 4;
    endtask

    task check_food_collision;
        automatic snake_part snake_head = snake_body[0];
        if (
            (snake_head.pos_x == food_pos.x) &&
            (snake_head.pos_y == food_pos.y)
        ) begin
            automatic int i = 0;
            while (snake_body[i].active && (i < (BODY_LENGTH-1))) begin
                i = i + 1;
            end

            snake_body[i].active = 1;
            score = score + 1;
            generate_food();
        end
    endtask
endmodule