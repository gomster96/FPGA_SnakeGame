`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 20:33:58
// Design Name: 
// Module Name: Checker
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


module Checker(
    input clk,
    input rst,
    input snakeHead,
    input snakeBody,
    input cherry,
    input boundary,
    output reg snakeEatCherry,
    output reg bump
    );
    
    reg makeOneClock = 1;
    wire bump_boundary;
    wire bump_body;
    assign eating_cherry = snakeHead && cherry&&makeOneClock;
    
    always@(posedge clk) begin
        if(eating_cherry == 1) begin
            makeOneClock <= 0;
            snakeEatCherry <= 1;
        end
        else begin
            snakeEatCherry <= 0;
            makeOneClock <= 1;
        end
    end
    
    assign bump_boundary = snakeHead && boundary ;
    assign bump_body = snakeHead && snakeBody;
    
    always@(posedge clk) begin

        if(bump_boundary == 1 || bump_body == 1) bump <= 1;
        else bump <= 0;

    end
    
endmodule
