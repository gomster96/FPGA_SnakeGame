`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 22:27:02
// Design Name: 
// Module Name: Screen
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


module Screen(
    input clk,
    input rst,
    input snake_on,
    input cherry_on,
    input boundary,
    output[9:0] pixel_x, pixel_y,
    output VGA_HS, VGA_VS,
    output [11:0] vga 
    );
    
    localparam COLOR_WHITE  = 12'b1111_1111_1111;
    localparam COLOR_RED = 12'b0000_0000_1111;
    localparam COLOR_BLUE  = 12'b1111_0000_0000;
    localparam COLOR_GREEN  = 12'b0000_1111_0000;
    localparam COLOR_YELLOW  = 12'b0000_1111_1111;
    localparam COLOR_BLACK  = 12'b0000_0000_0000;
    
    wire video_on, block_on;
    wire pixel_clk;
    reg [11:0] vga_next, vga_reg;


    VGA_controller VGA_controller_1(
        .clk(clk), .reset(Reset),
        .hsync(VGA_HS), .vsync(VGA_VS),
        .video_on(video_on), .pixel_clk(pixel_clk),
        .pixel_x(pixel_x), .pixel_y(pixel_y)
    );
    
    
    
    always @(posedge clk, posedge rst)
    begin
        if(rst) begin
            vga_reg <= 12'd0;
            
            end
        else
            if(pixel_clk)
                vga_reg <= vga_next;
    end
   
    always @*
    begin
        vga_next = vga_reg;
        if(~video_on)
            vga_next = COLOR_BLACK;
        else
        begin
            if(boundary)
                vga_next = COLOR_BLUE;
            else if(snake_on)
                vga_next = COLOR_YELLOW;
            else if(cherry_on)
                vga_next = COLOR_RED;
            else 
                vga_next =  COLOR_GREEN;
        end
    end
    
            
    assign vga = vga_reg;
endmodule
