`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Reference book: "FPGA Prototyping by Verilog Examples"
//                      "Xilinx Spartan-3 Version"
// Written by: Dr. Pong P. Chu
// Published by: Wiley, 2008
//
// Adapted for Basys 3 by David J. Marion aka FPGA Dude
//
//////////////////////////////////////////////////////////////////////////////////


module ascii_test_1(
    input [6:0] ascii_char,
    input clk,
    input video_on,
    input [9:0] x, y,
    input [9:0] x_loc,y_loc,
    output on,
    output reg [11:0] rgb
    );
    
    // signal declarations
    wire [10:0] rom_addr;           // 11-bit text ROM address
//    wire [6:0] ascii_char;          // 7-bit ASCII character code
    wire [3:0] char_row;            // 4-bit row of ASCII character
    wire [2:0] bit_addr;            // column number of ROM data
    wire [7:0] rom_data;
            // 8-bit row data from text ROM
    wire ascii_bit;     // ROM bit and status signal
    
    // instantiate ASCII ROM
    ascii_rom rom1(.clk(clk), .addr(rom_addr), .data(rom_data));
 
    // ASCII ROM interface
    assign rom_addr = {ascii_char, char_row};   // ROM address is ascii code + row
    assign ascii_bit = rom_data[~bit_addr]; 

//    assign ascii_char1 = 7'h37;
//    assign ascii_char2 = 7'h38;
//    assign ascii_char3 = 7'h39;   // 7-bit ascii code
    assign char_row = y[3:0];               // row number of ascii character rom
    assign bit_addr = x[2:0];               // column number of ascii character rom
    // "on" region in center of screen
    
    assign ascii_bit_on = ((x >= x_loc && x < x_loc+8) && (y >= y_loc && y < y_loc+15)) ? ascii_bit : 1'b0;
//    assign ascii_bit_on_2 = ((x >= 8 && x < 15) && (y >= 0 && y < 15)) ? ascii_bit : 1'b0;
//    assign ascii_bit_on_3 = ((x >= 15 && x < 23) && (y >= 0 && y < 15)) ? ascii_bit : 1'b0;
    assign on=ascii_bit_on;
    // rgb multiplexing circuit
    always @*
        if(~video_on)
            rgb = 12'h000;      // blank
        else
            if(ascii_bit_on)
                rgb = 12'h00F;  // blue letters
            else
                rgb = 12'hFFF;  // white background
   
endmodule