`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 04:22:54 PM
// Design Name: 
// Module Name: selection
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


module selection(
    input clk,
    input reset,
    input button1,
    input button2,
    output [1:0] out
    );
    wire A;
    wire B;
    wire DA;
    wire DB;
    assign DA=A|(!B&button1);
    assign DB=B|(!A & !button1 & button2);
    D_FlipFlop Flop1(DA,reset,clk,A);
    D_FlipFlop Flop2(DB,reset,clk,B);
    
    assign out[0]=B;
    assign out[1]=A;
endmodule
