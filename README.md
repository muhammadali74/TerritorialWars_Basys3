# TerritorialWars_Basys3

## Overview
- This project mainly uses Combinational Logic, Sequential Logic, and Digital Design concepts taught in the Course Digital Logic Design (EE/CS - 172/130) offered in fall 2022.
- The program is an interactive two-layer game based on Diligent Basys3 FPGA made using Verliog as the Hardware Descriptive Language.
- It includes several synchronous state-machines to structure the basic flow of the game and for implementing the game logic.
- The game takes input using two non-PMOD joysticks and displays VGA output on a VGA supporting monitor at a resolution of 640*480 (which is the native resolution of a non-overclocked Basys3 FPGA)

## Resource Consumption
![alt text](https://github.com/muhammadali74/TerritorialWars_Basys3/blob/main/resource.jpg?raw=true)
The figure shows the on-board resouce consumption of the program.

## References:
Some parts of the code are borrowed from the following

- [Diligent Basys3 Official Repositories](https://github.com/Digilent)
- [Interfacing Joystick using XADC](https://github.com/muhammadali74/Basys3-Joystick-Interfacing)
