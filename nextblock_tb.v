`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:56:31 AM
// Design Name: 
// Module Name: nextblock_tb
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


module nextblock_tb;

reg clk;
reg next;
reg [2:0]random; 
wire [2:0]shape;

nextblock nb(.clk(clk), .next(next), .random(random), .shape(shape));

  always begin
   #5 clk = ~clk;
   end
   
initial
begin
clk = 0;
next = 0;
random = 0;

#10 clk = 1;
#10 next = 0;
#10 random = 2;

#20 clk = 1;
#20 next = 1;
#20 random = 3;

#30 clk = 1;
#30 next = 0;
#30 random = 7;

#40 $finish;
end 
endmodule
