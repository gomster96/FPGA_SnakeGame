`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 21:35:53
// Design Name: 
// Module Name: newDatapath
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


module newDatapath(
    input clk, 
    input rst,
    input ps2_clk,
    input ps2_data,
    input gamePrepare,
    input gameStart,
    input gameEnd, 
    input [4:0] size,
    input [7:0] SW,
    input ARP_ON,
    output AUD_PWM,
    output AUD_SD,
    output [2:0] LED,
    output userStart,
    output snakeEatCherry,
    output bump,
    output restart, 
    output VGA_HS, VGA_VS,
    output [11:0] vga,
    output [7:0] AN,
    output CA,CB,CC,CD,CE,CF,CG, DP
    );
    
    wire [9:0] pixel_x, pixel_y;
    wire video_on, block_on;
    wire pixel_clk;
    reg [11:0] vga_next, vga_reg;
    wire Up, Left, Right, Down; 
    
    ss_drive(
    .CLK100MHZ(clk),
    .rst(rst),
    .gameStart(gameStart),
    .CA(CA), 
    .CB(CB), 
    .CC(CC), 
    .CD(CD), 
    .CE(CE), 
    .CF(CF), 
    .CG(CG), 
    .DP(DP),
    .AN(AN)
    );
    
     KeyBoard KBD(
    .clk(clk),
    .rst(rst),
    .ps2clk(ps2_clk),
    .ps2data(ps2_data),
    .Up(Up), .Down(Down), .Left(Left), .Right(Right), .Reset(Reset), .userStart(userStart)
    );
    
    
    
    /////////////////// snake condition/////////
    wire snake_on;
    wire cherry;
    wire snakeHead, snakeBody;
    wire boundary;

    
    Screen screen(
    .clk(clk),
    .rst(rst),
    .snake_on(snake_on),
    .boundary(boundary),
    .cherry_on(cherry),
    .pixel_x(pixel_x), .pixel_y(pixel_y),
    .VGA_HS(VGA_HS), .VGA_VS(VGA_VS),
    .vga(vga) 
    );
    
    assign snake_on = snakeHead || snakeBody;
    
    Snake snake_module(.clk(clk), .reset(!gameStart), .pixel_x(pixel_x), .pixel_y(pixel_y), 
        .Up(Up), .Left(Left), .Right(Right), .Down(Down), 
        .size(size),
        .snakeHead(snakeHead), .snakeBody(snakeBody));
    
    
    
    Cherry cherry_module(.clk(clk), .reset(!gameStart), .pixel_x(pixel_x), .pixel_y(pixel_y), .eating_cherry(snakeEatCherry), .cherry(cherry));
    
    
    Boundary boundary_module(.clk(clk), .pixel_x(pixel_x), .pixel_y(pixel_y), .boundary(boundary));   
    
    Checker checker(.clk(clk), .rst(rst),.snakeHead(snakeHead), .snakeBody(snakeBody), .cherry(cherry), .boundary(boundary), . snakeEatCherry(snakeEatCherry), .bump(bump));
    
    pwm_top audio(.clk(clk),.SW(SW),.ARP_ON(ARP_ON),.bump(bump),.snakeEatCherry(snakeEatCherry),.AUD_PWM(AUD_PWM),.AUD_SD(AUD_SD),.LED(LED));


endmodule
