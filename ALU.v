`timescale 1ns / 1ps
module ALU(input [2:0] aluControl,
           input [15:0] rs1Value,
           input [15:0] rs2Value,
           output reg regWriteEnable,
           output reg [15:0] rdValue);

always@(*)
    case(aluControl) 
        3'b000 : begin //add
                rdValue = rs1Value + rs2Value;
                regWriteEnable = 1'b1;
                end
        3'b001 : begin //sub
                rdValue = rs1Value - rs2Value;
                regWriteEnable = 1'b1;
                end
        3'b010 : begin //or
                rdValue = rs1Value | rs2Value;
                regWriteEnable = 1'b1;
                end
        3'b011 : begin //and
                rdValue = rs1Value & rs2Value;
                regWriteEnable = 1'b1;
                end
        3'b100 : begin //xor
                 rdValue = rs1Value ^ rs2Value;
                 end
    endcase
           
endmodule
