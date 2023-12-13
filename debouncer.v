`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:08:31 AM
// Design Name: 
// Module Name: debouncer
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

module debouncer(
    input clock,
    input I0,
    input I1,
    output reg O0,
    output reg O1
);

    reg [4:0] cnt0, cnt1;
    reg Iv0 = 0, Iv1 = 0;

    always @(posedge(clock)) begin
        if (I0 == Iv0) begin
            if (cnt0 == 19) O0 <= I0;
            else cnt0 <= cnt0 + 1;
        end
        else begin
            cnt0 <= 5'b00000;
            Iv0 <= I0;
        end

        if (I1 == Iv1) begin
            if (cnt1 == 19) O1 <= I1;
            else cnt1 <= cnt1 + 1;
        end
        else begin
            cnt1 <= 5'b00000;
            Iv1 <= I1;
        end
    end

endmodule

