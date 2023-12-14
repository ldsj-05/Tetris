`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:58:07 AM
// Design Name: 
// Module Name: randomnumgen_tb
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


module randomnumgen_tb;
 reg clk;
 wire [2:0] random;
 
 randomnumgen rng(.clk(clk),.random(random));


  always begin
   #5 clk = ~clk;
   end

initial
begin
clk = 0;

#10 clk = 1;

#20 clk = 1;

#30 clk = 0;

#50 $finish;
end

endmodule

