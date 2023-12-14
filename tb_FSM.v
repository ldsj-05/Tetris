`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:06:52 AM
// Design Name: 
// Module Name: tb_FSM
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


module tb_FSM;

  reg clock;
  reg reset;
  reg [29:0] scancode;
  wire out;
  reg [3:0] next_xpos, next_ypos, xpos_int, ypos_int;
  reg rotate_flag;

  FSM UUT (
    .clock(clock),
    .reset(reset),
    .scancode(scancode),
    .out(out),
    .next_xpos(next_xpos),
    .next_ypos(next_ypos),
    .xpos_int(xpos_int),
    .ypos_int(ypos_int),
    .rotate_flag(rotate_flag)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus
  initial begin
    reset = 1;
    scancode = 30'h00000000;

    #10 reset = 0;

    // Test case 1 - Add more test cases as needed
    #10 scancode = 29'h1B; // Stop
    #10 scancode = 29'h00; // Waiting for Input
    #10 scancode = 29'h23; // Check Down
    #10 scancode = 29'h3C; // Check Rotate
    #10 scancode = 29'h00; // Go Rotate

  

    #100 $finish;
  end

  // Monitor outputs
  always @(posedge clock) begin
    $display("out=%b, next_xpos=%h, next_ypos=%h, xpos_int=%h, ypos_int=%h, rotate_flag=%b",
             out, next_xpos, next_ypos, xpos_int, ypos_int, rotate_flag);
  end

endmodule

