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
//    input clk,                              // 100MHz from Basys 3
//    input reset1,
//    input reset2,                            // btnC
//    input video_on,
//    input up1,
//    input down1,
//    input right1,
//    input left1,
//    input up2,
//    input down2,
//    input right2,
//    input left2,                         // from VGA controller
//    input [9:0] x, y,                       // from VGA controller
//    output reg [11:0] rgb                   // to DAC, to VGA controller
//    );
    
//    parameter X_MAX = 639;                  // right border of display area
//    parameter Y_MAX = 479;                  // bottom border of display area
//    parameter SQ1_RGB = 12'h00F;
//    parameter SQ2_RGB = 12'hF00;             // red & green = yellow for square
//    parameter BG_RGB = 12'hFFF;       
//    parameter BLACK= 12'h000;      // blue background
//    parameter SQUARE_SIZE = 23;             // width of square sides in pixels
////    parameter SQUARE_VELOCITY_POS = 2;      // set position change value for positive direction
////    parameter SQUARE_VELOCITY_NEG = -2;     // set position change value for negative direction  
    
//    // create a 60Hz refresh tick at the start of vsync 
//    wire refresh_tick;
//    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
    
//    // square boundaries and position
//    wire [9:0] sq1_x_l, sq1_x_r;              // square left and right boundary
//    wire [9:0] sq1_y_t, sq1_y_b;              // square top and bottom boundary
    
//    reg [9:0] sq1_x_reg, sq1_y_reg;           // regs to track left, top position
//    reg [9:0] sq1_x_next, sq1_y_next;        // buffer wires
//    wire [9:0] sq1_top, sq1_bottom;
    
//    wire [9:0] sq2_x_l, sq2_x_r;              // square left and right boundary
//    wire [9:0] sq2_y_t, sq2_y_b;              // square top and bottom boundary
    
//    reg [9:0] sq2_x_reg, sq2_y_reg;           // regs to track left, top position
//    reg [9:0] sq2_x_next, sq2_y_next;        // buffer wires
//    wire [9:0] sq2_top, sq2_bottom;

//parameter x_delta=1;
//parameter y_delta=1;     // track square speed
////reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
    
//    // register control
//    always @(posedge clk or posedge reset2)
//        if(reset2) begin
//            sq1_x_reg <= 523;
//            sq1_y_reg <= 32;
//            sq2_x_reg <= 132;
//            sq2_y_reg <= 423;
////            x_delta_reg <= 10'h002;
////            y_delta_reg <= 10'h002;
//        end
//        else begin
//            sq1_x_reg <= sq1_x_next;
//            sq1_y_reg <= sq1_y_next;
//            sq2_x_reg <= sq2_x_next;
//            sq2_y_reg <= sq2_y_next;
            
////            x_delta_reg <= x_delta_next;
////            y_delta_reg <= y_delta_next;
//        end
    
//    // square boundaries
//    assign sq1_x_l = sq1_x_reg;                   // left boundary
//    assign sq1_y_t = sq1_y_reg;                   // top boundary
//    assign sq1_x_r = sq1_x_l + SQUARE_SIZE - 1;   // right boundary
//    assign sq1_y_b = sq1_y_t + SQUARE_SIZE - 1;
    
//    assign sq2_x_l = sq2_x_reg;                   // left boundary
//    assign sq2_y_t = sq2_y_reg;                   // top boundary
//    assign sq2_x_r = sq2_x_l + SQUARE_SIZE - 1;   // right boundary
//    assign sq2_y_b = sq2_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
//    // square status signal
//    wire sq1_on;
//    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
//    wire sq2_on;
//    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
//    wire black_on;
//    assign black_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  

                   
//    // new square position
//    always@(posedge clk)
//    begin
////    sq_y_next=sq_y_reg;
//    if (refresh_tick)
//        if (up1)
//            sq1_y_next = sq1_y_reg - y_delta;
//         else if (down1)
//            sq1_y_next = sq1_y_reg + y_delta;
//         else if (right1)
//            sq1_x_next = sq1_x_reg + x_delta;         
//         else if(left1)
//            sq1_x_next = sq1_x_reg - x_delta;
         
//         else
//            sq1_y_next = sq1_y_reg;
////        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
//      if (refresh_tick)  
//        if (up2)
//            sq2_y_next = sq2_y_reg - y_delta;
//        else if (down2)
//            sq2_y_next = sq2_y_reg + y_delta;
//        else if (right2)
//            sq2_x_next = sq2_x_reg + x_delta;         
//         else if(left2)
//            sq2_x_next = sq2_x_reg - x_delta;
         
