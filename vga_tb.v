`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 09:47:32 AM
// Design Name: 
// Module Name: vga_tb
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



module vga_tb(

    );
    
    reg in_clk;
    reg [2:0] block1_x,block2_x,block3_x,block4_x;
    reg[4:0] block1_y, block2_y, block3_y, block4_y;
    reg currentmap;
    
    
    wire newmap;
    wire [3:0] VGA_R, VGA_G, VGA_B;
    wire VGA_HS, VGA_VS;
    wire horizontal_position, vertical_position;
    
    
    
    vga DUT (
        in_clk,
        block1_x,
        block1_y,
        block2_x,
        block2_y,
        block3_x,
        block3_y,
        block4_x,
        block4_y,
        currentmap,
        VGA_R,
        VGA_G,
        VGA_B,
        VGA_HS,
        VGA_VS
    ); 
    
    // Clock generator
    always #10 in_clk = ~in_clk;
    
    initial begin
        in_clk = 0;
        block1_x = 4'b0110;
        block1_y = 5'b00011;
        block2_x = 4'b0111;
        block2_y = 5'b00011;
        block3_x = 4'b0111;
        block3_y = 5'b00010;
        block4_x = 4'b0111;
        block4_y = 5'b00001;
        currentmap = 12'b0;
    end
    initial #5000 $finish;
    
endmodule
