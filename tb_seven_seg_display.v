`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:01:10 AM
// Design Name: 
// Module Name: tb_seven_seg_display
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


module tb_seven_seg_display;
  reg clock;
  reg [15:0] player_score;
  wire [5:0] sel;
  wire [7:0] seg;

  seven_seg_display S(
    .clock(clock),
    .player_score(player_score),
    .sel(sel),
    .seg(seg)
  );


  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

 
  initial begin
    player_score = 0;

    // Test with different scores
    #10 player_score = 1234;
    #10 player_score = 5678;

   

    #100 $finish;
  end

endmodule


