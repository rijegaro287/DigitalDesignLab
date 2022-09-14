module sumador_restador
#(parameter NUM_BITS = 2) (A, B, CTRL, Cout, R);
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;
    input logic CTRL;

    output logic Cout;
    output logic [(NUM_BITS-1):0] R;

    always @(A or B or CTRL) begin
        {Cout, R} <= CTRL ? A - B : A + B;
    end
endmodule