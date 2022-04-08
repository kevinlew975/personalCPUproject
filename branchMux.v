`timescale 1ns / 1ps
module branchMux(input [15:0] adderOut,
                 input [15:0] pc,
                 input branch,
                 output reg [15:0] pc_Out);
           
           
           
                 
integer i;
integer k;

always@(*) begin
if(branch==1'b1)begin
    for(i=0;i<16;i=i+1)begin
        pc_Out[i]=adderOut[i];
    end//for
end//if
if(branch==1'b0)begin
    for(k=0;k<16;k=k+1)begin
        pc_Out[k]=pc[k];
    end
end


end//always                 

endmodule
