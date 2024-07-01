# Nexys A7 Counter with LEDs and Buttons

## Overview

This project implements a simple up/down counter on a Digilent Nexys A7 FPGA board. The current value of the counter is displayed on the LEDs, and the counter can be incremented or decremented using two push buttons on the board.

## Features

- **Counter Display**: The 8-bit counter value is displayed on the onboard LEDs parameterized by B.
- **Increment Button**: Pressing the "Add" button (BTNU) increments the counter.
- **Decrement Button**: Pressing the "Subtract" button (BTND) decrements the counter.
- **Overflow Protection**: Prevents exceeding max or passing minimum

## Requirements

- **Hardware**: Digilent Nexys A7 FPGA board.
- **Software**: Xilinx Vivado Design Suite.

