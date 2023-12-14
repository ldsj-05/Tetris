`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 06:53:56 PM
// Design Name: 
// Module Name: TopModule_tb
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


module TopModule_tb;

    // Inputs
    reg clock;
    reg reset;
    reg [9:0] lines_in;
    reg [3:0] xpos;
    reg [3:0] ypos;
    reg [29:0] scancode;
    
    // Outputs
    wire [9:0] grid_out;
    wire [7:0] player_score;
    wire [3:0] current_level;
    wire game_over;
    wire restart_game;

  
    wire [3:0] xpos_fsm;
    wire [3:0] ypos_fsm;
    wire rotate_flag_fsm;
    
    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end


    TopModule top_module_inst (
        .clock(clock),
        .reset(reset),
        .lines_in(lines_in),
        .xpos(xpos),
        .ypos(ypos),
        .scancode(scancode),
        .grid_out(grid_out),
        .player_score(player_score),
        .current_level(current_level),
        .game_over(game_over),
        .restart_game(restart_game),
        .xpos_fsm(xpos_fsm),
        .ypos_fsm(ypos_fsm),
        .rotate_flag_fsm(rotate_flag_fsm)
    );

    // Stimulus generation
    initial begin
        // Initialize inputs
        reset = 1;
        lines_in = 10'b0;  // Set lines_in to the desired value
        xpos = 4'b0000;   // Set xpos to the desired value
        ypos = 4'b0000;   // Set ypos to the desired value
        scancode = 30'b0;  // Set scancode to the desired value

        // Apply reset
        #10 reset = 0;

        // Add test scenarios here

        #100 $stop;  // Stop the simulation after some time
    end

    // Add assertions if needed

endmodule


