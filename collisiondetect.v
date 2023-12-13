`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:30:00 AM
// Design Name: 
// Module Name: collisiondetect
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


module collision(
    input clock,
    input [8:0]hori_pos,
    input [8:0]verti_pos,
    input [9:0] grid,
    output reg collision
    );
    
    initial collision <= 0;
    
    //detect collision with side walls
    always @(posedge clock)begin
        if (hori_pos > 394 || hori_pos < 234)
            assign collision = 1'b1;
        else
            assign collision = 1'b0;
    end
    
    
    //detect collision with bottom of 
    always @ (posedge clock) begin
        if (verti_pos > 379 || verti_pos < 59)
            assign collision = 1'b1;
        else 
            assign collision = 1'b0;
    end
    
       // Detect collision with other blocks 
    always @(posedge clock) begin
        if (grid[hori_pos + 10 * verti_pos])  // is grid a 1d array?
            collision <= 1'b1;
        else
            collision <= 1'b0;
    end
endmodule