//         else
//            sq2_y_next = sq2_y_reg;
//      end
////    else
////        sq_y_next = (up) ? (sq_y_reg + y_delta) : sq_y_reg;
//    // new square velocity 
////    always @* begin
////        x_delta_next = x_delta_reg;
////        y_delta_next = y_delta_reg;
////        if(sq_y_t < 1)                              // collide with top display edge
////            y_delta_next = SQUARE_VELOCITY_POS;     // change y direction(move down)
////        else if(sq_y_b > Y_MAX)                     // collide with bottom display edge
////            y_delta_next = SQUARE_VELOCITY_NEG;     // change y direction(move up)
////        else if(sq_x_l < 1)                         // collide with left display edge
////            x_delta_next = SQUARE_VELOCITY_POS;     // change x direction(move right)
////        else if(sq_x_r > X_MAX)                     // collide with right display edge
////            x_delta_next = SQUARE_VELOCITY_NEG;     // change x direction(move left)
////    end
    
//    // RGB control
//    always @*
//        if(~video_on)
//            rgb = 12'h000;          // black(no value) outside display area
//        else
//            if(sq1_on)
//                rgb = SQ1_RGB;       // yellow square
//            else if(sq2_on)
//                rgb = SQ2_RGB;
//            else if(black_on)
//                rgb = BLACK;
//            else
//                rgb= BG_RGB;       // blue background
    
//endmodule
input clk,
//    input clk_25,                              // 100MHz from Basys 3
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
    parameter BLACK= 12'h000;  
    parameter trail1 = 12'h009;
    parameter trail2 = 12'h900;    // blue background
    parameter SQUARE_SIZE = 18;
    parameter x_delta=1;
    parameter y_delta=1;             // width of square sides in pixels
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
//    wire [9:0] sq1_top, sq1_bottom;
    
    wire [9:0] sq2_x_l, sq2_x_r;              // square left and right boundary
    wire [9:0] sq2_y_t, sq2_y_b;              // square top and bottom boundary
    
    reg [9:0] sq2_x_reg, sq2_y_reg;           // regs to track left, top position
    reg [9:0] sq2_x_next, sq2_y_next;        // buffer wires
//    wire [9:0] sq2_top, sq2_bottom;

parameter gr_x_0_0 = 95;
parameter gr_y_0_0 = 15;
reg [1:0] gr0_0_on = 0;

parameter gr_x_1_0 = 113;
parameter gr_y_1_0 = 15;
reg [1:0] gr1_0_on = 0;

parameter gr_x_2_0 = 131;
parameter gr_y_2_0 = 15;
reg [1:0] gr2_0_on = 0;

parameter gr_x_3_0 = 149;
parameter gr_y_3_0 = 15;
reg [1:0] gr3_0_on = 0;

parameter gr_x_4_0 = 167;
parameter gr_y_4_0 = 15;
reg [1:0] gr4_0_on = 0;

parameter gr_x_5_0 = 185;
parameter gr_y_5_0 = 15;
reg [1:0] gr5_0_on = 0;

parameter gr_x_6_0 = 203;
parameter gr_y_6_0 = 15;
reg [1:0] gr6_0_on = 0;

parameter gr_x_7_0 = 221;
parameter gr_y_7_0 = 15;
reg [1:0] gr7_0_on = 0;

parameter gr_x_8_0 = 239;
parameter gr_y_8_0 = 15;
reg [1:0] gr8_0_on = 0;

parameter gr_x_9_0 = 257;
parameter gr_y_9_0 = 15;
reg [1:0] gr9_0_on = 0;

parameter gr_x_10_0 = 275;
parameter gr_y_10_0 = 15;
reg [1:0] gr10_0_on = 0;

parameter gr_x_11_0 = 293;
parameter gr_y_11_0 = 15;
reg [1:0] gr11_0_on = 0;

parameter gr_x_12_0 = 311;
parameter gr_y_12_0 = 15;
reg [1:0] gr12_0_on = 0;

parameter gr_x_13_0 = 329;
parameter gr_y_13_0 = 15;
reg [1:0] gr13_0_on = 0;

parameter gr_x_14_0 = 347;
parameter gr_y_14_0 = 15;
reg [1:0] gr14_0_on = 0;

parameter gr_x_15_0 = 365;
parameter gr_y_15_0 = 15;
reg [1:0] gr15_0_on = 0;

