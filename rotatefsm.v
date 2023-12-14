`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:09:39 AM
// Design Name: 
// Module Name: rotatefsm
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

module rotatefsm_tb;

  reg rot; 
 reg clock;
 reg reset;
 wire [2:0] rotation;

rotatefsm rfsm(.rot(rot),.clock(clock),.reset(reset),.rotation(rotation));

 initial begin
 clock = 0;
 forever #5 clock = ~clock;
 end 
 initial begin
  
  rot = 1;
  reset = 0;

  #30;
      reset = 0;
  #40;
 rot = 1;
  #10;
  rot = 0;
  #10;
 rot = 1; 
  #20;
  rot = 0; 
  #20;
  rot = 1; 
  #20;
  rot = 0;  
#80 $finish;
 end
endmodule

