module alu_decoder(
  input logic [5:0] funct,
  input logic alu_op,

  output logic [3:0] alu_control,
  //flag_w[1] modifica N y Z
  //flag_w[0] modifica C y V
  output logic [1:0] flag_w  
);

  always_comb begin
    if (alu_op) begin
      case (funct[4:1])
        4'b0000: begin //AND
          alu_control = 4'b1000;
          if (funct[0]) begin
            flag_w = 2'b10;
          end 
          else begin
            flag_w = 2'b00;
          end
        end

        4'b1100: begin //ORR
          alu_control = 4'b1001;
          if (funct[0]) begin
            flag_w = 2'b10;
          end 
          else begin
            flag_w = 2'b00;
          end
        end

        4'b1101: begin //LSL
          alu_control = 4'b1011;
          if (funct[0]) begin
            flag_w = 2'b10;
          end 
          else begin
            flag_w = 2'b00;
          end
        end

        4'b1110: begin //LSR
          alu_control = 4'b1100;
          if (funct[0]) begin
            flag_w = 2'b10;
          end 
          else begin
            flag_w = 2'b00;
          end
        end

        4'b0100: begin //ADD
          alu_control = 4'b0000;
          if (funct[0]) begin
            flag_w = 2'b11;
          end 
          else begin
            flag_w = 2'b00;
          end
        end

        4'b0010: begin //SUB
          alu_control = 4'b0001;
          if (funct[0]) begin
            flag_w = 2'b11;
          end 
          else begin
            flag_w = 2'b00;
          end
        end

        default: begin
          alu_control = 4'b0000;
          flag_w = 2'b00;
        end
      endcase
    end
    else begin
      alu_control = 4'b0000;
      flag_w = 2'b00;
    end
  end
endmodule