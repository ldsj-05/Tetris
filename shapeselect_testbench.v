`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:53:44 AM
// Design Name: 
// Module Name: shapeselect_testbench
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


module shapeselect_testbench;

reg [2:0] random;
wire [3:0] block;

shapeselect s(.random(random), .block(block));

initial
begin
random = 0;


#10 random = 1;
#20 random = 2;
#30 random = 3;
#40 random = 4;
#50 random = 5;
#60 random = 6;
#70 random = 7;
#80 random = 8;
#90 $finish;
end 
endmodule

