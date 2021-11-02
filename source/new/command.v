`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 21:11:33
// Design Name: 
// Module Name: command
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


module command(
    input clk,
    input [7:0] scancode,
    output reg Up, Down, Left, Right, Reset, userStart
    );
    
    
    always@(clk)
    begin
        Up = 0; Down = 0; Right = 0; Left = 0; Reset = 0; userStart = 0;
        case(scancode)
            'h77 : // w
                Up = 1;
            'h61 : // a
                Left = 1;
            'h73 : // s
                Down = 1;
            'h64 : // d
                Right = 1;
            'h72 : // r
                Reset = 1;
            'h71 :
                userStart = 1;
            default :
            begin
                Up=0;Left=0;Right=0;Down=0;Reset=0;userStart = 0;
            end
        endcase
    end
    
endmodule
