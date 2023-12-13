`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:51:48 AM
// Design Name: 
// Module Name: makeshape
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


module makeshape(
input [2:0]shape, 
input rotation,
output reg [15:0] block
);


reg[15:0] tblock, zblock, sblock, jblock, lblock, oblock, iblock;
reg [15:0] t0,t1,t2,t3, z0,z1,z2,z3, s0,s1,s2,s3, j0,j1,j2,j3, l0,l1,l2,l3, o0, i0, i1 ;

always @ * 
begin
case(shape)
1: begin
t0 = 16'b1110010000000000;
t1 = 16'b0010011000100000;
t2 = 16'b0000010011100000;
t3 = 16'b1000110010000000;
    end

2: begin
z0 = 16'b1100011000000000;
z1 = 16'b0010011001000000;
z2 = 16'b0000110001100000;
z3 = 16'b0100110010000000;
    end
3: begin 
s0 = 16'b0110110000000000;
s1 = 16'b0100011000100000;
s2 = 16'b0000011011000000;
s3 = 16'b1000110001000000;
     end
4: begin
j0 = 16'b0100010011000000;
j1 = 16'b1000111000000000;
j2 = 16'b0110010001000000;
j3 = 16'b0000111000100000;
      end
5: begin
l0 = 16'b0100010011000000;
l1 = 16'b0000111010000000;
l2 = 16'b1100010001000000;
l3 = 16'b0010111000000000;
     end
6:o0 = 16'b1100110000000000;
7: begin
i0 = 16'b1000100010001000;
i1 = 16'b0000000011110000;
end
default: o0 = 16'b1100110000000000;
endcase
end

always @ *
begin
if (rotation == 2'b00)
	begin
	tblock <= t0;
	zblock <= z0;
	sblock <= s0;
	jblock <= j0;
	lblock <= l0;
	oblock <= o0;
	iblock <= i0;
	end
else if (rotation == 2'b01)
	begin
	tblock <= t1;
	zblock <= z1;
	sblock <= s1;
	jblock <= j1;
	lblock <= l1;
	oblock <= o0;
	iblock <= i1;
	end	
else if (rotation == 2'b10)
	begin 
	tblock <= t2;
	zblock <= z2;
	sblock <= s2;
	jblock <= j2;
	lblock <= l2;
	oblock <= o0;
	iblock <= i0;
	end	
else if (rotation == 2'b11)
	begin
	tblock <= t3;
	zblock <= z3;
	sblock <= s3;
	jblock <= j3;
	lblock <= l3;
	oblock <= o0;
	iblock <= i1;
	end
else
	begin
	tblock <= t0;
	zblock <= z0;
	sblock <= s0;
	jblock <= j0;
	lblock <= l0;
	oblock <= o0;
	iblock <= i0;
	end
end
endmodule
