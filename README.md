# UART Design in Verilog

## 📌 Overview
UART (TX/RX) design in Verilog with baud generator (9600 baud @100MHz), FSM-based implementation and simulation verification.

## ⚙️ Features
- UART Transmitter (TX)
- UART Receiver (RX)
- Baud Rate Generator
- FSM-based design
- Simulation verified

## 🧠 Working
- Data is transmitted serially using UART protocol
- Receiver reconstructs data using clock ticks
- Received data is displayed on LEDs

## 🧪 Simulation Result
- Successfully received data: **0x42 ('B')**
- Output verified using waveform

## 📁 File Structure
- `src/` → Verilog source files  
- `tb/` → Testbench  
- `sim/` → Simulation waveform  

## 🛠️ Tools Used
- Verilog HDL
- Vivado

## 🚀 Future Improvements
- Add oversampling in RX
- Add FIFO buffer
- Button debounce
