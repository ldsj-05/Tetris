`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:42:42 AM
// Design Name: 
// Module Name: tb_game_clock
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


module tb_game_clock;

    reg clock;
    reg reset;
    reg pause;
    wire game_clk;
    wire vga_clk;

  
    game_clock T (
        .clock(clock),
        .reset(reset),
        .pause(pause),
        .game_clk(game_clk),
        .vga_clk(vga_clk)
    );

    // Clock generation
    always begin
        #5 clock = ~clock;
    end

    // Initial conditions
    initial begin
        clock = 0;
        reset = 1;
        pause = 0;


        #10 reset = 0;

        // Simulate for 1000 ns
        #1000 $finish;
    end

 
    initial begin

        #200 pause = 1;
    end

endmodule

