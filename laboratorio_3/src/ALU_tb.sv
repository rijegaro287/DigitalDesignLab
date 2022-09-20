module ALU_tb();
    localparam NUM_BITS = 4;

    logic [(NUM_BITS-1):0] A;
    logic [(NUM_BITS-1):0] B;
    logic [3:0] S;

    logic [(NUM_BITS-1):0] R;
    logic N, Z, C, V;

    ALU dut(.A(A), .B(B), .S(S), .R(R), .N(N), .Z(Z), .C(C), .V(V));

    initial begin
        // ---------------> Suma <---------------
        S <= 4'b0000;

        // Sin carry
        A <= 4'b1001;
        B <= 4'b0110;
        #10;
        // Con carry
        A <= 4'b1010;
        B <= 4'b1100;
        #10;
        //Con overflow positivo
        A <= 4'b0100;
        B <= 4'b0100;
        #10;
        //Con overflow negativo
        A <= 4'b1100;
        B <= 4'b1000;
        #10;
       
        // ---------------> Resta <---------------
        S <= 4'b0001;

        // Resultado positivo
        A <= 4'b1111;
        B <= 4'b1100;
        #10;
        // Resultado con carry
        A <= 4'b1010;
        B <= 4'b1100;
        #10;
        // Resultado con overflow
        A <= 4'b0100;
        B <= 4'b1100;
        #10;
        // Resultado con overflow
        A <= 4'b1100;
        B <= 4'b0101;
        #10;

        // ---------------> Multiplicación <---------------
        S <= 4'b0010;

        // 3x2 = 6
        A <= 4'b0011;
        B <= 4'b0010;
        #10;
        // 4x3 = 12
        A <= 4'b0100;
        B <= 4'b0011;
        #10;
        // 4x3 = 12
        A <= 4'b0010;
        B <= 4'b1110;
        #10;
        // 4x3 = 12
        A <= 4'b0101;
        B <= 4'b0010;
        #10;

        $stop;
    end
endmodule