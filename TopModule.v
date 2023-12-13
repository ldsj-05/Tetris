`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 06:48:47 PM
// Design Name: 
// Module Name: TopModule
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

module TopModule (
    input wire clock,
    input wire reset,
    input wire pause,
    input wire next_block,
    input wire [2:0] random_block,
    input wire rotate,
    input wire [8:0] hori_pos,
    input wire [8:0] verti_pos,
    input wire [9:0] grid,
    input wire [3:0] lines_cleared,
    input wire [29:0] scancode,
    output reg [9:0] grid_out,
    output reg [7:0] player_score,
    output reg [3:0] current_level,
    output reg game_over,
    output reg restart_game,
    output reg [2:0] rotation,
    output reg [5:0] sel,
    output reg [7:0] seg,
    output reg [3:0] block,
    output reg VGA_R,  
    output reg VGA_G,  
    output reg VGA_B   
);
// vga module
    vga vga_inst (
        .in_clk(in_clk),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    // GridLines module
    GridLines grid_lines_inst (
        .lines_in(grid),
        .xpos(hori_pos),
        .ypos(verti_pos),
        .grid_out(grid_out),
        .clock(clock)
    );

    // TopLevelKeyboard module
    FSM FSM_inst(
        .out(out),
        .clock(clock),
        .reset(reset),
        .xpos_int(xpos_int),
        .ypos_int(ypos_int),
        .rotate_flag(out),
        .next_xpos(next_xpos),
        .next_ypos(next_ypos),
        .scancode(scancode),
        .current_state(current_state),
        .next_state(next_state),
        .xpos(xpos),
        .ypos(ypos),
        .regnext_xpos(regnext_xpos),
        .regnext_ypos(regnext_ypos),
        .rotate_con(rotate_con)
    );


    // ScoreModule module
    ScoreModule score_module_inst (
        .clock(clock),
        .reset(reset),
        .lines_cleared(lines_cleared),
        .xpos(hori_pos),
        .ypos(verti_pos),
        .scancode(scancode),
        .player_score(player_score),
        .current_level(current_level),
        .game_over(game_over),
        .restart_game(restart_game)
    );

    // CollisionDetect module
    collision collision_inst (
        .clock(clock),
        .reset(reset),
        .left(right),
        .game_board(game_board),
        .wall_collision(wall_collision),
        .block_collision(block_collision),
        .current_piece(current_piece),
        .piece_position(piece_position)

    );

    // GameClock module
    game_clock game_clock_inst (
        .clock(clock),
        .reset(reset),
        .pause(pause),
        .game_clk(),
        .vga_clk()
    );

    // MakeShape module
    makeshape make_shape_inst (
        .shape(block),
        .rotation(rotation),
        .block()
    );

    // NextBlock module
    nextblock next_block_inst (
        .clk(clock),
        .next(next_block),
        .random(random_block),
        .shape(block)
    );

    // RandomNumGen module
    randomnumgen random_num_gen_inst (
        .clk(clock),
        .random()
    );

    // RotateFSM module
    rotatefsm rotate_fsm_inst (
        .clock(clock),
        .reset(reset),
        .rot(rotate),
        .rotation(rotation)
    );

    // SevenSegDisplay module
    seven_seg_display seven_seg_display_inst (
        .clock(clock),
        .player_score(player_score),
        .sel(sel),
        .seg(seg)
    );

    // ShapeSelect module
    shapeselect shape_select_inst (
        .random(random_block),
        .block(block)
    );

  



endmodule



