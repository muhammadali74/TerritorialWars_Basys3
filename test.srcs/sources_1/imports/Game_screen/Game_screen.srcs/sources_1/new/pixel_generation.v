`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2022 01:34:26 AM
// Design Name: 
// Module Name: pixel_generation
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



module pixel_generation(
    input clk,
    input reset,
    input video_on,
    input [9:0] x, y,
    input up,//for up movement 
//    input down,//for down movement
    output reg [11:0] rgb
    );

    // RGB Color Values
    parameter RED    = 12'h00F;
//    parameter GREEN  = 12'h0F0;
    parameter BLUE   = 12'hF00;
//    parameter YELLOW = 12'h0FF;     // RED and GREEN
//    parameter AQUA   = 12'hFF0;     // GREEN and BLUE
//    parameter VIOLET = 12'hF0F;     // RED and BLUE
    parameter WHITE  = 12'hFFF;     // all ON
    parameter BLACK  = 12'h000;     // all OFF
//    parameter GRAY   = 12'hAAA;     // some of each color
    parameter red_height=23;
    parameter red_width=23;
    
    parameter left_bound=132;
    parameter right_bound=155;
    parameter block_velocity=23;
    // Pixel Location Status Signal
    
    
//wire u_white_on;
//wire u_black_on;
//wire u_red_on;
//wire u_blue_on;
wire pad_on;

wire [9:0] reb_block_bottom,red_block_top;
reg [9:0] red_block_reg=323;
reg [9:0] red_block_next;

wire wall_on;
    // Set RGB output value based on status signals
wire refresh_tick;
assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0; // start of vsync(vertical retrace)
//paddle
assign red_block_top = red_block_reg;                             // paddle top position
assign red_block_bottom = red_block_top + red_height - 1;              // paddle bottom position
assign pad_on = (left_bound <= x) && (x <= right_bound) &&(red_block_top <= y) && (y <= red_block_bottom);

assign wall_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  

always @* begin
    red_block_next = red_block_reg;     // no move
        
    if(refresh_tick)
        if(up)
           red_block_next = red_block_reg + block_velocity;
    end
//always @*
//begin
//    if (up)
//        if (~down)
//        begin
//             u_red_on    <= ((x >= 455) && (x < 546)  &&  (y >= 0) && (y < 412));
//             u_blue_on   <= ((x >= 546) && (x < 640)  &&  (y >= 0) && (y < 412));
//        end
//    else 
//        if (down)
//            if (~up)
//                begin
//                u_red_on    <= ((x >= 455) && (x < 546)  &&  (y >= 0) && (y < 412));
//                u_blue_on   <= ((x >= 546) && (x < 640)  &&  (y >= 0) && (y < 412));
//                end
// end

    always @*
        if(~video_on)
            rgb = BLACK;
        else
            if(pad_on)
                rgb = RED;
            else if(wall_on)
                rgb=BLACK;
            else
                rgb=WHITE;
                


       
endmodule