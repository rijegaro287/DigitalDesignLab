module random_number_generator
#(
  parameter LIMIT = 15,
  parameter SEED = 1
)
(
  input logic clk,
  input logic rst,
  input logic load,
  output logic [($clog2(LIMIT)-1):0] random_number
);
    logic [7:0] state_in;
    logic [7:0] state_out;

    logic xor_0;
    logic xor_1;
    logic xor_2;

    D_FF dff_0 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[1]),
      .Q(state_out[0])
    );

    D_FF dff_1 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[2]), //xor_0
      .Q(state_out[1])
    );

    D_FF dff_2 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[3]), //xor_1
      .Q(state_out[2])
    );

    D_FF dff_3 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[4]), //xor_2
      .Q(state_out[3])
    );

    D_FF dff_4 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[5]),
      .Q(state_out[4])
    );

    D_FF dff_5 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[6]),
      .Q(state_out[5])
    );

    D_FF dff_6 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[7]),
      .Q(state_out[6])
    );

    D_FF dff_7 (
      .CLK(clk),
      .RST(rst),
      .D(state_in[0]),
      .Q(state_out[7])
    );

    always_comb begin
      xor_0 <= state_out[0] ^ state_out[2];
      xor_1 <= state_out[0] ^ state_out[3];
      xor_2 <= state_out[0] ^ state_out[4];
      
      if (load) begin
        state_in[1:0] <= state_out[1:0];
        state_in[2] <= xor_0;
        state_in[3] <= xor_1;
        state_in[4] <= xor_2;
        state_in[7:5] <= state_out[7:5];
      end
      else begin
        state_in <= SEED;
      end

      if(state_out[($clog2(LIMIT)-1):0] > LIMIT) random_number <= LIMIT;
      else random_number <= state_out[($clog2(LIMIT)-1):0];
    end
endmodule