`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 10:05:02
// Design Name: 
// Module Name: Snake
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


module Snake(
    input clk,
    input reset,
    input [9:0] pixel_x, pixel_y,
    input Up, Left, Right, Down,
    input wire[4:0] size,
    output reg snakeHead,
    output reg snakeBody
    );
    
    reg [9:0] snakeHead_X = 10'd200;
    reg [8:0] snakeHead_Y = 9'd200;    
    reg [9:0] snakeBody_X [31:0];
    reg [8:0] snakeBody_Y [31:0];
    
    reg [3:0] direction;
    integer i;
    integer i2;
    integer count;
    wire snakeBodySignal;
    
    assign snakeBodySignal = (snakeHead_X != snakeBody_X[0]) || (snakeHead_Y != snakeBody_Y[0]);
    
    always @(posedge clk) begin
        if(snakeBodySignal == 1) begin
            snakeBody_X[0] <= snakeHead_X;
            snakeBody_Y[0] <= snakeHead_Y;
            for (i=31; i>0; i = i-1) begin
                if(i <= size -1) begin
                    snakeBody_X[i] <= snakeBody_X[i-1];
                    snakeBody_Y[i] <= snakeBody_Y[i-1]; 
                end
                else begin
                
                    snakeBody_X[i] <= 10'd0;
                    snakeBody_Y[i] <= 9'd0; 
                end
                
            end
        end
        
        if(reset) direction <= 4'b0000;
        else
            if(Up && direction != 4'b1000) direction <= 4'b0001;
            else if(Left && direction != 4'b0100) direction <= 4'b0010;
            else if(Right && direction != 4'b0010) direction <= 4'b0100;
            else if(Down && direction != 4'b0001) direction <= 4'b1000;
            else direction <= direction;
    end
    
     always@(posedge clk) begin
        snakeBody = 0;
        for(i2 = 1; i2<size; i2 = i2+1) begin
            if(snakeBody == 0)
                snakeBody = ((pixel_x > snakeBody_X[i2] && pixel_x < snakeBody_X[i2]+10) && (pixel_y > snakeBody_Y[i2] && pixel_y < snakeBody_Y[i2]+10));
             
        end
    end
    
    always@(posedge clk) begin
         snakeHead = ((pixel_x > snakeBody_X[0] && pixel_x < snakeBody_X[0]+10) && (pixel_y > snakeBody_Y[0] && pixel_y < snakeBody_Y[0]+10));
       
    end
    
     always @(posedge clk) begin
        if(reset) begin
            snakeHead_X <= 10'd200;
            snakeHead_Y <= 9'd200;
            
            
            
        end  
        else begin
            if(count == 1000_0000) begin
                count <= 0;     
                if(direction == 4'b0001) begin snakeHead_Y = snakeHead_Y - 10; end
                else if(direction == 4'b0010) begin snakeHead_X = snakeHead_X - 10; end
                else if(direction == 4'b0100) begin snakeHead_X = snakeHead_X + 10; end
                else if(direction == 4'b1000) begin snakeHead_Y = snakeHead_Y + 10; end
                else begin
                    snakeHead_X = snakeHead_X;
                    snakeHead_Y = snakeHead_Y;
                end
            end
            else count <= count+1;
        end
    end
    
endmodule