parameter gr_x_16_0 = 383;
parameter gr_y_16_0 = 15;
reg [1:0] gr16_0_on = 0;

parameter gr_x_17_0 = 401;
parameter gr_y_17_0 = 15;
reg [1:0] gr17_0_on = 0;

parameter gr_x_18_0 = 419;
parameter gr_y_18_0 = 15;
reg [1:0] gr18_0_on = 0;

parameter gr_x_19_0 = 437;
parameter gr_y_19_0 = 15;
reg [1:0] gr19_0_on = 0;

parameter gr_x_20_0 = 455;
parameter gr_y_20_0 = 15;
reg [1:0] gr20_0_on = 0;

parameter gr_x_21_0 = 473;
parameter gr_y_21_0 = 15;
reg [1:0] gr21_0_on = 0;

parameter gr_x_22_0 = 491;
parameter gr_y_22_0 = 15;
reg [1:0] gr22_0_on = 0;

parameter gr_x_23_0 = 509;
parameter gr_y_23_0 = 15;
reg [1:0] gr23_0_on = 0;

parameter gr_x_24_0 = 527;
parameter gr_y_24_0 = 15;
reg [1:0] gr24_0_on = 0;
//    assign 
    
//    wire [9:0] 

     // track square speed
//reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
    //Player one block
    // square boundaries
    assign sq1_x_l = sq1_x_reg;                   // left boundary
    assign sq1_y_t = sq1_y_reg;                   // top boundary
    assign sq1_x_r = sq1_x_l + SQUARE_SIZE;   // right boundary
    assign sq1_y_b = sq1_y_t + SQUARE_SIZE;
    
    assign sq2_x_l = sq2_x_reg;                   // left boundary
    assign sq2_y_t = sq2_y_reg;                   // top boundary
    assign sq2_x_r = sq2_x_l + SQUARE_SIZE;   // right boundary
    assign sq2_y_b = sq2_y_t + SQUARE_SIZE;   // bottom boundary
    
    // square status signal
    wire sq1_on;
    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
    wire sq2_on;
    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
    wire tr0_0_on;
    assign tr0_0_on = (gr_x_0_0 <= x) && (x <= gr_x_0_0+18) && (gr_y_0_0 <= y) && (y <= gr_y_0_0+18);
    
wire tr1_0_on;
assign tr1_0_on = (gr_x_1_0 <= x) && (x <= gr_x_1_0+18) && (gr_y_1_0 <= y) && (y <= gr_y_1_0+18);


wire tr2_0_on;
assign tr2_0_on = (gr_x_2_0 <= x) && (x <= gr_x_2_0+18) && (gr_y_2_0 <= y) && (y <= gr_y_2_0+18);


wire tr3_0_on;
assign tr3_0_on = (gr_x_3_0 <= x) && (x <= gr_x_3_0+18) && (gr_y_3_0 <= y) && (y <= gr_y_3_0+18);


wire tr4_0_on;
assign tr4_0_on = (gr_x_4_0 <= x) && (x <= gr_x_4_0+18) && (gr_y_4_0 <= y) && (y <= gr_y_4_0+18);


wire tr5_0_on;
assign tr5_0_on = (gr_x_5_0 <= x) && (x <= gr_x_5_0+18) && (gr_y_5_0 <= y) && (y <= gr_y_5_0+18);


wire tr6_0_on;
assign tr6_0_on = (gr_x_6_0 <= x) && (x <= gr_x_6_0+18) && (gr_y_6_0 <= y) && (y <= gr_y_6_0+18);


wire tr7_0_on;
assign tr7_0_on = (gr_x_7_0 <= x) && (x <= gr_x_7_0+18) && (gr_y_7_0 <= y) && (y <= gr_y_7_0+18);


wire tr8_0_on;
assign tr8_0_on = (gr_x_8_0 <= x) && (x <= gr_x_8_0+18) && (gr_y_8_0 <= y) && (y <= gr_y_8_0+18);


wire tr9_0_on;
assign tr9_0_on = (gr_x_9_0 <= x) && (x <= gr_x_9_0+18) && (gr_y_9_0 <= y) && (y <= gr_y_9_0+18);


wire tr10_0_on;
assign tr10_0_on = (gr_x_10_0 <= x) && (x <= gr_x_10_0+18) && (gr_y_10_0 <= y) && (y <= gr_y_10_0+18);


