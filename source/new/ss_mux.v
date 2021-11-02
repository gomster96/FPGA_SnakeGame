`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/12/08 22:42:50
// Design Name:
// Module Name: ss_mux
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


module ss_mux(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [3:0] E,
    input [3:0] F,
    input [3:0] G,
    input [3:0] H,
    input [2:0] sel,  
    output reg [3:0] OutD
    );
   
    always @ (sel)
    begin
        case(sel)
        3'b000: OutD <= A;
        3'b001: OutD <= B;
        3'b010: OutD <= C;
        3'b011: OutD <= D;
        3'b100: OutD <= E;
        3'b101: OutD <= F;
        3'b110: OutD <= G;
        3'b111: OutD <= H;
        endcase
    end
   
endmodule

