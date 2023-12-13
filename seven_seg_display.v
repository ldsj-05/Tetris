`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:58:45 AM
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display (
  input clock,
  input [15:0] player_score,
  output reg [5:0] sel,
  output reg [7:0] seg
);

wire sev_seg [9:0];

assign sev_seg[0] = 7'b1000000;
assign sev_seg[1] = 7'b1111001;
assign sev_seg[2] = 7'b0100100;
assign sev_seg[3] = 7'b0110000;
assign sev_seg[4] = 7'b0011001;
assign sev_seg[5] = 7'b0010010;
assign sev_seg[6] = 7'b0000010;
assign sev_seg[7] = 7'b1111000;
assign sev_seg[8] = 7'b0000000;
assign sev_seg[9] = 7'b0000000;

reg[15:0] cnt = 0;
always @(posedge clock) cnt <= cnt + 1;
    wire sd_clk;
    assign sd_clk = cnt[15];

 reg [5:0] sel_reg = 6'b000001;
    reg [3:0] curr_digit;

    always @(*) begin
        curr_digit = player_score % 10;
    end

    always @(posedge sd_clk) begin
        sel_reg <= {sel_reg[4:0], sel_reg[5]};
    end

    always @(*) begin
        seg[7:0] = {1'b1, sev_seg[curr_digit]};
        sel[5:0] = ~sel_reg;
    end

endmodule