wire tr11_0_on;
assign tr11_0_on = (gr_x_11_0 <= x) && (x <= gr_x_11_0+18) && (gr_y_11_0 <= y) && (y <= gr_y_11_0+18);


wire tr12_0_on;
assign tr12_0_on = (gr_x_12_0 <= x) && (x <= gr_x_12_0+18) && (gr_y_12_0 <= y) && (y <= gr_y_12_0+18);


wire tr13_0_on;
assign tr13_0_on = (gr_x_13_0 <= x) && (x <= gr_x_13_0+18) && (gr_y_13_0 <= y) && (y <= gr_y_13_0+18);


wire tr14_0_on;
assign tr14_0_on = (gr_x_14_0 <= x) && (x <= gr_x_14_0+18) && (gr_y_14_0 <= y) && (y <= gr_y_14_0+18);


wire tr15_0_on;
assign tr15_0_on = (gr_x_15_0 <= x) && (x <= gr_x_15_0+18) && (gr_y_15_0 <= y) && (y <= gr_y_15_0+18);


wire tr16_0_on;
assign tr16_0_on = (gr_x_16_0 <= x) && (x <= gr_x_16_0+18) && (gr_y_16_0 <= y) && (y <= gr_y_16_0+18);


wire tr17_0_on;
assign tr17_0_on = (gr_x_17_0 <= x) && (x <= gr_x_17_0+18) && (gr_y_17_0 <= y) && (y <= gr_y_17_0+18);


wire tr18_0_on;
assign tr18_0_on = (gr_x_18_0 <= x) && (x <= gr_x_18_0+18) && (gr_y_18_0 <= y) && (y <= gr_y_18_0+18);


wire tr19_0_on;
assign tr19_0_on = (gr_x_19_0 <= x) && (x <= gr_x_19_0+18) && (gr_y_19_0 <= y) && (y <= gr_y_19_0+18);


wire tr20_0_on;
assign tr20_0_on = (gr_x_20_0 <= x) && (x <= gr_x_20_0+18) && (gr_y_20_0 <= y) && (y <= gr_y_20_0+18);


wire tr21_0_on;
assign tr21_0_on = (gr_x_21_0 <= x) && (x <= gr_x_21_0+18) && (gr_y_21_0 <= y) && (y <= gr_y_21_0+18);


wire tr22_0_on;
assign tr22_0_on = (gr_x_22_0 <= x) && (x <= gr_x_22_0+18) && (gr_y_22_0 <= y) && (y <= gr_y_22_0+18);


wire tr23_0_on;
assign tr23_0_on = (gr_x_23_0 <= x) && (x <= gr_x_23_0+18) && (gr_y_23_0 <= y) && (y <= gr_y_23_0+18);


wire tr24_0_on;
assign tr24_0_on = (gr_x_24_0 <= x) && (x <= gr_x_24_0+18) && (gr_y_24_0 <= y) && (y <= gr_y_24_0+18);

    
    
//    // register control
//initial
//begin
//    sq1_x_reg <= 523;
//    sq1_y_reg <= 32;
//    sq2_x_reg <= 132;
//    sq2_y_reg <= 423;
//end

//always @(posedge clk or posedge reset2)
//    if (reset2)
//        begin
//            sq1_x_reg <= 0;
//            sq1_y_reg <= 0;
//            sq2_x_reg <= 0;
//            sq2_y_reg <= 0;
//        end
    always @(posedge clk or posedge reset1)//posedge clk or
    if (reset1) 
         begin
            sq1_x_reg <= 0;
            sq1_y_reg <= 0;
            sq2_x_reg <= 0;
            sq2_y_reg <= 0;
//            gr0_0_on = 0;
//            gr1_0_on = 0;
//            gr2_0_on = 0;
//            gr3_0_on = 0;
//            gr4_0_on = 0;
//            gr5_0_on = 0;
//            gr6_0_on = 0;
//            gr7_0_on = 0;
//            gr8_0_on = 0;
//            gr9_0_on = 0;
//            gr10_0_on = 0;
//            gr11_0_on = 0;
//            gr12_0_on = 0;
//            gr13_0_on = 0;
//            gr14_0_on = 0;
//            gr15_0_on = 0;
//            gr16_0_on = 0;
//            gr17_0_on = 0;
//            gr18_0_on = 0;
//            gr19_0_on = 0;
//            gr20_0_on = 0;
//            gr21_0_on = 0;
//            gr22_0_on = 0;
//            gr23_0_on = 0;
//            gr24_0_on = 0;
//            x_delta_reg <= 10'h002;
//            y_delta_reg <= 10'h002;
           end
