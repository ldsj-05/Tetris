`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:52:53 AM
// Design Name: 
// Module Name: shapeselect
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

module shapeselect (
    input [2:0] random, 
    output reg [3:0] block);

wire[3:0] tblock, zblock, sblock, jblock, lblock, oblock, iblock;

randomnumgen(clock, random);

always @ *
begin
case(random)
1: block = tblock;
2: block = zblock;
3: block = sblock;
4: block = jblock;
5: block = lblock;
6: block = oblock;
7: block = iblock;
default: block = 0;
endcase
end

endmodule

