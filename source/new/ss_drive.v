`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/08 20:50:43
// Design Name: 
// Module Name: ss_drive
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


module ss_drive(
    input CLK100MHZ,
    input rst,
    input gameStart,
    output CA, 
    output CB, 
    output CC, 
    output CD, 
    output CE, 
    output CF, 
    output CG, 
    output DP,
    output reg [7:0] AN
    );
    wire [3:0] value;
    wire[2:0] sel;
    wire [3:0] data4, data5, data6, data7;
        
    ss_bcd (.clk(CLK100MHZ), .reset(rst), .gameStart(gameStart), .data4(data4), .data5(data5), .data6(data6), .data7(data7));
    ss_mux m0(4'b0, 4'b0, 4'b0, 4'b0, data4, data5, data6, data7, sel,value);
    ss_clk_mux cm0(.clk(CLK100MHZ), .rst(rst), .sel(sel));
    ss_display DP0(value, AN[5], CA, CB, CC, CD, CE, CF, CG, DP); 
    
    always@(sel) begin
        case(sel)
        3'b000: begin 
            AN[7] <= 1; AN[6] <= 1; AN[5] <= 1; AN[4] <= 1; 
            AN[3] <=1 ; AN[2] <= 1; AN[1] <= 1; AN[0] <= 0; end
        3'b001: begin 
            AN[7] <= 1; AN[6] <= 1; AN[5] <= 1; AN[4] <= 1; 
            AN[3] <=1 ; AN[2] <= 1; AN[1] <= 0; AN[0] <= 1; end
        3'b010: begin 
            AN[7] <= 1; AN[6] <= 1; AN[5] <= 1; AN[4] <= 1; 
            AN[3] <=1 ; AN[2] <= 0; AN[1] <= 1; AN[0] <= 1; end
        3'b011: begin 
            AN[7] <= 1; AN[6] <= 1; AN[5] <= 1; AN[4] <= 1; 
            AN[3] <=0 ; AN[2] <= 1; AN[1] <= 1; AN[0] <= 1; end
        3'b100: begin 
            AN[7] <= 1; AN[6] <= 1; AN[5] <= 1; AN[4] <= 0; 
            AN[3] <=1 ; AN[2] <= 1; AN[1] <= 1; AN[0] <= 1; end
        3'b101: begin 
            AN[7] <= 1; AN[6] <= 1; AN[5] <= 0; AN[4] <= 1; 
            AN[3] <=1 ; AN[2] <= 1; AN[1] <= 1; AN[0] <= 1; end
        3'b110: begin 
            AN[7] <= 1; AN[6] <= 0; AN[5] <= 1; AN[4] <= 1; 
            AN[3] <=1 ; AN[2] <= 1; AN[1] <= 1; AN[0] <= 1; end
        3'b111: begin 
            AN[7] <= 0; AN[6] <= 1; AN[5] <= 1; AN[4] <= 1; 
            AN[3] <=1 ; AN[2] <= 1; AN[1] <= 1; AN[0] <= 1; end
            
        endcase
    end
    
    
    
    
    
endmodule
