`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 10:05:48
// Design Name: 
// Module Name: Main_Controller
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
`define S0 2'b00 
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module Controller(
    input clk,
    input reset,
    input userStart,
    input snakeEatCherry,
    input bump,
    input restart,
    output reg gamePrepare,
    output reg gameStart,
    output reg gameEnd,
    output reg[4:0] size
    );
    reg[1:0] cs;
    reg[1:0] nstate;
   
    
    reg sizeupState;
    reg myKey = 1;
    assign sizeUp = snakeEatCherry && sizeupState && myKey;
    reg fin;
    always @(posedge clk) begin
        if (gamePrepare) begin
            size <= 5'b00001; 
        end
        else if(sizeUp) begin
            myKey <= 0;
            size <= size + 5'b00001;
            
        end
        else myKey <= 1;
    end



    
    always @(posedge clk) begin
        case(cs)
            `S0: begin
                gamePrepare <= 1; gameStart <= 0;
            end
            `S1: begin
                 gamePrepare <= 0; gameStart <= 1; fin <= 0; sizeupState <= 0;
            end
            `S2: begin
                sizeupState <= 1; fin <= 1;
                end
            `S3: begin
                 gameStart <= 0; gameEnd <= 1;
            end
        endcase
    end
    
    always @(posedge clk) begin
        cs <= nstate;
    end
    
    always @(reset or userStart or snakeEatCherry or bump or restart or fin) begin
        if(reset) begin
            nstate = `S0;
        end
        else begin
            case(cs)
            `S0: 
                if(userStart) nstate = `S1;
                else nstate = `S0;
            `S1: begin
                if(snakeEatCherry) nstate = `S2;
                else if(bump) nstate = `S3;
                else nstate = `S1;
            end
            `S2: 
                if(fin) begin
                    nstate = `S1;
                end
                else if(size == 5'b11111) nstate = `S3;
                else nstate = `S2;
            `S3: begin
                if(restart) nstate = `S0;
                else nstate = `S3;
            end
            endcase
        end
    end
    
endmodule
