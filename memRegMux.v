`timescale 1ns / 1ps
module memRegMux(input memToReg,
                 input [15:0] readData,
                 input [15:0] aluResult,
                 output reg [15:0] memRegOut);
        
integer i;
integer k;        
                 
always@(*) begin                 
  if(memToReg ==1'b1) begin
    for (i =0;i<16;i=i+1) begin
        memRegOut[i] = readData[i];
    end//for 
  end//if               
  
  if(memToReg==1'b0) begin
    for(k=0;k<16;k=k+1) begin
        memRegOut[k] = aluResult[k];
    end
  end
                 
end//always
endmodule
