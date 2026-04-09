`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 19:52:18
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk, tick, start,rst,
    input [7:0] data,
    output reg tx, ready
    );
    parameter IDLE=0, START=1, DATA=2, STOP=3;
    reg [1:0] state = IDLE;
    reg [2:0] bit_idx = 0;

    always @(posedge clk) begin
      if (rst) begin
        state <= IDLE;
        tx <= 1;
        ready <= 1;
        bit_idx <= 0;
    end
    else begin
        case(state)
            IDLE: begin
                tx <= 1; ready <= 1;
                if(start) state <= START;
            end
            START: if(tick) begin
                tx <= 0; ready <= 0;
                state <= DATA; bit_idx <= 0;
            end
            DATA: if(tick) begin
                tx <= data[bit_idx];
                if(bit_idx == 7) state <= STOP;
                else bit_idx <= bit_idx + 1;
            end
            STOP: if(tick) begin
                tx <= 1; state <= IDLE;
            end
        endcase
    end
    end
endmodule
