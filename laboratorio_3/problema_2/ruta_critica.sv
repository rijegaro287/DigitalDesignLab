module ruta_critica #(parameter n = 4, m = n*2) (input logic [n*2-1:0] ab,
												 input logic [3:0] s,
												 input logic clk, rst,
												 output logic [n-1:0] resultado,
												 output logic [6:0] disp0
												 );
												 

logic z,ne,_ca,o;
logic [n*2-1:0] reg_result;
logic [n-1:0] aluResult;

register #(n) registro_entrada(rst, clk, ab, reg_result);

param_alu #(n) alu_test(reg_result[m/2-1:0],reg_result[m-1:m/2],s, aluResult,z, ne, _ca, o);

registerOut #(n) registro_salida(rst, clk, aluResult,  resultado);

decoSum display0 (resultado, disp0);



endmodule 