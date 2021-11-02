`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/12/08 22:42:26
// Design Name:
// Module Name: ss_clk_mux
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


module ss_clk_mux(input clk, input rst, output reg[2:0] sel);
    integer cnt;
    always@(posedge clk) begin
    if(rst)
        begin
            cnt <= 0;
            sel <= 3'b000;
        end
    else if(cnt < 20000)
        begin
            cnt <= cnt + 1;
            sel <= sel;
        end
     else
        begin
            cnt <= 0;
            if(sel == 3'b111)
                sel <= 3'b000;
            else sel <= sel+1;
        end
    end

endmodule