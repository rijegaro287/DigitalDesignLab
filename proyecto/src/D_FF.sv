module D_FF #(parameter NUM_BITS = 2) (CLK, RST, D, Q);
    input logic CLK, RST;
    input logic [(NUM_BITS-1):0] D;

    output logic [(NUM_BITS-1):0] Q = 0;

    always_ff @(posedge CLK or posedge RST)
        if (RST) Q <= '{default: '0};
        else Q <= D;
endmodule