module sumador_completo(Cin, A, B, Cout, S);
    input logic Cin;
    input logic A;    
    input logic B;    

    output logic Cout;
    output logic S;

    logic N0, N1, N2;

    assign N0 = A && B;
    assign N1 = A ^ B;
    assign N2 = N1 && Cin;
    
    assign Cout = N0 || N2;
    assign S = N1 ^ Cin;
endmodule