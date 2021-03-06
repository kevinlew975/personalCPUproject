`timescale 1ns / 1ps
//ensures either immediate value from IMM gen is sent to ALU
//or the value from register file if imm gen not used
module immMux(input imm_Control_6,
              input imm_Control_3,
              input [15:0] rs2ValueReg,
              input [15:0] rs2ValueImm,
              output reg [15:0] rs2Value);
integer i;
integer k;             
always@(*) begin
    if(imm_Control_6 == 1'b1 || imm_Control_3 == 1'b1) begin 
        for (i=0; i<16;i=i+1) begin
            rs2Value[i] = rs2ValueImm[i];
        end //for
    end //if
    if(imm_Control_6 == 1'b0 && imm_Control_3 == 1'b0) begin 
        for (i=0; i<16;i=i+1) begin
            rs2Value[i] = rs2ValueReg[i];
        end //for
    end //if
end //always
endmodule
