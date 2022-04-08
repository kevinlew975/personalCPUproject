`timescale 1ns / 1ps
module immGen(input imm_Control_6,
              input imm_Control_3,
              input reset,
              input [15:0] instructionIn,
              output reg [15:0] rs2Value);
              
integer i;
integer k;
integer y;

always@(*) begin
    if(imm_Control_6 == 1'b1) begin
        for (i = 0; i < 6; i=i+1) begin
            rs2Value[i] = instructionIn[i];
        end //for 
    end //if immControl
    if(imm_Control_3 == 1'b1) begin
        for (y=0; y < 3; y=y+1) begin
            rs2Value[y] = instructionIn[y];
        end//for
    end//if
    if (reset == 1'b1) begin
        for (k=0; k < 16; k=k+1) begin
            rs2Value[k] = 1'b0;
        end//for
    end //reset

end//always                   
endmodule
