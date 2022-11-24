module conditional_logic(
  input logic clk,

  input logic [3:0] cond,
  input logic [3:0] alu_flags,
  input logic [1:0] flag_w,
  input logic pcs,
  input logic reg_w,
  input logic mem_w,

  output logic pc_src,
  output logic reg_write,
  output logic mem_write
);
  localparam N = 3;
  localparam Z = 2;
  localparam C = 1;
  localparam V = 0;

  logic cond_ex;
  logic nz_flags_enable;
  logic cv_flags_enable;

  logic [3:0] flags;

  always_comb begin
    case (cond) // condition_check
      4'b0000: cond_ex = flags[Z]; // EQ
      4'b0001: cond_ex = ~flags[Z]; // NE
      4'b0010: cond_ex = flags[C]; // CS/HS
      4'b0011: cond_ex = ~flags[C]; // CC/LO
      4'b0100: cond_ex = flags[N]; // MI
      4'b0101: cond_ex = ~flags[N]; // PL
      4'b0110: cond_ex = flags[V]; // VS
      4'b0111: cond_ex = ~flags[V]; // VC
      4'b1000: cond_ex = flags[C] & ~flags[Z]; // HI
      4'b1001: cond_ex = ~flags[C] | flags[Z]; // LS
      4'b1010: cond_ex = ~(flags[N] ^ flags[V]); // GE
      4'b1011: cond_ex = flags[N] ^ flags[V]; // LT
      4'b1100: cond_ex = ~flags[Z] & ~(flags[N] ^ flags[V]); // GT
      4'b1101: cond_ex = flags[Z] | (flags[N] ^ flags[V]); // LE
      4'b1110: cond_ex = 1'b1; // AL
		  default: cond_ex = 1'b0;
  endcase
  end

  D_FF #(.NUM_BITS(2)) 
    nz_flags(
      .CLK(clk),
      .RST(nz_flags_enable),
      .D(alu_flags[3:2]),
      .Q(flags[3:2])
    );

  D_FF #(.NUM_BITS(2)) 
    cv_flags(
      .CLK(clk),
      .RST(cv_flags_enable),
      .D(alu_flags[1:0]),
      .Q(flags[1:0])
    );

  assign nz_flags_enable = ~(flag_w[1] && cond_ex);
  assign cv_flags_enable = ~(flag_w[0] && cond_ex);

  assign pc_src = cond_ex && pcs;
  assign reg_write = cond_ex && reg_w;
  assign mem_write = cond_ex && mem_w;
endmodule