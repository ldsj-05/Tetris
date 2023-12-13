`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:45:23 AM
// Design Name: 
// Module Name: ScoreModule
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


module ScoreModule (
    input clock,
    input reset,
    input [3:0] lines_cleared,
    input [3:0] xpos, ypos,
    input [29:0] scancode,
    output reg [7:0] player_score,
    output reg [3:0] current_level,
    output reg game_over,
    output reg restart_game
);

    // Parameters for difficulty levels
    parameter LEVEL_1_THRESHOLD = 10;
    parameter LEVEL_2_THRESHOLD = 30;
    parameter LEVEL_3_THRESHOLD = 50;

    // Game state variables
    reg [3:0] difficulty_level;
    reg [7:0] total_score;

    // Constants
    localparam NUM_ROWS = 10;  // based on rows not sure 

    // Game Over and Restart signals
    reg game_over_internal;
    reg restart_game_internal;

    // Line clearing state machine
reg [1:0] completion_state;
reg start_bit_detected;
reg scan_ready;
reg [NUM_ROWS-1:0] row_states;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        // Reset game state and other variables
        difficulty_level <= 4'b0000;
        total_score <= 8'b00000000;
        game_over_internal <= 0;
        restart_game_internal <= 0;
        completion_state <= 2'b00;
        start_bit_detected <= 0;
        scan_ready <= 0;
        row_states <= 0;
    end else begin
        // Score based on lines cleared
        if (lines_cleared > 0) begin
            total_score <= total_score + (lines_cleared * 10);
        end

        // Line clearing logic
        case (completion_state)
            2'b00: begin
                // State 0: Check for start bit
                if (scancode[7:4] == 4'b1111) begin
                    start_bit_detected <= 1;
                    completion_state <= 2'b01;
                end
            end

            2'b01: begin
                // Wait for scan code to be ready
                if (scancode[3:0] == 4'b0001) begin
                    scan_ready <= 1;
                    completion_state <= 2'b10;
                end
            end

            2'b10: begin
                // Check for full lines and update row_states
                row_states <= (row_states << 1) | (lines_cleared == NUM_ROWS);

                // Clear full lines
                if (lines_cleared == NUM_ROWS) begin
                    total_score <= total_score + 100;  // Bonus points for clearing a line
                end

                // Transition back to State 0 or another state based on conditions
                completion_state <= 2'b00;
                start_bit_detected <= 0;
                scan_ready <= 0;
            end
        endcase

        // Update difficulty level based on the total score
        if (total_score >= LEVEL_3_THRESHOLD) begin
            difficulty_level <= 4'b0011; // Level 3
        end else if (total_score >= LEVEL_2_THRESHOLD) begin
            difficulty_level <= 4'b0010; // Level 2
        end else if (total_score >= LEVEL_1_THRESHOLD) begin
            difficulty_level <= 4'b0001; // Level 1
        end else begin
            difficulty_level <= 4'b0000; // Default level
        end
    end
end

    // Game Over condition
    always @(posedge clock) begin
        if (ypos == 0) begin
            game_over_internal <= 1;
        end else begin
            game_over_internal <= 0;
        end
    end

    // Restart condition
    always @(posedge clock) begin
        if (scancode == 29'h1C) begin
            restart_game_internal <= 1;
        end else begin
            restart_game_internal <= 0;
        end
    end

    // Output signals
    always @* begin
     player_score <= total_score;
     current_level <= difficulty_level;
     game_over <= game_over_internal;
     restart_game <= restart_game_internal;
end 

endmodule


