`timescale 1ns / 1ps
//not sure if this works or is doing things right
module programCounter(input [15:0] previousCounter,
                      output reg [15:0] currentCounter);
                      
always@(*) begin
    currentCounter <= previousCounter + 1'b1;
end //always                 
                      
endmodule
