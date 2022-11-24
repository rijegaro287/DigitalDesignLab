module instructionDecoder(instruction,op,funct,cond,Rn,Rm,Rd,imm);
	input [31:0] instruction;
	output logic [1:0] op;
	output logic [5:0] funct;
	output logic [3:0] cond;
	output logic [3:0] Rn,Rm,Rd; //Rn=Primer operador, Rm=Segundo operador en caso de usarse,  Rd=registro destino
	output logic [23:0] imm; //inmediato
	//logic [1:0] indexMode;
	logic I;//bandera de inmediato
	always_comb begin
	
		case(op)
		
			0:	
			begin
				Rn=instruction[19:16];
				Rd=instruction[15:12];
				funct=instruction[25:20];
				//indexMode=0;
				if(I) begin
					
					imm=instruction[7:0];
					Rm=0;
				end
				else begin
					imm=0;
					Rm=instruction[3:0];
				end
			end
			
			1: 
			begin
				Rn=instruction[19:16];
				Rd=instruction[15:12];
				funct=instruction[25:20];
				//indexMode={instruction[24],instruction[21]};
				if(I)begin
					Rm=instruction[3:0];
					imm=0;
				
				end
				else begin
					Rm=0;
					imm=instruction[11:0];
				
				end
			end
			2:
			begin
				Rn=0;
				Rd=0;
				Rm=0;
				funct=instruction[25:24];
				imm=instruction[23:0];
			end
			default:
			begin
				Rm=0;
				Rn=0;
				Rd=0;
				funct=0;
				imm=0;
			
			end
		
		
		endcase
	
	
	end
	assign op=instruction[27:26];
	assign cond=instruction[31:28];
	assign I=instruction[25];
	
	
	

endmodule 