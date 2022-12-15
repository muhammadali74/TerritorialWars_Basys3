`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2022 04:28:30 PM
// Design Name: 
// Module Name: clk_div2
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


module clk_div2(
       input clk,
    output clk_d
    );
    parameter div_value=4999999;
    reg clk_d;
    reg [23:0] count;
    initial
      begin
        clk_d=0;
        count=0;
      end
    always @(posedge clk)
        begin
        if (count==div_value)
            count<=0;
        else
            count<=count+1; 
        end
    always @(posedge clk)
        begin
        if (count==div_value)
            clk_d<=~clk_d;
        end    
endmodule
