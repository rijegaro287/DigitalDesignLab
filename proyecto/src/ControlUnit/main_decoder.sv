module main_decoder(
  input logic [1:0] op,
  input logic [5:0] funct,

  output logic reg_w,
  output logic mem_w,
  output logic mem_to_reg,
  output logic alu_src,
  output logic [1:0] reg_src,
  output logic branch,
  output logic alu_op
);

always_comb begin
    case (op)
        2'b00: begin
          if (funct[5]) begin
            branch = 0;
            mem_to_reg = 0;
            mem_w = 0;
            alu_src = 1;
            reg_w = 1;
            reg_src = 2'b00;
            alu_op = 1;
          end
          else begin
            branch = 0;
            mem_to_reg = 0;
            mem_w = 0;
            alu_src = 0;
            reg_w = 1;
            reg_src = 2'b00;
            alu_op = 1;
          end
        end
        
        2'b01: begin
        if (funct[0]) begin
            branch = 0;
            mem_to_reg = 1;
            mem_w = 0;
            alu_src = 1;
            reg_w = 1;
            reg_src = 2'b00;
            alu_op = 0;
          end
          else begin
            branch = 0;
            mem_to_reg = 0;
            mem_w = 1;
            alu_src = 1;
            reg_w = 0;
            reg_src = 2'b10;
            alu_op = 0;
          end
        end
        
        2'b10: begin
          branch = 1;
          mem_to_reg = 0;
          mem_w = 0;
          alu_src = 1;
          reg_w = 0;
          reg_src = 2'b01;
          alu_op = 0;
        end

        default: begin
          branch = 0;
          mem_to_reg = 0;
          mem_w = 0;
          alu_src = 0;
          reg_w = 0;
          reg_src = 2'b00;
          alu_op = 0;
        end
    endcase
  end
endmodule