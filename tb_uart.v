`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2026 19:56:49
// Design Name: 
// Module Name: tb_uart
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


`timescale 1ns / 1ps
module tb_uart();
    reg clk, btn;
    reg rx_serial;
    wire tx_serial;
    wire [7:0] leds;
    reg rst;

    top_module uut (.clk(clk),.rst(rst),.btn_send(btn), .rx_pin(rx_serial), .tx_pin(tx_serial), .leds(leds));

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        clk = 0; btn = 0; rx_serial = 1; rst=1;
        #50; rst=0;
        
        // Test TX: Button press
        #20;
        btn = 1; #20; btn = 0;
        
        // Test RX: Simulate 'B' (8'h42 -> 01000010) coming from PC
        #200000; 
        rx_serial = 0; #104170; // Start Bit
        rx_serial = 0; #104170; // Bit 0
        rx_serial = 1; #104170; // Bit 1
        rx_serial = 0; #104170; // Bit 2
        rx_serial = 0; #104170; // Bit 3
        rx_serial = 0; #104170; // Bit 4
        rx_serial = 0; #104170; // Bit 5
        rx_serial = 1; #104170; // Bit 6
        rx_serial = 0; #104170; // Bit 7
        rx_serial = 1; #104170; // Stop Bit
        
        #500000;
        $finish;
    end
endmodule
