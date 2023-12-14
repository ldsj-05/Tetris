`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 07:24:22 AM
// Design Name: 
// Module Name: TopLevelModule_tb
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




module TopLevelKeyboard_tb;

    reg clock;
    reg kclock;
    reg kdata;
    wire [31:0] keycodeout;

    // Instantiate the TopKeyboard module
    TopLevelKeyboard T (
        .clock(clock),
        .kclock(kclock),
        .kdata(kdata),
        .keycodeout(keycodeout)
    );

    // Provide a clock signal
    always begin
        #5 clock = ~clock;
    end

    // Initial block for simulation setup
    initial begin
        // Initialize signals
        clock = 0;
        kclock = 0;
        kdata = 0;

        // Add stimulus
        #10 kclock = 1;
        #10 kdata = 1;
        #10 kdata = 0;
        #10 kdata = 1;


        // Stop the simulation after some time
        #100 $stop;
    end

    // Display signals in the simulation
    always @(posedge clock) begin
        $display("Time=%0t kclock=%b kdata=%b keycodeout=%h", $time, kclock, kdata, keycodeout);
    end

endmodule


