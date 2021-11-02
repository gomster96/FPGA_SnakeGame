`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/08 21:10:53
// Design Name: 
// Module Name: ss_bcd10_4bit
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


module ss_bcd(
    input clk,
    input reset,
    input gameStart,
    output[3:0] data4,
    output[3:0] data5,
    output[3:0] data6,
    output[3:0] data7
    );
    integer div;
    wire [3:0] en;
    wire [3:0] value;
    
    ss_cnt10 u0(.clk(clk), .rst(reset), .gameStart(gameStart), .en(en[0]), .tc(en[1]), .Q(data4));
    ss_cnt10 u1(.clk(clk), .rst(reset), .gameStart(gameStart), .en(en[1]), .tc(en[2]), .Q(data5));
    ss_cnt10 u2(.clk(clk), .rst(reset), .gameStart(gameStart), .en(en[2]), .tc(en[3]), .Q(data6));
    ss_cnt10 u3(.clk(clk), .rst(reset), .gameStart(gameStart), .en(en[3]), .tc(), .Q(data7));



always @(posedge clk or posedge reset)
    if(reset)
        div <=0;
     else begin
        if(div == 'd1000_0000)
            div<=0;
        else
            div <= div +1;    
      end 
      
      assign en[0] = (div == 'd1000_0000);   
endmodule

