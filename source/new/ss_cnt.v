`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/08 21:10:08
// Design Name: 
// Module Name: ss_cnt10
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


module ss_cnt10(
    input clk,
    input rst,
    input gameStart,
    output reg [3:0] Q,
    input en,
    output tc
    );
    
    always @(posedge clk or posedge rst)
        if(rst)
            Q<=4'd0;
        else if(en&&gameStart) begin
            Q<= Q+1;
            if(Q == 4'd9) 
                Q <= 4'd0;
    end
    
    assign tc = (Q==4'd9 && en)?1:0;
    
endmodule

