`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:57:30 AM
// Design Name: 
// Module Name: randomnumgen
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


module randomnumgen(
    input wire clk,
    output reg [2:0] random
    );
    
initial 
begin
random = 1;
end

always @ (posedge clk) begin
if (random == 7) begin
	random <= 1;
end else begin
	random <= random + 1;
end
end

    
endmodule

