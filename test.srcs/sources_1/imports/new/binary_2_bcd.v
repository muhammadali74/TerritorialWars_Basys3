`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 01:33:04 PM
// Design Name: 
// Module Name: binary_2_bcd
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


module binary_2_bcd(
    input clk,
    input [9:0] num,
    output reg [3:0] num0,
    output reg [3:0] num1,
    output reg [3:0] num2,
    output reg [3:0] num3       
    );
    reg [9:0] num_interim;

    always @(posedge clk)
        begin
        num_interim = num;
        
        num0=num_interim%10;
        num_interim = num_interim / 10;
        
        num1=num_interim%10;
        num_interim = num_interim / 10;
        
        num2=num_interim%10;
        num_interim = num_interim / 10;
        
        num3=num_interim%10;
        num_interim = num_interim / 10;
        
        end
   
endmodule

