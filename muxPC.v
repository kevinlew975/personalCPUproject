`timescale 1ns / 1ps
module muxPC(input [15:0] rs1_reg,
             input [15:0] pc,
             input branch,
             input jump,
             output reg [15:0] rs1_out);
             
integer i;
integer k;

always@(*) begin
    if (branch == 1'b1 || jump == 1'b1) begin
        for (i = 0; i<16;i=i+1) begin
            rs1_out[i] = rs1_reg;
        end
    end//if      
    if (branch ==1'b0 && jump == 1'b0) begin
        for (k=0; k<16;k=k+1) begin
            rs1_out[k] = pc;
        end
    end
             
end //always          
endmodule
