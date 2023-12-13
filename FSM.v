`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:05:54 AM
// Design Name: 
// Module Name: FSM
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


module FSM(
    output out,
    output reg [3:0] next_xpos,
    output reg [3:0] next_ypos,
    output reg [3:0] xpos_int, 
    output reg [3:0] ypos_int, 
    output reg rotate_flag,
    input clock,
    input reset,
    input [29:0] scancode
);

    reg [3:0] current_state, next_state;
    reg [3:0] xpos, ypos;
    reg [3:0] regnext_xpos, regnext_ypos;
    reg rotate_con; 

    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;
    parameter S9 = 4'b1001;
    parameter S10 = 4'b1010;
    parameter S11 = 4'b1011;

    initial begin
        current_state = S0;
    end

    always @(posedge clock, posedge reset) begin
        if (reset) begin
            current_state <= S0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(current_state, scancode) begin
        case (current_state) 
        
    S0: begin 						//Stop
                if (scancode == 29'h1B) begin
                    next_state = S1;
                end else begin
                    next_state = S0;
                end
            end
        
    S1: begin 						//Waiting for Input
                if (scancode == 29'h00) begin
                    next_state = S2;
                end else if (scancode == 29'h23) begin
                    next_state = S6;
                end else if (scancode == 29'h2B) begin
                    next_state = S4;
                end else if (scancode == 29'h3B) begin
                    next_state = S8;
                end else begin
                    next_state = S1;
                end
            end
        
    S2: begin						//Check Down
                if (xpos - 1 == 1) begin
                    next_state = S0;
                end else begin
                    next_state = S3;
                end 
            end 
           
    S3: begin						//Go Down
                next_ypos = ypos - 1;
                next_xpos = xpos;
                next_state = S1;
            end

    S4: begin						//Check Right
                if (xpos + 1 == 1) begin
                    next_state = S0;
                end else begin
                    next_state = S5;
                end 
            end 

    S5: begin						//Go Right
                next_xpos = xpos + 1;
                next_ypos = ypos;
            end

    S6: begin						//Check Left
                if (xpos - 1 == 1) begin
                    next_state = S0;
                end else begin
                    next_state = S7;
                end 
            end 

    S7: begin						//Go Left
                next_xpos = xpos - 1;
                next_ypos = ypos;
            end

    S8: begin						//Check Rotate
                if (scancode == 29'h3C) begin // right arrow key for clockwise rotation
                    rotate_con = 1;
                end else begin
                    rotate_con = 0;
                end

                next_state = S9;
            end

    S9: begin						//Go Rotate
                if (rotate_con == 1) begin
                  

                    // Swap x and y positions
                    regnext_xpos = ypos;
                    regnext_ypos = xpos;

                    // You may need to adjust the positions based on the rotation center and block size
                   

                    next_state = S1; // Transition to the next state after rotation
                end else begin
                    // If rotate_con is not asserted, maintain the current state
                    next_state = S9;
                end
            end

    S10: begin						//Check Stop
                next_xpos = xpos;
                next_ypos = ypos;
            end

    S11: begin						//Delete Row
                next_xpos = xpos;
                next_ypos = ypos;
            end
default: next_state = S0;
        endcase
    end

    // Output assignments
always @(posedge clock) begin
    next_xpos <= regnext_xpos;
    next_ypos <= regnext_ypos;
    xpos_int <= xpos;
    ypos_int <= ypos;
    rotate_flag <= rotate_con;
end

endmodule

