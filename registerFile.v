`timescale 1ns / 1ps
module registerFile(input reset,
                    input [2:0] rd,
                    input [2:0] rs1,
                    input [2:0] rs2,
                    input writeRegEn,
                    input [15:0] dataIn,
                    output reg [15:0] dataOut,
                    output reg [15:0] rs1Value,
                    output reg [15:0] rs2Value);
                    
reg [15:0] regArray [7:0];
integer i;
integer k;

always @(*) begin
    rs1Value = regArray[rs1];
    rs2Value = regArray[rs2];
if(reset) begin
    for (i = 0; i <= 7; i=i+1) begin
        regArray[i] = 16'd0;
    end//for 
end//reset
else if(writeRegEn) begin                //confused
    for (k=0; k<16;k=k+1) begin
        dataOut[k] = dataIn[k];
    end
    regArray[rd] = dataOut;
end//elseif
end//always                    
                    
endmodule
