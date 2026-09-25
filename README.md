# ECE128-Lab3
ECE 128 Lab 3: 4-bit full adder with BCD-to-seven-segment display implementation on the Basys3 FPGA using Verilog.
# ECE 128 Lab 3 - 4-Bit Full Adder with Seven-Segment Display

## Overview

This project implements a 4-bit full adder and displays the SUM output on the
seven-segment display of a Basys3 FPGA board.

The design includes:

- 1-bit Full Adder
- 4-bit Ripple Carry Adder (RCA)
- 4-bit Carry Look-Ahead Adder (CLA)
- 2-to-1 4-bit Multiplexer
- BCD-to-Seven-Segment Decoder
- Display multiplexing logic
- Basys3 FPGA implementation

Only the 4-bit SUM output is displayed. The carry-out signal is not displayed.

## Repository Structure

```text
ECE128-Lab3/
├── README.md
├── src/
│   ├── FA.v
│   ├── RCA_4bit.v
│   ├── CLA_4bit.v
│   ├── Mux2to1_4bit.v
│   ├── BCD_to_7seg.v
│   └── Lab3_Top.v
├── sim/
│   ├── BCD_to_7seg_tb.v
│   └── Lab3_Top_tb.v
└── constraints/
    └── Basys3.xdc
