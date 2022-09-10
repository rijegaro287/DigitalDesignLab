module sumador_restador
#(parameter NUM_BITS = 2) (A, B, CTRL, Cout, R);
    input logic [(NUM_BITS-1):0] A;
    input logic [(NUM_BITS-1):0] B;
    input logic CTRL;

    output logic Cout;
    output logic [(NUM_BITS-1):0] R;

    always @(A or B or CTRL) begin
    //     {Cout, R} <= A + B;
    //     // if (CTRL == 0) begin
    //     //     {Cout, R} <= A + B;
    //     // end
    //     // else begin
    //     //     R <= A - B;
    //     //     Cout <= 0;
    //     // end

        {Cout, R} <= CTRL ? A - B : A + B;
    end
endmodule