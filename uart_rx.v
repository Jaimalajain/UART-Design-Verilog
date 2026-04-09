`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 19:54:35
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input clk, tick, rx,rst,
    output reg [7:0] data,
    output reg rx_done
    );
    parameter IDLE=0, START=1, DATA=2, STOP=3;
    reg [1:0] state = IDLE;
    reg [2:0] bit_idx = 0;
    reg [7:0] temp_data;

    
    always @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
        bit_idx <= 0;
        rx_done <= 0;
        temp_data <= 0;
    end
    else begin
        rx_done <= 0;
        case(state)
            IDLE: begin
                bit_idx <= 0;
                if(rx == 0) state <= START;
            end

            START: if(tick) begin
                if(rx == 0) state <= DATA;
                else state <= IDLE;
            end

            DATA: if(tick) begin
                temp_data[bit_idx] <= rx;
                if(bit_idx == 7) state <= STOP;
                else bit_idx <= bit_idx + 1;
            end

            STOP: if(tick) begin
                if(rx == 1) begin
                    data <= temp_data;
                    rx_done <= 1;
                end
                state <= IDLE;
            end
        endcase
    end
end
endmodule
