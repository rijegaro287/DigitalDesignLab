module contador(input clk, output logic [3:0] data);
    
logic [3:0] temp = 4'b0000 ;
    
always @(posedge clk) begin
  
  begin
  if (temp==4'b1000)
    temp <= 4'b0000;
  else
    temp <= temp + 1;
  end
 end
 
assign data = temp;

endmodule 