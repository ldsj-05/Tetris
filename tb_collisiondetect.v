`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:36:20 AM
// Design Name: 
// Module Name: tb_collisiondetect
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


module tb_collisiondetect;

  reg clock;
  reg [8:0] hori_pos;
  reg [8:0] verti_pos;
  reg [9:0] grid;
  wire collision;

  collisiondetect T (
    .clock(clock),
    .hori_pos(hori_pos),
    .verti_pos(verti_pos),
    .grid(grid),
    .collision(collision)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus
  initial begin
    hori_pos = 300;
    verti_pos = 200;
    grid = 10'b0000000000;
    #10;
    hori_pos = 230;
    #10;
    verti_pos = 380;
    #10;
    grid[hori_pos + 10 * verti_pos] = 1;
    #10;
    hori_pos = 300;
    verti_pos = 200;
    #10;

    #100 $finish;
  end

endmodule

