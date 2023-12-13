`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:05:02 AM
// Design Name: 
// Module Name: PS2Receiver
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

module PS2Receiver(
	input clock,
	input kclock,
	input kdata,
	output [31:0] keycodeout
	);
    
    
	wire kclockf, kdataf;
	reg [7:0]datacur;
	reg [7:0]dataprev;
	reg [3:0]cnt;
	reg [31:0]keycode;
	reg flag;
    
	initial begin
    	keycode[31:0]<=0'h00000000;
    	cnt<=4'b0000;
    	flag<=1'b0;
	end
    
debouncer u_debounce(
    .clock(clock),
    .I0(kclock),
    .I1(kdata),
    .O0(kclockf),
    .O1(kdataf)
);
    
always@(negedge(kclockf))begin
	case(cnt)
	0:;//Start bit
	1:datacur[0]<=kdataf;
	2:datacur[1]<=kdataf;
	3:datacur[2]<=kdataf;
	4:datacur[3]<=kdataf;
	5:datacur[4]<=kdataf;
	6:datacur[5]<=kdataf;
	7:datacur[6]<=kdataf;
	8:datacur[7]<=kdataf;
	9:flag<=1'b1;
	10:flag<=1'b0;
    
	endcase
    	if(cnt<=9) cnt<=cnt+1;
    	else if(cnt==10) cnt<=0;
   	 
end

always @(posedge flag)begin
	if (dataprev!=datacur)begin
    	keycode[31:24]<=keycode[23:16];
    	keycode[23:16]<=keycode[15:8];
    	keycode[15:8]<=dataprev;
    	keycode[7:0]<=datacur;
    	dataprev<=datacur;
	end
end
    
assign keycodeout=keycode;
    
endmodule


