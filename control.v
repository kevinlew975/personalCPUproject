`timescale 1ns / 1ps

module control( input [3:0] opcode,
                input reset,
                output reg [2:0] aluControl,
                output reg regWriteEnable,
                output reg imm_Control_6,
                output reg imm_Control_3,
                output reg jump,
                output reg branch);
                
                
//reset
always@(reset or opcode) begin
    if(reset) begin
        aluControl = 3'b000;
        regWriteEnable = 1'b0;
        imm_Control_6 = 1'b0;
        imm_Control_3 = 1'b0;
        jump = 1'b0;
        branch = 1'b0;
    end//if
end //reset

//opcode input
always@(opcode) begin
    case(opcode) 
        4'b0000 : begin  //halt
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b0001 : begin //add
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b0010 : begin //or
                    aluControl = 3'b010;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                 end
        4'b0011 : begin //sub
                    aluControl = 3'b001;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b0100 : begin //and
                    aluControl = 3'b010;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end    
        4'b0101 : begin //xor
                    aluControl = 3'b100;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end  
        4'b0110 : begin //addi
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b0111 : begin //jalr                        NOT FINISHED
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b1;
                    branch = 1'b0;
                  end
        4'b1000 : begin //slli                        ditto
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b1001 : begin //srli
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b1010 : begin //subi
                    aluControl = 3'b001;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b1011 : begin //jal
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b1;
                    branch = 1'b0;
                  end
        4'b1100 : begin //lw
                    aluControl = 3'b000;
                    regWriteEnable = 1'b1;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b1101 : begin //sw
                    aluControl = 3'b000;
                    regWriteEnable = 1'b0;
                    imm_Control_6 = 1'b1;
                    imm_Control_3 = 1'b0;
                    jump = 1'b0;
                    branch = 1'b0;
                  end
        4'b1110 : begin //beq
                    aluControl = 3'b000;
                    regWriteEnable = 1'b0;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b1;
                    jump = 1'b0;
                    branch = 1'b1;
                  end
        4'b1111 : begin //bge
                    aluControl = 3'b000;
                    regWriteEnable = 1'b0;
                    imm_Control_6 = 1'b0;
                    imm_Control_3 = 1'b1;
                    jump = 1'b0;
                    branch = 1'b1;
                  end
                  
    endcase //opcode case
end //always
endmodule
