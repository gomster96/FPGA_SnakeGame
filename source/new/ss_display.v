`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/12/08 22:42:05
// Design Name:
// Module Name: ss_display
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module ss_display(
    input [3:0] Din,
    input AN_5,
    output reg ssA,
    output reg ssB,
    output reg ssC,
    output reg ssD,
    output reg ssE,
    output reg ssF,
    output reg ssG,
    output reg ssDP
    );
    always @(Din) begin
        if(AN_5 == 0)
        begin
            ssA = 0; ssB = 0; ssC = 0; ssD = 0; ssE = 0; ssF = 0 ; ssG = 0; ssDP = 0;
        end
        else
        begin
            ssA = 0; ssB = 0; ssC = 0; ssD = 0; ssE = 0; ssF = 0 ; ssG = 0; ssDP = 1;
        end
        case (Din)
            4'b0000: begin
            //0
            ssG = 1;
            end
            4'b0001: begin
            //1
            ssA = 1; ssD = 1; ssE = 1; ssF = 1 ; ssG = 1;
            end
            4'b0010:begin
            //2
            ssC = 1; ssF = 1 ;
            end
            4'b0011:begin
            //3
            ssE = 1; ssF = 1 ;
            end
            4'b0100:begin
            //4
            ssA=1; ssD = 1; ssE = 1;
            end
            4'b0101:begin
            //5
            ssB = 1; ssE = 1;
            end
            4'b0110:begin
            //6
            ssB = 1;
            end
            4'b0111:begin
            //7
            ssD = 1; ssE = 1;  ssG = 1;
            end
            4'b1000:begin
            //8
           
            end
            4'b1001:begin
            //9
            ssE = 1;
            end
            4'b1010:begin
            //10 == a\
            ssF = 1 ;
            end
            4'b1011:begin
            //11 == b
            ssA = 1; ssB = 1;
            end
            4'b1100:begin
            //12 == c
            ssB = 1; ssC = 1; ssG = 1;
            end  
            4'b1101:begin
            //13 == d
            ssA = 1; ssF = 1;
            end
            4'b1110:begin
            //14 == e
            ssB = 1; ssC = 1;
            end
            4'b1111:begin
            //15 == f
            ssB = 1; ssC = 1; ssD = 1;
            end
        endcase
    end
   
endmodule

