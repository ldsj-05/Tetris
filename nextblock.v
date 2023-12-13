`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:55:25 AM
// Design Name: 
// Module Name: nextblock
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


module nextblock(
input clk,
input next,
input [2:0] random,
output reg [2:0] shape
);

	always @ (posedge clk) begin
	 if(next) begin
             shape <= random;
       	 end
    	 else
            shape <= 1;
	end
	endmodule
