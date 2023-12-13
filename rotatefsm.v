`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:08:40 AM
// Design Name: 
// Module Name: rotatefsm
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


module rotatefsm(
	input clock,
	input reset,
	input rot, // input from keyboard key
	output reg [2:0] rotation
);

  reg [1:0] current_state, next_state;
 reg [2:0] out;

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

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

   always @(current_state, rot) begin
        case (current_state) 
            S0: begin
                if (rot == 1) begin
                    next_state = S1;
                end else begin
                    next_state = S0;
                end
            end
            S1: begin
                if (rot == 1) begin
                    next_state = S2;
                end else begin
                    next_state = S1;
                end
            end
            S2: begin
                if (rot == 1) begin
                    next_state = S3;
                end else begin
                    next_state = S2;
                end 
            end 
            S3: begin
                if (rot == 1) begin
                    next_state = S0;
                end else begin
                    next_state = S3;
                end
            end
            default: next_state = S0;
        endcase
end

    always @(current_state) begin 
        case (current_state) 
            S0: begin
		 rotation = 0;
        out <= rotation;
	end
S1: begin
		assign rotation = 1;
        out <= rotation;
	end
S2: begin
		assign rotation = 2;
        out <= rotation;
	end
S3: begin
		assign rotation = 0;
        out <= rotation;
	end
            default: out = 0;
        endcase
    end
endmodule

