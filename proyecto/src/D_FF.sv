module D_FF(CLK, RST, D, Q);
    input logic CLK, RST;
    input logic D;

    output logic Q = 0;

    always_ff @(posedge CLK or posedge RST)
        if (RST) Q <= 1'b0;
        else Q <= D;
endmodule