`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:12:08 AM
// Design Name: 
// Module Name: TopLevelKeyboard
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies:
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TopLevelKeyboard (
    input clock,
    input kclock,
    input kdata,
    output reg [31:0] keycode
);

    // Instantiate PS2Receiver module
    PS2Receiver u_ps2receiver (
        .clock(clock),
        .kclock(kclock),
        .kdata(kdata),
        .keycodeout(keycodeout)
    );

    // Instantiate debouncer module
    reg kclockf, kdataf;
    reg [7:0] datacur, dataprev;
    reg [3:0] cnt;
    reg flag; 
    reg [4:0] cnt0, cnt1;
    wire O0, O1;
    
    debouncer u_debouncer (
        .clock(clock),
        .I0(kclock),
        .I1(kdata),
        .O0(O0),
        .O1(O1)
    );

    always @(negedge kclockf) begin
        case(cnt)
            0: ; // Start bit
            1: datacur[0] <= kdataf;
            2: datacur[1] <= kdataf;
            3: datacur[2] <= kdataf;
            4: datacur[3] <= kdataf;
            5: datacur[4] <= kdataf;
            6: datacur[5] <= kdataf;
            7: datacur[6] <= kdataf;
            8: datacur[7] <= kdataf;
            9: flag <= 1'b1;
            10: flag <= 1'b0;
        endcase
        if (cnt <= 9) cnt <= cnt + 1;
        else if (cnt == 10) cnt <= 0;
    end

    always @(posedge flag) begin
        if (dataprev != datacur) begin
            keycode[31:24] <= keycode[23:16];
            keycode[23:16] <= keycode[15:8];
            keycode[15:8] <= dataprev;
            keycode[7:0] <= datacur;
            dataprev <= datacur;
        end
        else begin
            // Reset keycode when there is no change
            keycode <= 32'h00000000;
        end
    end


endmodule





