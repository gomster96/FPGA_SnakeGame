`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 04:19:39
// Design Name: 
// Module Name: Top
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


module Top(
    input CLK100MHZ, BTNC,
    input [7:0] SW, 
    input ARP_ON, 
    input PS2_CLK, PS2_DATA,
    output AUD_PWM, AUD_SD,
    output [2:0] LED,
    output VGA_HS, VGA_VS,
    output [11:0] vga,
    output [7:0] AN,
    output CA,CB,CC,CD,CE,CF,CG, DP
    );
    wire game_over;
    wire Up, Down, Right, Left, Reset, userStart;
    

     wire snakeEatCherry, bump, restart, gamePrepare, gameStart, gameEnd;
    wire[4:0] size;
    
    newDatapath Main_Datapath(
        .clk(CLK100MHZ), 
        .rst(BTNC),
        .ps2_clk(PS2_CLK),
        .ps2_data(PS2_DATA),
        .gamePrepare(gamePrepare),
        .gameStart(gameStart),
        .gameEnd(gameEnd), 
        .size(size),
        .SW(SW),
        .ARP_ON(ARP_ON),
        .AUD_PWM(AUD_PWM),
        .AUD_SD(AUD_SD),
        .userStart(userStart),
        .snakeEatCherry(snakeEatCherry),
        .bump(bump),
        .restart(restart),  
        .VGA_HS(VGA_HS), .VGA_VS(VGA_VS),
        .vga(vga), 
        .AN(AN),
        .CA(CA),.CB(CB),.CC(CC),.CD(CD),.CE(CE),.CF(CF),.CG(CG),.DP(DP)
    );
    
    
   wire clk_50;
    
    Controller Main_Controller(
        .clk(CLK100MHZ),
        .reset(BTNC),
        .userStart(userStart),
        .snakeEatCherry(snakeEatCherry),
        .bump(bump),
        .restart(restart),
        .gamePrepare(gamePrepare),
        .gameStart(gameStart),
        .gameEnd(gameEnd),
        .size(size)
    );
    
endmodule
