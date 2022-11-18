module D_FF(CLK, RST, D, Q);
    input logic CLK, RST;
    input logic [31:0] D;

    output logic [31:0] Q = 0;

    always_ff @(posedge CLK or posedge RST)
        if (RST) Q <= '{default: '0};
        else Q <= D;
endmodule