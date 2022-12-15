`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2022 11:14:12 AM
// Design Name: 
// Module Name: bcd_2_hex
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


module bcd_2_hex(
    input clk,
    input [3:0] bcd,
    output reg [6:0] hex
    );
    
    always @(posedge clk)
        begin
        if (bcd == 4'b0000)
            hex = 7'h30;
        else if (bcd == 4'b0001)
            hex = 7'h31;
        else if (bcd == 4'b0010)
            hex = 7'h32;
        else if (bcd == 4'b0011)
            hex = 7'h33;
        else if (bcd == 4'b0100)
            hex = 7'h34;
        else if (bcd == 4'b0101)
            hex = 7'h35;
        else if (bcd == 4'b0110)
            hex = 7'h36;
        else if (bcd == 4'b0111)
            hex = 7'h37;
        else if (bcd == 4'b1000)
            hex = 7'h38;
        else if (bcd == 4'b1001)
            hex = 7'h39;
        
        end
    
endmodule
