`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:16:20 AM
// Design Name: 
// Module Name: GridLines
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

module GridLines (
    input [9:0] lines_in,
    input [3:0] xpos,
    input [3:0] ypos,
    output reg [9:0] grid_out,
    input clock
);

    // Grid parameters
    parameter GRID_WIDTH = 10;
    parameter GRID_HEIGHT = 20;

    // Internal signals
    reg [9:0] lines_internal;
    reg [9:0] grid_internal;

    always @* begin
        // Update the lines_internal
        lines_internal = lines_in;

        // grid_internal is prolly wrong bc its based on lines and current block position
        
        grid_internal = 10'b0000000000;

       
        if (lines_internal != 0) begin
            for (integer i = 0; i < GRID_HEIGHT; i = i + 1) begin
                if (i < lines_internal) begin
                    grid_internal[i * GRID_WIDTH +: GRID_WIDTH] = 10'b1111111111;
                end
            end
        end

        // Example: Set the block in the grid based on xpos and ypos
        if (ypos < GRID_HEIGHT) begin
            grid_internal[ypos * GRID_WIDTH + xpos +: 4] = 4'b1111;
        end
    end

    // Output assignment
    always @(posedge clock) begin
        // Assign the output based on internal signals
        grid_out <= grid_internal;
    end

endmodule