//        always@(posedge clk)
        else
        begin
            sq1_x_reg <= sq1_x_next;
            sq1_y_reg <= sq1_y_next;
            sq2_x_reg <= sq2_x_next;
            sq2_y_reg <= sq2_y_next;
//            gr0_0_on = gr0_0_on;
//            gr1_0_on = gr1_0_on;
//            gr2_0_on = gr2_0_on;
//            gr3_0_on = gr3_0_on;
//            gr4_0_on = gr4_0_on;
//            gr5_0_on = gr5_0_on;
//            gr6_0_on = gr6_0_on;
//            gr7_0_on = gr7_0_on;
//            gr8_0_on = gr8_0_on;
//            gr9_0_on = gr9_0_on;
//            gr10_0_on = gr10_0_on;
//            gr11_0_on = gr11_0_on;
//            gr12_0_on = gr12_0_on;
//            gr13_0_on = gr13_0_on;
//            gr14_0_on = gr14_0_on;
//            gr15_0_on = gr15_0_on;
//            gr16_0_on = gr16_0_on;
//            gr17_0_on = gr17_0_on;
//            gr18_0_on = gr18_0_on;
//            gr19_0_on = gr19_0_on;
//            gr20_0_on = gr20_0_on;
//            gr21_0_on = gr21_0_on;
//            gr22_0_on = gr22_0_on;
//            gr23_0_on = gr23_0_on;
//            gr24_0_on = gr24_0_on;
            
//            x_delta_reg <= x_delta_next;
//            y_delta_reg <= y_delta_next;
        end
    
//    //Player one block
//    assign sq1_x_l = sq1_x_reg;                   // left boundary
//    assign sq1_y_t = sq1_y_reg;                   // top boundary
//    assign sq1_x_r = sq1_x_l + SQUARE_SIZE - 1;   // right boundary
//    assign sq1_y_b = sq1_y_t + SQUARE_SIZE - 1;
//    //Player two block declaration
//    assign sq2_x_l = sq2_x_reg;                   // left boundary
//    assign sq2_y_t = sq2_y_reg;                   // top boundary
//    assign sq2_x_r = sq2_x_l + SQUARE_SIZE - 1;   // right boundary
//    assign sq2_y_b = sq2_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
//    // square status signal
//    wire sq1_on;//Player one on signal
//    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
//    wire sq2_on;//Player two on pixel signal
//    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
    wire black_on;
//    assign black_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  
    assign black_on= (x>=95 && x<=545) && (y>=13 && y<=15)| (x>=545 && x<=547) && (y>=15 && y<=465);// | (x>=93 && x<=95) && (y>=15 && y<=500);// | (x>=95 && x<=565) && (y>=455 && y<=467);
    assign black_on1 = (x==95) && (y>=15 && y<=465);
    assign black_on2 = (x>=95 && x<=545) && (y==465);
//     new square position

    wire [11:0] rgb_wire;
//    romv2 init(clk, video_on, x/3, y[8:0]/2, rgb_wire);
//    easyrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
    tortrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
//    winrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
//    win2rom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
//    drawrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);

    always@(posedge clk)
      begin
    if (refresh_tick)
        if (up1)
            if(sq1_y_reg >= 16)
                begin
                sq1_y_next = sq1_y_reg - y_delta;
                end
            else
                sq1_y_next = sq1_y_reg;
         else if (down1)
            if(sq1_y_reg <= 446)
                sq1_y_next = sq1_y_reg + y_delta;
            else
                sq1_y_next = sq1_y_reg;
         else if (right1)
                if (sq1_x_reg<=528)
                    sq1_x_next = sq1_x_reg + x_delta;    
                else
                   sq1_x_next = sq1_x_reg;
         else if(left1)
            if (sq1_x_reg>=96)
                    sq1_x_next = sq1_x_reg - x_delta;    
                else
                   sq1_x_next = sq1_x_reg;
         
         else
            sq1_y_next = sq1_y_reg;
