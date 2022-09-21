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

        A <= 4'b1001;
        B <= 4'b0110;
        #10;
        assert (R == 4'b1111) $display("Resultado correcto");
            else $error("Fallo en prueba suma 9 + 6");

        A <= 4'b1000;
        B <= 4'b0011;
        #10;
        assert (R == 4'b1011) $display("Resultado correcto");
            else $error("Fallo en prueba suma 8 + 3");
       
        // ---------------> Resta <---------------
        S <= 4'b0001;

        A <= 4'b1111;
        B <= 4'b1100;
        #10;
        assert (R == 4'b0011) $display("Resultado correcto");
            else $error("Fallo en prueba resta 15 - 12");

        A <= 4'b1010;
        B <= 4'b0011;
        #10;
        assert (R == 4'b0111) $display("Resultado correcto");
            else $error("Fallo en prueba resta 10 - 3");

        // ---------------> Multiplicación <---------------
        S <= 4'b0010;

        A <= 4'b0101;
        B <= 4'b0010;
        #10;
        assert (R == 4'b1010) $display("Resultado correcto");
            else $error("Fallo en prueba multiplicacion 5 x 2");

        A <= 4'b0100;
        B <= 4'b0011;
        #10;
        assert (R == 4'b1100) $display("Resultado correcto");
            else $error("Fallo en prueba multiplicacion 4 x 3");

        // ---------------> División <---------------
        S <= 4'b0011;

        A <= 4'b1000;
        B <= 4'b0100;
        #10;
        assert (R == 4'b0010) $display("Resultado correcto");
            else $error("Fallo en prueba division 8 / 4");

        A <= 4'b1111;
        B <= 4'b0011;
        #10;
        assert (R == 4'b0101) $display("Resultado correcto");
            else $error("Fallo en prueba division 15 / 3");

        // ---------------> Módulo <---------------
        S <= 4'b0100;

        A <= 4'b1010;
        B <= 4'b0110;
        #10;
        assert (R == 4'b0100) $display("Resultado correcto");
            else $error("Fallo en prueba modulo 10 mod 4");

        A <= 4'b1111;
        B <= 4'b1100;
        #10;
        assert (R == 4'b0011) $display("Resultado correcto");
            else $error("Fallo en prueba modulo 15 mod 12");

        #10; $stop;
    end
endmodule