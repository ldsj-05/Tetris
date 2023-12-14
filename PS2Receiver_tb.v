`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:09:55 AM
// Design Name: 
// Module Name: PS2Receiver_tb
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


module PS2Receiver_tb;

   wire clock;
   reg kclock, kdata;
   wire [31:0] keycodeout;

   // Instantiate the PS2Receiver 
   PS2Receiver T (
      .clock(clock),
      .kclock(kclock),
      .kdata(kdata),
      .keycodeout(keycodeout)
   );

   // Instantiate a clock 
   reg clk_gen;

   always begin
      #5 clk_gen = ~clk_gen; 
   end


   assign clock = clk_gen;

   // Test scenario
   initial begin
      // Initialize signals
      kclock = 1;
      kdata = 1;


      #100

      // PS/2 data sequence
      #10 kclock = 0; kdata = 0;  // Start bit
      #10 kclock = 1; kdata = 1;  // Data bit 0
      #10 kclock = 0; kdata = 1;  // Data bit 1
      #10 kclock = 1; kdata = 0;  // Data bit 2
      #10 kclock = 0; kdata = 0;  // Data bit 3
      #10 kclock = 1; kdata = 1;  // Data bit 4
      #10 kclock = 0; kdata = 0;  // Data bit 5
      #10 kclock = 1; kdata = 0;  // Data bit 6
      #10 kclock = 0; kdata = 1;  // Data bit 7
      #10 kclock = 1; kdata = 1;  // Parity bit
      #10 kclock = 0; kdata = 1;  // Stop bit

      // Wait for a while to observe the result
      #200

      // End simulation
      $finish;
   end

endmodule