//        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
      if (refresh_tick)  
         if (up2)
            if(sq2_y_reg >= 16)
                sq2_y_next = sq2_y_reg - y_delta;
            else
                sq2_y_next = sq2_y_reg;
         else if (down2)
            if(sq2_y_reg <= 446)
                sq2_y_next = sq2_y_reg + y_delta;
            else
                sq2_y_next = sq2_y_reg;
          else if (right2)
                if (sq2_x_reg<=528)
                    sq2_x_next = sq2_x_reg + x_delta;    
                else
                   sq2_x_next = sq2_x_reg;         
         else if(left2)
            if (sq2_x_reg>=96)
                    sq2_x_next = sq2_x_reg - x_delta;    
                else
                   sq2_x_next = sq2_x_reg;
         
            else
                sq2_y_next = sq2_y_reg;
         
     if (refresh_tick)
if (sq1_x_next == gr_x_0_0 && sq1_y_next == gr_y_0_0)
gr0_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_1_0 && sq1_y_next == gr_y_1_0)
gr1_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_2_0 && sq1_y_next == gr_y_2_0)
gr2_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_3_0 && sq1_y_next == gr_y_3_0)
gr3_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_4_0 && sq1_y_next == gr_y_4_0)
gr4_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_5_0 && sq1_y_next == gr_y_5_0)
gr5_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_6_0 && sq1_y_next == gr_y_6_0)
gr6_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_7_0 && sq1_y_next == gr_y_7_0)
gr7_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_8_0 && sq1_y_next == gr_y_8_0)
gr8_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_9_0 && sq1_y_next == gr_y_9_0)
gr9_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_10_0 && sq1_y_next == gr_y_10_0)
gr10_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_11_0 && sq1_y_next == gr_y_11_0)
gr11_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_12_0 && sq1_y_next == gr_y_12_0)
gr12_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_13_0 && sq1_y_next == gr_y_13_0)
gr13_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_14_0 && sq1_y_next == gr_y_14_0)
gr14_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_15_0 && sq1_y_next == gr_y_15_0)
gr15_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_16_0 && sq1_y_next == gr_y_16_0)
gr16_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_17_0 && sq1_y_next == gr_y_17_0)
gr17_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_18_0 && sq1_y_next == gr_y_18_0)
gr18_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_19_0 && sq1_y_next == gr_y_19_0)
gr19_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_20_0 && sq1_y_next == gr_y_20_0)
gr20_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_21_0 && sq1_y_next == gr_y_21_0)
gr21_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_22_0 && sq1_y_next == gr_y_22_0)
gr22_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_23_0 && sq1_y_next == gr_y_23_0)
gr23_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_24_0 && sq1_y_next == gr_y_24_0)
gr24_0_on = 2'd1;

