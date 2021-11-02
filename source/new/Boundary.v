`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 01:01:54
// Design Name: 
// Module Name: Boundary
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


module Boundary(
    input clk,
    input [9:0] pixel_x, pixel_y,
    output reg boundary
    );
    
    always @(posedge clk) 
	begin
		boundary <= (((pixel_x>= 0) && (pixel_x < 31) || (pixel_x >= 610) && (pixel_x < 641)) || ((pixel_y >= 0) && (pixel_y < 31) || (pixel_y >= 450) && (pixel_y < 481)));
	end
    
endmodule
