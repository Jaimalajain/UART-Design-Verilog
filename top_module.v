`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 19:55:33
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,rst,         // 100MHz clock
    input btn_send,     // Button to trigger TX
    input rx_pin,       // Physical RX Pin
    output tx_pin,      // Physical TX Pin
    output [7:0] leds   // LEDs to show received data
    );

    wire tick, tx_ready, rx_done;
    wire [7:0] rx_data;

    baud_gen bg (.clk(clk),.rst(rst), .tick(tick));

    uart_tx tx_inst (
        .clk(clk),.rst(rst), .tick(tick), .start(btn_send), 
        .data(8'h41),.tx(tx_pin), .ready(tx_ready) // Sends 'A'
    );

    uart_rx rx_inst (
        .clk(clk),.rst(rst), .tick(tick), .rx(rx_pin), 
        .data(rx_data), .rx_done(rx_done)
    );

    assign leds = rx_data; // Jo receive hoga wo LEDs par dikhega

endmodule