if (refresh_tick)
if (sq1_x_next == gr_x_0_0 && sq1_y_next == gr_y_0_0)
gr0_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_1_0 && sq1_y_next == gr_y_1_0)
gr1_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_2_0 && sq1_y_next == gr_y_2_0)
gr2_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_3_0 && sq1_y_next == gr_y_3_0)
gr3_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_4_0 && sq1_y_next == gr_y_4_0)
gr4_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_5_0 && sq1_y_next == gr_y_5_0)
gr5_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_6_0 && sq1_y_next == gr_y_6_0)
gr6_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_7_0 && sq1_y_next == gr_y_7_0)
gr7_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_8_0 && sq1_y_next == gr_y_8_0)
gr8_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_9_0 && sq1_y_next == gr_y_9_0)
gr9_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_10_0 && sq1_y_next == gr_y_10_0)
gr10_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_11_0 && sq1_y_next == gr_y_11_0)
gr11_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_12_0 && sq1_y_next == gr_y_12_0)
gr12_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_13_0 && sq1_y_next == gr_y_13_0)
gr13_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_14_0 && sq1_y_next == gr_y_14_0)
gr14_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_15_0 && sq1_y_next == gr_y_15_0)
gr15_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_16_0 && sq1_y_next == gr_y_16_0)
gr16_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_17_0 && sq1_y_next == gr_y_17_0)
gr17_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_18_0 && sq1_y_next == gr_y_18_0)
gr18_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_19_0 && sq1_y_next == gr_y_19_0)
gr19_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_20_0 && sq1_y_next == gr_y_20_0)
gr20_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_21_0 && sq1_y_next == gr_y_21_0)
gr21_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_22_0 && sq1_y_next == gr_y_22_0)
gr22_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_23_0 && sq1_y_next == gr_y_23_0)
gr23_0_on = 2'd1;
if (refresh_tick)
if (sq1_x_next == gr_x_24_0 && sq1_y_next == gr_y_24_0)
gr24_0_on = 2'd1;
//PS D:\UNI\OneDrive - Habib University\it is wot is>  d:; cd 'd:\UNI\OneDrive - Habib University\it is wot is'; & 'C:\Program Files\Python39\python.exe' 'c:\Users\Tajdar\.vscode\extensions\ms-python.python-2022.18.2\pythonFiles\lib\python\debugpy\adapter/../..\debugpy\launcher' '56681' '--' 'd:\UNI\OneDrive - Habib University\it is wot is\basics.py' 
if (refresh_tick)
if (sq2_x_next == gr_x_0_0 && sq2_y_next == gr_y_0_0)
gr0_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_1_0 && sq2_y_next == gr_y_1_0)
gr1_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_2_0 && sq2_y_next == gr_y_2_0)
gr2_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_3_0 && sq2_y_next == gr_y_3_0)
gr3_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_4_0 && sq2_y_next == gr_y_4_0)
gr4_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_5_0 && sq2_y_next == gr_y_5_0)
gr5_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_6_0 && sq2_y_next == gr_y_6_0)
gr6_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_7_0 && sq2_y_next == gr_y_7_0)
gr7_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_8_0 && sq2_y_next == gr_y_8_0)
gr8_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_9_0 && sq2_y_next == gr_y_9_0)
gr9_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_10_0 && sq2_y_next == gr_y_10_0)
gr10_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_11_0 && sq2_y_next == gr_y_11_0)
gr11_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_12_0 && sq2_y_next == gr_y_12_0)
gr12_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_13_0 && sq2_y_next == gr_y_13_0)
gr13_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_14_0 && sq2_y_next == gr_y_14_0)
gr14_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_15_0 && sq2_y_next == gr_y_15_0)
gr15_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_16_0 && sq2_y_next == gr_y_16_0)
gr16_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_17_0 && sq2_y_next == gr_y_17_0)
gr17_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_18_0 && sq2_y_next == gr_y_18_0)
gr18_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_19_0 && sq2_y_next == gr_y_19_0)
gr19_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_20_0 && sq2_y_next == gr_y_20_0)
gr20_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_21_0 && sq2_y_next == gr_y_21_0)
gr21_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_22_0 && sq2_y_next == gr_y_22_0)
gr22_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_23_0 && sq2_y_next == gr_y_23_0)
gr23_0_on = 2'd2;
if (refresh_tick)
if (sq2_x_next == gr_x_24_0 && sq2_y_next == gr_y_24_0)
gr24_0_on = 2'd2;
//              assign gr00_on = 1;     

if(refresh_tick)
if (reset2)
gr0_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr1_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr2_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr3_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr4_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr5_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr6_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr7_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr8_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr9_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr10_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr11_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr12_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr13_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr14_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr15_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr16_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr17_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr18_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr19_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr20_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr21_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr22_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr23_0_on = 2'd0;

if(refresh_tick)
if (reset2)
gr24_0_on = 2'd0;

if(refresh_tick)
if (reset2)
begin
sq1_x_next <= 527;
sq1_y_next <= 447;
sq2_x_next <= 95;
sq2_y_next <= 15;
end
        
      end
      
            
            
        
//            x_delta_reg <= 10'h002;
//            y_delta_reg <= 10'h002;
      
//      if (refresh_tick)
//        if (reset2)
//            begin
//            sq1_x_reg <= 523;
//            sq1_y_reg <= 32;
//            sq2_x_reg <= 132;
//            sq2_y_reg <= 423;
////            x_delta_reg <= 10'h002;
////            y_delta_reg <= 10'h002;
//    always@(posedge clk)
//    begin
//    if (refresh_tick)
//         if (up1)
//            if (sq1_y_t <= 15)
//                sq1_y_next = sq1_y_reg - y_delta;
//            else
//                sq1_y_next = sq1_y_reg;
//         else if (down1)
//            if (sq1_y_b >= 465)
//                sq1_y_next = sq1_y_reg + y_delta;
//            else
//                sq1_y_next = sq1_y_reg;
//         else if (right1)
//            if (sq1_x_r >= 545)
//                sq1_x_next = sq1_x_reg + x_delta;
//            else
//                sq1_y_next = sq1_y_reg;        
//         else if(left1)
//            if (sq1_x_l <= 95)
//                sq1_x_next = sq1_x_reg - x_delta;
//            else
//                sq1_y_next = sq1_y_reg; 
//         else
//            sq1_y_next = sq1_y_reg;
////        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
//      if (refresh_tick)  
//        if (up2)
//            if (sq2_y_t <= 15)
//                sq2_y_next = sq2_y_reg - y_delta;
//            else
//                sq2_y_next = sq2_y_reg;
//        else if (down2)
//            if (sq2_y_b >= 465)
//                sq2_y_next = sq2_y_reg + y_delta;
//            else
//                sq2_y_next = sq2_y_reg;
//        else if (right2)
//            if (sq2_x_r >= 545)
//                sq2_x_next = sq2_x_reg + x_delta;
//            else
//                sq2_y_next = sq2_y_reg;        
//         else if(left2)
//            if (sq2_x_l <= 95)
//                sq2_x_next = sq2_x_reg - x_delta;
//            else
//                sq2_y_next = sq2_y_reg;
//         else
//            sq2_y_next = sq2_y_reg;
//      end
////    else
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
    always @(posedge clk)
        if(~video_on)
            rgb = 12'h000;          // black(no value) outside display area
        else
            rgb= rgb_wire;
