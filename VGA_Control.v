`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 03:43:31 PM
// Design Name: 
// Module Name: VGA_Control
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



module VGA_Control(
    input block1_x,
    input block1_y,
    input block2_x,
    input block2_y,
    input block3_x,
    input block3_y,
    input block4_x,
    input block4_y,
    input currentmap,
    input wire horizontal_position,
    input wire vertical_position,
    output reg newblock1_x1,
    output reg newblock1_x2,
    output reg newblock1_y1,
    output reg newblock1_y2,
    output reg newblock2_x1,
    output reg newblock2_x2,
    output reg newblock2_y1,
    output reg newblock2_y2,
    output reg newblock3_x1,
    output reg newblock3_x2,
    output reg newblock3_y1,
    output reg newblock3_y2,
    output reg newblock4_x1,
    output reg newblock4_x2,
    output reg newblock4_y1,
    output reg newblock4_y2,
    output newmap
    );
    
    parameter block_width = 17;
    parameter block_rad = 8;
    reg [3:0] VGA_R;
    reg [3:0] VGA_G;
    reg [3:0] VGA_B;
    reg map_bottomleftx;
    reg map_bottomlefty;
    reg map_topleftx;
    reg map_toplefty;
    integer i;
    integer w;
    
//block 1     
    
    always @ (*) begin
        newblock1_x1 = (block1_x*17)-8;
        newblock1_x2 = (block1_y*17)-8;
        newblock1_y1 = (block1_y*17)+8;
        newblock1_y2 = (block1_y*17)+8;
    end
    always @ (*)
    if (horizontal_position > newblock1_x1 && horizontal_position < newblock1_x2 && vertical_position > newblock1_y1 && vertical_position > newblock1_y2) begin    
       VGA_R <= 8;
       VGA_G <= 8;
       VGA_B <= 8;
    end
    else begin
        VGA_R <= 0;
         VGA_G = 8;
        VGA_B <=0;
    end 


    
//block 2
    always @ (*) begin
        newblock2_x1 = (block1_x*17)-8;
        newblock2_x2 = (block1_y*17)-8;
        newblock2_y1 = (block1_y*17)+8;
        newblock2_y2 = (block1_y*17)+8;
    end
    always @ (*)
    if (horizontal_position > newblock2_x1 && horizontal_position < newblock2_x2 && vertical_position > newblock2_y1 && vertical_position > newblock2_y2) begin    
       VGA_R <= 8;
       VGA_G <= 8;
       VGA_B <= 8;
    end
    else begin
        VGA_R <= 0;
        VGA_G = 8;
        VGA_B <=0;
    end 


//block 3

     always @ (*) begin
        newblock3_x1 = (block1_x*17)-8;
        newblock3_x2 = (block1_y*17)-8;
        newblock3_y1 = (block1_y*17)+8;
        newblock3_y2 = (block1_y*17)+8;
    end
    always @ (*)
    if (horizontal_position > newblock3_x1 && horizontal_position < newblock3_x2 && vertical_position > newblock3_y1 && vertical_position > newblock3_y2) begin    
       VGA_R <= 8;
       VGA_G <= 8;
       VGA_B <= 8;
    end
    else begin
        VGA_R <= 0;
        VGA_G = 8;
        VGA_B <=0;
    end 

//block 4
    always @ (*) begin
        newblock4_x1 = (block1_x*17)-8;
        newblock4_x2 = (block1_y*17)-8;
        newblock4_y1 = (block1_y*17)+8;
        newblock4_y2 = (block1_y*17)+8;
    end
    always @ (*)
    if (horizontal_position > newblock4_x1 && horizontal_position < newblock4_x2 && vertical_position > newblock4_y1 && vertical_position > newblock4_y2) begin    
       VGA_R <= 8;
       VGA_G <= 8;
       VGA_B <= 8;
    end
    else begin
        VGA_R <= 0;
        VGA_G = 8;
        VGA_B <=0;
    end 


//current map top half

    //always @ * begin
    //  for (i = 0; i < 199; i = i+1) begin
           
 
//current map bottom half
    
endmodule


