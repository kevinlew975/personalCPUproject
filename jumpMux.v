`timescale 1ns / 1ps

module jumpMux(input jump,
               input [15:0] branchMux,
               input [15:0] aluResult,
               output reg [15:0] nextPC);
               
integer i;
integer k;

always@(*) begin
    if(jump==1'b1)begin
        for(i=0;i<16;i=i+1)begin
            nextPC[i]=aluResult[i];
        end//for
    end//if
    if(jump==1'b0)begin
        for(k=0;k<16;k=k+1)begin
            nextPC[i]=branchMux[i];
        end//for
    end//if
end//always               
               
endmodule
