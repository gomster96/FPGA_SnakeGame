`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 03:47:44
// Design Name: 
// Module Name: Cherry
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


module Cherry(
    input clk,
    input reset,
    input [9:0] pixel_x,
    input [8:0] pixel_y,
    input eating_cherry,
    output reg cherry
    );
    
    wire [5:0] q;
    rand_num_generator rand_gen(.clk(clk), .reset(reset), .q(q));
    
    wire [23:0] mod4_next;
    reg [23:0] mod4_reg;
    always @(posedge clk)
    if(reset)
        mod4_reg <= 24'b0000_0000_0000_0000_0000_0000;
    else
        mod4_reg <= mod4_next;

    assign mod4_next = mod4_reg + 1 ;

    assign pixel_clk = (mod4_reg == 24'b1111_1111_1111_1111_1111_1111) ? 1 : 0; // output signal of pixel clock
    
    reg [9:0] rand_x = 10'd100;
	reg [8:0] rand_y = 9'd80;
	
	always@(posedge pixel_clk)
	begin
	rand_x= rand_x + 48;
	if(rand_x >= 570)
		begin
        rand_x = q + 20;
		end
    else if (rand_x <=80)
        rand_x = q + 20;
	end
	
	always @(posedge pixel_clk)
	begin
	rand_y=rand_y + 31 ;
	if(rand_y >= 400)
		begin
        rand_y = q + 20;
		end
    else if(rand_y <=80) 
        rand_y = q + 20;
	end
	
    
    reg  cherry_inX;
    reg  cherry_inY;
    

    ///초기 위치 설정 
    reg[9:0] change_rand_x = 10'd100;
    reg[8:0] change_rand_y = 90'd80;
    always @(posedge clk)
    begin
        if(eating_cherry) begin
            change_rand_x = rand_x;
            change_rand_y = rand_y;
        end
    end
    
    always @(posedge clk)
	begin
	   
            cherry_inX <= (pixel_x > change_rand_x && pixel_x < (change_rand_x + 10));
            cherry_inY <= (pixel_y > change_rand_y && pixel_y < (change_rand_y + 10));
            cherry <= cherry_inX && cherry_inY;
		
	end



    
endmodule