//            if(sq1_on)
//                rgb = SQ1_RGB;       // yellow square
//            else if(sq2_on)
//                rgb = SQ2_RGB;
//            else if(black_on1)
//                rgb = BLACK;
//            else if (black_on2)
//                rgb = BLACK;
//            else if (black_on)
//                rgb = BLACK;
//            else if ((tr0_0_on && gr0_0_on == 2'd1) | (tr1_0_on && gr1_0_on == 2'd1) | (tr2_0_on && gr2_0_on == 2'd1) | (tr3_0_on && gr3_0_on == 2'd1) | (tr4_0_on && gr4_0_on == 2'd1) | (tr5_0_on && gr5_0_on == 2'd1) | (tr6_0_on && gr6_0_on == 2'd1) | (tr7_0_on && gr7_0_on == 2'd1) | (tr8_0_on && gr8_0_on == 2'd1) | (tr9_0_on && gr9_0_on == 2'd1) | (tr10_0_on && gr10_0_on == 2'd1) | (tr11_0_on && gr11_0_on == 2'd1) | (tr12_0_on && gr12_0_on == 2'd1) | (tr13_0_on && gr13_0_on == 2'd1) | (tr14_0_on && gr14_0_on == 2'd1) | (tr15_0_on && gr15_0_on == 2'd1) | (tr16_0_on && gr16_0_on == 2'd1) | (tr17_0_on && gr17_0_on == 2'd1) | (tr18_0_on && gr18_0_on == 2'd1) | (tr19_0_on && gr19_0_on == 2'd1) | (tr20_0_on && gr20_0_on == 2'd1) | (tr21_0_on && gr21_0_on == 2'd1) | (tr22_0_on && gr22_0_on == 2'd1) | (tr23_0_on && gr23_0_on == 2'd1) | (tr24_0_on && gr24_0_on == 2'd1))
//                rgb = trail1;
//            else if ((tr0_0_on && gr0_0_on == 2'd2) | (tr1_0_on && gr1_0_on == 2'd2) | (tr2_0_on && gr2_0_on == 2'd2) | (tr3_0_on && gr3_0_on == 2'd2) | (tr4_0_on && gr4_0_on == 2'd2) | (tr5_0_on && gr5_0_on == 2'd2) | (tr6_0_on && gr6_0_on == 2'd2) | (tr7_0_on && gr7_0_on == 2'd2) | (tr8_0_on && gr8_0_on == 2'd2) | (tr9_0_on && gr9_0_on == 2'd2) | (tr10_0_on && gr10_0_on == 2'd2) | (tr11_0_on && gr11_0_on == 2'd2) | (tr12_0_on && gr12_0_on == 2'd2) | (tr13_0_on && gr13_0_on == 2'd2) | (tr14_0_on && gr14_0_on == 2'd2) | (tr15_0_on && gr15_0_on == 2'd2) | (tr16_0_on && gr16_0_on == 2'd2) | (tr17_0_on && gr17_0_on == 2'd2) | (tr18_0_on && gr18_0_on == 2'd2) | (tr19_0_on && gr19_0_on == 2'd2) | (tr20_0_on && gr20_0_on == 2'd2) | (tr21_0_on && gr21_0_on == 2'd2) | (tr22_0_on && gr22_0_on == 2'd2) | (tr23_0_on && gr23_0_on == 2'd2) | (tr24_0_on && gr24_0_on == 2'd2))
//                rgb = trail2;
//            else
//                rgb= BG_RGB;       // blue background
    
endmodule


