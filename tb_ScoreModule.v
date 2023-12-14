`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:57:43 AM
// Design Name: 
// Module Name: tb_ScoreModule
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


module tb_ScoreModule;

  reg clock;
  reg reset;
  reg [3:0] lines_cleared;
  reg [3:0] xpos_in, ypos_in;
  reg [29:0] scancode;
  wire [7:0] player_score;
  wire [3:0] current_level;
  reg game_over;
  reg restart_game;

  ScoreModule T (
    .clock(clock),
    .reset(reset),
    .lines_cleared(lines_cleared),
    .xpos_in(xpos_in),
    .ypos_in(ypos_in),
    .scancode(scancode),
    .player_score(player_score),
    .current_level(current_level),
    .game_over(game_over),
    .restart_game(restart_game)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus
  initial begin
    reset = 1;
    lines_cleared = 0;
    xpos_in = 4'b0000;
    ypos_in = 4'b0000;
    scancode = 30'h00000000;

    #10 reset = 0;

    // Test case 1
    #10 lines_cleared = 2;
    #10 scancode = 30'h1C;

 

    #100 $finish;
  end

endmodule

