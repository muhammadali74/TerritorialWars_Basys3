`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 11:07:00 AM
// Design Name: 
// Module Name: pixel_generation_two
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



module pixel_generation_two(
    input clk,                              // 100MHz from Basys 3
    input reset,                            // btnC
    input video_on,
    input up,
    input down,
    input right,
    input left,                         // from VGA controller
    input [9:0] x, y,                       // from VGA controller
    output reg [11:0] rgb                   // to DAC, to VGA controller
    );
    
    parameter X_MAX = 639;                  // right border of display area
    parameter Y_MAX = 479;                  // bottom border of display area
    parameter SQ_RGB = 12'h0FF;             // red & green = yellow for square
    parameter BG_RGB = 12'hF00;             // blue background
    parameter SQUARE_SIZE = 23;             // width of square sides in pixels
//    parameter SQUARE_VELOCITY_POS = 2;      // set position change value for positive direction
//    parameter SQUARE_VELOCITY_NEG = -2;     // set position change value for negative direction  
    
    // create a 60Hz refresh tick at the start of vsync 
    wire refresh_tick;
    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
    
    // square boundaries and position
    wire [9:0] sq_x_l, sq_x_r;              // square left and right boundary
    wire [9:0] sq_y_t, sq_y_b;              // square top and bottom boundary
    
    reg [9:0] sq_x_reg, sq_y_reg;           // regs to track left, top position
    reg [9:0] sq_x_next, sq_y_next;        // buffer wires
    wire [9:0] sq_top, sq_bottom;

parameter x_delta=1;
parameter y_delta=1;     // track square speed
//reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
    
    // register control
    always @(posedge clk or posedge reset)
        if(reset) begin
            sq_x_reg <= 132;
            sq_y_reg <= 423;
//            x_delta_reg <= 10'h002;
//            y_delta_reg <= 10'h002;
        end
        else begin
            sq_x_reg <= sq_x_next;
            sq_y_reg <= sq_y_next;
//            x_delta_reg <= x_delta_next;
//            y_delta_reg <= y_delta_next;
        end
    
    // square boundaries
    assign sq_x_l = sq_x_reg;                   // left boundary
    assign sq_y_t = sq_y_reg;                   // top boundary
    assign sq_x_r = sq_x_l + SQUARE_SIZE - 1;   // right boundary
    assign sq_y_b = sq_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
    // square status signal
    wire sq_on;
    assign sq_on = (sq_x_l <= x) && (x <= sq_x_r) && (sq_y_t <= y) && (y <= sq_y_b);
                   
    // new square position
    always@(posedge clk)
    begin
//    sq_y_next=sq_y_reg;
    if (refresh_tick)
        if (up)
            sq_y_next = sq_y_reg - y_delta;
         else if (down)
            sq_y_next = sq_y_reg + y_delta;
         else if (right)
            sq_x_next = sq_x_reg + x_delta;         
         else if(left)
            sq_x_next = sq_x_reg - x_delta;
         
         else
            sq_y_next = sq_y_reg;
//        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
    
      end
//    else
//        sq_y_next = (up) ? (sq_y_reg + y_delta) : sq_y_reg;
    // new square velocity 
//    always @* begin
//        x_delta_next = x_delta_reg;
//        y_delta_next = y_delta_reg;
//        if(sq_y_t < 1)                              // collide with top display edge
//            y_delta_next = SQUARE_VELOCITY_POS;     // change y direction(move down)
//        else if(sq_y_b > Y_MAX)                     // collide with bottom display edge
//            y_delta_next = SQUARE_VELOCITY_NEG;     // change y direction(move up)
//        else if(sq_x_l < 1)                         // collide with left display edge
//            x_delta_next = SQUARE_VELOCITY_POS;     // change x direction(move right)
//        else if(sq_x_r > X_MAX)                     // collide with right display edge
//            x_delta_next = SQUARE_VELOCITY_NEG;     // change x direction(move left)
//    end
    
    // RGB control
    always @*
        if(~video_on)
            rgb = 12'h000;          // black(no value) outside display area
        else
            if(sq_on)
                rgb = SQ_RGB;       // yellow square
            else
                rgb = BG_RGB;       // blue background
    
endmodule



module pixel_generation_three(
    input clk,                              // 100MHz from Basys 3
    input reset1,
    input reset2,                            // btnC
    input video_on,
    input up1,
    input down1,
    input right1,
    input left1,
    input up2,
    input down2,
    input right2,
    input left2,                         // from VGA controller
    input [9:0] x, y,                       // from VGA controller
    output reg [11:0] rgb                   // to DAC, to VGA controller
    );
    
    parameter X_MAX = 639;                  // right border of display area
    parameter Y_MAX = 479;                  // bottom border of display area
    parameter SQ1_RGB = 12'h00F;
    parameter SQ2_RGB = 12'hF00;             // red & green = yellow for square
    parameter BG_RGB = 12'hFFF;       
    parameter BLACK= 12'h000;      // blue background
    parameter SQUARE_SIZE = 23;             // width of square sides in pixels
//    parameter SQUARE_VELOCITY_POS = 2;      // set position change value for positive direction
//    parameter SQUARE_VELOCITY_NEG = -2;     // set position change value for negative direction  
    
    // create a 60Hz refresh tick at the start of vsync 
    wire refresh_tick;
    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
    
    // square boundaries and position
    wire [9:0] sq1_x_l, sq1_x_r;              // square left and right boundary
    wire [9:0] sq1_y_t, sq1_y_b;              // square top and bottom boundary
    
    reg [9:0] sq1_x_reg, sq1_y_reg;           // regs to track left, top position
    reg [9:0] sq1_x_next, sq1_y_next;        // buffer wires
    wire [9:0] sq1_top, sq1_bottom;
    
    wire [9:0] sq2_x_l, sq2_x_r;              // square left and right boundary
    wire [9:0] sq2_y_t, sq2_y_b;              // square top and bottom boundary
    
    reg [9:0] sq2_x_reg, sq2_y_reg;           // regs to track left, top position
    reg [9:0] sq2_x_next, sq2_y_next;        // buffer wires
    wire [9:0] sq2_top, sq2_bottom;

parameter x_delta=1;
parameter y_delta=1;     // track square speed
//reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
    
    // register control
    always @(posedge clk or posedge reset2)
        if(reset2) begin
            sq1_x_reg <= 523;
            sq1_y_reg <= 32;
            sq2_x_reg <= 132;
            sq2_y_reg <= 423;
//            x_delta_reg <= 10'h002;
//            y_delta_reg <= 10'h002;
        end
        else begin
            sq1_x_reg <= sq1_x_next;
            sq1_y_reg <= sq1_y_next;
            sq2_x_reg <= sq2_x_next;
            sq2_y_reg <= sq2_y_next;
            
//            x_delta_reg <= x_delta_next;
//            y_delta_reg <= y_delta_next;
        end
    
    // square boundaries
    assign sq1_x_l = sq1_x_reg;                   // left boundary
    assign sq1_y_t = sq1_y_reg;                   // top boundary
    assign sq1_x_r = sq1_x_l + SQUARE_SIZE - 1;   // right boundary
    assign sq1_y_b = sq1_y_t + SQUARE_SIZE - 1;
    
    assign sq2_x_l = sq2_x_reg;                   // left boundary
    assign sq2_y_t = sq2_y_reg;                   // top boundary
    assign sq2_x_r = sq2_x_l + SQUARE_SIZE - 1;   // right boundary
    assign sq2_y_b = sq2_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
    // square status signal
    wire sq1_on;
    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
    wire sq2_on;
    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
    wire black_on;
    assign black_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  

                   
    // new square position
    always@(posedge clk)
    begin
//    sq_y_next=sq_y_reg;
    if (refresh_tick)
        if (up1)
            sq1_y_next = sq1_y_reg - y_delta;
         else if (down1)
            sq1_y_next = sq1_y_reg + y_delta;
         else if (right1)
            sq1_x_next = sq1_x_reg + x_delta;         
         else if(left1)
            sq1_x_next = sq1_x_reg - x_delta;
         
         else
            sq1_y_next = sq1_y_reg;
//        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
      if (refresh_tick)  
        if (up2)
            sq2_y_next = sq2_y_reg - y_delta;
        else if (down2)
            sq2_y_next = sq2_y_reg + y_delta;
        else if (right2)
            sq2_x_next = sq2_x_reg + x_delta;         
         else if(left2)
            sq2_x_next = sq2_x_reg - x_delta;
         
         else
            sq2_y_next = sq2_y_reg;
      end
//    else
//        sq_y_next = (up) ? (sq_y_reg + y_delta) : sq_y_reg;
    // new square velocity 
//    always @* begin
//        x_delta_next = x_delta_reg;
//        y_delta_next = y_delta_reg;
//        if(sq_y_t < 1)                              // collide with top display edge
//            y_delta_next = SQUARE_VELOCITY_POS;     // change y direction(move down)
//        else if(sq_y_b > Y_MAX)                     // collide with bottom display edge
//            y_delta_next = SQUARE_VELOCITY_NEG;     // change y direction(move up)
//        else if(sq_x_l < 1)                         // collide with left display edge
//            x_delta_next = SQUARE_VELOCITY_POS;     // change x direction(move right)
//        else if(sq_x_r > X_MAX)                     // collide with right display edge
//            x_delta_next = SQUARE_VELOCITY_NEG;     // change x direction(move left)
//    end
    
    // RGB control
    always @*
        if(~video_on)
            rgb = 12'h000;          // black(no value) outside display area
        else
            if(sq1_on)
                rgb = SQ1_RGB;       // yellow square
            else if(sq2_on)
                rgb = SQ2_RGB;
            else if(black_on)
                rgb = BLACK;
            else
                rgb= BG_RGB;       // blue background
    
endmodule

