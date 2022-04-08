`timescale 1ns / 1ps
module main(input clk,
            input reset,
            output reg [15:0] program_counter,
            output reg [15:0] pc_out,
            output [15:0] instruction,
            output [2:0] rs1,
            output [2:0] rs2,
            output[15:0] rs1data,
            output[15:0] rs2data,
            output[15:0] read_data,
            output[15:0] write_data,
            output [9:0] address_bus);
            
always @(posedge clk)begin            
    if(reset == 1'b1) begin
        program_counter <= 0;
    end
    else
        program_counter <= pc_out;
end//always reset            

//control
wire [3:0] opcode;
control control_m (.opcode(opcode));

//registerFile
wire [2:0] rd;
wire [2:0] rs1;
wire [2:0] rs2;
wire writeRegEn;
wire [15:0] dataIn;
registerFile registerFile_m (.rd(rd), .rs1(rs1), .rs2(rs2), .writeRegEn(writeRegen),
                             .dataIn(dataIn));
                             
//ALU
wire [2:0] aluControl;
wire [15:0] rs1Value;
wire [15:0] rs2Value;
ALU ALU_M (.aluControl(aluControl), .rs1Value(rs1Value));

//immMux
wire imm_Control_6;
wire imm_Control_3;
wire [15:0] rs2ValueReg;
wire [15:0] rs2ValueImm;
immMux immMux_m (.imm_Control_6(imm_Control_6), .imm_Control_3(imm_Control_3),
                 .rs2ValueReg(rs2ValueReg), .rs2ValueImm(rs2ValueImm));
                 
//muxPC
wire [15:0] rs1_reg;
wire [15:0] pc;
wire branch;
wire jump;
muxPC muxPC_m (.rs1_reg(rs1_reg), .pc(pc), .branch(branch), .jump(jump));

//jumpMux
wire [15:0] branchMux;
wire [15:0] aluResult;
jumpMux jumpMux_m (.jump(jump), .branchMux(branchMux), .aluResult(aluResult));

//memRegMux
wire memToReg;
wire [15:0] readData;
memRegMux memRegMux_m (.memToReg(memToReg), .readData(readData), .aluResult(aluResult));
 
//branchMux
wire [15:0] adderOut;
wire [15:0] pc;
branchMux branchMux_m (.adderOut(adderOut), .pc(pc), .branch(branch)); 

//immGen
wire [15:0] instructionIn;
immGen immGen_m (.imm_Control_6(imm_Control_6), .imm_Control_3(imm_Control_3), .reset(reset),
                 .instructionIn(instructionIn));
                 
//programCounter
wire[15:0] previousCounter;
programCounter programCounter_m (.previousCounter(previousCounter));                 
        
endmodule
