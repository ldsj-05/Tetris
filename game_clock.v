`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:42:09 AM
// Design Name: 
// Module Name: game_clock
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


module game_clock(
    input wire clock,
    input wire reset,
    input wire pause,
    output reg game_clk,
    output reg vga_clk
);

    reg [31:0] vga_counter;
    reg [31:0] game_counter;

    parameter VGA_TARGET_FREQUENCY = 60;
    parameter GAME_TARGET_FREQUENCY = 1;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            vga_counter <= 0;
            game_counter <= 0;
            vga_clk <= 0;
            game_clk <= 0;
        end else begin
            if (!pause) begin
                if (vga_counter == (32'b1000000000/VGA_TARGET_FREQUENCY)/2) begin
                    vga_counter <= 0;
                    vga_clk <= ~vga_clk;
                end else begin
                    vga_counter <= vga_counter + 1;
                end

                if (game_counter == (32'b1000000000/GAME_TARGET_FREQUENCY)/2) begin
                    game_counter <= 0;
                    game_clk <= ~game_clk;
                end else begin
                    game_counter <= game_counter + 1;
                end
            end
        end
    end

endmodule

