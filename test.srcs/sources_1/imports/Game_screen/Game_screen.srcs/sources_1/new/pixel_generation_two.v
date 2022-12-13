//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 11/03/2022 11:07:00 AM
//// Design Name: 
//// Module Name: pixel_generation_two
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////



//module pixel_generation_two(
//    input clk,                              // 100MHz from Basys 3
//    input reset,                            // btnC
//    input video_on,
//    input up,
//    input down,
//    input right,
//    input left,                         // from VGA controller
//    input [9:0] x, y,                       // from VGA controller
//    output reg [11:0] rgb                   // to DAC, to VGA controller
//    );
    
//    parameter X_MAX = 639;                  // right border of display area
//    parameter Y_MAX = 479;                  // bottom border of display area
//    parameter SQ_RGB = 12'h0FF;             // red & green = yellow for square
//    parameter BG_RGB = 12'hF00;             // blue background
//    parameter SQUARE_SIZE = 23;             // width of square sides in pixels
////    parameter SQUARE_VELOCITY_POS = 2;      // set position change value for positive direction
////    parameter SQUARE_VELOCITY_NEG = -2;     // set position change value for negative direction  
    
//    // create a 60Hz refresh tick at the start of vsync 
//    wire refresh_tick;
//    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
    
//    // square boundaries and position
//    wire [9:0] sq_x_l, sq_x_r;              // square left and right boundary
//    wire [9:0] sq_y_t, sq_y_b;              // square top and bottom boundary
    
//    reg [9:0] sq_x_reg, sq_y_reg;           // regs to track left, top position
//    reg [9:0] sq_x_next, sq_y_next;        // buffer wires
//    wire [9:0] sq_top, sq_bottom;

//parameter x_delta=1;
//parameter y_delta=1;     // track square speed
////reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
    
//    // register control
//    always @(posedge clk or posedge reset)
//        if(reset) begin
//            sq_x_reg <= 132;
//            sq_y_reg <= 423;
////            x_delta_reg <= 10'h002;
////            y_delta_reg <= 10'h002;
//        end
//        else begin
//            sq_x_reg <= sq_x_next;
//            sq_y_reg <= sq_y_next;
////            x_delta_reg <= x_delta_next;
////            y_delta_reg <= y_delta_next;
//        end
    
//    // square boundaries
//    assign sq_x_l = sq_x_reg;                   // left boundary
//    assign sq_y_t = sq_y_reg;                   // top boundary
//    assign sq_x_r = sq_x_l + SQUARE_SIZE - 1;   // right boundary
//    assign sq_y_b = sq_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
//    // square status signal
//    wire sq_on;
//    assign sq_on = (sq_x_l <= x) && (x <= sq_x_r) && (sq_y_t <= y) && (y <= sq_y_b);
                   
//    // new square position
//    always@(posedge clk)
//    begin
////    sq_y_next=sq_y_reg;
//    if (refresh_tick)
//        if (up)
//            sq_y_next = sq_y_reg - y_delta;
//         else if (down)
//            sq_y_next = sq_y_reg + y_delta;
//         else if (right)
//            sq_x_next = sq_x_reg + x_delta;         
//         else if(left)
//            sq_x_next = sq_x_reg - x_delta;
         
//         else
//            sq_y_next = sq_y_reg;
////        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
    
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
//            if(sq_on)
//                rgb = SQ_RGB;       // yellow square
//            else
//                rgb = BG_RGB;       // blue background
    
//endmodule



//module pixel_generation_three(
////    input clk,                              // 100MHz from Basys 3
////    input reset1,
////    input reset2,                            // btnC
////    input video_on,
////    input up1,
////    input down1,
////    input right1,
////    input left1,
////    input up2,
////    input down2,
////    input right2,
////    input left2,                         // from VGA controller
////    input [9:0] x, y,                       // from VGA controller
////    output reg [11:0] rgb                   // to DAC, to VGA controller
////    );
    
////    parameter X_MAX = 639;                  // right border of display area
////    parameter Y_MAX = 479;                  // bottom border of display area
////    parameter SQ1_RGB = 12'h00F;
////    parameter SQ2_RGB = 12'hF00;             // red & green = yellow for square
////    parameter BG_RGB = 12'hFFF;       
////    parameter BLACK= 12'h000;      // blue background
////    parameter SQUARE_SIZE = 23;             // width of square sides in pixels
//////    parameter SQUARE_VELOCITY_POS = 2;      // set position change value for positive direction
//////    parameter SQUARE_VELOCITY_NEG = -2;     // set position change value for negative direction  
    
////    // create a 60Hz refresh tick at the start of vsync 
////    wire refresh_tick;
////    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
    
////    // square boundaries and position
////    wire [9:0] sq1_x_l, sq1_x_r;              // square left and right boundary
////    wire [9:0] sq1_y_t, sq1_y_b;              // square top and bottom boundary
    
////    reg [9:0] sq1_x_reg, sq1_y_reg;           // regs to track left, top position
////    reg [9:0] sq1_x_next, sq1_y_next;        // buffer wires
////    wire [9:0] sq1_top, sq1_bottom;
    
////    wire [9:0] sq2_x_l, sq2_x_r;              // square left and right boundary
////    wire [9:0] sq2_y_t, sq2_y_b;              // square top and bottom boundary
    
////    reg [9:0] sq2_x_reg, sq2_y_reg;           // regs to track left, top position
////    reg [9:0] sq2_x_next, sq2_y_next;        // buffer wires
////    wire [9:0] sq2_top, sq2_bottom;

////parameter x_delta=1;
////parameter y_delta=1;     // track square speed
//////reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
    
////    // register control
////    always @(posedge clk or posedge reset2)
////        if(reset2) begin
////            sq1_x_reg <= 523;
////            sq1_y_reg <= 32;
////            sq2_x_reg <= 132;
////            sq2_y_reg <= 423;
//////            x_delta_reg <= 10'h002;
//////            y_delta_reg <= 10'h002;
////        end
////        else begin
////            sq1_x_reg <= sq1_x_next;
////            sq1_y_reg <= sq1_y_next;
////            sq2_x_reg <= sq2_x_next;
////            sq2_y_reg <= sq2_y_next;
            
//////            x_delta_reg <= x_delta_next;
//////            y_delta_reg <= y_delta_next;
////        end
    
////    // square boundaries
////    assign sq1_x_l = sq1_x_reg;                   // left boundary
////    assign sq1_y_t = sq1_y_reg;                   // top boundary
////    assign sq1_x_r = sq1_x_l + SQUARE_SIZE - 1;   // right boundary
////    assign sq1_y_b = sq1_y_t + SQUARE_SIZE - 1;
    
////    assign sq2_x_l = sq2_x_reg;                   // left boundary
////    assign sq2_y_t = sq2_y_reg;                   // top boundary
////    assign sq2_x_r = sq2_x_l + SQUARE_SIZE - 1;   // right boundary
////    assign sq2_y_b = sq2_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
////    // square status signal
////    wire sq1_on;
////    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
////    wire sq2_on;
////    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
////    wire black_on;
////    assign black_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  

                   
////    // new square position
////    always@(posedge clk)
////    begin
//////    sq_y_next=sq_y_reg;
////    if (refresh_tick)
////        if (up1)
////            sq1_y_next = sq1_y_reg - y_delta;
////         else if (down1)
////            sq1_y_next = sq1_y_reg + y_delta;
////         else if (right1)
////            sq1_x_next = sq1_x_reg + x_delta;         
////         else if(left1)
////            sq1_x_next = sq1_x_reg - x_delta;
         
////         else
////            sq1_y_next = sq1_y_reg;
//////        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
////      if (refresh_tick)  
////        if (up2)
////            sq2_y_next = sq2_y_reg - y_delta;
////        else if (down2)
////            sq2_y_next = sq2_y_reg + y_delta;
////        else if (right2)
////            sq2_x_next = sq2_x_reg + x_delta;         
////         else if(left2)
////            sq2_x_next = sq2_x_reg - x_delta;
         
////         else
////            sq2_y_next = sq2_y_reg;
////      end
//////    else
//////        sq_y_next = (up) ? (sq_y_reg + y_delta) : sq_y_reg;
////    // new square velocity 
//////    always @* begin
//////        x_delta_next = x_delta_reg;
//////        y_delta_next = y_delta_reg;
//////        if(sq_y_t < 1)                              // collide with top display edge
//////            y_delta_next = SQUARE_VELOCITY_POS;     // change y direction(move down)
//////        else if(sq_y_b > Y_MAX)                     // collide with bottom display edge
//////            y_delta_next = SQUARE_VELOCITY_NEG;     // change y direction(move up)
//////        else if(sq_x_l < 1)                         // collide with left display edge
//////            x_delta_next = SQUARE_VELOCITY_POS;     // change x direction(move right)
//////        else if(sq_x_r > X_MAX)                     // collide with right display edge
//////            x_delta_next = SQUARE_VELOCITY_NEG;     // change x direction(move left)
//////    end
    
////    // RGB control
////    always @*
////        if(~video_on)
////            rgb = 12'h000;          // black(no value) outside display area
////        else
////            if(sq1_on)
////                rgb = SQ1_RGB;       // yellow square
////            else if(sq2_on)
////                rgb = SQ2_RGB;
////            else if(black_on)
////                rgb = BLACK;
////            else
////                rgb= BG_RGB;       // blue background
    
////endmodule
//input clk,
////    input clk_25,                              // 100MHz from Basys 3
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
//    parameter BLACK= 12'h000;  
//    parameter trail1 = 12'h009;
//    parameter trail2 = 12'h900;    // blue background
//    parameter SQUARE_SIZE = 18;
//    parameter x_delta=1;
//    parameter y_delta=1;             // width of square sides in pixels
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
////    wire [9:0] sq1_top, sq1_bottom;
    
//    wire [9:0] sq2_x_l, sq2_x_r;              // square left and right boundary
//    wire [9:0] sq2_y_t, sq2_y_b;              // square top and bottom boundary
    
//    reg [9:0] sq2_x_reg, sq2_y_reg;           // regs to track left, top position
//    reg [9:0] sq2_x_next, sq2_y_next;        // buffer wires
////    wire [9:0] sq2_top, sq2_bottom;

//parameter gr_x_0_0 = 95;
//parameter gr_y_0_0 = 15;
//reg [1:0] gr0_0_on = 0;

//parameter gr_x_1_0 = 113;
//parameter gr_y_1_0 = 15;
//reg [1:0] gr1_0_on = 0;

//parameter gr_x_2_0 = 131;
//parameter gr_y_2_0 = 15;
//reg [1:0] gr2_0_on = 0;

//parameter gr_x_3_0 = 149;
//parameter gr_y_3_0 = 15;
//reg [1:0] gr3_0_on = 0;

//parameter gr_x_4_0 = 167;
//parameter gr_y_4_0 = 15;
//reg [1:0] gr4_0_on = 0;

//parameter gr_x_5_0 = 185;
//parameter gr_y_5_0 = 15;
//reg [1:0] gr5_0_on = 0;

//parameter gr_x_6_0 = 203;
//parameter gr_y_6_0 = 15;
//reg [1:0] gr6_0_on = 0;

//parameter gr_x_7_0 = 221;
//parameter gr_y_7_0 = 15;
//reg [1:0] gr7_0_on = 0;

//parameter gr_x_8_0 = 239;
//parameter gr_y_8_0 = 15;
//reg [1:0] gr8_0_on = 0;

//parameter gr_x_9_0 = 257;
//parameter gr_y_9_0 = 15;
//reg [1:0] gr9_0_on = 0;

//parameter gr_x_10_0 = 275;
//parameter gr_y_10_0 = 15;
//reg [1:0] gr10_0_on = 0;

//parameter gr_x_11_0 = 293;
//parameter gr_y_11_0 = 15;
//reg [1:0] gr11_0_on = 0;

//parameter gr_x_12_0 = 311;
//parameter gr_y_12_0 = 15;
//reg [1:0] gr12_0_on = 0;

//parameter gr_x_13_0 = 329;
//parameter gr_y_13_0 = 15;
//reg [1:0] gr13_0_on = 0;

//parameter gr_x_14_0 = 347;
//parameter gr_y_14_0 = 15;
//reg [1:0] gr14_0_on = 0;

//parameter gr_x_15_0 = 365;
//parameter gr_y_15_0 = 15;
//reg [1:0] gr15_0_on = 0;

//parameter gr_x_16_0 = 383;
//parameter gr_y_16_0 = 15;
//reg [1:0] gr16_0_on = 0;

//parameter gr_x_17_0 = 401;
//parameter gr_y_17_0 = 15;
//reg [1:0] gr17_0_on = 0;

//parameter gr_x_18_0 = 419;
//parameter gr_y_18_0 = 15;
//reg [1:0] gr18_0_on = 0;

//parameter gr_x_19_0 = 437;
//parameter gr_y_19_0 = 15;
//reg [1:0] gr19_0_on = 0;

//parameter gr_x_20_0 = 455;
//parameter gr_y_20_0 = 15;
//reg [1:0] gr20_0_on = 0;

//parameter gr_x_21_0 = 473;
//parameter gr_y_21_0 = 15;
//reg [1:0] gr21_0_on = 0;

//parameter gr_x_22_0 = 491;
//parameter gr_y_22_0 = 15;
//reg [1:0] gr22_0_on = 0;

//parameter gr_x_23_0 = 509;
//parameter gr_y_23_0 = 15;
//reg [1:0] gr23_0_on = 0;

//parameter gr_x_24_0 = 527;
//parameter gr_y_24_0 = 15;
//reg [1:0] gr24_0_on = 0;
////    assign 
    
////    wire [9:0] 

//     // track square speed
////reg [9:0] x_delta_next, y_delta_next;   // buffer regs    
//    //Player one block
//    // square boundaries
//    assign sq1_x_l = sq1_x_reg;                   // left boundary
//    assign sq1_y_t = sq1_y_reg;                   // top boundary
//    assign sq1_x_r = sq1_x_l + SQUARE_SIZE;   // right boundary
//    assign sq1_y_b = sq1_y_t + SQUARE_SIZE;
    
//    assign sq2_x_l = sq2_x_reg;                   // left boundary
//    assign sq2_y_t = sq2_y_reg;                   // top boundary
//    assign sq2_x_r = sq2_x_l + SQUARE_SIZE;   // right boundary
//    assign sq2_y_b = sq2_y_t + SQUARE_SIZE;   // bottom boundary
    
//    // square status signal
//    wire sq1_on;
//    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
//    wire sq2_on;
//    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
//    wire tr0_0_on;
//    assign tr0_0_on = (gr_x_0_0 <= x) && (x <= gr_x_0_0+18) && (gr_y_0_0 <= y) && (y <= gr_y_0_0+18);
    
//wire tr1_0_on;
//assign tr1_0_on = (gr_x_1_0 <= x) && (x <= gr_x_1_0+18) && (gr_y_1_0 <= y) && (y <= gr_y_1_0+18);


//wire tr2_0_on;
//assign tr2_0_on = (gr_x_2_0 <= x) && (x <= gr_x_2_0+18) && (gr_y_2_0 <= y) && (y <= gr_y_2_0+18);


//wire tr3_0_on;
//assign tr3_0_on = (gr_x_3_0 <= x) && (x <= gr_x_3_0+18) && (gr_y_3_0 <= y) && (y <= gr_y_3_0+18);


//wire tr4_0_on;
//assign tr4_0_on = (gr_x_4_0 <= x) && (x <= gr_x_4_0+18) && (gr_y_4_0 <= y) && (y <= gr_y_4_0+18);


//wire tr5_0_on;
//assign tr5_0_on = (gr_x_5_0 <= x) && (x <= gr_x_5_0+18) && (gr_y_5_0 <= y) && (y <= gr_y_5_0+18);


//wire tr6_0_on;
//assign tr6_0_on = (gr_x_6_0 <= x) && (x <= gr_x_6_0+18) && (gr_y_6_0 <= y) && (y <= gr_y_6_0+18);


//wire tr7_0_on;
//assign tr7_0_on = (gr_x_7_0 <= x) && (x <= gr_x_7_0+18) && (gr_y_7_0 <= y) && (y <= gr_y_7_0+18);


//wire tr8_0_on;
//assign tr8_0_on = (gr_x_8_0 <= x) && (x <= gr_x_8_0+18) && (gr_y_8_0 <= y) && (y <= gr_y_8_0+18);


//wire tr9_0_on;
//assign tr9_0_on = (gr_x_9_0 <= x) && (x <= gr_x_9_0+18) && (gr_y_9_0 <= y) && (y <= gr_y_9_0+18);


//wire tr10_0_on;
//assign tr10_0_on = (gr_x_10_0 <= x) && (x <= gr_x_10_0+18) && (gr_y_10_0 <= y) && (y <= gr_y_10_0+18);


//wire tr11_0_on;
//assign tr11_0_on = (gr_x_11_0 <= x) && (x <= gr_x_11_0+18) && (gr_y_11_0 <= y) && (y <= gr_y_11_0+18);


//wire tr12_0_on;
//assign tr12_0_on = (gr_x_12_0 <= x) && (x <= gr_x_12_0+18) && (gr_y_12_0 <= y) && (y <= gr_y_12_0+18);


//wire tr13_0_on;
//assign tr13_0_on = (gr_x_13_0 <= x) && (x <= gr_x_13_0+18) && (gr_y_13_0 <= y) && (y <= gr_y_13_0+18);


//wire tr14_0_on;
//assign tr14_0_on = (gr_x_14_0 <= x) && (x <= gr_x_14_0+18) && (gr_y_14_0 <= y) && (y <= gr_y_14_0+18);


//wire tr15_0_on;
//assign tr15_0_on = (gr_x_15_0 <= x) && (x <= gr_x_15_0+18) && (gr_y_15_0 <= y) && (y <= gr_y_15_0+18);


//wire tr16_0_on;
//assign tr16_0_on = (gr_x_16_0 <= x) && (x <= gr_x_16_0+18) && (gr_y_16_0 <= y) && (y <= gr_y_16_0+18);


//wire tr17_0_on;
//assign tr17_0_on = (gr_x_17_0 <= x) && (x <= gr_x_17_0+18) && (gr_y_17_0 <= y) && (y <= gr_y_17_0+18);


//wire tr18_0_on;
//assign tr18_0_on = (gr_x_18_0 <= x) && (x <= gr_x_18_0+18) && (gr_y_18_0 <= y) && (y <= gr_y_18_0+18);


//wire tr19_0_on;
//assign tr19_0_on = (gr_x_19_0 <= x) && (x <= gr_x_19_0+18) && (gr_y_19_0 <= y) && (y <= gr_y_19_0+18);


//wire tr20_0_on;
//assign tr20_0_on = (gr_x_20_0 <= x) && (x <= gr_x_20_0+18) && (gr_y_20_0 <= y) && (y <= gr_y_20_0+18);


//wire tr21_0_on;
//assign tr21_0_on = (gr_x_21_0 <= x) && (x <= gr_x_21_0+18) && (gr_y_21_0 <= y) && (y <= gr_y_21_0+18);


//wire tr22_0_on;
//assign tr22_0_on = (gr_x_22_0 <= x) && (x <= gr_x_22_0+18) && (gr_y_22_0 <= y) && (y <= gr_y_22_0+18);


//wire tr23_0_on;
//assign tr23_0_on = (gr_x_23_0 <= x) && (x <= gr_x_23_0+18) && (gr_y_23_0 <= y) && (y <= gr_y_23_0+18);


//wire tr24_0_on;
//assign tr24_0_on = (gr_x_24_0 <= x) && (x <= gr_x_24_0+18) && (gr_y_24_0 <= y) && (y <= gr_y_24_0+18);

    
    
////    // register control
////initial
////begin
////    sq1_x_reg <= 523;
////    sq1_y_reg <= 32;
////    sq2_x_reg <= 132;
////    sq2_y_reg <= 423;
////end

////always @(posedge clk or posedge reset2)
////    if (reset2)
////        begin
////            sq1_x_reg <= 0;
////            sq1_y_reg <= 0;
////            sq2_x_reg <= 0;
////            sq2_y_reg <= 0;
////        end
//    always @(posedge clk or posedge reset1)//posedge clk or
//    if (reset1) 
//         begin
//            sq1_x_reg <= 0;
//            sq1_y_reg <= 0;
//            sq2_x_reg <= 0;
//            sq2_y_reg <= 0;
////            gr0_0_on = 0;
////            gr1_0_on = 0;
////            gr2_0_on = 0;
////            gr3_0_on = 0;
////            gr4_0_on = 0;
////            gr5_0_on = 0;
////            gr6_0_on = 0;
////            gr7_0_on = 0;
////            gr8_0_on = 0;
////            gr9_0_on = 0;
////            gr10_0_on = 0;
////            gr11_0_on = 0;
////            gr12_0_on = 0;
////            gr13_0_on = 0;
////            gr14_0_on = 0;
////            gr15_0_on = 0;
////            gr16_0_on = 0;
////            gr17_0_on = 0;
////            gr18_0_on = 0;
////            gr19_0_on = 0;
////            gr20_0_on = 0;
////            gr21_0_on = 0;
////            gr22_0_on = 0;
////            gr23_0_on = 0;
////            gr24_0_on = 0;
////            x_delta_reg <= 10'h002;
////            y_delta_reg <= 10'h002;
//           end
////        always@(posedge clk)
//        else
//        begin
//            sq1_x_reg <= sq1_x_next;
//            sq1_y_reg <= sq1_y_next;
//            sq2_x_reg <= sq2_x_next;
//            sq2_y_reg <= sq2_y_next;
////            gr0_0_on = gr0_0_on;
////            gr1_0_on = gr1_0_on;
////            gr2_0_on = gr2_0_on;
////            gr3_0_on = gr3_0_on;
////            gr4_0_on = gr4_0_on;
////            gr5_0_on = gr5_0_on;
////            gr6_0_on = gr6_0_on;
////            gr7_0_on = gr7_0_on;
////            gr8_0_on = gr8_0_on;
////            gr9_0_on = gr9_0_on;
////            gr10_0_on = gr10_0_on;
////            gr11_0_on = gr11_0_on;
////            gr12_0_on = gr12_0_on;
////            gr13_0_on = gr13_0_on;
////            gr14_0_on = gr14_0_on;
////            gr15_0_on = gr15_0_on;
////            gr16_0_on = gr16_0_on;
////            gr17_0_on = gr17_0_on;
////            gr18_0_on = gr18_0_on;
////            gr19_0_on = gr19_0_on;
////            gr20_0_on = gr20_0_on;
////            gr21_0_on = gr21_0_on;
////            gr22_0_on = gr22_0_on;
////            gr23_0_on = gr23_0_on;
////            gr24_0_on = gr24_0_on;
            
////            x_delta_reg <= x_delta_next;
////            y_delta_reg <= y_delta_next;
//        end
    
////    //Player one block
////    assign sq1_x_l = sq1_x_reg;                   // left boundary
////    assign sq1_y_t = sq1_y_reg;                   // top boundary
////    assign sq1_x_r = sq1_x_l + SQUARE_SIZE - 1;   // right boundary
////    assign sq1_y_b = sq1_y_t + SQUARE_SIZE - 1;
////    //Player two block declaration
////    assign sq2_x_l = sq2_x_reg;                   // left boundary
////    assign sq2_y_t = sq2_y_reg;                   // top boundary
////    assign sq2_x_r = sq2_x_l + SQUARE_SIZE - 1;   // right boundary
////    assign sq2_y_b = sq2_y_t + SQUARE_SIZE - 1;   // bottom boundary
    
////    // square status signal
////    wire sq1_on;//Player one on signal
////    assign sq1_on = (sq1_x_l <= x) && (x <= sq1_x_r) && (sq1_y_t <= y) && (y <= sq1_y_b);
    
////    wire sq2_on;//Player two on pixel signal
////    assign sq2_on = (sq2_x_l <= x) && (x <= sq2_x_r) && (sq2_y_t <= y) && (y <= sq2_y_b);
    
//    wire black_on;
////    assign black_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  
//    assign black_on= (x>=95 && x<=545) && (y>=13 && y<=15)| (x>=545 && x<=547) && (y>=15 && y<=465);// | (x>=93 && x<=95) && (y>=15 && y<=500);// | (x>=95 && x<=565) && (y>=455 && y<=467);
//    assign black_on1 = (x==95) && (y>=15 && y<=465);
//    assign black_on2 = (x>=95 && x<=545) && (y==465);
////     new square position

//    wire [11:0] rgb_wire;
////    romv2 init(clk, video_on, x/3, y[8:0]/2, rgb_wire);
////    easyrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
//    tortrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
////    winrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
////    win2rom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);
////    drawrom easy(clk, video_on, x/3, y[8:0]/2, rgb_wire);

//    always@(posedge clk)
//      begin
//    if (refresh_tick)
//        if (up1)
//            if(sq1_y_reg >= 16)
//                begin
//                sq1_y_next = sq1_y_reg - y_delta;
//                end
//            else
//                sq1_y_next = sq1_y_reg;
//         else if (down1)
//            if(sq1_y_reg <= 446)
//                sq1_y_next = sq1_y_reg + y_delta;
//            else
//                sq1_y_next = sq1_y_reg;
//         else if (right1)
//                if (sq1_x_reg<=528)
//                    sq1_x_next = sq1_x_reg + x_delta;    
//                else
//                   sq1_x_next = sq1_x_reg;
//         else if(left1)
//            if (sq1_x_reg>=96)
//                    sq1_x_next = sq1_x_reg - x_delta;    
//                else
//                   sq1_x_next = sq1_x_reg;
         
//         else
//            sq1_y_next = sq1_y_reg;
////        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
//      if (refresh_tick)  
//         if (up2)
//            if(sq2_y_reg >= 16)
//                sq2_y_next = sq2_y_reg - y_delta;
//            else
//                sq2_y_next = sq2_y_reg;
//         else if (down2)
//            if(sq2_y_reg <= 446)
//                sq2_y_next = sq2_y_reg + y_delta;
//            else
//                sq2_y_next = sq2_y_reg;
//          else if (right2)
//                if (sq2_x_reg<=528)
//                    sq2_x_next = sq2_x_reg + x_delta;    
//                else
//                   sq2_x_next = sq2_x_reg;         
//         else if(left2)
//            if (sq2_x_reg>=96)
//                    sq2_x_next = sq2_x_reg - x_delta;    
//                else
//                   sq2_x_next = sq2_x_reg;
         
//            else
//                sq2_y_next = sq2_y_reg;
         
//     if (refresh_tick)
//if (sq1_x_next == gr_x_0_0 && sq1_y_next == gr_y_0_0)
//gr0_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_1_0 && sq1_y_next == gr_y_1_0)
//gr1_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_2_0 && sq1_y_next == gr_y_2_0)
//gr2_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_3_0 && sq1_y_next == gr_y_3_0)
//gr3_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_4_0 && sq1_y_next == gr_y_4_0)
//gr4_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_5_0 && sq1_y_next == gr_y_5_0)
//gr5_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_6_0 && sq1_y_next == gr_y_6_0)
//gr6_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_7_0 && sq1_y_next == gr_y_7_0)
//gr7_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_8_0 && sq1_y_next == gr_y_8_0)
//gr8_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_9_0 && sq1_y_next == gr_y_9_0)
//gr9_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_10_0 && sq1_y_next == gr_y_10_0)
//gr10_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_11_0 && sq1_y_next == gr_y_11_0)
//gr11_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_12_0 && sq1_y_next == gr_y_12_0)
//gr12_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_13_0 && sq1_y_next == gr_y_13_0)
//gr13_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_14_0 && sq1_y_next == gr_y_14_0)
//gr14_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_15_0 && sq1_y_next == gr_y_15_0)
//gr15_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_16_0 && sq1_y_next == gr_y_16_0)
//gr16_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_17_0 && sq1_y_next == gr_y_17_0)
//gr17_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_18_0 && sq1_y_next == gr_y_18_0)
//gr18_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_19_0 && sq1_y_next == gr_y_19_0)
//gr19_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_20_0 && sq1_y_next == gr_y_20_0)
//gr20_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_21_0 && sq1_y_next == gr_y_21_0)
//gr21_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_22_0 && sq1_y_next == gr_y_22_0)
//gr22_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_23_0 && sq1_y_next == gr_y_23_0)
//gr23_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_24_0 && sq1_y_next == gr_y_24_0)
//gr24_0_on = 2'd1;

//if (refresh_tick)
//if (sq1_x_next == gr_x_0_0 && sq1_y_next == gr_y_0_0)
//gr0_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_1_0 && sq1_y_next == gr_y_1_0)
//gr1_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_2_0 && sq1_y_next == gr_y_2_0)
//gr2_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_3_0 && sq1_y_next == gr_y_3_0)
//gr3_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_4_0 && sq1_y_next == gr_y_4_0)
//gr4_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_5_0 && sq1_y_next == gr_y_5_0)
//gr5_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_6_0 && sq1_y_next == gr_y_6_0)
//gr6_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_7_0 && sq1_y_next == gr_y_7_0)
//gr7_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_8_0 && sq1_y_next == gr_y_8_0)
//gr8_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_9_0 && sq1_y_next == gr_y_9_0)
//gr9_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_10_0 && sq1_y_next == gr_y_10_0)
//gr10_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_11_0 && sq1_y_next == gr_y_11_0)
//gr11_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_12_0 && sq1_y_next == gr_y_12_0)
//gr12_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_13_0 && sq1_y_next == gr_y_13_0)
//gr13_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_14_0 && sq1_y_next == gr_y_14_0)
//gr14_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_15_0 && sq1_y_next == gr_y_15_0)
//gr15_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_16_0 && sq1_y_next == gr_y_16_0)
//gr16_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_17_0 && sq1_y_next == gr_y_17_0)
//gr17_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_18_0 && sq1_y_next == gr_y_18_0)
//gr18_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_19_0 && sq1_y_next == gr_y_19_0)
//gr19_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_20_0 && sq1_y_next == gr_y_20_0)
//gr20_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_21_0 && sq1_y_next == gr_y_21_0)
//gr21_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_22_0 && sq1_y_next == gr_y_22_0)
//gr22_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_23_0 && sq1_y_next == gr_y_23_0)
//gr23_0_on = 2'd1;
//if (refresh_tick)
//if (sq1_x_next == gr_x_24_0 && sq1_y_next == gr_y_24_0)
//gr24_0_on = 2'd1;
////PS D:\UNI\OneDrive - Habib University\it is wot is>  d:; cd 'd:\UNI\OneDrive - Habib University\it is wot is'; & 'C:\Program Files\Python39\python.exe' 'c:\Users\Tajdar\.vscode\extensions\ms-python.python-2022.18.2\pythonFiles\lib\python\debugpy\adapter/../..\debugpy\launcher' '56681' '--' 'd:\UNI\OneDrive - Habib University\it is wot is\basics.py' 
//if (refresh_tick)
//if (sq2_x_next == gr_x_0_0 && sq2_y_next == gr_y_0_0)
//gr0_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_1_0 && sq2_y_next == gr_y_1_0)
//gr1_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_2_0 && sq2_y_next == gr_y_2_0)
//gr2_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_3_0 && sq2_y_next == gr_y_3_0)
//gr3_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_4_0 && sq2_y_next == gr_y_4_0)
//gr4_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_5_0 && sq2_y_next == gr_y_5_0)
//gr5_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_6_0 && sq2_y_next == gr_y_6_0)
//gr6_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_7_0 && sq2_y_next == gr_y_7_0)
//gr7_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_8_0 && sq2_y_next == gr_y_8_0)
//gr8_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_9_0 && sq2_y_next == gr_y_9_0)
//gr9_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_10_0 && sq2_y_next == gr_y_10_0)
//gr10_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_11_0 && sq2_y_next == gr_y_11_0)
//gr11_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_12_0 && sq2_y_next == gr_y_12_0)
//gr12_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_13_0 && sq2_y_next == gr_y_13_0)
//gr13_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_14_0 && sq2_y_next == gr_y_14_0)
//gr14_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_15_0 && sq2_y_next == gr_y_15_0)
//gr15_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_16_0 && sq2_y_next == gr_y_16_0)
//gr16_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_17_0 && sq2_y_next == gr_y_17_0)
//gr17_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_18_0 && sq2_y_next == gr_y_18_0)
//gr18_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_19_0 && sq2_y_next == gr_y_19_0)
//gr19_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_20_0 && sq2_y_next == gr_y_20_0)
//gr20_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_21_0 && sq2_y_next == gr_y_21_0)
//gr21_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_22_0 && sq2_y_next == gr_y_22_0)
//gr22_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_23_0 && sq2_y_next == gr_y_23_0)
//gr23_0_on = 2'd2;
//if (refresh_tick)
//if (sq2_x_next == gr_x_24_0 && sq2_y_next == gr_y_24_0)
//gr24_0_on = 2'd2;
////              assign gr00_on = 1;     

//if(refresh_tick)
//if (reset2)
//gr0_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr1_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr2_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr3_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr4_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr5_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr6_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr7_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr8_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr9_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr10_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr11_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr12_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr13_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr14_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr15_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr16_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr17_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr18_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr19_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr20_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr21_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr22_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr23_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//gr24_0_on = 2'd0;

//if(refresh_tick)
//if (reset2)
//begin
//sq1_x_next <= 527;
//sq1_y_next <= 447;
//sq2_x_next <= 95;
//sq2_y_next <= 15;
//end
        
//      end
      
            
            
        
////            x_delta_reg <= 10'h002;
////            y_delta_reg <= 10'h002;
      
////      if (refresh_tick)
////        if (reset2)
////            begin
////            sq1_x_reg <= 523;
////            sq1_y_reg <= 32;
////            sq2_x_reg <= 132;
////            sq2_y_reg <= 423;
//////            x_delta_reg <= 10'h002;
//////            y_delta_reg <= 10'h002;
////    always@(posedge clk)
////    begin
////    if (refresh_tick)
////         if (up1)
////            if (sq1_y_t <= 15)
////                sq1_y_next = sq1_y_reg - y_delta;
////            else
////                sq1_y_next = sq1_y_reg;
////         else if (down1)
////            if (sq1_y_b >= 465)
////                sq1_y_next = sq1_y_reg + y_delta;
////            else
////                sq1_y_next = sq1_y_reg;
////         else if (right1)
////            if (sq1_x_r >= 545)
////                sq1_x_next = sq1_x_reg + x_delta;
////            else
////                sq1_y_next = sq1_y_reg;        
////         else if(left1)
////            if (sq1_x_l <= 95)
////                sq1_x_next = sq1_x_reg - x_delta;
////            else
////                sq1_y_next = sq1_y_reg; 
////         else
////            sq1_y_next = sq1_y_reg;
//////        sq_y_next = (down) ? (sq_y_reg + y_delta ): sq_y_reg;
////      if (refresh_tick)  
////        if (up2)
////            if (sq2_y_t <= 15)
////                sq2_y_next = sq2_y_reg - y_delta;
////            else
////                sq2_y_next = sq2_y_reg;
////        else if (down2)
////            if (sq2_y_b >= 465)
////                sq2_y_next = sq2_y_reg + y_delta;
////            else
////                sq2_y_next = sq2_y_reg;
////        else if (right2)
////            if (sq2_x_r >= 545)
////                sq2_x_next = sq2_x_reg + x_delta;
////            else
////                sq2_y_next = sq2_y_reg;        
////         else if(left2)
////            if (sq2_x_l <= 95)
////                sq2_x_next = sq2_x_reg - x_delta;
////            else
////                sq2_y_next = sq2_y_reg;
////         else
////            sq2_y_next = sq2_y_reg;
////      end
//////    else
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
//    always @(posedge clk)
//        if(~video_on)
//            rgb = 12'h000;          // black(no value) outside display area
//        else
//            rgb= rgb_wire;
////            if(sq1_on)
////                rgb = SQ1_RGB;       // yellow square
////            else if(sq2_on)
////                rgb = SQ2_RGB;
////            else if(black_on1)
////                rgb = BLACK;
////            else if (black_on2)
////                rgb = BLACK;
////            else if (black_on)
////                rgb = BLACK;
////            else if ((tr0_0_on && gr0_0_on == 2'd1) | (tr1_0_on && gr1_0_on == 2'd1) | (tr2_0_on && gr2_0_on == 2'd1) | (tr3_0_on && gr3_0_on == 2'd1) | (tr4_0_on && gr4_0_on == 2'd1) | (tr5_0_on && gr5_0_on == 2'd1) | (tr6_0_on && gr6_0_on == 2'd1) | (tr7_0_on && gr7_0_on == 2'd1) | (tr8_0_on && gr8_0_on == 2'd1) | (tr9_0_on && gr9_0_on == 2'd1) | (tr10_0_on && gr10_0_on == 2'd1) | (tr11_0_on && gr11_0_on == 2'd1) | (tr12_0_on && gr12_0_on == 2'd1) | (tr13_0_on && gr13_0_on == 2'd1) | (tr14_0_on && gr14_0_on == 2'd1) | (tr15_0_on && gr15_0_on == 2'd1) | (tr16_0_on && gr16_0_on == 2'd1) | (tr17_0_on && gr17_0_on == 2'd1) | (tr18_0_on && gr18_0_on == 2'd1) | (tr19_0_on && gr19_0_on == 2'd1) | (tr20_0_on && gr20_0_on == 2'd1) | (tr21_0_on && gr21_0_on == 2'd1) | (tr22_0_on && gr22_0_on == 2'd1) | (tr23_0_on && gr23_0_on == 2'd1) | (tr24_0_on && gr24_0_on == 2'd1))
////                rgb = trail1;
////            else if ((tr0_0_on && gr0_0_on == 2'd2) | (tr1_0_on && gr1_0_on == 2'd2) | (tr2_0_on && gr2_0_on == 2'd2) | (tr3_0_on && gr3_0_on == 2'd2) | (tr4_0_on && gr4_0_on == 2'd2) | (tr5_0_on && gr5_0_on == 2'd2) | (tr6_0_on && gr6_0_on == 2'd2) | (tr7_0_on && gr7_0_on == 2'd2) | (tr8_0_on && gr8_0_on == 2'd2) | (tr9_0_on && gr9_0_on == 2'd2) | (tr10_0_on && gr10_0_on == 2'd2) | (tr11_0_on && gr11_0_on == 2'd2) | (tr12_0_on && gr12_0_on == 2'd2) | (tr13_0_on && gr13_0_on == 2'd2) | (tr14_0_on && gr14_0_on == 2'd2) | (tr15_0_on && gr15_0_on == 2'd2) | (tr16_0_on && gr16_0_on == 2'd2) | (tr17_0_on && gr17_0_on == 2'd2) | (tr18_0_on && gr18_0_on == 2'd2) | (tr19_0_on && gr19_0_on == 2'd2) | (tr20_0_on && gr20_0_on == 2'd2) | (tr21_0_on && gr21_0_on == 2'd2) | (tr22_0_on && gr22_0_on == 2'd2) | (tr23_0_on && gr23_0_on == 2'd2) | (tr24_0_on && gr24_0_on == 2'd2))
////                rgb = trail2;
////            else
////                rgb= BG_RGB;       // blue background
    
//endmodule





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



module pixel_generation_three(
    input clk,
    input clk_25,                             // 100MHz from Basys 3
    input reset1,
    input reset2,  
    input reset3,
    input play,                          // btnC
    input video_on,
    input up1,
    input down1,
    input right1,
    input left1,
    input up2,
    input down2,
    input right2,
    input left2,                         // from VGA controller
    input [9:0] x, y, 
    input [1:0]S,
    input en,
    output [6:0]Y,
    output [3:0] digit,                     // from VGA controller
    output reg [11:0] rgb                   // to DAC, to VGA controller
    );
    
    parameter X_MAX = 639;                  // right border of display area
    parameter Y_MAX = 479;                  // bottom border of display area
    parameter SQ1_RGB = 12'h00F;
    parameter SQ2_RGB = 12'hF00;             // red & green = yellow for square
    parameter BG1 = 12'hFFF;   
    parameter BG2 = 12'hF00;
    parameter BG3 = 12'h0F0;
    parameter BG4 = 12'h00F;    
    parameter BLACK= 12'h000;  
    parameter trail1 = 12'h99F;
    parameter trail2 = 12'hF99;    // blue background
    parameter over = 12'h999;
    parameter start = 12'hFF0;
    parameter b_start = 12'hF0F;
    parameter bonus_rgb = 12'h0FF;
    parameter SQUARE_SIZE = 18;
    parameter x_delta=18;
    parameter y_delta=18;             // width of square sides in pixels
//    parameter SQUARE_VELOCITY_POS = 2;      // set position change value for positive direction
//    parameter SQUARE_VELOCITY_NEG = -2;     // set position change value for negative direction  
    
    // create a 60Hz refresh tick at the start of vsync 
//    wire refresh_tick;
//    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
    
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

parameter gr_x_0_0 = 95; parameter gr_y_0_0 = 15; reg [1:0] gr0_0_on = 0;
parameter gr_x_0_1 = 95; parameter gr_y_0_1 = 33; reg [1:0] gr0_1_on = 0;
parameter gr_x_0_2 = 95; parameter gr_y_0_2 = 51; reg [1:0] gr0_2_on = 0;
parameter gr_x_0_3 = 95; parameter gr_y_0_3 = 69; reg [1:0] gr0_3_on = 0;
parameter gr_x_0_4 = 95; parameter gr_y_0_4 = 87; reg [1:0] gr0_4_on = 0;
parameter gr_x_0_5 = 95; parameter gr_y_0_5 = 105; reg [1:0] gr0_5_on = 0;
parameter gr_x_0_6 = 95; parameter gr_y_0_6 = 123; reg [1:0] gr0_6_on = 0;
parameter gr_x_0_7 = 95; parameter gr_y_0_7 = 141; reg [1:0] gr0_7_on = 0;
parameter gr_x_0_8 = 95; parameter gr_y_0_8 = 159; reg [1:0] gr0_8_on = 0;
parameter gr_x_0_9 = 95; parameter gr_y_0_9 = 177; reg [1:0] gr0_9_on = 0;
parameter gr_x_0_10 = 95; parameter gr_y_0_10 = 195; reg [1:0] gr0_10_on = 0;
parameter gr_x_0_11 = 95; parameter gr_y_0_11 = 213; reg [1:0] gr0_11_on = 0;
parameter gr_x_0_12 = 95; parameter gr_y_0_12 = 231; reg [1:0] gr0_12_on = 0;
parameter gr_x_0_13 = 95; parameter gr_y_0_13 = 249; reg [1:0] gr0_13_on = 0;
parameter gr_x_0_14 = 95; parameter gr_y_0_14 = 267; reg [1:0] gr0_14_on = 0;
parameter gr_x_0_15 = 95; parameter gr_y_0_15 = 285; reg [1:0] gr0_15_on = 0;
parameter gr_x_0_16 = 95; parameter gr_y_0_16 = 303; reg [1:0] gr0_16_on = 0;
parameter gr_x_0_17 = 95; parameter gr_y_0_17 = 321; reg [1:0] gr0_17_on = 0;
parameter gr_x_0_18 = 95; parameter gr_y_0_18 = 339; reg [1:0] gr0_18_on = 0;
parameter gr_x_0_19 = 95; parameter gr_y_0_19 = 357; reg [1:0] gr0_19_on = 0;
parameter gr_x_0_20 = 95; parameter gr_y_0_20 = 375; reg [1:0] gr0_20_on = 0;
parameter gr_x_0_21 = 95; parameter gr_y_0_21 = 393; reg [1:0] gr0_21_on = 0;
parameter gr_x_0_22 = 95; parameter gr_y_0_22 = 411; reg [1:0] gr0_22_on = 0;
parameter gr_x_0_23 = 95; parameter gr_y_0_23 = 429; reg [1:0] gr0_23_on = 0;
parameter gr_x_0_24 = 95; parameter gr_y_0_24 = 447; reg [1:0] gr0_24_on = 0;
parameter gr_x_1_0 = 113; parameter gr_y_1_0 = 15; reg [1:0] gr1_0_on = 0;
parameter gr_x_1_1 = 113; parameter gr_y_1_1 = 33; reg [1:0] gr1_1_on = 0;
parameter gr_x_1_2 = 113; parameter gr_y_1_2 = 51; reg [1:0] gr1_2_on = 0;
parameter gr_x_1_3 = 113; parameter gr_y_1_3 = 69; reg [1:0] gr1_3_on = 0;
parameter gr_x_1_4 = 113; parameter gr_y_1_4 = 87; reg [1:0] gr1_4_on = 0;
parameter gr_x_1_5 = 113; parameter gr_y_1_5 = 105; reg [1:0] gr1_5_on = 0;
parameter gr_x_1_6 = 113; parameter gr_y_1_6 = 123; reg [1:0] gr1_6_on = 0;
parameter gr_x_1_7 = 113; parameter gr_y_1_7 = 141; reg [1:0] gr1_7_on = 0;
parameter gr_x_1_8 = 113; parameter gr_y_1_8 = 159; reg [1:0] gr1_8_on = 0;
parameter gr_x_1_9 = 113; parameter gr_y_1_9 = 177; reg [1:0] gr1_9_on = 0;
parameter gr_x_1_10 = 113; parameter gr_y_1_10 = 195; reg [1:0] gr1_10_on = 0;
parameter gr_x_1_11 = 113; parameter gr_y_1_11 = 213; reg [1:0] gr1_11_on = 0;
parameter gr_x_1_12 = 113; parameter gr_y_1_12 = 231; reg [1:0] gr1_12_on = 0;
parameter gr_x_1_13 = 113; parameter gr_y_1_13 = 249; reg [1:0] gr1_13_on = 0;
parameter gr_x_1_14 = 113; parameter gr_y_1_14 = 267; reg [1:0] gr1_14_on = 0;
parameter gr_x_1_15 = 113; parameter gr_y_1_15 = 285; reg [1:0] gr1_15_on = 0;
parameter gr_x_1_16 = 113; parameter gr_y_1_16 = 303; reg [1:0] gr1_16_on = 0;
parameter gr_x_1_17 = 113; parameter gr_y_1_17 = 321; reg [1:0] gr1_17_on = 0;
parameter gr_x_1_18 = 113; parameter gr_y_1_18 = 339; reg [1:0] gr1_18_on = 0;
parameter gr_x_1_19 = 113; parameter gr_y_1_19 = 357; reg [1:0] gr1_19_on = 0;
parameter gr_x_1_20 = 113; parameter gr_y_1_20 = 375; reg [1:0] gr1_20_on = 0;
parameter gr_x_1_21 = 113; parameter gr_y_1_21 = 393; reg [1:0] gr1_21_on = 0;
parameter gr_x_1_22 = 113; parameter gr_y_1_22 = 411; reg [1:0] gr1_22_on = 0;
parameter gr_x_1_23 = 113; parameter gr_y_1_23 = 429; reg [1:0] gr1_23_on = 0;
parameter gr_x_1_24 = 113; parameter gr_y_1_24 = 447; reg [1:0] gr1_24_on = 0;
parameter gr_x_2_0 = 131; parameter gr_y_2_0 = 15; reg [1:0] gr2_0_on = 0;
parameter gr_x_2_1 = 131; parameter gr_y_2_1 = 33; reg [1:0] gr2_1_on = 0;
parameter gr_x_2_2 = 131; parameter gr_y_2_2 = 51; reg [1:0] gr2_2_on = 0;
parameter gr_x_2_3 = 131; parameter gr_y_2_3 = 69; reg [1:0] gr2_3_on = 0;
parameter gr_x_2_4 = 131; parameter gr_y_2_4 = 87; reg [1:0] gr2_4_on = 0;
parameter gr_x_2_5 = 131; parameter gr_y_2_5 = 105; reg [1:0] gr2_5_on = 0;
parameter gr_x_2_6 = 131; parameter gr_y_2_6 = 123; reg [1:0] gr2_6_on = 0;
parameter gr_x_2_7 = 131; parameter gr_y_2_7 = 141; reg [1:0] gr2_7_on = 0;
parameter gr_x_2_8 = 131; parameter gr_y_2_8 = 159; reg [1:0] gr2_8_on = 0;
parameter gr_x_2_9 = 131; parameter gr_y_2_9 = 177; reg [1:0] gr2_9_on = 0;
parameter gr_x_2_10 = 131; parameter gr_y_2_10 = 195; reg [1:0] gr2_10_on = 0;
parameter gr_x_2_11 = 131; parameter gr_y_2_11 = 213; reg [1:0] gr2_11_on = 0;
parameter gr_x_2_12 = 131; parameter gr_y_2_12 = 231; reg [1:0] gr2_12_on = 0;
parameter gr_x_2_13 = 131; parameter gr_y_2_13 = 249; reg [1:0] gr2_13_on = 0;
parameter gr_x_2_14 = 131; parameter gr_y_2_14 = 267; reg [1:0] gr2_14_on = 0;
parameter gr_x_2_15 = 131; parameter gr_y_2_15 = 285; reg [1:0] gr2_15_on = 0;
parameter gr_x_2_16 = 131; parameter gr_y_2_16 = 303; reg [1:0] gr2_16_on = 0;
parameter gr_x_2_17 = 131; parameter gr_y_2_17 = 321; reg [1:0] gr2_17_on = 0;
parameter gr_x_2_18 = 131; parameter gr_y_2_18 = 339; reg [1:0] gr2_18_on = 0;
parameter gr_x_2_19 = 131; parameter gr_y_2_19 = 357; reg [1:0] gr2_19_on = 0;
parameter gr_x_2_20 = 131; parameter gr_y_2_20 = 375; reg [1:0] gr2_20_on = 0;
parameter gr_x_2_21 = 131; parameter gr_y_2_21 = 393; reg [1:0] gr2_21_on = 0;
parameter gr_x_2_22 = 131; parameter gr_y_2_22 = 411; reg [1:0] gr2_22_on = 0;
parameter gr_x_2_23 = 131; parameter gr_y_2_23 = 429; reg [1:0] gr2_23_on = 0;
parameter gr_x_2_24 = 131; parameter gr_y_2_24 = 447; reg [1:0] gr2_24_on = 0;
parameter gr_x_3_0 = 149; parameter gr_y_3_0 = 15; reg [1:0] gr3_0_on = 0;
parameter gr_x_3_1 = 149; parameter gr_y_3_1 = 33; reg [1:0] gr3_1_on = 0;
parameter gr_x_3_2 = 149; parameter gr_y_3_2 = 51; reg [1:0] gr3_2_on = 0;
parameter gr_x_3_3 = 149; parameter gr_y_3_3 = 69; reg [1:0] gr3_3_on = 0;
parameter gr_x_3_4 = 149; parameter gr_y_3_4 = 87; reg [1:0] gr3_4_on = 0;
parameter gr_x_3_5 = 149; parameter gr_y_3_5 = 105; reg [1:0] gr3_5_on = 0;
parameter gr_x_3_6 = 149; parameter gr_y_3_6 = 123; reg [1:0] gr3_6_on = 0;
parameter gr_x_3_7 = 149; parameter gr_y_3_7 = 141; reg [1:0] gr3_7_on = 0;
parameter gr_x_3_8 = 149; parameter gr_y_3_8 = 159; reg [1:0] gr3_8_on = 0;
parameter gr_x_3_9 = 149; parameter gr_y_3_9 = 177; reg [1:0] gr3_9_on = 0;
parameter gr_x_3_10 = 149; parameter gr_y_3_10 = 195; reg [1:0] gr3_10_on = 0;
parameter gr_x_3_11 = 149; parameter gr_y_3_11 = 213; reg [1:0] gr3_11_on = 0;
parameter gr_x_3_12 = 149; parameter gr_y_3_12 = 231; reg [1:0] gr3_12_on = 0;
parameter gr_x_3_13 = 149; parameter gr_y_3_13 = 249; reg [1:0] gr3_13_on = 0;
parameter gr_x_3_14 = 149; parameter gr_y_3_14 = 267; reg [1:0] gr3_14_on = 0;
parameter gr_x_3_15 = 149; parameter gr_y_3_15 = 285; reg [1:0] gr3_15_on = 0;
parameter gr_x_3_16 = 149; parameter gr_y_3_16 = 303; reg [1:0] gr3_16_on = 0;
parameter gr_x_3_17 = 149; parameter gr_y_3_17 = 321; reg [1:0] gr3_17_on = 0;
parameter gr_x_3_18 = 149; parameter gr_y_3_18 = 339; reg [1:0] gr3_18_on = 0;
parameter gr_x_3_19 = 149; parameter gr_y_3_19 = 357; reg [1:0] gr3_19_on = 0;
parameter gr_x_3_20 = 149; parameter gr_y_3_20 = 375; reg [1:0] gr3_20_on = 0;
parameter gr_x_3_21 = 149; parameter gr_y_3_21 = 393; reg [1:0] gr3_21_on = 0;
parameter gr_x_3_22 = 149; parameter gr_y_3_22 = 411; reg [1:0] gr3_22_on = 0;
parameter gr_x_3_23 = 149; parameter gr_y_3_23 = 429; reg [1:0] gr3_23_on = 0;
parameter gr_x_3_24 = 149; parameter gr_y_3_24 = 447; reg [1:0] gr3_24_on = 0;
parameter gr_x_4_0 = 167; parameter gr_y_4_0 = 15; reg [1:0] gr4_0_on = 0;
parameter gr_x_4_1 = 167; parameter gr_y_4_1 = 33; reg [1:0] gr4_1_on = 0;
parameter gr_x_4_2 = 167; parameter gr_y_4_2 = 51; reg [1:0] gr4_2_on = 0;
parameter gr_x_4_3 = 167; parameter gr_y_4_3 = 69; reg [1:0] gr4_3_on = 0;
parameter gr_x_4_4 = 167; parameter gr_y_4_4 = 87; reg [1:0] gr4_4_on = 0;
parameter gr_x_4_5 = 167; parameter gr_y_4_5 = 105; reg [1:0] gr4_5_on = 0;
parameter gr_x_4_6 = 167; parameter gr_y_4_6 = 123; reg [1:0] gr4_6_on = 0;
parameter gr_x_4_7 = 167; parameter gr_y_4_7 = 141; reg [1:0] gr4_7_on = 0;
parameter gr_x_4_8 = 167; parameter gr_y_4_8 = 159; reg [1:0] gr4_8_on = 0;
parameter gr_x_4_9 = 167; parameter gr_y_4_9 = 177; reg [1:0] gr4_9_on = 0;
parameter gr_x_4_10 = 167; parameter gr_y_4_10 = 195; reg [1:0] gr4_10_on = 0;
parameter gr_x_4_11 = 167; parameter gr_y_4_11 = 213; reg [1:0] gr4_11_on = 0;
parameter gr_x_4_12 = 167; parameter gr_y_4_12 = 231; reg [1:0] gr4_12_on = 0;
parameter gr_x_4_13 = 167; parameter gr_y_4_13 = 249; reg [1:0] gr4_13_on = 0;
parameter gr_x_4_14 = 167; parameter gr_y_4_14 = 267; reg [1:0] gr4_14_on = 0;
parameter gr_x_4_15 = 167; parameter gr_y_4_15 = 285; reg [1:0] gr4_15_on = 0;
parameter gr_x_4_16 = 167; parameter gr_y_4_16 = 303; reg [1:0] gr4_16_on = 0;
parameter gr_x_4_17 = 167; parameter gr_y_4_17 = 321; reg [1:0] gr4_17_on = 0;
parameter gr_x_4_18 = 167; parameter gr_y_4_18 = 339; reg [1:0] gr4_18_on = 0;
parameter gr_x_4_19 = 167; parameter gr_y_4_19 = 357; reg [1:0] gr4_19_on = 0;
parameter gr_x_4_20 = 167; parameter gr_y_4_20 = 375; reg [1:0] gr4_20_on = 0;
parameter gr_x_4_21 = 167; parameter gr_y_4_21 = 393; reg [1:0] gr4_21_on = 0;
parameter gr_x_4_22 = 167; parameter gr_y_4_22 = 411; reg [1:0] gr4_22_on = 0;
parameter gr_x_4_23 = 167; parameter gr_y_4_23 = 429; reg [1:0] gr4_23_on = 0;
parameter gr_x_4_24 = 167; parameter gr_y_4_24 = 447; reg [1:0] gr4_24_on = 0;
parameter gr_x_5_0 = 185; parameter gr_y_5_0 = 15; reg [1:0] gr5_0_on = 0;
parameter gr_x_5_1 = 185; parameter gr_y_5_1 = 33; reg [1:0] gr5_1_on = 0;
parameter gr_x_5_2 = 185; parameter gr_y_5_2 = 51; reg [1:0] gr5_2_on = 0;
parameter gr_x_5_3 = 185; parameter gr_y_5_3 = 69; reg [1:0] gr5_3_on = 0;
parameter gr_x_5_4 = 185; parameter gr_y_5_4 = 87; reg [1:0] gr5_4_on = 0;
parameter gr_x_5_5 = 185; parameter gr_y_5_5 = 105; reg [1:0] gr5_5_on = 0;
parameter gr_x_5_6 = 185; parameter gr_y_5_6 = 123; reg [1:0] gr5_6_on = 0;
parameter gr_x_5_7 = 185; parameter gr_y_5_7 = 141; reg [1:0] gr5_7_on = 0;
parameter gr_x_5_8 = 185; parameter gr_y_5_8 = 159; reg [1:0] gr5_8_on = 0;
parameter gr_x_5_9 = 185; parameter gr_y_5_9 = 177; reg [1:0] gr5_9_on = 0;
parameter gr_x_5_10 = 185; parameter gr_y_5_10 = 195; reg [1:0] gr5_10_on = 0;
parameter gr_x_5_11 = 185; parameter gr_y_5_11 = 213; reg [1:0] gr5_11_on = 0;
parameter gr_x_5_12 = 185; parameter gr_y_5_12 = 231; reg [1:0] gr5_12_on = 0;
parameter gr_x_5_13 = 185; parameter gr_y_5_13 = 249; reg [1:0] gr5_13_on = 0;
parameter gr_x_5_14 = 185; parameter gr_y_5_14 = 267; reg [1:0] gr5_14_on = 0;
parameter gr_x_5_15 = 185; parameter gr_y_5_15 = 285; reg [1:0] gr5_15_on = 0;
parameter gr_x_5_16 = 185; parameter gr_y_5_16 = 303; reg [1:0] gr5_16_on = 0;
parameter gr_x_5_17 = 185; parameter gr_y_5_17 = 321; reg [1:0] gr5_17_on = 0;
parameter gr_x_5_18 = 185; parameter gr_y_5_18 = 339; reg [1:0] gr5_18_on = 0;
parameter gr_x_5_19 = 185; parameter gr_y_5_19 = 357; reg [1:0] gr5_19_on = 0;
parameter gr_x_5_20 = 185; parameter gr_y_5_20 = 375; reg [1:0] gr5_20_on = 0;
parameter gr_x_5_21 = 185; parameter gr_y_5_21 = 393; reg [1:0] gr5_21_on = 0;
parameter gr_x_5_22 = 185; parameter gr_y_5_22 = 411; reg [1:0] gr5_22_on = 0;
parameter gr_x_5_23 = 185; parameter gr_y_5_23 = 429; reg [1:0] gr5_23_on = 0;
parameter gr_x_5_24 = 185; parameter gr_y_5_24 = 447; reg [1:0] gr5_24_on = 0;
parameter gr_x_6_0 = 203; parameter gr_y_6_0 = 15; reg [1:0] gr6_0_on = 0;
parameter gr_x_6_1 = 203; parameter gr_y_6_1 = 33; reg [1:0] gr6_1_on = 0;
parameter gr_x_6_2 = 203; parameter gr_y_6_2 = 51; reg [1:0] gr6_2_on = 0;
parameter gr_x_6_3 = 203; parameter gr_y_6_3 = 69; reg [1:0] gr6_3_on = 0;
parameter gr_x_6_4 = 203; parameter gr_y_6_4 = 87; reg [1:0] gr6_4_on = 0;
parameter gr_x_6_5 = 203; parameter gr_y_6_5 = 105; reg [1:0] gr6_5_on = 0;
parameter gr_x_6_6 = 203; parameter gr_y_6_6 = 123; reg [1:0] gr6_6_on = 0;
parameter gr_x_6_7 = 203; parameter gr_y_6_7 = 141; reg [1:0] gr6_7_on = 0;
parameter gr_x_6_8 = 203; parameter gr_y_6_8 = 159; reg [1:0] gr6_8_on = 0;
parameter gr_x_6_9 = 203; parameter gr_y_6_9 = 177; reg [1:0] gr6_9_on = 0;
parameter gr_x_6_10 = 203; parameter gr_y_6_10 = 195; reg [1:0] gr6_10_on = 0;
parameter gr_x_6_11 = 203; parameter gr_y_6_11 = 213; reg [1:0] gr6_11_on = 0;
parameter gr_x_6_12 = 203; parameter gr_y_6_12 = 231; reg [1:0] gr6_12_on = 0;
parameter gr_x_6_13 = 203; parameter gr_y_6_13 = 249; reg [1:0] gr6_13_on = 0;
parameter gr_x_6_14 = 203; parameter gr_y_6_14 = 267; reg [1:0] gr6_14_on = 0;
parameter gr_x_6_15 = 203; parameter gr_y_6_15 = 285; reg [1:0] gr6_15_on = 0;
parameter gr_x_6_16 = 203; parameter gr_y_6_16 = 303; reg [1:0] gr6_16_on = 0;
parameter gr_x_6_17 = 203; parameter gr_y_6_17 = 321; reg [1:0] gr6_17_on = 0;
parameter gr_x_6_18 = 203; parameter gr_y_6_18 = 339; reg [1:0] gr6_18_on = 0;
parameter gr_x_6_19 = 203; parameter gr_y_6_19 = 357; reg [1:0] gr6_19_on = 0;
parameter gr_x_6_20 = 203; parameter gr_y_6_20 = 375; reg [1:0] gr6_20_on = 0;
parameter gr_x_6_21 = 203; parameter gr_y_6_21 = 393; reg [1:0] gr6_21_on = 0;
parameter gr_x_6_22 = 203; parameter gr_y_6_22 = 411; reg [1:0] gr6_22_on = 0;
parameter gr_x_6_23 = 203; parameter gr_y_6_23 = 429; reg [1:0] gr6_23_on = 0;
parameter gr_x_6_24 = 203; parameter gr_y_6_24 = 447; reg [1:0] gr6_24_on = 0;
parameter gr_x_7_0 = 221; parameter gr_y_7_0 = 15; reg [1:0] gr7_0_on = 0;
parameter gr_x_7_1 = 221; parameter gr_y_7_1 = 33; reg [1:0] gr7_1_on = 0;
parameter gr_x_7_2 = 221; parameter gr_y_7_2 = 51; reg [1:0] gr7_2_on = 0;
parameter gr_x_7_3 = 221; parameter gr_y_7_3 = 69; reg [1:0] gr7_3_on = 0;
parameter gr_x_7_4 = 221; parameter gr_y_7_4 = 87; reg [1:0] gr7_4_on = 0;
parameter gr_x_7_5 = 221; parameter gr_y_7_5 = 105; reg [1:0] gr7_5_on = 0;
parameter gr_x_7_6 = 221; parameter gr_y_7_6 = 123; reg [1:0] gr7_6_on = 0;
parameter gr_x_7_7 = 221; parameter gr_y_7_7 = 141; reg [1:0] gr7_7_on = 0;
parameter gr_x_7_8 = 221; parameter gr_y_7_8 = 159; reg [1:0] gr7_8_on = 0;
parameter gr_x_7_9 = 221; parameter gr_y_7_9 = 177; reg [1:0] gr7_9_on = 0;
parameter gr_x_7_10 = 221; parameter gr_y_7_10 = 195; reg [1:0] gr7_10_on = 0;
parameter gr_x_7_11 = 221; parameter gr_y_7_11 = 213; reg [1:0] gr7_11_on = 0;
parameter gr_x_7_12 = 221; parameter gr_y_7_12 = 231; reg [1:0] gr7_12_on = 0;
parameter gr_x_7_13 = 221; parameter gr_y_7_13 = 249; reg [1:0] gr7_13_on = 0;
parameter gr_x_7_14 = 221; parameter gr_y_7_14 = 267; reg [1:0] gr7_14_on = 0;
parameter gr_x_7_15 = 221; parameter gr_y_7_15 = 285; reg [1:0] gr7_15_on = 0;
parameter gr_x_7_16 = 221; parameter gr_y_7_16 = 303; reg [1:0] gr7_16_on = 0;
parameter gr_x_7_17 = 221; parameter gr_y_7_17 = 321; reg [1:0] gr7_17_on = 0;
parameter gr_x_7_18 = 221; parameter gr_y_7_18 = 339; reg [1:0] gr7_18_on = 0;
parameter gr_x_7_19 = 221; parameter gr_y_7_19 = 357; reg [1:0] gr7_19_on = 0;
parameter gr_x_7_20 = 221; parameter gr_y_7_20 = 375; reg [1:0] gr7_20_on = 0;
parameter gr_x_7_21 = 221; parameter gr_y_7_21 = 393; reg [1:0] gr7_21_on = 0;
parameter gr_x_7_22 = 221; parameter gr_y_7_22 = 411; reg [1:0] gr7_22_on = 0;
parameter gr_x_7_23 = 221; parameter gr_y_7_23 = 429; reg [1:0] gr7_23_on = 0;
parameter gr_x_7_24 = 221; parameter gr_y_7_24 = 447; reg [1:0] gr7_24_on = 0;
parameter gr_x_8_0 = 239; parameter gr_y_8_0 = 15; reg [1:0] gr8_0_on = 0;
parameter gr_x_8_1 = 239; parameter gr_y_8_1 = 33; reg [1:0] gr8_1_on = 0;
parameter gr_x_8_2 = 239; parameter gr_y_8_2 = 51; reg [1:0] gr8_2_on = 0;
parameter gr_x_8_3 = 239; parameter gr_y_8_3 = 69; reg [1:0] gr8_3_on = 0;
parameter gr_x_8_4 = 239; parameter gr_y_8_4 = 87; reg [1:0] gr8_4_on = 0;
parameter gr_x_8_5 = 239; parameter gr_y_8_5 = 105; reg [1:0] gr8_5_on = 0;
parameter gr_x_8_6 = 239; parameter gr_y_8_6 = 123; reg [1:0] gr8_6_on = 0;
parameter gr_x_8_7 = 239; parameter gr_y_8_7 = 141; reg [1:0] gr8_7_on = 0;
parameter gr_x_8_8 = 239; parameter gr_y_8_8 = 159; reg [1:0] gr8_8_on = 0;
parameter gr_x_8_9 = 239; parameter gr_y_8_9 = 177; reg [1:0] gr8_9_on = 0;
parameter gr_x_8_10 = 239; parameter gr_y_8_10 = 195; reg [1:0] gr8_10_on = 0;
parameter gr_x_8_11 = 239; parameter gr_y_8_11 = 213; reg [1:0] gr8_11_on = 0;
parameter gr_x_8_12 = 239; parameter gr_y_8_12 = 231; reg [1:0] gr8_12_on = 0;
parameter gr_x_8_13 = 239; parameter gr_y_8_13 = 249; reg [1:0] gr8_13_on = 0;
parameter gr_x_8_14 = 239; parameter gr_y_8_14 = 267; reg [1:0] gr8_14_on = 0;
parameter gr_x_8_15 = 239; parameter gr_y_8_15 = 285; reg [1:0] gr8_15_on = 0;
parameter gr_x_8_16 = 239; parameter gr_y_8_16 = 303; reg [1:0] gr8_16_on = 0;
parameter gr_x_8_17 = 239; parameter gr_y_8_17 = 321; reg [1:0] gr8_17_on = 0;
parameter gr_x_8_18 = 239; parameter gr_y_8_18 = 339; reg [1:0] gr8_18_on = 0;
parameter gr_x_8_19 = 239; parameter gr_y_8_19 = 357; reg [1:0] gr8_19_on = 0;
parameter gr_x_8_20 = 239; parameter gr_y_8_20 = 375; reg [1:0] gr8_20_on = 0;
parameter gr_x_8_21 = 239; parameter gr_y_8_21 = 393; reg [1:0] gr8_21_on = 0;
parameter gr_x_8_22 = 239; parameter gr_y_8_22 = 411; reg [1:0] gr8_22_on = 0;
parameter gr_x_8_23 = 239; parameter gr_y_8_23 = 429; reg [1:0] gr8_23_on = 0;
parameter gr_x_8_24 = 239; parameter gr_y_8_24 = 447; reg [1:0] gr8_24_on = 0;
parameter gr_x_9_0 = 257; parameter gr_y_9_0 = 15; reg [1:0] gr9_0_on = 0;
parameter gr_x_9_1 = 257; parameter gr_y_9_1 = 33; reg [1:0] gr9_1_on = 0;
parameter gr_x_9_2 = 257; parameter gr_y_9_2 = 51; reg [1:0] gr9_2_on = 0;
parameter gr_x_9_3 = 257; parameter gr_y_9_3 = 69; reg [1:0] gr9_3_on = 0;
parameter gr_x_9_4 = 257; parameter gr_y_9_4 = 87; reg [1:0] gr9_4_on = 0;
parameter gr_x_9_5 = 257; parameter gr_y_9_5 = 105; reg [1:0] gr9_5_on = 0;
parameter gr_x_9_6 = 257; parameter gr_y_9_6 = 123; reg [1:0] gr9_6_on = 0;
parameter gr_x_9_7 = 257; parameter gr_y_9_7 = 141; reg [1:0] gr9_7_on = 0;
parameter gr_x_9_8 = 257; parameter gr_y_9_8 = 159; reg [1:0] gr9_8_on = 0;
parameter gr_x_9_9 = 257; parameter gr_y_9_9 = 177; reg [1:0] gr9_9_on = 0;
parameter gr_x_9_10 = 257; parameter gr_y_9_10 = 195; reg [1:0] gr9_10_on = 0;
parameter gr_x_9_11 = 257; parameter gr_y_9_11 = 213; reg [1:0] gr9_11_on = 0;
parameter gr_x_9_12 = 257; parameter gr_y_9_12 = 231; reg [1:0] gr9_12_on = 0;
parameter gr_x_9_13 = 257; parameter gr_y_9_13 = 249; reg [1:0] gr9_13_on = 0;
parameter gr_x_9_14 = 257; parameter gr_y_9_14 = 267; reg [1:0] gr9_14_on = 0;
parameter gr_x_9_15 = 257; parameter gr_y_9_15 = 285; reg [1:0] gr9_15_on = 0;
parameter gr_x_9_16 = 257; parameter gr_y_9_16 = 303; reg [1:0] gr9_16_on = 0;
parameter gr_x_9_17 = 257; parameter gr_y_9_17 = 321; reg [1:0] gr9_17_on = 0;
parameter gr_x_9_18 = 257; parameter gr_y_9_18 = 339; reg [1:0] gr9_18_on = 0;
parameter gr_x_9_19 = 257; parameter gr_y_9_19 = 357; reg [1:0] gr9_19_on = 0;
parameter gr_x_9_20 = 257; parameter gr_y_9_20 = 375; reg [1:0] gr9_20_on = 0;
parameter gr_x_9_21 = 257; parameter gr_y_9_21 = 393; reg [1:0] gr9_21_on = 0;
parameter gr_x_9_22 = 257; parameter gr_y_9_22 = 411; reg [1:0] gr9_22_on = 0;
parameter gr_x_9_23 = 257; parameter gr_y_9_23 = 429; reg [1:0] gr9_23_on = 0;
parameter gr_x_9_24 = 257; parameter gr_y_9_24 = 447; reg [1:0] gr9_24_on = 0;
parameter gr_x_10_0 = 275; parameter gr_y_10_0 = 15; reg [1:0] gr10_0_on = 0;
parameter gr_x_10_1 = 275; parameter gr_y_10_1 = 33; reg [1:0] gr10_1_on = 0;
parameter gr_x_10_2 = 275; parameter gr_y_10_2 = 51; reg [1:0] gr10_2_on = 0;
parameter gr_x_10_3 = 275; parameter gr_y_10_3 = 69; reg [1:0] gr10_3_on = 0;
parameter gr_x_10_4 = 275; parameter gr_y_10_4 = 87; reg [1:0] gr10_4_on = 0;
parameter gr_x_10_5 = 275; parameter gr_y_10_5 = 105; reg [1:0] gr10_5_on = 0;
parameter gr_x_10_6 = 275; parameter gr_y_10_6 = 123; reg [1:0] gr10_6_on = 0;
parameter gr_x_10_7 = 275; parameter gr_y_10_7 = 141; reg [1:0] gr10_7_on = 0;
parameter gr_x_10_8 = 275; parameter gr_y_10_8 = 159; reg [1:0] gr10_8_on = 0;
parameter gr_x_10_9 = 275; parameter gr_y_10_9 = 177; reg [1:0] gr10_9_on = 0;
parameter gr_x_10_10 = 275; parameter gr_y_10_10 = 195; reg [1:0] gr10_10_on = 0;
parameter gr_x_10_11 = 275; parameter gr_y_10_11 = 213; reg [1:0] gr10_11_on = 0;
parameter gr_x_10_12 = 275; parameter gr_y_10_12 = 231; reg [1:0] gr10_12_on = 0;
parameter gr_x_10_13 = 275; parameter gr_y_10_13 = 249; reg [1:0] gr10_13_on = 0;
parameter gr_x_10_14 = 275; parameter gr_y_10_14 = 267; reg [1:0] gr10_14_on = 0;
parameter gr_x_10_15 = 275; parameter gr_y_10_15 = 285; reg [1:0] gr10_15_on = 0;
parameter gr_x_10_16 = 275; parameter gr_y_10_16 = 303; reg [1:0] gr10_16_on = 0;
parameter gr_x_10_17 = 275; parameter gr_y_10_17 = 321; reg [1:0] gr10_17_on = 0;
parameter gr_x_10_18 = 275; parameter gr_y_10_18 = 339; reg [1:0] gr10_18_on = 0;
parameter gr_x_10_19 = 275; parameter gr_y_10_19 = 357; reg [1:0] gr10_19_on = 0;
parameter gr_x_10_20 = 275; parameter gr_y_10_20 = 375; reg [1:0] gr10_20_on = 0;
parameter gr_x_10_21 = 275; parameter gr_y_10_21 = 393; reg [1:0] gr10_21_on = 0;
parameter gr_x_10_22 = 275; parameter gr_y_10_22 = 411; reg [1:0] gr10_22_on = 0;
parameter gr_x_10_23 = 275; parameter gr_y_10_23 = 429; reg [1:0] gr10_23_on = 0;
parameter gr_x_10_24 = 275; parameter gr_y_10_24 = 447; reg [1:0] gr10_24_on = 0;
parameter gr_x_11_0 = 293; parameter gr_y_11_0 = 15; reg [1:0] gr11_0_on = 0;
parameter gr_x_11_1 = 293; parameter gr_y_11_1 = 33; reg [1:0] gr11_1_on = 0;
parameter gr_x_11_2 = 293; parameter gr_y_11_2 = 51; reg [1:0] gr11_2_on = 0;
parameter gr_x_11_3 = 293; parameter gr_y_11_3 = 69; reg [1:0] gr11_3_on = 0;
parameter gr_x_11_4 = 293; parameter gr_y_11_4 = 87; reg [1:0] gr11_4_on = 0;
parameter gr_x_11_5 = 293; parameter gr_y_11_5 = 105; reg [1:0] gr11_5_on = 0;
parameter gr_x_11_6 = 293; parameter gr_y_11_6 = 123; reg [1:0] gr11_6_on = 0;
parameter gr_x_11_7 = 293; parameter gr_y_11_7 = 141; reg [1:0] gr11_7_on = 0;
parameter gr_x_11_8 = 293; parameter gr_y_11_8 = 159; reg [1:0] gr11_8_on = 0;
parameter gr_x_11_9 = 293; parameter gr_y_11_9 = 177; reg [1:0] gr11_9_on = 0;
parameter gr_x_11_10 = 293; parameter gr_y_11_10 = 195; reg [1:0] gr11_10_on = 0;
parameter gr_x_11_11 = 293; parameter gr_y_11_11 = 213; reg [1:0] gr11_11_on = 0;
parameter gr_x_11_12 = 293; parameter gr_y_11_12 = 231; reg [1:0] gr11_12_on = 0;
parameter gr_x_11_13 = 293; parameter gr_y_11_13 = 249; reg [1:0] gr11_13_on = 0;
parameter gr_x_11_14 = 293; parameter gr_y_11_14 = 267; reg [1:0] gr11_14_on = 0;
parameter gr_x_11_15 = 293; parameter gr_y_11_15 = 285; reg [1:0] gr11_15_on = 0;
parameter gr_x_11_16 = 293; parameter gr_y_11_16 = 303; reg [1:0] gr11_16_on = 0;
parameter gr_x_11_17 = 293; parameter gr_y_11_17 = 321; reg [1:0] gr11_17_on = 0;
parameter gr_x_11_18 = 293; parameter gr_y_11_18 = 339; reg [1:0] gr11_18_on = 0;
parameter gr_x_11_19 = 293; parameter gr_y_11_19 = 357; reg [1:0] gr11_19_on = 0;
parameter gr_x_11_20 = 293; parameter gr_y_11_20 = 375; reg [1:0] gr11_20_on = 0;
parameter gr_x_11_21 = 293; parameter gr_y_11_21 = 393; reg [1:0] gr11_21_on = 0;
parameter gr_x_11_22 = 293; parameter gr_y_11_22 = 411; reg [1:0] gr11_22_on = 0;
parameter gr_x_11_23 = 293; parameter gr_y_11_23 = 429; reg [1:0] gr11_23_on = 0;
parameter gr_x_11_24 = 293; parameter gr_y_11_24 = 447; reg [1:0] gr11_24_on = 0;
parameter gr_x_12_0 = 311; parameter gr_y_12_0 = 15; reg [1:0] gr12_0_on = 0;
parameter gr_x_12_1 = 311; parameter gr_y_12_1 = 33; reg [1:0] gr12_1_on = 0;
parameter gr_x_12_2 = 311; parameter gr_y_12_2 = 51; reg [1:0] gr12_2_on = 0;
parameter gr_x_12_3 = 311; parameter gr_y_12_3 = 69; reg [1:0] gr12_3_on = 0;
parameter gr_x_12_4 = 311; parameter gr_y_12_4 = 87; reg [1:0] gr12_4_on = 0;
parameter gr_x_12_5 = 311; parameter gr_y_12_5 = 105; reg [1:0] gr12_5_on = 0;
parameter gr_x_12_6 = 311; parameter gr_y_12_6 = 123; reg [1:0] gr12_6_on = 0;
parameter gr_x_12_7 = 311; parameter gr_y_12_7 = 141; reg [1:0] gr12_7_on = 0;
parameter gr_x_12_8 = 311; parameter gr_y_12_8 = 159; reg [1:0] gr12_8_on = 0;
parameter gr_x_12_9 = 311; parameter gr_y_12_9 = 177; reg [1:0] gr12_9_on = 0;
parameter gr_x_12_10 = 311; parameter gr_y_12_10 = 195; reg [1:0] gr12_10_on = 0;
parameter gr_x_12_11 = 311; parameter gr_y_12_11 = 213; reg [1:0] gr12_11_on = 0;
parameter gr_x_12_12 = 311; parameter gr_y_12_12 = 231; reg [1:0] gr12_12_on = 0;
parameter gr_x_12_13 = 311; parameter gr_y_12_13 = 249; reg [1:0] gr12_13_on = 0;
parameter gr_x_12_14 = 311; parameter gr_y_12_14 = 267; reg [1:0] gr12_14_on = 0;
parameter gr_x_12_15 = 311; parameter gr_y_12_15 = 285; reg [1:0] gr12_15_on = 0;
parameter gr_x_12_16 = 311; parameter gr_y_12_16 = 303; reg [1:0] gr12_16_on = 0;
parameter gr_x_12_17 = 311; parameter gr_y_12_17 = 321; reg [1:0] gr12_17_on = 0;
parameter gr_x_12_18 = 311; parameter gr_y_12_18 = 339; reg [1:0] gr12_18_on = 0;
parameter gr_x_12_19 = 311; parameter gr_y_12_19 = 357; reg [1:0] gr12_19_on = 0;
parameter gr_x_12_20 = 311; parameter gr_y_12_20 = 375; reg [1:0] gr12_20_on = 0;
parameter gr_x_12_21 = 311; parameter gr_y_12_21 = 393; reg [1:0] gr12_21_on = 0;
parameter gr_x_12_22 = 311; parameter gr_y_12_22 = 411; reg [1:0] gr12_22_on = 0;
parameter gr_x_12_23 = 311; parameter gr_y_12_23 = 429; reg [1:0] gr12_23_on = 0;
parameter gr_x_12_24 = 311; parameter gr_y_12_24 = 447; reg [1:0] gr12_24_on = 0;
parameter gr_x_13_0 = 329; parameter gr_y_13_0 = 15; reg [1:0] gr13_0_on = 0;
parameter gr_x_13_1 = 329; parameter gr_y_13_1 = 33; reg [1:0] gr13_1_on = 0;
parameter gr_x_13_2 = 329; parameter gr_y_13_2 = 51; reg [1:0] gr13_2_on = 0;
parameter gr_x_13_3 = 329; parameter gr_y_13_3 = 69; reg [1:0] gr13_3_on = 0;
parameter gr_x_13_4 = 329; parameter gr_y_13_4 = 87; reg [1:0] gr13_4_on = 0;
parameter gr_x_13_5 = 329; parameter gr_y_13_5 = 105; reg [1:0] gr13_5_on = 0;
parameter gr_x_13_6 = 329; parameter gr_y_13_6 = 123; reg [1:0] gr13_6_on = 0;
parameter gr_x_13_7 = 329; parameter gr_y_13_7 = 141; reg [1:0] gr13_7_on = 0;
parameter gr_x_13_8 = 329; parameter gr_y_13_8 = 159; reg [1:0] gr13_8_on = 0;
parameter gr_x_13_9 = 329; parameter gr_y_13_9 = 177; reg [1:0] gr13_9_on = 0;
parameter gr_x_13_10 = 329; parameter gr_y_13_10 = 195; reg [1:0] gr13_10_on = 0;
parameter gr_x_13_11 = 329; parameter gr_y_13_11 = 213; reg [1:0] gr13_11_on = 0;
parameter gr_x_13_12 = 329; parameter gr_y_13_12 = 231; reg [1:0] gr13_12_on = 0;
parameter gr_x_13_13 = 329; parameter gr_y_13_13 = 249; reg [1:0] gr13_13_on = 0;
parameter gr_x_13_14 = 329; parameter gr_y_13_14 = 267; reg [1:0] gr13_14_on = 0;
parameter gr_x_13_15 = 329; parameter gr_y_13_15 = 285; reg [1:0] gr13_15_on = 0;
parameter gr_x_13_16 = 329; parameter gr_y_13_16 = 303; reg [1:0] gr13_16_on = 0;
parameter gr_x_13_17 = 329; parameter gr_y_13_17 = 321; reg [1:0] gr13_17_on = 0;
parameter gr_x_13_18 = 329; parameter gr_y_13_18 = 339; reg [1:0] gr13_18_on = 0;
parameter gr_x_13_19 = 329; parameter gr_y_13_19 = 357; reg [1:0] gr13_19_on = 0;
parameter gr_x_13_20 = 329; parameter gr_y_13_20 = 375; reg [1:0] gr13_20_on = 0;
parameter gr_x_13_21 = 329; parameter gr_y_13_21 = 393; reg [1:0] gr13_21_on = 0;
parameter gr_x_13_22 = 329; parameter gr_y_13_22 = 411; reg [1:0] gr13_22_on = 0;
parameter gr_x_13_23 = 329; parameter gr_y_13_23 = 429; reg [1:0] gr13_23_on = 0;
parameter gr_x_13_24 = 329; parameter gr_y_13_24 = 447; reg [1:0] gr13_24_on = 0;
parameter gr_x_14_0 = 347; parameter gr_y_14_0 = 15; reg [1:0] gr14_0_on = 0;
parameter gr_x_14_1 = 347; parameter gr_y_14_1 = 33; reg [1:0] gr14_1_on = 0;
parameter gr_x_14_2 = 347; parameter gr_y_14_2 = 51; reg [1:0] gr14_2_on = 0;
parameter gr_x_14_3 = 347; parameter gr_y_14_3 = 69; reg [1:0] gr14_3_on = 0;
parameter gr_x_14_4 = 347; parameter gr_y_14_4 = 87; reg [1:0] gr14_4_on = 0;
parameter gr_x_14_5 = 347; parameter gr_y_14_5 = 105; reg [1:0] gr14_5_on = 0;
parameter gr_x_14_6 = 347; parameter gr_y_14_6 = 123; reg [1:0] gr14_6_on = 0;
parameter gr_x_14_7 = 347; parameter gr_y_14_7 = 141; reg [1:0] gr14_7_on = 0;
parameter gr_x_14_8 = 347; parameter gr_y_14_8 = 159; reg [1:0] gr14_8_on = 0;
parameter gr_x_14_9 = 347; parameter gr_y_14_9 = 177; reg [1:0] gr14_9_on = 0;
parameter gr_x_14_10 = 347; parameter gr_y_14_10 = 195; reg [1:0] gr14_10_on = 0;
parameter gr_x_14_11 = 347; parameter gr_y_14_11 = 213; reg [1:0] gr14_11_on = 0;
parameter gr_x_14_12 = 347; parameter gr_y_14_12 = 231; reg [1:0] gr14_12_on = 0;
parameter gr_x_14_13 = 347; parameter gr_y_14_13 = 249; reg [1:0] gr14_13_on = 0;
parameter gr_x_14_14 = 347; parameter gr_y_14_14 = 267; reg [1:0] gr14_14_on = 0;
parameter gr_x_14_15 = 347; parameter gr_y_14_15 = 285; reg [1:0] gr14_15_on = 0;
parameter gr_x_14_16 = 347; parameter gr_y_14_16 = 303; reg [1:0] gr14_16_on = 0;
parameter gr_x_14_17 = 347; parameter gr_y_14_17 = 321; reg [1:0] gr14_17_on = 0;
parameter gr_x_14_18 = 347; parameter gr_y_14_18 = 339; reg [1:0] gr14_18_on = 0;
parameter gr_x_14_19 = 347; parameter gr_y_14_19 = 357; reg [1:0] gr14_19_on = 0;
parameter gr_x_14_20 = 347; parameter gr_y_14_20 = 375; reg [1:0] gr14_20_on = 0;
parameter gr_x_14_21 = 347; parameter gr_y_14_21 = 393; reg [1:0] gr14_21_on = 0;
parameter gr_x_14_22 = 347; parameter gr_y_14_22 = 411; reg [1:0] gr14_22_on = 0;
parameter gr_x_14_23 = 347; parameter gr_y_14_23 = 429; reg [1:0] gr14_23_on = 0;
parameter gr_x_14_24 = 347; parameter gr_y_14_24 = 447; reg [1:0] gr14_24_on = 0;
parameter gr_x_15_0 = 365; parameter gr_y_15_0 = 15; reg [1:0] gr15_0_on = 0;
parameter gr_x_15_1 = 365; parameter gr_y_15_1 = 33; reg [1:0] gr15_1_on = 0;
parameter gr_x_15_2 = 365; parameter gr_y_15_2 = 51; reg [1:0] gr15_2_on = 0;
parameter gr_x_15_3 = 365; parameter gr_y_15_3 = 69; reg [1:0] gr15_3_on = 0;
parameter gr_x_15_4 = 365; parameter gr_y_15_4 = 87; reg [1:0] gr15_4_on = 0;
parameter gr_x_15_5 = 365; parameter gr_y_15_5 = 105; reg [1:0] gr15_5_on = 0;
parameter gr_x_15_6 = 365; parameter gr_y_15_6 = 123; reg [1:0] gr15_6_on = 0;
parameter gr_x_15_7 = 365; parameter gr_y_15_7 = 141; reg [1:0] gr15_7_on = 0;
parameter gr_x_15_8 = 365; parameter gr_y_15_8 = 159; reg [1:0] gr15_8_on = 0;
parameter gr_x_15_9 = 365; parameter gr_y_15_9 = 177; reg [1:0] gr15_9_on = 0;
parameter gr_x_15_10 = 365; parameter gr_y_15_10 = 195; reg [1:0] gr15_10_on = 0;
parameter gr_x_15_11 = 365; parameter gr_y_15_11 = 213; reg [1:0] gr15_11_on = 0;
parameter gr_x_15_12 = 365; parameter gr_y_15_12 = 231; reg [1:0] gr15_12_on = 0;
parameter gr_x_15_13 = 365; parameter gr_y_15_13 = 249; reg [1:0] gr15_13_on = 0;
parameter gr_x_15_14 = 365; parameter gr_y_15_14 = 267; reg [1:0] gr15_14_on = 0;
parameter gr_x_15_15 = 365; parameter gr_y_15_15 = 285; reg [1:0] gr15_15_on = 0;
parameter gr_x_15_16 = 365; parameter gr_y_15_16 = 303; reg [1:0] gr15_16_on = 0;
parameter gr_x_15_17 = 365; parameter gr_y_15_17 = 321; reg [1:0] gr15_17_on = 0;
parameter gr_x_15_18 = 365; parameter gr_y_15_18 = 339; reg [1:0] gr15_18_on = 0;
parameter gr_x_15_19 = 365; parameter gr_y_15_19 = 357; reg [1:0] gr15_19_on = 0;
parameter gr_x_15_20 = 365; parameter gr_y_15_20 = 375; reg [1:0] gr15_20_on = 0;
parameter gr_x_15_21 = 365; parameter gr_y_15_21 = 393; reg [1:0] gr15_21_on = 0;
parameter gr_x_15_22 = 365; parameter gr_y_15_22 = 411; reg [1:0] gr15_22_on = 0;
parameter gr_x_15_23 = 365; parameter gr_y_15_23 = 429; reg [1:0] gr15_23_on = 0;
parameter gr_x_15_24 = 365; parameter gr_y_15_24 = 447; reg [1:0] gr15_24_on = 0;
parameter gr_x_16_0 = 383; parameter gr_y_16_0 = 15; reg [1:0] gr16_0_on = 0;
parameter gr_x_16_1 = 383; parameter gr_y_16_1 = 33; reg [1:0] gr16_1_on = 0;
parameter gr_x_16_2 = 383; parameter gr_y_16_2 = 51; reg [1:0] gr16_2_on = 0;
parameter gr_x_16_3 = 383; parameter gr_y_16_3 = 69; reg [1:0] gr16_3_on = 0;
parameter gr_x_16_4 = 383; parameter gr_y_16_4 = 87; reg [1:0] gr16_4_on = 0;
parameter gr_x_16_5 = 383; parameter gr_y_16_5 = 105; reg [1:0] gr16_5_on = 0;
parameter gr_x_16_6 = 383; parameter gr_y_16_6 = 123; reg [1:0] gr16_6_on = 0;
parameter gr_x_16_7 = 383; parameter gr_y_16_7 = 141; reg [1:0] gr16_7_on = 0;
parameter gr_x_16_8 = 383; parameter gr_y_16_8 = 159; reg [1:0] gr16_8_on = 0;
parameter gr_x_16_9 = 383; parameter gr_y_16_9 = 177; reg [1:0] gr16_9_on = 0;
parameter gr_x_16_10 = 383; parameter gr_y_16_10 = 195; reg [1:0] gr16_10_on = 0;
parameter gr_x_16_11 = 383; parameter gr_y_16_11 = 213; reg [1:0] gr16_11_on = 0;
parameter gr_x_16_12 = 383; parameter gr_y_16_12 = 231; reg [1:0] gr16_12_on = 0;
parameter gr_x_16_13 = 383; parameter gr_y_16_13 = 249; reg [1:0] gr16_13_on = 0;
parameter gr_x_16_14 = 383; parameter gr_y_16_14 = 267; reg [1:0] gr16_14_on = 0;
parameter gr_x_16_15 = 383; parameter gr_y_16_15 = 285; reg [1:0] gr16_15_on = 0;
parameter gr_x_16_16 = 383; parameter gr_y_16_16 = 303; reg [1:0] gr16_16_on = 0;
parameter gr_x_16_17 = 383; parameter gr_y_16_17 = 321; reg [1:0] gr16_17_on = 0;
parameter gr_x_16_18 = 383; parameter gr_y_16_18 = 339; reg [1:0] gr16_18_on = 0;
parameter gr_x_16_19 = 383; parameter gr_y_16_19 = 357; reg [1:0] gr16_19_on = 0;
parameter gr_x_16_20 = 383; parameter gr_y_16_20 = 375; reg [1:0] gr16_20_on = 0;
parameter gr_x_16_21 = 383; parameter gr_y_16_21 = 393; reg [1:0] gr16_21_on = 0;
parameter gr_x_16_22 = 383; parameter gr_y_16_22 = 411; reg [1:0] gr16_22_on = 0;
parameter gr_x_16_23 = 383; parameter gr_y_16_23 = 429; reg [1:0] gr16_23_on = 0;
parameter gr_x_16_24 = 383; parameter gr_y_16_24 = 447; reg [1:0] gr16_24_on = 0;
parameter gr_x_17_0 = 401; parameter gr_y_17_0 = 15; reg [1:0] gr17_0_on = 0;
parameter gr_x_17_1 = 401; parameter gr_y_17_1 = 33; reg [1:0] gr17_1_on = 0;
parameter gr_x_17_2 = 401; parameter gr_y_17_2 = 51; reg [1:0] gr17_2_on = 0;
parameter gr_x_17_3 = 401; parameter gr_y_17_3 = 69; reg [1:0] gr17_3_on = 0;
parameter gr_x_17_4 = 401; parameter gr_y_17_4 = 87; reg [1:0] gr17_4_on = 0;
parameter gr_x_17_5 = 401; parameter gr_y_17_5 = 105; reg [1:0] gr17_5_on = 0;
parameter gr_x_17_6 = 401; parameter gr_y_17_6 = 123; reg [1:0] gr17_6_on = 0;
parameter gr_x_17_7 = 401; parameter gr_y_17_7 = 141; reg [1:0] gr17_7_on = 0;
parameter gr_x_17_8 = 401; parameter gr_y_17_8 = 159; reg [1:0] gr17_8_on = 0;
parameter gr_x_17_9 = 401; parameter gr_y_17_9 = 177; reg [1:0] gr17_9_on = 0;
parameter gr_x_17_10 = 401; parameter gr_y_17_10 = 195; reg [1:0] gr17_10_on = 0;
parameter gr_x_17_11 = 401; parameter gr_y_17_11 = 213; reg [1:0] gr17_11_on = 0;
parameter gr_x_17_12 = 401; parameter gr_y_17_12 = 231; reg [1:0] gr17_12_on = 0;
parameter gr_x_17_13 = 401; parameter gr_y_17_13 = 249; reg [1:0] gr17_13_on = 0;
parameter gr_x_17_14 = 401; parameter gr_y_17_14 = 267; reg [1:0] gr17_14_on = 0;
parameter gr_x_17_15 = 401; parameter gr_y_17_15 = 285; reg [1:0] gr17_15_on = 0;
parameter gr_x_17_16 = 401; parameter gr_y_17_16 = 303; reg [1:0] gr17_16_on = 0;
parameter gr_x_17_17 = 401; parameter gr_y_17_17 = 321; reg [1:0] gr17_17_on = 0;
parameter gr_x_17_18 = 401; parameter gr_y_17_18 = 339; reg [1:0] gr17_18_on = 0;
parameter gr_x_17_19 = 401; parameter gr_y_17_19 = 357; reg [1:0] gr17_19_on = 0;
parameter gr_x_17_20 = 401; parameter gr_y_17_20 = 375; reg [1:0] gr17_20_on = 0;
parameter gr_x_17_21 = 401; parameter gr_y_17_21 = 393; reg [1:0] gr17_21_on = 0;
parameter gr_x_17_22 = 401; parameter gr_y_17_22 = 411; reg [1:0] gr17_22_on = 0;
parameter gr_x_17_23 = 401; parameter gr_y_17_23 = 429; reg [1:0] gr17_23_on = 0;
parameter gr_x_17_24 = 401; parameter gr_y_17_24 = 447; reg [1:0] gr17_24_on = 0;
parameter gr_x_18_0 = 419; parameter gr_y_18_0 = 15; reg [1:0] gr18_0_on = 0;
parameter gr_x_18_1 = 419; parameter gr_y_18_1 = 33; reg [1:0] gr18_1_on = 0;
parameter gr_x_18_2 = 419; parameter gr_y_18_2 = 51; reg [1:0] gr18_2_on = 0;
parameter gr_x_18_3 = 419; parameter gr_y_18_3 = 69; reg [1:0] gr18_3_on = 0;
parameter gr_x_18_4 = 419; parameter gr_y_18_4 = 87; reg [1:0] gr18_4_on = 0;
parameter gr_x_18_5 = 419; parameter gr_y_18_5 = 105; reg [1:0] gr18_5_on = 0;
parameter gr_x_18_6 = 419; parameter gr_y_18_6 = 123; reg [1:0] gr18_6_on = 0;
parameter gr_x_18_7 = 419; parameter gr_y_18_7 = 141; reg [1:0] gr18_7_on = 0;
parameter gr_x_18_8 = 419; parameter gr_y_18_8 = 159; reg [1:0] gr18_8_on = 0;
parameter gr_x_18_9 = 419; parameter gr_y_18_9 = 177; reg [1:0] gr18_9_on = 0;
parameter gr_x_18_10 = 419; parameter gr_y_18_10 = 195; reg [1:0] gr18_10_on = 0;
parameter gr_x_18_11 = 419; parameter gr_y_18_11 = 213; reg [1:0] gr18_11_on = 0;
parameter gr_x_18_12 = 419; parameter gr_y_18_12 = 231; reg [1:0] gr18_12_on = 0;
parameter gr_x_18_13 = 419; parameter gr_y_18_13 = 249; reg [1:0] gr18_13_on = 0;
parameter gr_x_18_14 = 419; parameter gr_y_18_14 = 267; reg [1:0] gr18_14_on = 0;
parameter gr_x_18_15 = 419; parameter gr_y_18_15 = 285; reg [1:0] gr18_15_on = 0;
parameter gr_x_18_16 = 419; parameter gr_y_18_16 = 303; reg [1:0] gr18_16_on = 0;
parameter gr_x_18_17 = 419; parameter gr_y_18_17 = 321; reg [1:0] gr18_17_on = 0;
parameter gr_x_18_18 = 419; parameter gr_y_18_18 = 339; reg [1:0] gr18_18_on = 0;
parameter gr_x_18_19 = 419; parameter gr_y_18_19 = 357; reg [1:0] gr18_19_on = 0;
parameter gr_x_18_20 = 419; parameter gr_y_18_20 = 375; reg [1:0] gr18_20_on = 0;
parameter gr_x_18_21 = 419; parameter gr_y_18_21 = 393; reg [1:0] gr18_21_on = 0;
parameter gr_x_18_22 = 419; parameter gr_y_18_22 = 411; reg [1:0] gr18_22_on = 0;
parameter gr_x_18_23 = 419; parameter gr_y_18_23 = 429; reg [1:0] gr18_23_on = 0;
parameter gr_x_18_24 = 419; parameter gr_y_18_24 = 447; reg [1:0] gr18_24_on = 0;
parameter gr_x_19_0 = 437; parameter gr_y_19_0 = 15; reg [1:0] gr19_0_on = 0;
parameter gr_x_19_1 = 437; parameter gr_y_19_1 = 33; reg [1:0] gr19_1_on = 0;
parameter gr_x_19_2 = 437; parameter gr_y_19_2 = 51; reg [1:0] gr19_2_on = 0;
parameter gr_x_19_3 = 437; parameter gr_y_19_3 = 69; reg [1:0] gr19_3_on = 0;
parameter gr_x_19_4 = 437; parameter gr_y_19_4 = 87; reg [1:0] gr19_4_on = 0;
parameter gr_x_19_5 = 437; parameter gr_y_19_5 = 105; reg [1:0] gr19_5_on = 0;
parameter gr_x_19_6 = 437; parameter gr_y_19_6 = 123; reg [1:0] gr19_6_on = 0;
parameter gr_x_19_7 = 437; parameter gr_y_19_7 = 141; reg [1:0] gr19_7_on = 0;
parameter gr_x_19_8 = 437; parameter gr_y_19_8 = 159; reg [1:0] gr19_8_on = 0;
parameter gr_x_19_9 = 437; parameter gr_y_19_9 = 177; reg [1:0] gr19_9_on = 0;
parameter gr_x_19_10 = 437; parameter gr_y_19_10 = 195; reg [1:0] gr19_10_on = 0;
parameter gr_x_19_11 = 437; parameter gr_y_19_11 = 213; reg [1:0] gr19_11_on = 0;
parameter gr_x_19_12 = 437; parameter gr_y_19_12 = 231; reg [1:0] gr19_12_on = 0;
parameter gr_x_19_13 = 437; parameter gr_y_19_13 = 249; reg [1:0] gr19_13_on = 0;
parameter gr_x_19_14 = 437; parameter gr_y_19_14 = 267; reg [1:0] gr19_14_on = 0;
parameter gr_x_19_15 = 437; parameter gr_y_19_15 = 285; reg [1:0] gr19_15_on = 0;
parameter gr_x_19_16 = 437; parameter gr_y_19_16 = 303; reg [1:0] gr19_16_on = 0;
parameter gr_x_19_17 = 437; parameter gr_y_19_17 = 321; reg [1:0] gr19_17_on = 0;
parameter gr_x_19_18 = 437; parameter gr_y_19_18 = 339; reg [1:0] gr19_18_on = 0;
parameter gr_x_19_19 = 437; parameter gr_y_19_19 = 357; reg [1:0] gr19_19_on = 0;
parameter gr_x_19_20 = 437; parameter gr_y_19_20 = 375; reg [1:0] gr19_20_on = 0;
parameter gr_x_19_21 = 437; parameter gr_y_19_21 = 393; reg [1:0] gr19_21_on = 0;
parameter gr_x_19_22 = 437; parameter gr_y_19_22 = 411; reg [1:0] gr19_22_on = 0;
parameter gr_x_19_23 = 437; parameter gr_y_19_23 = 429; reg [1:0] gr19_23_on = 0;
parameter gr_x_19_24 = 437; parameter gr_y_19_24 = 447; reg [1:0] gr19_24_on = 0;
parameter gr_x_20_0 = 455; parameter gr_y_20_0 = 15; reg [1:0] gr20_0_on = 0;
parameter gr_x_20_1 = 455; parameter gr_y_20_1 = 33; reg [1:0] gr20_1_on = 0;
parameter gr_x_20_2 = 455; parameter gr_y_20_2 = 51; reg [1:0] gr20_2_on = 0;
parameter gr_x_20_3 = 455; parameter gr_y_20_3 = 69; reg [1:0] gr20_3_on = 0;
parameter gr_x_20_4 = 455; parameter gr_y_20_4 = 87; reg [1:0] gr20_4_on = 0;
parameter gr_x_20_5 = 455; parameter gr_y_20_5 = 105; reg [1:0] gr20_5_on = 0;
parameter gr_x_20_6 = 455; parameter gr_y_20_6 = 123; reg [1:0] gr20_6_on = 0;
parameter gr_x_20_7 = 455; parameter gr_y_20_7 = 141; reg [1:0] gr20_7_on = 0;
parameter gr_x_20_8 = 455; parameter gr_y_20_8 = 159; reg [1:0] gr20_8_on = 0;
parameter gr_x_20_9 = 455; parameter gr_y_20_9 = 177; reg [1:0] gr20_9_on = 0;
parameter gr_x_20_10 = 455; parameter gr_y_20_10 = 195; reg [1:0] gr20_10_on = 0;
parameter gr_x_20_11 = 455; parameter gr_y_20_11 = 213; reg [1:0] gr20_11_on = 0;
parameter gr_x_20_12 = 455; parameter gr_y_20_12 = 231; reg [1:0] gr20_12_on = 0;
parameter gr_x_20_13 = 455; parameter gr_y_20_13 = 249; reg [1:0] gr20_13_on = 0;
parameter gr_x_20_14 = 455; parameter gr_y_20_14 = 267; reg [1:0] gr20_14_on = 0;
parameter gr_x_20_15 = 455; parameter gr_y_20_15 = 285; reg [1:0] gr20_15_on = 0;
parameter gr_x_20_16 = 455; parameter gr_y_20_16 = 303; reg [1:0] gr20_16_on = 0;
parameter gr_x_20_17 = 455; parameter gr_y_20_17 = 321; reg [1:0] gr20_17_on = 0;
parameter gr_x_20_18 = 455; parameter gr_y_20_18 = 339; reg [1:0] gr20_18_on = 0;
parameter gr_x_20_19 = 455; parameter gr_y_20_19 = 357; reg [1:0] gr20_19_on = 0;
parameter gr_x_20_20 = 455; parameter gr_y_20_20 = 375; reg [1:0] gr20_20_on = 0;
parameter gr_x_20_21 = 455; parameter gr_y_20_21 = 393; reg [1:0] gr20_21_on = 0;
parameter gr_x_20_22 = 455; parameter gr_y_20_22 = 411; reg [1:0] gr20_22_on = 0;
parameter gr_x_20_23 = 455; parameter gr_y_20_23 = 429; reg [1:0] gr20_23_on = 0;
parameter gr_x_20_24 = 455; parameter gr_y_20_24 = 447; reg [1:0] gr20_24_on = 0;
parameter gr_x_21_0 = 473; parameter gr_y_21_0 = 15; reg [1:0] gr21_0_on = 0;
parameter gr_x_21_1 = 473; parameter gr_y_21_1 = 33; reg [1:0] gr21_1_on = 0;
parameter gr_x_21_2 = 473; parameter gr_y_21_2 = 51; reg [1:0] gr21_2_on = 0;
parameter gr_x_21_3 = 473; parameter gr_y_21_3 = 69; reg [1:0] gr21_3_on = 0;
parameter gr_x_21_4 = 473; parameter gr_y_21_4 = 87; reg [1:0] gr21_4_on = 0;
parameter gr_x_21_5 = 473; parameter gr_y_21_5 = 105; reg [1:0] gr21_5_on = 0;
parameter gr_x_21_6 = 473; parameter gr_y_21_6 = 123; reg [1:0] gr21_6_on = 0;
parameter gr_x_21_7 = 473; parameter gr_y_21_7 = 141; reg [1:0] gr21_7_on = 0;
parameter gr_x_21_8 = 473; parameter gr_y_21_8 = 159; reg [1:0] gr21_8_on = 0;
parameter gr_x_21_9 = 473; parameter gr_y_21_9 = 177; reg [1:0] gr21_9_on = 0;
parameter gr_x_21_10 = 473; parameter gr_y_21_10 = 195; reg [1:0] gr21_10_on = 0;
parameter gr_x_21_11 = 473; parameter gr_y_21_11 = 213; reg [1:0] gr21_11_on = 0;
parameter gr_x_21_12 = 473; parameter gr_y_21_12 = 231; reg [1:0] gr21_12_on = 0;
parameter gr_x_21_13 = 473; parameter gr_y_21_13 = 249; reg [1:0] gr21_13_on = 0;
parameter gr_x_21_14 = 473; parameter gr_y_21_14 = 267; reg [1:0] gr21_14_on = 0;
parameter gr_x_21_15 = 473; parameter gr_y_21_15 = 285; reg [1:0] gr21_15_on = 0;
parameter gr_x_21_16 = 473; parameter gr_y_21_16 = 303; reg [1:0] gr21_16_on = 0;
parameter gr_x_21_17 = 473; parameter gr_y_21_17 = 321; reg [1:0] gr21_17_on = 0;
parameter gr_x_21_18 = 473; parameter gr_y_21_18 = 339; reg [1:0] gr21_18_on = 0;
parameter gr_x_21_19 = 473; parameter gr_y_21_19 = 357; reg [1:0] gr21_19_on = 0;
parameter gr_x_21_20 = 473; parameter gr_y_21_20 = 375; reg [1:0] gr21_20_on = 0;
parameter gr_x_21_21 = 473; parameter gr_y_21_21 = 393; reg [1:0] gr21_21_on = 0;
parameter gr_x_21_22 = 473; parameter gr_y_21_22 = 411; reg [1:0] gr21_22_on = 0;
parameter gr_x_21_23 = 473; parameter gr_y_21_23 = 429; reg [1:0] gr21_23_on = 0;
parameter gr_x_21_24 = 473; parameter gr_y_21_24 = 447; reg [1:0] gr21_24_on = 0;
parameter gr_x_22_0 = 491; parameter gr_y_22_0 = 15; reg [1:0] gr22_0_on = 0;
parameter gr_x_22_1 = 491; parameter gr_y_22_1 = 33; reg [1:0] gr22_1_on = 0;
parameter gr_x_22_2 = 491; parameter gr_y_22_2 = 51; reg [1:0] gr22_2_on = 0;
parameter gr_x_22_3 = 491; parameter gr_y_22_3 = 69; reg [1:0] gr22_3_on = 0;
parameter gr_x_22_4 = 491; parameter gr_y_22_4 = 87; reg [1:0] gr22_4_on = 0;
parameter gr_x_22_5 = 491; parameter gr_y_22_5 = 105; reg [1:0] gr22_5_on = 0;
parameter gr_x_22_6 = 491; parameter gr_y_22_6 = 123; reg [1:0] gr22_6_on = 0;
parameter gr_x_22_7 = 491; parameter gr_y_22_7 = 141; reg [1:0] gr22_7_on = 0;
parameter gr_x_22_8 = 491; parameter gr_y_22_8 = 159; reg [1:0] gr22_8_on = 0;
parameter gr_x_22_9 = 491; parameter gr_y_22_9 = 177; reg [1:0] gr22_9_on = 0;
parameter gr_x_22_10 = 491; parameter gr_y_22_10 = 195; reg [1:0] gr22_10_on = 0;
parameter gr_x_22_11 = 491; parameter gr_y_22_11 = 213; reg [1:0] gr22_11_on = 0;
parameter gr_x_22_12 = 491; parameter gr_y_22_12 = 231; reg [1:0] gr22_12_on = 0;
parameter gr_x_22_13 = 491; parameter gr_y_22_13 = 249; reg [1:0] gr22_13_on = 0;
parameter gr_x_22_14 = 491; parameter gr_y_22_14 = 267; reg [1:0] gr22_14_on = 0;
parameter gr_x_22_15 = 491; parameter gr_y_22_15 = 285; reg [1:0] gr22_15_on = 0;
parameter gr_x_22_16 = 491; parameter gr_y_22_16 = 303; reg [1:0] gr22_16_on = 0;
parameter gr_x_22_17 = 491; parameter gr_y_22_17 = 321; reg [1:0] gr22_17_on = 0;
parameter gr_x_22_18 = 491; parameter gr_y_22_18 = 339; reg [1:0] gr22_18_on = 0;
parameter gr_x_22_19 = 491; parameter gr_y_22_19 = 357; reg [1:0] gr22_19_on = 0;
parameter gr_x_22_20 = 491; parameter gr_y_22_20 = 375; reg [1:0] gr22_20_on = 0;
parameter gr_x_22_21 = 491; parameter gr_y_22_21 = 393; reg [1:0] gr22_21_on = 0;
parameter gr_x_22_22 = 491; parameter gr_y_22_22 = 411; reg [1:0] gr22_22_on = 0;
parameter gr_x_22_23 = 491; parameter gr_y_22_23 = 429; reg [1:0] gr22_23_on = 0;
parameter gr_x_22_24 = 491; parameter gr_y_22_24 = 447; reg [1:0] gr22_24_on = 0;
parameter gr_x_23_0 = 509; parameter gr_y_23_0 = 15; reg [1:0] gr23_0_on = 0;
parameter gr_x_23_1 = 509; parameter gr_y_23_1 = 33; reg [1:0] gr23_1_on = 0;
parameter gr_x_23_2 = 509; parameter gr_y_23_2 = 51; reg [1:0] gr23_2_on = 0;
parameter gr_x_23_3 = 509; parameter gr_y_23_3 = 69; reg [1:0] gr23_3_on = 0;
parameter gr_x_23_4 = 509; parameter gr_y_23_4 = 87; reg [1:0] gr23_4_on = 0;
parameter gr_x_23_5 = 509; parameter gr_y_23_5 = 105; reg [1:0] gr23_5_on = 0;
parameter gr_x_23_6 = 509; parameter gr_y_23_6 = 123; reg [1:0] gr23_6_on = 0;
parameter gr_x_23_7 = 509; parameter gr_y_23_7 = 141; reg [1:0] gr23_7_on = 0;
parameter gr_x_23_8 = 509; parameter gr_y_23_8 = 159; reg [1:0] gr23_8_on = 0;
parameter gr_x_23_9 = 509; parameter gr_y_23_9 = 177; reg [1:0] gr23_9_on = 0;
parameter gr_x_23_10 = 509; parameter gr_y_23_10 = 195; reg [1:0] gr23_10_on = 0;
parameter gr_x_23_11 = 509; parameter gr_y_23_11 = 213; reg [1:0] gr23_11_on = 0;
parameter gr_x_23_12 = 509; parameter gr_y_23_12 = 231; reg [1:0] gr23_12_on = 0;
parameter gr_x_23_13 = 509; parameter gr_y_23_13 = 249; reg [1:0] gr23_13_on = 0;
parameter gr_x_23_14 = 509; parameter gr_y_23_14 = 267; reg [1:0] gr23_14_on = 0;
parameter gr_x_23_15 = 509; parameter gr_y_23_15 = 285; reg [1:0] gr23_15_on = 0;
parameter gr_x_23_16 = 509; parameter gr_y_23_16 = 303; reg [1:0] gr23_16_on = 0;
parameter gr_x_23_17 = 509; parameter gr_y_23_17 = 321; reg [1:0] gr23_17_on = 0;
parameter gr_x_23_18 = 509; parameter gr_y_23_18 = 339; reg [1:0] gr23_18_on = 0;
parameter gr_x_23_19 = 509; parameter gr_y_23_19 = 357; reg [1:0] gr23_19_on = 0;
parameter gr_x_23_20 = 509; parameter gr_y_23_20 = 375; reg [1:0] gr23_20_on = 0;
parameter gr_x_23_21 = 509; parameter gr_y_23_21 = 393; reg [1:0] gr23_21_on = 0;
parameter gr_x_23_22 = 509; parameter gr_y_23_22 = 411; reg [1:0] gr23_22_on = 0;
parameter gr_x_23_23 = 509; parameter gr_y_23_23 = 429; reg [1:0] gr23_23_on = 0;
parameter gr_x_23_24 = 509; parameter gr_y_23_24 = 447; reg [1:0] gr23_24_on = 0;
parameter gr_x_24_0 = 527; parameter gr_y_24_0 = 15; reg [1:0] gr24_0_on = 0;
parameter gr_x_24_1 = 527; parameter gr_y_24_1 = 33; reg [1:0] gr24_1_on = 0;
parameter gr_x_24_2 = 527; parameter gr_y_24_2 = 51; reg [1:0] gr24_2_on = 0;
parameter gr_x_24_3 = 527; parameter gr_y_24_3 = 69; reg [1:0] gr24_3_on = 0;
parameter gr_x_24_4 = 527; parameter gr_y_24_4 = 87; reg [1:0] gr24_4_on = 0;
parameter gr_x_24_5 = 527; parameter gr_y_24_5 = 105; reg [1:0] gr24_5_on = 0;
parameter gr_x_24_6 = 527; parameter gr_y_24_6 = 123; reg [1:0] gr24_6_on = 0;
parameter gr_x_24_7 = 527; parameter gr_y_24_7 = 141; reg [1:0] gr24_7_on = 0;
parameter gr_x_24_8 = 527; parameter gr_y_24_8 = 159; reg [1:0] gr24_8_on = 0;
parameter gr_x_24_9 = 527; parameter gr_y_24_9 = 177; reg [1:0] gr24_9_on = 0;
parameter gr_x_24_10 = 527; parameter gr_y_24_10 = 195; reg [1:0] gr24_10_on = 0;
parameter gr_x_24_11 = 527; parameter gr_y_24_11 = 213; reg [1:0] gr24_11_on = 0;
parameter gr_x_24_12 = 527; parameter gr_y_24_12 = 231; reg [1:0] gr24_12_on = 0;
parameter gr_x_24_13 = 527; parameter gr_y_24_13 = 249; reg [1:0] gr24_13_on = 0;
parameter gr_x_24_14 = 527; parameter gr_y_24_14 = 267; reg [1:0] gr24_14_on = 0;
parameter gr_x_24_15 = 527; parameter gr_y_24_15 = 285; reg [1:0] gr24_15_on = 0;
parameter gr_x_24_16 = 527; parameter gr_y_24_16 = 303; reg [1:0] gr24_16_on = 0;
parameter gr_x_24_17 = 527; parameter gr_y_24_17 = 321; reg [1:0] gr24_17_on = 0;
parameter gr_x_24_18 = 527; parameter gr_y_24_18 = 339; reg [1:0] gr24_18_on = 0;
parameter gr_x_24_19 = 527; parameter gr_y_24_19 = 357; reg [1:0] gr24_19_on = 0;
parameter gr_x_24_20 = 527; parameter gr_y_24_20 = 375; reg [1:0] gr24_20_on = 0;
parameter gr_x_24_21 = 527; parameter gr_y_24_21 = 393; reg [1:0] gr24_21_on = 0;
parameter gr_x_24_22 = 527; parameter gr_y_24_22 = 411; reg [1:0] gr24_22_on = 0;
parameter gr_x_24_23 = 527; parameter gr_y_24_23 = 429; reg [1:0] gr24_23_on = 0;
parameter gr_x_24_24 = 527; parameter gr_y_24_24 = 447; reg [1:0] gr24_24_on = 0;


reg col = 0;
reg [1:0] win = 0;
reg ply = 1;
reg main = 1;
reg bonus = 0;

reg [9:0] bonus_x;
reg [9:0] bonus_y;


reg [9:0] count_b = 10'd0;
reg [9:0] count_r = 10'd0;
reg [9:0] timer_count = 10'd60;
reg [3:0] timer_check = 4'd0;
reg [5:0] color = 0;

///////////////////////////////////////////////////////////////////////////
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
    
wire tr0_0_on; assign tr0_0_on = (gr_x_0_0 <= x) && (x <= gr_x_0_0+18) && (gr_y_0_0 <= y) && (y <= gr_y_0_0+18);
wire tr0_1_on; assign tr0_1_on = (gr_x_0_1 <= x) && (x <= gr_x_0_1+18) && (gr_y_0_1 <= y) && (y <= gr_y_0_1+18);
wire tr0_2_on; assign tr0_2_on = (gr_x_0_2 <= x) && (x <= gr_x_0_2+18) && (gr_y_0_2 <= y) && (y <= gr_y_0_2+18);
wire tr0_3_on; assign tr0_3_on = (gr_x_0_3 <= x) && (x <= gr_x_0_3+18) && (gr_y_0_3 <= y) && (y <= gr_y_0_3+18);
wire tr0_4_on; assign tr0_4_on = (gr_x_0_4 <= x) && (x <= gr_x_0_4+18) && (gr_y_0_4 <= y) && (y <= gr_y_0_4+18);
wire tr0_5_on; assign tr0_5_on = (gr_x_0_5 <= x) && (x <= gr_x_0_5+18) && (gr_y_0_5 <= y) && (y <= gr_y_0_5+18);
wire tr0_6_on; assign tr0_6_on = (gr_x_0_6 <= x) && (x <= gr_x_0_6+18) && (gr_y_0_6 <= y) && (y <= gr_y_0_6+18);
wire tr0_7_on; assign tr0_7_on = (gr_x_0_7 <= x) && (x <= gr_x_0_7+18) && (gr_y_0_7 <= y) && (y <= gr_y_0_7+18);
wire tr0_8_on; assign tr0_8_on = (gr_x_0_8 <= x) && (x <= gr_x_0_8+18) && (gr_y_0_8 <= y) && (y <= gr_y_0_8+18);
wire tr0_9_on; assign tr0_9_on = (gr_x_0_9 <= x) && (x <= gr_x_0_9+18) && (gr_y_0_9 <= y) && (y <= gr_y_0_9+18);
wire tr0_10_on; assign tr0_10_on = (gr_x_0_10 <= x) && (x <= gr_x_0_10+18) && (gr_y_0_10 <= y) && (y <= gr_y_0_10+18);
wire tr0_11_on; assign tr0_11_on = (gr_x_0_11 <= x) && (x <= gr_x_0_11+18) && (gr_y_0_11 <= y) && (y <= gr_y_0_11+18);
wire tr0_12_on; assign tr0_12_on = (gr_x_0_12 <= x) && (x <= gr_x_0_12+18) && (gr_y_0_12 <= y) && (y <= gr_y_0_12+18);
wire tr0_13_on; assign tr0_13_on = (gr_x_0_13 <= x) && (x <= gr_x_0_13+18) && (gr_y_0_13 <= y) && (y <= gr_y_0_13+18);
wire tr0_14_on; assign tr0_14_on = (gr_x_0_14 <= x) && (x <= gr_x_0_14+18) && (gr_y_0_14 <= y) && (y <= gr_y_0_14+18);
wire tr0_15_on; assign tr0_15_on = (gr_x_0_15 <= x) && (x <= gr_x_0_15+18) && (gr_y_0_15 <= y) && (y <= gr_y_0_15+18);
wire tr0_16_on; assign tr0_16_on = (gr_x_0_16 <= x) && (x <= gr_x_0_16+18) && (gr_y_0_16 <= y) && (y <= gr_y_0_16+18);
wire tr0_17_on; assign tr0_17_on = (gr_x_0_17 <= x) && (x <= gr_x_0_17+18) && (gr_y_0_17 <= y) && (y <= gr_y_0_17+18);
wire tr0_18_on; assign tr0_18_on = (gr_x_0_18 <= x) && (x <= gr_x_0_18+18) && (gr_y_0_18 <= y) && (y <= gr_y_0_18+18);
wire tr0_19_on; assign tr0_19_on = (gr_x_0_19 <= x) && (x <= gr_x_0_19+18) && (gr_y_0_19 <= y) && (y <= gr_y_0_19+18);
wire tr0_20_on; assign tr0_20_on = (gr_x_0_20 <= x) && (x <= gr_x_0_20+18) && (gr_y_0_20 <= y) && (y <= gr_y_0_20+18);
wire tr0_21_on; assign tr0_21_on = (gr_x_0_21 <= x) && (x <= gr_x_0_21+18) && (gr_y_0_21 <= y) && (y <= gr_y_0_21+18);
wire tr0_22_on; assign tr0_22_on = (gr_x_0_22 <= x) && (x <= gr_x_0_22+18) && (gr_y_0_22 <= y) && (y <= gr_y_0_22+18);
wire tr0_23_on; assign tr0_23_on = (gr_x_0_23 <= x) && (x <= gr_x_0_23+18) && (gr_y_0_23 <= y) && (y <= gr_y_0_23+18);
wire tr0_24_on; assign tr0_24_on = (gr_x_0_24 <= x) && (x <= gr_x_0_24+18) && (gr_y_0_24 <= y) && (y <= gr_y_0_24+18);
wire tr1_0_on; assign tr1_0_on = (gr_x_1_0 <= x) && (x <= gr_x_1_0+18) && (gr_y_1_0 <= y) && (y <= gr_y_1_0+18);
wire tr1_1_on; assign tr1_1_on = (gr_x_1_1 <= x) && (x <= gr_x_1_1+18) && (gr_y_1_1 <= y) && (y <= gr_y_1_1+18);
wire tr1_2_on; assign tr1_2_on = (gr_x_1_2 <= x) && (x <= gr_x_1_2+18) && (gr_y_1_2 <= y) && (y <= gr_y_1_2+18);
wire tr1_3_on; assign tr1_3_on = (gr_x_1_3 <= x) && (x <= gr_x_1_3+18) && (gr_y_1_3 <= y) && (y <= gr_y_1_3+18);
wire tr1_4_on; assign tr1_4_on = (gr_x_1_4 <= x) && (x <= gr_x_1_4+18) && (gr_y_1_4 <= y) && (y <= gr_y_1_4+18);
wire tr1_5_on; assign tr1_5_on = (gr_x_1_5 <= x) && (x <= gr_x_1_5+18) && (gr_y_1_5 <= y) && (y <= gr_y_1_5+18);
wire tr1_6_on; assign tr1_6_on = (gr_x_1_6 <= x) && (x <= gr_x_1_6+18) && (gr_y_1_6 <= y) && (y <= gr_y_1_6+18);
wire tr1_7_on; assign tr1_7_on = (gr_x_1_7 <= x) && (x <= gr_x_1_7+18) && (gr_y_1_7 <= y) && (y <= gr_y_1_7+18);
wire tr1_8_on; assign tr1_8_on = (gr_x_1_8 <= x) && (x <= gr_x_1_8+18) && (gr_y_1_8 <= y) && (y <= gr_y_1_8+18);
wire tr1_9_on; assign tr1_9_on = (gr_x_1_9 <= x) && (x <= gr_x_1_9+18) && (gr_y_1_9 <= y) && (y <= gr_y_1_9+18);
wire tr1_10_on; assign tr1_10_on = (gr_x_1_10 <= x) && (x <= gr_x_1_10+18) && (gr_y_1_10 <= y) && (y <= gr_y_1_10+18);
wire tr1_11_on; assign tr1_11_on = (gr_x_1_11 <= x) && (x <= gr_x_1_11+18) && (gr_y_1_11 <= y) && (y <= gr_y_1_11+18);
wire tr1_12_on; assign tr1_12_on = (gr_x_1_12 <= x) && (x <= gr_x_1_12+18) && (gr_y_1_12 <= y) && (y <= gr_y_1_12+18);
wire tr1_13_on; assign tr1_13_on = (gr_x_1_13 <= x) && (x <= gr_x_1_13+18) && (gr_y_1_13 <= y) && (y <= gr_y_1_13+18);
wire tr1_14_on; assign tr1_14_on = (gr_x_1_14 <= x) && (x <= gr_x_1_14+18) && (gr_y_1_14 <= y) && (y <= gr_y_1_14+18);
wire tr1_15_on; assign tr1_15_on = (gr_x_1_15 <= x) && (x <= gr_x_1_15+18) && (gr_y_1_15 <= y) && (y <= gr_y_1_15+18);
wire tr1_16_on; assign tr1_16_on = (gr_x_1_16 <= x) && (x <= gr_x_1_16+18) && (gr_y_1_16 <= y) && (y <= gr_y_1_16+18);
wire tr1_17_on; assign tr1_17_on = (gr_x_1_17 <= x) && (x <= gr_x_1_17+18) && (gr_y_1_17 <= y) && (y <= gr_y_1_17+18);
wire tr1_18_on; assign tr1_18_on = (gr_x_1_18 <= x) && (x <= gr_x_1_18+18) && (gr_y_1_18 <= y) && (y <= gr_y_1_18+18);
wire tr1_19_on; assign tr1_19_on = (gr_x_1_19 <= x) && (x <= gr_x_1_19+18) && (gr_y_1_19 <= y) && (y <= gr_y_1_19+18);
wire tr1_20_on; assign tr1_20_on = (gr_x_1_20 <= x) && (x <= gr_x_1_20+18) && (gr_y_1_20 <= y) && (y <= gr_y_1_20+18);
wire tr1_21_on; assign tr1_21_on = (gr_x_1_21 <= x) && (x <= gr_x_1_21+18) && (gr_y_1_21 <= y) && (y <= gr_y_1_21+18);
wire tr1_22_on; assign tr1_22_on = (gr_x_1_22 <= x) && (x <= gr_x_1_22+18) && (gr_y_1_22 <= y) && (y <= gr_y_1_22+18);
wire tr1_23_on; assign tr1_23_on = (gr_x_1_23 <= x) && (x <= gr_x_1_23+18) && (gr_y_1_23 <= y) && (y <= gr_y_1_23+18);
wire tr1_24_on; assign tr1_24_on = (gr_x_1_24 <= x) && (x <= gr_x_1_24+18) && (gr_y_1_24 <= y) && (y <= gr_y_1_24+18);
wire tr2_0_on; assign tr2_0_on = (gr_x_2_0 <= x) && (x <= gr_x_2_0+18) && (gr_y_2_0 <= y) && (y <= gr_y_2_0+18);
wire tr2_1_on; assign tr2_1_on = (gr_x_2_1 <= x) && (x <= gr_x_2_1+18) && (gr_y_2_1 <= y) && (y <= gr_y_2_1+18);
wire tr2_2_on; assign tr2_2_on = (gr_x_2_2 <= x) && (x <= gr_x_2_2+18) && (gr_y_2_2 <= y) && (y <= gr_y_2_2+18);
wire tr2_3_on; assign tr2_3_on = (gr_x_2_3 <= x) && (x <= gr_x_2_3+18) && (gr_y_2_3 <= y) && (y <= gr_y_2_3+18);
wire tr2_4_on; assign tr2_4_on = (gr_x_2_4 <= x) && (x <= gr_x_2_4+18) && (gr_y_2_4 <= y) && (y <= gr_y_2_4+18);
wire tr2_5_on; assign tr2_5_on = (gr_x_2_5 <= x) && (x <= gr_x_2_5+18) && (gr_y_2_5 <= y) && (y <= gr_y_2_5+18);
wire tr2_6_on; assign tr2_6_on = (gr_x_2_6 <= x) && (x <= gr_x_2_6+18) && (gr_y_2_6 <= y) && (y <= gr_y_2_6+18);
wire tr2_7_on; assign tr2_7_on = (gr_x_2_7 <= x) && (x <= gr_x_2_7+18) && (gr_y_2_7 <= y) && (y <= gr_y_2_7+18);
wire tr2_8_on; assign tr2_8_on = (gr_x_2_8 <= x) && (x <= gr_x_2_8+18) && (gr_y_2_8 <= y) && (y <= gr_y_2_8+18);
wire tr2_9_on; assign tr2_9_on = (gr_x_2_9 <= x) && (x <= gr_x_2_9+18) && (gr_y_2_9 <= y) && (y <= gr_y_2_9+18);
wire tr2_10_on; assign tr2_10_on = (gr_x_2_10 <= x) && (x <= gr_x_2_10+18) && (gr_y_2_10 <= y) && (y <= gr_y_2_10+18);
wire tr2_11_on; assign tr2_11_on = (gr_x_2_11 <= x) && (x <= gr_x_2_11+18) && (gr_y_2_11 <= y) && (y <= gr_y_2_11+18);
wire tr2_12_on; assign tr2_12_on = (gr_x_2_12 <= x) && (x <= gr_x_2_12+18) && (gr_y_2_12 <= y) && (y <= gr_y_2_12+18);
wire tr2_13_on; assign tr2_13_on = (gr_x_2_13 <= x) && (x <= gr_x_2_13+18) && (gr_y_2_13 <= y) && (y <= gr_y_2_13+18);
wire tr2_14_on; assign tr2_14_on = (gr_x_2_14 <= x) && (x <= gr_x_2_14+18) && (gr_y_2_14 <= y) && (y <= gr_y_2_14+18);
wire tr2_15_on; assign tr2_15_on = (gr_x_2_15 <= x) && (x <= gr_x_2_15+18) && (gr_y_2_15 <= y) && (y <= gr_y_2_15+18);
wire tr2_16_on; assign tr2_16_on = (gr_x_2_16 <= x) && (x <= gr_x_2_16+18) && (gr_y_2_16 <= y) && (y <= gr_y_2_16+18);
wire tr2_17_on; assign tr2_17_on = (gr_x_2_17 <= x) && (x <= gr_x_2_17+18) && (gr_y_2_17 <= y) && (y <= gr_y_2_17+18);
wire tr2_18_on; assign tr2_18_on = (gr_x_2_18 <= x) && (x <= gr_x_2_18+18) && (gr_y_2_18 <= y) && (y <= gr_y_2_18+18);
wire tr2_19_on; assign tr2_19_on = (gr_x_2_19 <= x) && (x <= gr_x_2_19+18) && (gr_y_2_19 <= y) && (y <= gr_y_2_19+18);
wire tr2_20_on; assign tr2_20_on = (gr_x_2_20 <= x) && (x <= gr_x_2_20+18) && (gr_y_2_20 <= y) && (y <= gr_y_2_20+18);
wire tr2_21_on; assign tr2_21_on = (gr_x_2_21 <= x) && (x <= gr_x_2_21+18) && (gr_y_2_21 <= y) && (y <= gr_y_2_21+18);
wire tr2_22_on; assign tr2_22_on = (gr_x_2_22 <= x) && (x <= gr_x_2_22+18) && (gr_y_2_22 <= y) && (y <= gr_y_2_22+18);
wire tr2_23_on; assign tr2_23_on = (gr_x_2_23 <= x) && (x <= gr_x_2_23+18) && (gr_y_2_23 <= y) && (y <= gr_y_2_23+18);
wire tr2_24_on; assign tr2_24_on = (gr_x_2_24 <= x) && (x <= gr_x_2_24+18) && (gr_y_2_24 <= y) && (y <= gr_y_2_24+18);
wire tr3_0_on; assign tr3_0_on = (gr_x_3_0 <= x) && (x <= gr_x_3_0+18) && (gr_y_3_0 <= y) && (y <= gr_y_3_0+18);
wire tr3_1_on; assign tr3_1_on = (gr_x_3_1 <= x) && (x <= gr_x_3_1+18) && (gr_y_3_1 <= y) && (y <= gr_y_3_1+18);
wire tr3_2_on; assign tr3_2_on = (gr_x_3_2 <= x) && (x <= gr_x_3_2+18) && (gr_y_3_2 <= y) && (y <= gr_y_3_2+18);
wire tr3_3_on; assign tr3_3_on = (gr_x_3_3 <= x) && (x <= gr_x_3_3+18) && (gr_y_3_3 <= y) && (y <= gr_y_3_3+18);
wire tr3_4_on; assign tr3_4_on = (gr_x_3_4 <= x) && (x <= gr_x_3_4+18) && (gr_y_3_4 <= y) && (y <= gr_y_3_4+18);
wire tr3_5_on; assign tr3_5_on = (gr_x_3_5 <= x) && (x <= gr_x_3_5+18) && (gr_y_3_5 <= y) && (y <= gr_y_3_5+18);
wire tr3_6_on; assign tr3_6_on = (gr_x_3_6 <= x) && (x <= gr_x_3_6+18) && (gr_y_3_6 <= y) && (y <= gr_y_3_6+18);
wire tr3_7_on; assign tr3_7_on = (gr_x_3_7 <= x) && (x <= gr_x_3_7+18) && (gr_y_3_7 <= y) && (y <= gr_y_3_7+18);
wire tr3_8_on; assign tr3_8_on = (gr_x_3_8 <= x) && (x <= gr_x_3_8+18) && (gr_y_3_8 <= y) && (y <= gr_y_3_8+18);
wire tr3_9_on; assign tr3_9_on = (gr_x_3_9 <= x) && (x <= gr_x_3_9+18) && (gr_y_3_9 <= y) && (y <= gr_y_3_9+18);
wire tr3_10_on; assign tr3_10_on = (gr_x_3_10 <= x) && (x <= gr_x_3_10+18) && (gr_y_3_10 <= y) && (y <= gr_y_3_10+18);
wire tr3_11_on; assign tr3_11_on = (gr_x_3_11 <= x) && (x <= gr_x_3_11+18) && (gr_y_3_11 <= y) && (y <= gr_y_3_11+18);
wire tr3_12_on; assign tr3_12_on = (gr_x_3_12 <= x) && (x <= gr_x_3_12+18) && (gr_y_3_12 <= y) && (y <= gr_y_3_12+18);
wire tr3_13_on; assign tr3_13_on = (gr_x_3_13 <= x) && (x <= gr_x_3_13+18) && (gr_y_3_13 <= y) && (y <= gr_y_3_13+18);
wire tr3_14_on; assign tr3_14_on = (gr_x_3_14 <= x) && (x <= gr_x_3_14+18) && (gr_y_3_14 <= y) && (y <= gr_y_3_14+18);
wire tr3_15_on; assign tr3_15_on = (gr_x_3_15 <= x) && (x <= gr_x_3_15+18) && (gr_y_3_15 <= y) && (y <= gr_y_3_15+18);
wire tr3_16_on; assign tr3_16_on = (gr_x_3_16 <= x) && (x <= gr_x_3_16+18) && (gr_y_3_16 <= y) && (y <= gr_y_3_16+18);
wire tr3_17_on; assign tr3_17_on = (gr_x_3_17 <= x) && (x <= gr_x_3_17+18) && (gr_y_3_17 <= y) && (y <= gr_y_3_17+18);
wire tr3_18_on; assign tr3_18_on = (gr_x_3_18 <= x) && (x <= gr_x_3_18+18) && (gr_y_3_18 <= y) && (y <= gr_y_3_18+18);
wire tr3_19_on; assign tr3_19_on = (gr_x_3_19 <= x) && (x <= gr_x_3_19+18) && (gr_y_3_19 <= y) && (y <= gr_y_3_19+18);
wire tr3_20_on; assign tr3_20_on = (gr_x_3_20 <= x) && (x <= gr_x_3_20+18) && (gr_y_3_20 <= y) && (y <= gr_y_3_20+18);
wire tr3_21_on; assign tr3_21_on = (gr_x_3_21 <= x) && (x <= gr_x_3_21+18) && (gr_y_3_21 <= y) && (y <= gr_y_3_21+18);
wire tr3_22_on; assign tr3_22_on = (gr_x_3_22 <= x) && (x <= gr_x_3_22+18) && (gr_y_3_22 <= y) && (y <= gr_y_3_22+18);
wire tr3_23_on; assign tr3_23_on = (gr_x_3_23 <= x) && (x <= gr_x_3_23+18) && (gr_y_3_23 <= y) && (y <= gr_y_3_23+18);
wire tr3_24_on; assign tr3_24_on = (gr_x_3_24 <= x) && (x <= gr_x_3_24+18) && (gr_y_3_24 <= y) && (y <= gr_y_3_24+18);
wire tr4_0_on; assign tr4_0_on = (gr_x_4_0 <= x) && (x <= gr_x_4_0+18) && (gr_y_4_0 <= y) && (y <= gr_y_4_0+18);
wire tr4_1_on; assign tr4_1_on = (gr_x_4_1 <= x) && (x <= gr_x_4_1+18) && (gr_y_4_1 <= y) && (y <= gr_y_4_1+18);
wire tr4_2_on; assign tr4_2_on = (gr_x_4_2 <= x) && (x <= gr_x_4_2+18) && (gr_y_4_2 <= y) && (y <= gr_y_4_2+18);
wire tr4_3_on; assign tr4_3_on = (gr_x_4_3 <= x) && (x <= gr_x_4_3+18) && (gr_y_4_3 <= y) && (y <= gr_y_4_3+18);
wire tr4_4_on; assign tr4_4_on = (gr_x_4_4 <= x) && (x <= gr_x_4_4+18) && (gr_y_4_4 <= y) && (y <= gr_y_4_4+18);
wire tr4_5_on; assign tr4_5_on = (gr_x_4_5 <= x) && (x <= gr_x_4_5+18) && (gr_y_4_5 <= y) && (y <= gr_y_4_5+18);
wire tr4_6_on; assign tr4_6_on = (gr_x_4_6 <= x) && (x <= gr_x_4_6+18) && (gr_y_4_6 <= y) && (y <= gr_y_4_6+18);
wire tr4_7_on; assign tr4_7_on = (gr_x_4_7 <= x) && (x <= gr_x_4_7+18) && (gr_y_4_7 <= y) && (y <= gr_y_4_7+18);
wire tr4_8_on; assign tr4_8_on = (gr_x_4_8 <= x) && (x <= gr_x_4_8+18) && (gr_y_4_8 <= y) && (y <= gr_y_4_8+18);
wire tr4_9_on; assign tr4_9_on = (gr_x_4_9 <= x) && (x <= gr_x_4_9+18) && (gr_y_4_9 <= y) && (y <= gr_y_4_9+18);
wire tr4_10_on; assign tr4_10_on = (gr_x_4_10 <= x) && (x <= gr_x_4_10+18) && (gr_y_4_10 <= y) && (y <= gr_y_4_10+18);
wire tr4_11_on; assign tr4_11_on = (gr_x_4_11 <= x) && (x <= gr_x_4_11+18) && (gr_y_4_11 <= y) && (y <= gr_y_4_11+18);
wire tr4_12_on; assign tr4_12_on = (gr_x_4_12 <= x) && (x <= gr_x_4_12+18) && (gr_y_4_12 <= y) && (y <= gr_y_4_12+18);
wire tr4_13_on; assign tr4_13_on = (gr_x_4_13 <= x) && (x <= gr_x_4_13+18) && (gr_y_4_13 <= y) && (y <= gr_y_4_13+18);
wire tr4_14_on; assign tr4_14_on = (gr_x_4_14 <= x) && (x <= gr_x_4_14+18) && (gr_y_4_14 <= y) && (y <= gr_y_4_14+18);
wire tr4_15_on; assign tr4_15_on = (gr_x_4_15 <= x) && (x <= gr_x_4_15+18) && (gr_y_4_15 <= y) && (y <= gr_y_4_15+18);
wire tr4_16_on; assign tr4_16_on = (gr_x_4_16 <= x) && (x <= gr_x_4_16+18) && (gr_y_4_16 <= y) && (y <= gr_y_4_16+18);
wire tr4_17_on; assign tr4_17_on = (gr_x_4_17 <= x) && (x <= gr_x_4_17+18) && (gr_y_4_17 <= y) && (y <= gr_y_4_17+18);
wire tr4_18_on; assign tr4_18_on = (gr_x_4_18 <= x) && (x <= gr_x_4_18+18) && (gr_y_4_18 <= y) && (y <= gr_y_4_18+18);
wire tr4_19_on; assign tr4_19_on = (gr_x_4_19 <= x) && (x <= gr_x_4_19+18) && (gr_y_4_19 <= y) && (y <= gr_y_4_19+18);
wire tr4_20_on; assign tr4_20_on = (gr_x_4_20 <= x) && (x <= gr_x_4_20+18) && (gr_y_4_20 <= y) && (y <= gr_y_4_20+18);
wire tr4_21_on; assign tr4_21_on = (gr_x_4_21 <= x) && (x <= gr_x_4_21+18) && (gr_y_4_21 <= y) && (y <= gr_y_4_21+18);
wire tr4_22_on; assign tr4_22_on = (gr_x_4_22 <= x) && (x <= gr_x_4_22+18) && (gr_y_4_22 <= y) && (y <= gr_y_4_22+18);
wire tr4_23_on; assign tr4_23_on = (gr_x_4_23 <= x) && (x <= gr_x_4_23+18) && (gr_y_4_23 <= y) && (y <= gr_y_4_23+18);
wire tr4_24_on; assign tr4_24_on = (gr_x_4_24 <= x) && (x <= gr_x_4_24+18) && (gr_y_4_24 <= y) && (y <= gr_y_4_24+18);
wire tr5_0_on; assign tr5_0_on = (gr_x_5_0 <= x) && (x <= gr_x_5_0+18) && (gr_y_5_0 <= y) && (y <= gr_y_5_0+18);
wire tr5_1_on; assign tr5_1_on = (gr_x_5_1 <= x) && (x <= gr_x_5_1+18) && (gr_y_5_1 <= y) && (y <= gr_y_5_1+18);
wire tr5_2_on; assign tr5_2_on = (gr_x_5_2 <= x) && (x <= gr_x_5_2+18) && (gr_y_5_2 <= y) && (y <= gr_y_5_2+18);
wire tr5_3_on; assign tr5_3_on = (gr_x_5_3 <= x) && (x <= gr_x_5_3+18) && (gr_y_5_3 <= y) && (y <= gr_y_5_3+18);
wire tr5_4_on; assign tr5_4_on = (gr_x_5_4 <= x) && (x <= gr_x_5_4+18) && (gr_y_5_4 <= y) && (y <= gr_y_5_4+18);
wire tr5_5_on; assign tr5_5_on = (gr_x_5_5 <= x) && (x <= gr_x_5_5+18) && (gr_y_5_5 <= y) && (y <= gr_y_5_5+18);
wire tr5_6_on; assign tr5_6_on = (gr_x_5_6 <= x) && (x <= gr_x_5_6+18) && (gr_y_5_6 <= y) && (y <= gr_y_5_6+18);
wire tr5_7_on; assign tr5_7_on = (gr_x_5_7 <= x) && (x <= gr_x_5_7+18) && (gr_y_5_7 <= y) && (y <= gr_y_5_7+18);
wire tr5_8_on; assign tr5_8_on = (gr_x_5_8 <= x) && (x <= gr_x_5_8+18) && (gr_y_5_8 <= y) && (y <= gr_y_5_8+18);
wire tr5_9_on; assign tr5_9_on = (gr_x_5_9 <= x) && (x <= gr_x_5_9+18) && (gr_y_5_9 <= y) && (y <= gr_y_5_9+18);
wire tr5_10_on; assign tr5_10_on = (gr_x_5_10 <= x) && (x <= gr_x_5_10+18) && (gr_y_5_10 <= y) && (y <= gr_y_5_10+18);
wire tr5_11_on; assign tr5_11_on = (gr_x_5_11 <= x) && (x <= gr_x_5_11+18) && (gr_y_5_11 <= y) && (y <= gr_y_5_11+18);
wire tr5_12_on; assign tr5_12_on = (gr_x_5_12 <= x) && (x <= gr_x_5_12+18) && (gr_y_5_12 <= y) && (y <= gr_y_5_12+18);
wire tr5_13_on; assign tr5_13_on = (gr_x_5_13 <= x) && (x <= gr_x_5_13+18) && (gr_y_5_13 <= y) && (y <= gr_y_5_13+18);
wire tr5_14_on; assign tr5_14_on = (gr_x_5_14 <= x) && (x <= gr_x_5_14+18) && (gr_y_5_14 <= y) && (y <= gr_y_5_14+18);
wire tr5_15_on; assign tr5_15_on = (gr_x_5_15 <= x) && (x <= gr_x_5_15+18) && (gr_y_5_15 <= y) && (y <= gr_y_5_15+18);
wire tr5_16_on; assign tr5_16_on = (gr_x_5_16 <= x) && (x <= gr_x_5_16+18) && (gr_y_5_16 <= y) && (y <= gr_y_5_16+18);
wire tr5_17_on; assign tr5_17_on = (gr_x_5_17 <= x) && (x <= gr_x_5_17+18) && (gr_y_5_17 <= y) && (y <= gr_y_5_17+18);
wire tr5_18_on; assign tr5_18_on = (gr_x_5_18 <= x) && (x <= gr_x_5_18+18) && (gr_y_5_18 <= y) && (y <= gr_y_5_18+18);
wire tr5_19_on; assign tr5_19_on = (gr_x_5_19 <= x) && (x <= gr_x_5_19+18) && (gr_y_5_19 <= y) && (y <= gr_y_5_19+18);
wire tr5_20_on; assign tr5_20_on = (gr_x_5_20 <= x) && (x <= gr_x_5_20+18) && (gr_y_5_20 <= y) && (y <= gr_y_5_20+18);
wire tr5_21_on; assign tr5_21_on = (gr_x_5_21 <= x) && (x <= gr_x_5_21+18) && (gr_y_5_21 <= y) && (y <= gr_y_5_21+18);
wire tr5_22_on; assign tr5_22_on = (gr_x_5_22 <= x) && (x <= gr_x_5_22+18) && (gr_y_5_22 <= y) && (y <= gr_y_5_22+18);
wire tr5_23_on; assign tr5_23_on = (gr_x_5_23 <= x) && (x <= gr_x_5_23+18) && (gr_y_5_23 <= y) && (y <= gr_y_5_23+18);
wire tr5_24_on; assign tr5_24_on = (gr_x_5_24 <= x) && (x <= gr_x_5_24+18) && (gr_y_5_24 <= y) && (y <= gr_y_5_24+18);
wire tr6_0_on; assign tr6_0_on = (gr_x_6_0 <= x) && (x <= gr_x_6_0+18) && (gr_y_6_0 <= y) && (y <= gr_y_6_0+18);
wire tr6_1_on; assign tr6_1_on = (gr_x_6_1 <= x) && (x <= gr_x_6_1+18) && (gr_y_6_1 <= y) && (y <= gr_y_6_1+18);
wire tr6_2_on; assign tr6_2_on = (gr_x_6_2 <= x) && (x <= gr_x_6_2+18) && (gr_y_6_2 <= y) && (y <= gr_y_6_2+18);
wire tr6_3_on; assign tr6_3_on = (gr_x_6_3 <= x) && (x <= gr_x_6_3+18) && (gr_y_6_3 <= y) && (y <= gr_y_6_3+18);
wire tr6_4_on; assign tr6_4_on = (gr_x_6_4 <= x) && (x <= gr_x_6_4+18) && (gr_y_6_4 <= y) && (y <= gr_y_6_4+18);
wire tr6_5_on; assign tr6_5_on = (gr_x_6_5 <= x) && (x <= gr_x_6_5+18) && (gr_y_6_5 <= y) && (y <= gr_y_6_5+18);
wire tr6_6_on; assign tr6_6_on = (gr_x_6_6 <= x) && (x <= gr_x_6_6+18) && (gr_y_6_6 <= y) && (y <= gr_y_6_6+18);
wire tr6_7_on; assign tr6_7_on = (gr_x_6_7 <= x) && (x <= gr_x_6_7+18) && (gr_y_6_7 <= y) && (y <= gr_y_6_7+18);
wire tr6_8_on; assign tr6_8_on = (gr_x_6_8 <= x) && (x <= gr_x_6_8+18) && (gr_y_6_8 <= y) && (y <= gr_y_6_8+18);
wire tr6_9_on; assign tr6_9_on = (gr_x_6_9 <= x) && (x <= gr_x_6_9+18) && (gr_y_6_9 <= y) && (y <= gr_y_6_9+18);
wire tr6_10_on; assign tr6_10_on = (gr_x_6_10 <= x) && (x <= gr_x_6_10+18) && (gr_y_6_10 <= y) && (y <= gr_y_6_10+18);
wire tr6_11_on; assign tr6_11_on = (gr_x_6_11 <= x) && (x <= gr_x_6_11+18) && (gr_y_6_11 <= y) && (y <= gr_y_6_11+18);
wire tr6_12_on; assign tr6_12_on = (gr_x_6_12 <= x) && (x <= gr_x_6_12+18) && (gr_y_6_12 <= y) && (y <= gr_y_6_12+18);
wire tr6_13_on; assign tr6_13_on = (gr_x_6_13 <= x) && (x <= gr_x_6_13+18) && (gr_y_6_13 <= y) && (y <= gr_y_6_13+18);
wire tr6_14_on; assign tr6_14_on = (gr_x_6_14 <= x) && (x <= gr_x_6_14+18) && (gr_y_6_14 <= y) && (y <= gr_y_6_14+18);
wire tr6_15_on; assign tr6_15_on = (gr_x_6_15 <= x) && (x <= gr_x_6_15+18) && (gr_y_6_15 <= y) && (y <= gr_y_6_15+18);
wire tr6_16_on; assign tr6_16_on = (gr_x_6_16 <= x) && (x <= gr_x_6_16+18) && (gr_y_6_16 <= y) && (y <= gr_y_6_16+18);
wire tr6_17_on; assign tr6_17_on = (gr_x_6_17 <= x) && (x <= gr_x_6_17+18) && (gr_y_6_17 <= y) && (y <= gr_y_6_17+18);
wire tr6_18_on; assign tr6_18_on = (gr_x_6_18 <= x) && (x <= gr_x_6_18+18) && (gr_y_6_18 <= y) && (y <= gr_y_6_18+18);
wire tr6_19_on; assign tr6_19_on = (gr_x_6_19 <= x) && (x <= gr_x_6_19+18) && (gr_y_6_19 <= y) && (y <= gr_y_6_19+18);
wire tr6_20_on; assign tr6_20_on = (gr_x_6_20 <= x) && (x <= gr_x_6_20+18) && (gr_y_6_20 <= y) && (y <= gr_y_6_20+18);
wire tr6_21_on; assign tr6_21_on = (gr_x_6_21 <= x) && (x <= gr_x_6_21+18) && (gr_y_6_21 <= y) && (y <= gr_y_6_21+18);
wire tr6_22_on; assign tr6_22_on = (gr_x_6_22 <= x) && (x <= gr_x_6_22+18) && (gr_y_6_22 <= y) && (y <= gr_y_6_22+18);
wire tr6_23_on; assign tr6_23_on = (gr_x_6_23 <= x) && (x <= gr_x_6_23+18) && (gr_y_6_23 <= y) && (y <= gr_y_6_23+18);
wire tr6_24_on; assign tr6_24_on = (gr_x_6_24 <= x) && (x <= gr_x_6_24+18) && (gr_y_6_24 <= y) && (y <= gr_y_6_24+18);
wire tr7_0_on; assign tr7_0_on = (gr_x_7_0 <= x) && (x <= gr_x_7_0+18) && (gr_y_7_0 <= y) && (y <= gr_y_7_0+18);
wire tr7_1_on; assign tr7_1_on = (gr_x_7_1 <= x) && (x <= gr_x_7_1+18) && (gr_y_7_1 <= y) && (y <= gr_y_7_1+18);
wire tr7_2_on; assign tr7_2_on = (gr_x_7_2 <= x) && (x <= gr_x_7_2+18) && (gr_y_7_2 <= y) && (y <= gr_y_7_2+18);
wire tr7_3_on; assign tr7_3_on = (gr_x_7_3 <= x) && (x <= gr_x_7_3+18) && (gr_y_7_3 <= y) && (y <= gr_y_7_3+18);
wire tr7_4_on; assign tr7_4_on = (gr_x_7_4 <= x) && (x <= gr_x_7_4+18) && (gr_y_7_4 <= y) && (y <= gr_y_7_4+18);
wire tr7_5_on; assign tr7_5_on = (gr_x_7_5 <= x) && (x <= gr_x_7_5+18) && (gr_y_7_5 <= y) && (y <= gr_y_7_5+18);
wire tr7_6_on; assign tr7_6_on = (gr_x_7_6 <= x) && (x <= gr_x_7_6+18) && (gr_y_7_6 <= y) && (y <= gr_y_7_6+18);
wire tr7_7_on; assign tr7_7_on = (gr_x_7_7 <= x) && (x <= gr_x_7_7+18) && (gr_y_7_7 <= y) && (y <= gr_y_7_7+18);
wire tr7_8_on; assign tr7_8_on = (gr_x_7_8 <= x) && (x <= gr_x_7_8+18) && (gr_y_7_8 <= y) && (y <= gr_y_7_8+18);
wire tr7_9_on; assign tr7_9_on = (gr_x_7_9 <= x) && (x <= gr_x_7_9+18) && (gr_y_7_9 <= y) && (y <= gr_y_7_9+18);
wire tr7_10_on; assign tr7_10_on = (gr_x_7_10 <= x) && (x <= gr_x_7_10+18) && (gr_y_7_10 <= y) && (y <= gr_y_7_10+18);
wire tr7_11_on; assign tr7_11_on = (gr_x_7_11 <= x) && (x <= gr_x_7_11+18) && (gr_y_7_11 <= y) && (y <= gr_y_7_11+18);
wire tr7_12_on; assign tr7_12_on = (gr_x_7_12 <= x) && (x <= gr_x_7_12+18) && (gr_y_7_12 <= y) && (y <= gr_y_7_12+18);
wire tr7_13_on; assign tr7_13_on = (gr_x_7_13 <= x) && (x <= gr_x_7_13+18) && (gr_y_7_13 <= y) && (y <= gr_y_7_13+18);
wire tr7_14_on; assign tr7_14_on = (gr_x_7_14 <= x) && (x <= gr_x_7_14+18) && (gr_y_7_14 <= y) && (y <= gr_y_7_14+18);
wire tr7_15_on; assign tr7_15_on = (gr_x_7_15 <= x) && (x <= gr_x_7_15+18) && (gr_y_7_15 <= y) && (y <= gr_y_7_15+18);
wire tr7_16_on; assign tr7_16_on = (gr_x_7_16 <= x) && (x <= gr_x_7_16+18) && (gr_y_7_16 <= y) && (y <= gr_y_7_16+18);
wire tr7_17_on; assign tr7_17_on = (gr_x_7_17 <= x) && (x <= gr_x_7_17+18) && (gr_y_7_17 <= y) && (y <= gr_y_7_17+18);
wire tr7_18_on; assign tr7_18_on = (gr_x_7_18 <= x) && (x <= gr_x_7_18+18) && (gr_y_7_18 <= y) && (y <= gr_y_7_18+18);
wire tr7_19_on; assign tr7_19_on = (gr_x_7_19 <= x) && (x <= gr_x_7_19+18) && (gr_y_7_19 <= y) && (y <= gr_y_7_19+18);
wire tr7_20_on; assign tr7_20_on = (gr_x_7_20 <= x) && (x <= gr_x_7_20+18) && (gr_y_7_20 <= y) && (y <= gr_y_7_20+18);
wire tr7_21_on; assign tr7_21_on = (gr_x_7_21 <= x) && (x <= gr_x_7_21+18) && (gr_y_7_21 <= y) && (y <= gr_y_7_21+18);
wire tr7_22_on; assign tr7_22_on = (gr_x_7_22 <= x) && (x <= gr_x_7_22+18) && (gr_y_7_22 <= y) && (y <= gr_y_7_22+18);
wire tr7_23_on; assign tr7_23_on = (gr_x_7_23 <= x) && (x <= gr_x_7_23+18) && (gr_y_7_23 <= y) && (y <= gr_y_7_23+18);
wire tr7_24_on; assign tr7_24_on = (gr_x_7_24 <= x) && (x <= gr_x_7_24+18) && (gr_y_7_24 <= y) && (y <= gr_y_7_24+18);
wire tr8_0_on; assign tr8_0_on = (gr_x_8_0 <= x) && (x <= gr_x_8_0+18) && (gr_y_8_0 <= y) && (y <= gr_y_8_0+18);
wire tr8_1_on; assign tr8_1_on = (gr_x_8_1 <= x) && (x <= gr_x_8_1+18) && (gr_y_8_1 <= y) && (y <= gr_y_8_1+18);
wire tr8_2_on; assign tr8_2_on = (gr_x_8_2 <= x) && (x <= gr_x_8_2+18) && (gr_y_8_2 <= y) && (y <= gr_y_8_2+18);
wire tr8_3_on; assign tr8_3_on = (gr_x_8_3 <= x) && (x <= gr_x_8_3+18) && (gr_y_8_3 <= y) && (y <= gr_y_8_3+18);
wire tr8_4_on; assign tr8_4_on = (gr_x_8_4 <= x) && (x <= gr_x_8_4+18) && (gr_y_8_4 <= y) && (y <= gr_y_8_4+18);
wire tr8_5_on; assign tr8_5_on = (gr_x_8_5 <= x) && (x <= gr_x_8_5+18) && (gr_y_8_5 <= y) && (y <= gr_y_8_5+18);
wire tr8_6_on; assign tr8_6_on = (gr_x_8_6 <= x) && (x <= gr_x_8_6+18) && (gr_y_8_6 <= y) && (y <= gr_y_8_6+18);
wire tr8_7_on; assign tr8_7_on = (gr_x_8_7 <= x) && (x <= gr_x_8_7+18) && (gr_y_8_7 <= y) && (y <= gr_y_8_7+18);
wire tr8_8_on; assign tr8_8_on = (gr_x_8_8 <= x) && (x <= gr_x_8_8+18) && (gr_y_8_8 <= y) && (y <= gr_y_8_8+18);
wire tr8_9_on; assign tr8_9_on = (gr_x_8_9 <= x) && (x <= gr_x_8_9+18) && (gr_y_8_9 <= y) && (y <= gr_y_8_9+18);
wire tr8_10_on; assign tr8_10_on = (gr_x_8_10 <= x) && (x <= gr_x_8_10+18) && (gr_y_8_10 <= y) && (y <= gr_y_8_10+18);
wire tr8_11_on; assign tr8_11_on = (gr_x_8_11 <= x) && (x <= gr_x_8_11+18) && (gr_y_8_11 <= y) && (y <= gr_y_8_11+18);
wire tr8_12_on; assign tr8_12_on = (gr_x_8_12 <= x) && (x <= gr_x_8_12+18) && (gr_y_8_12 <= y) && (y <= gr_y_8_12+18);
wire tr8_13_on; assign tr8_13_on = (gr_x_8_13 <= x) && (x <= gr_x_8_13+18) && (gr_y_8_13 <= y) && (y <= gr_y_8_13+18);
wire tr8_14_on; assign tr8_14_on = (gr_x_8_14 <= x) && (x <= gr_x_8_14+18) && (gr_y_8_14 <= y) && (y <= gr_y_8_14+18);
wire tr8_15_on; assign tr8_15_on = (gr_x_8_15 <= x) && (x <= gr_x_8_15+18) && (gr_y_8_15 <= y) && (y <= gr_y_8_15+18);
wire tr8_16_on; assign tr8_16_on = (gr_x_8_16 <= x) && (x <= gr_x_8_16+18) && (gr_y_8_16 <= y) && (y <= gr_y_8_16+18);
wire tr8_17_on; assign tr8_17_on = (gr_x_8_17 <= x) && (x <= gr_x_8_17+18) && (gr_y_8_17 <= y) && (y <= gr_y_8_17+18);
wire tr8_18_on; assign tr8_18_on = (gr_x_8_18 <= x) && (x <= gr_x_8_18+18) && (gr_y_8_18 <= y) && (y <= gr_y_8_18+18);
wire tr8_19_on; assign tr8_19_on = (gr_x_8_19 <= x) && (x <= gr_x_8_19+18) && (gr_y_8_19 <= y) && (y <= gr_y_8_19+18);
wire tr8_20_on; assign tr8_20_on = (gr_x_8_20 <= x) && (x <= gr_x_8_20+18) && (gr_y_8_20 <= y) && (y <= gr_y_8_20+18);
wire tr8_21_on; assign tr8_21_on = (gr_x_8_21 <= x) && (x <= gr_x_8_21+18) && (gr_y_8_21 <= y) && (y <= gr_y_8_21+18);
wire tr8_22_on; assign tr8_22_on = (gr_x_8_22 <= x) && (x <= gr_x_8_22+18) && (gr_y_8_22 <= y) && (y <= gr_y_8_22+18);
wire tr8_23_on; assign tr8_23_on = (gr_x_8_23 <= x) && (x <= gr_x_8_23+18) && (gr_y_8_23 <= y) && (y <= gr_y_8_23+18);
wire tr8_24_on; assign tr8_24_on = (gr_x_8_24 <= x) && (x <= gr_x_8_24+18) && (gr_y_8_24 <= y) && (y <= gr_y_8_24+18);
wire tr9_0_on; assign tr9_0_on = (gr_x_9_0 <= x) && (x <= gr_x_9_0+18) && (gr_y_9_0 <= y) && (y <= gr_y_9_0+18);
wire tr9_1_on; assign tr9_1_on = (gr_x_9_1 <= x) && (x <= gr_x_9_1+18) && (gr_y_9_1 <= y) && (y <= gr_y_9_1+18);
wire tr9_2_on; assign tr9_2_on = (gr_x_9_2 <= x) && (x <= gr_x_9_2+18) && (gr_y_9_2 <= y) && (y <= gr_y_9_2+18);
wire tr9_3_on; assign tr9_3_on = (gr_x_9_3 <= x) && (x <= gr_x_9_3+18) && (gr_y_9_3 <= y) && (y <= gr_y_9_3+18);
wire tr9_4_on; assign tr9_4_on = (gr_x_9_4 <= x) && (x <= gr_x_9_4+18) && (gr_y_9_4 <= y) && (y <= gr_y_9_4+18);
wire tr9_5_on; assign tr9_5_on = (gr_x_9_5 <= x) && (x <= gr_x_9_5+18) && (gr_y_9_5 <= y) && (y <= gr_y_9_5+18);
wire tr9_6_on; assign tr9_6_on = (gr_x_9_6 <= x) && (x <= gr_x_9_6+18) && (gr_y_9_6 <= y) && (y <= gr_y_9_6+18);
wire tr9_7_on; assign tr9_7_on = (gr_x_9_7 <= x) && (x <= gr_x_9_7+18) && (gr_y_9_7 <= y) && (y <= gr_y_9_7+18);
wire tr9_8_on; assign tr9_8_on = (gr_x_9_8 <= x) && (x <= gr_x_9_8+18) && (gr_y_9_8 <= y) && (y <= gr_y_9_8+18);
wire tr9_9_on; assign tr9_9_on = (gr_x_9_9 <= x) && (x <= gr_x_9_9+18) && (gr_y_9_9 <= y) && (y <= gr_y_9_9+18);
wire tr9_10_on; assign tr9_10_on = (gr_x_9_10 <= x) && (x <= gr_x_9_10+18) && (gr_y_9_10 <= y) && (y <= gr_y_9_10+18);
wire tr9_11_on; assign tr9_11_on = (gr_x_9_11 <= x) && (x <= gr_x_9_11+18) && (gr_y_9_11 <= y) && (y <= gr_y_9_11+18);
wire tr9_12_on; assign tr9_12_on = (gr_x_9_12 <= x) && (x <= gr_x_9_12+18) && (gr_y_9_12 <= y) && (y <= gr_y_9_12+18);
wire tr9_13_on; assign tr9_13_on = (gr_x_9_13 <= x) && (x <= gr_x_9_13+18) && (gr_y_9_13 <= y) && (y <= gr_y_9_13+18);
wire tr9_14_on; assign tr9_14_on = (gr_x_9_14 <= x) && (x <= gr_x_9_14+18) && (gr_y_9_14 <= y) && (y <= gr_y_9_14+18);
wire tr9_15_on; assign tr9_15_on = (gr_x_9_15 <= x) && (x <= gr_x_9_15+18) && (gr_y_9_15 <= y) && (y <= gr_y_9_15+18);
wire tr9_16_on; assign tr9_16_on = (gr_x_9_16 <= x) && (x <= gr_x_9_16+18) && (gr_y_9_16 <= y) && (y <= gr_y_9_16+18);
wire tr9_17_on; assign tr9_17_on = (gr_x_9_17 <= x) && (x <= gr_x_9_17+18) && (gr_y_9_17 <= y) && (y <= gr_y_9_17+18);
wire tr9_18_on; assign tr9_18_on = (gr_x_9_18 <= x) && (x <= gr_x_9_18+18) && (gr_y_9_18 <= y) && (y <= gr_y_9_18+18);
wire tr9_19_on; assign tr9_19_on = (gr_x_9_19 <= x) && (x <= gr_x_9_19+18) && (gr_y_9_19 <= y) && (y <= gr_y_9_19+18);
wire tr9_20_on; assign tr9_20_on = (gr_x_9_20 <= x) && (x <= gr_x_9_20+18) && (gr_y_9_20 <= y) && (y <= gr_y_9_20+18);
wire tr9_21_on; assign tr9_21_on = (gr_x_9_21 <= x) && (x <= gr_x_9_21+18) && (gr_y_9_21 <= y) && (y <= gr_y_9_21+18);
wire tr9_22_on; assign tr9_22_on = (gr_x_9_22 <= x) && (x <= gr_x_9_22+18) && (gr_y_9_22 <= y) && (y <= gr_y_9_22+18);
wire tr9_23_on; assign tr9_23_on = (gr_x_9_23 <= x) && (x <= gr_x_9_23+18) && (gr_y_9_23 <= y) && (y <= gr_y_9_23+18);
wire tr9_24_on; assign tr9_24_on = (gr_x_9_24 <= x) && (x <= gr_x_9_24+18) && (gr_y_9_24 <= y) && (y <= gr_y_9_24+18);
wire tr10_0_on; assign tr10_0_on = (gr_x_10_0 <= x) && (x <= gr_x_10_0+18) && (gr_y_10_0 <= y) && (y <= gr_y_10_0+18);
wire tr10_1_on; assign tr10_1_on = (gr_x_10_1 <= x) && (x <= gr_x_10_1+18) && (gr_y_10_1 <= y) && (y <= gr_y_10_1+18);
wire tr10_2_on; assign tr10_2_on = (gr_x_10_2 <= x) && (x <= gr_x_10_2+18) && (gr_y_10_2 <= y) && (y <= gr_y_10_2+18);
wire tr10_3_on; assign tr10_3_on = (gr_x_10_3 <= x) && (x <= gr_x_10_3+18) && (gr_y_10_3 <= y) && (y <= gr_y_10_3+18);
wire tr10_4_on; assign tr10_4_on = (gr_x_10_4 <= x) && (x <= gr_x_10_4+18) && (gr_y_10_4 <= y) && (y <= gr_y_10_4+18);
wire tr10_5_on; assign tr10_5_on = (gr_x_10_5 <= x) && (x <= gr_x_10_5+18) && (gr_y_10_5 <= y) && (y <= gr_y_10_5+18);
wire tr10_6_on; assign tr10_6_on = (gr_x_10_6 <= x) && (x <= gr_x_10_6+18) && (gr_y_10_6 <= y) && (y <= gr_y_10_6+18);
wire tr10_7_on; assign tr10_7_on = (gr_x_10_7 <= x) && (x <= gr_x_10_7+18) && (gr_y_10_7 <= y) && (y <= gr_y_10_7+18);
wire tr10_8_on; assign tr10_8_on = (gr_x_10_8 <= x) && (x <= gr_x_10_8+18) && (gr_y_10_8 <= y) && (y <= gr_y_10_8+18);
wire tr10_9_on; assign tr10_9_on = (gr_x_10_9 <= x) && (x <= gr_x_10_9+18) && (gr_y_10_9 <= y) && (y <= gr_y_10_9+18);
wire tr10_10_on; assign tr10_10_on = (gr_x_10_10 <= x) && (x <= gr_x_10_10+18) && (gr_y_10_10 <= y) && (y <= gr_y_10_10+18);
wire tr10_11_on; assign tr10_11_on = (gr_x_10_11 <= x) && (x <= gr_x_10_11+18) && (gr_y_10_11 <= y) && (y <= gr_y_10_11+18);
wire tr10_12_on; assign tr10_12_on = (gr_x_10_12 <= x) && (x <= gr_x_10_12+18) && (gr_y_10_12 <= y) && (y <= gr_y_10_12+18);
wire tr10_13_on; assign tr10_13_on = (gr_x_10_13 <= x) && (x <= gr_x_10_13+18) && (gr_y_10_13 <= y) && (y <= gr_y_10_13+18);
wire tr10_14_on; assign tr10_14_on = (gr_x_10_14 <= x) && (x <= gr_x_10_14+18) && (gr_y_10_14 <= y) && (y <= gr_y_10_14+18);
wire tr10_15_on; assign tr10_15_on = (gr_x_10_15 <= x) && (x <= gr_x_10_15+18) && (gr_y_10_15 <= y) && (y <= gr_y_10_15+18);
wire tr10_16_on; assign tr10_16_on = (gr_x_10_16 <= x) && (x <= gr_x_10_16+18) && (gr_y_10_16 <= y) && (y <= gr_y_10_16+18);
wire tr10_17_on; assign tr10_17_on = (gr_x_10_17 <= x) && (x <= gr_x_10_17+18) && (gr_y_10_17 <= y) && (y <= gr_y_10_17+18);
wire tr10_18_on; assign tr10_18_on = (gr_x_10_18 <= x) && (x <= gr_x_10_18+18) && (gr_y_10_18 <= y) && (y <= gr_y_10_18+18);
wire tr10_19_on; assign tr10_19_on = (gr_x_10_19 <= x) && (x <= gr_x_10_19+18) && (gr_y_10_19 <= y) && (y <= gr_y_10_19+18);
wire tr10_20_on; assign tr10_20_on = (gr_x_10_20 <= x) && (x <= gr_x_10_20+18) && (gr_y_10_20 <= y) && (y <= gr_y_10_20+18);
wire tr10_21_on; assign tr10_21_on = (gr_x_10_21 <= x) && (x <= gr_x_10_21+18) && (gr_y_10_21 <= y) && (y <= gr_y_10_21+18);
wire tr10_22_on; assign tr10_22_on = (gr_x_10_22 <= x) && (x <= gr_x_10_22+18) && (gr_y_10_22 <= y) && (y <= gr_y_10_22+18);
wire tr10_23_on; assign tr10_23_on = (gr_x_10_23 <= x) && (x <= gr_x_10_23+18) && (gr_y_10_23 <= y) && (y <= gr_y_10_23+18);
wire tr10_24_on; assign tr10_24_on = (gr_x_10_24 <= x) && (x <= gr_x_10_24+18) && (gr_y_10_24 <= y) && (y <= gr_y_10_24+18);
wire tr11_0_on; assign tr11_0_on = (gr_x_11_0 <= x) && (x <= gr_x_11_0+18) && (gr_y_11_0 <= y) && (y <= gr_y_11_0+18);
wire tr11_1_on; assign tr11_1_on = (gr_x_11_1 <= x) && (x <= gr_x_11_1+18) && (gr_y_11_1 <= y) && (y <= gr_y_11_1+18);
wire tr11_2_on; assign tr11_2_on = (gr_x_11_2 <= x) && (x <= gr_x_11_2+18) && (gr_y_11_2 <= y) && (y <= gr_y_11_2+18);
wire tr11_3_on; assign tr11_3_on = (gr_x_11_3 <= x) && (x <= gr_x_11_3+18) && (gr_y_11_3 <= y) && (y <= gr_y_11_3+18);
wire tr11_4_on; assign tr11_4_on = (gr_x_11_4 <= x) && (x <= gr_x_11_4+18) && (gr_y_11_4 <= y) && (y <= gr_y_11_4+18);
wire tr11_5_on; assign tr11_5_on = (gr_x_11_5 <= x) && (x <= gr_x_11_5+18) && (gr_y_11_5 <= y) && (y <= gr_y_11_5+18);
wire tr11_6_on; assign tr11_6_on = (gr_x_11_6 <= x) && (x <= gr_x_11_6+18) && (gr_y_11_6 <= y) && (y <= gr_y_11_6+18);
wire tr11_7_on; assign tr11_7_on = (gr_x_11_7 <= x) && (x <= gr_x_11_7+18) && (gr_y_11_7 <= y) && (y <= gr_y_11_7+18);
wire tr11_8_on; assign tr11_8_on = (gr_x_11_8 <= x) && (x <= gr_x_11_8+18) && (gr_y_11_8 <= y) && (y <= gr_y_11_8+18);
wire tr11_9_on; assign tr11_9_on = (gr_x_11_9 <= x) && (x <= gr_x_11_9+18) && (gr_y_11_9 <= y) && (y <= gr_y_11_9+18);
wire tr11_10_on; assign tr11_10_on = (gr_x_11_10 <= x) && (x <= gr_x_11_10+18) && (gr_y_11_10 <= y) && (y <= gr_y_11_10+18);
wire tr11_11_on; assign tr11_11_on = (gr_x_11_11 <= x) && (x <= gr_x_11_11+18) && (gr_y_11_11 <= y) && (y <= gr_y_11_11+18);
wire tr11_12_on; assign tr11_12_on = (gr_x_11_12 <= x) && (x <= gr_x_11_12+18) && (gr_y_11_12 <= y) && (y <= gr_y_11_12+18);
wire tr11_13_on; assign tr11_13_on = (gr_x_11_13 <= x) && (x <= gr_x_11_13+18) && (gr_y_11_13 <= y) && (y <= gr_y_11_13+18);
wire tr11_14_on; assign tr11_14_on = (gr_x_11_14 <= x) && (x <= gr_x_11_14+18) && (gr_y_11_14 <= y) && (y <= gr_y_11_14+18);
wire tr11_15_on; assign tr11_15_on = (gr_x_11_15 <= x) && (x <= gr_x_11_15+18) && (gr_y_11_15 <= y) && (y <= gr_y_11_15+18);
wire tr11_16_on; assign tr11_16_on = (gr_x_11_16 <= x) && (x <= gr_x_11_16+18) && (gr_y_11_16 <= y) && (y <= gr_y_11_16+18);
wire tr11_17_on; assign tr11_17_on = (gr_x_11_17 <= x) && (x <= gr_x_11_17+18) && (gr_y_11_17 <= y) && (y <= gr_y_11_17+18);
wire tr11_18_on; assign tr11_18_on = (gr_x_11_18 <= x) && (x <= gr_x_11_18+18) && (gr_y_11_18 <= y) && (y <= gr_y_11_18+18);
wire tr11_19_on; assign tr11_19_on = (gr_x_11_19 <= x) && (x <= gr_x_11_19+18) && (gr_y_11_19 <= y) && (y <= gr_y_11_19+18);
wire tr11_20_on; assign tr11_20_on = (gr_x_11_20 <= x) && (x <= gr_x_11_20+18) && (gr_y_11_20 <= y) && (y <= gr_y_11_20+18);
wire tr11_21_on; assign tr11_21_on = (gr_x_11_21 <= x) && (x <= gr_x_11_21+18) && (gr_y_11_21 <= y) && (y <= gr_y_11_21+18);
wire tr11_22_on; assign tr11_22_on = (gr_x_11_22 <= x) && (x <= gr_x_11_22+18) && (gr_y_11_22 <= y) && (y <= gr_y_11_22+18);
wire tr11_23_on; assign tr11_23_on = (gr_x_11_23 <= x) && (x <= gr_x_11_23+18) && (gr_y_11_23 <= y) && (y <= gr_y_11_23+18);
wire tr11_24_on; assign tr11_24_on = (gr_x_11_24 <= x) && (x <= gr_x_11_24+18) && (gr_y_11_24 <= y) && (y <= gr_y_11_24+18);
wire tr12_0_on; assign tr12_0_on = (gr_x_12_0 <= x) && (x <= gr_x_12_0+18) && (gr_y_12_0 <= y) && (y <= gr_y_12_0+18);
wire tr12_1_on; assign tr12_1_on = (gr_x_12_1 <= x) && (x <= gr_x_12_1+18) && (gr_y_12_1 <= y) && (y <= gr_y_12_1+18);
wire tr12_2_on; assign tr12_2_on = (gr_x_12_2 <= x) && (x <= gr_x_12_2+18) && (gr_y_12_2 <= y) && (y <= gr_y_12_2+18);
wire tr12_3_on; assign tr12_3_on = (gr_x_12_3 <= x) && (x <= gr_x_12_3+18) && (gr_y_12_3 <= y) && (y <= gr_y_12_3+18);
wire tr12_4_on; assign tr12_4_on = (gr_x_12_4 <= x) && (x <= gr_x_12_4+18) && (gr_y_12_4 <= y) && (y <= gr_y_12_4+18);
wire tr12_5_on; assign tr12_5_on = (gr_x_12_5 <= x) && (x <= gr_x_12_5+18) && (gr_y_12_5 <= y) && (y <= gr_y_12_5+18);
wire tr12_6_on; assign tr12_6_on = (gr_x_12_6 <= x) && (x <= gr_x_12_6+18) && (gr_y_12_6 <= y) && (y <= gr_y_12_6+18);
wire tr12_7_on; assign tr12_7_on = (gr_x_12_7 <= x) && (x <= gr_x_12_7+18) && (gr_y_12_7 <= y) && (y <= gr_y_12_7+18);
wire tr12_8_on; assign tr12_8_on = (gr_x_12_8 <= x) && (x <= gr_x_12_8+18) && (gr_y_12_8 <= y) && (y <= gr_y_12_8+18);
wire tr12_9_on; assign tr12_9_on = (gr_x_12_9 <= x) && (x <= gr_x_12_9+18) && (gr_y_12_9 <= y) && (y <= gr_y_12_9+18);
wire tr12_10_on; assign tr12_10_on = (gr_x_12_10 <= x) && (x <= gr_x_12_10+18) && (gr_y_12_10 <= y) && (y <= gr_y_12_10+18);
wire tr12_11_on; assign tr12_11_on = (gr_x_12_11 <= x) && (x <= gr_x_12_11+18) && (gr_y_12_11 <= y) && (y <= gr_y_12_11+18);
wire tr12_12_on; assign tr12_12_on = (gr_x_12_12 <= x) && (x <= gr_x_12_12+18) && (gr_y_12_12 <= y) && (y <= gr_y_12_12+18);
wire tr12_13_on; assign tr12_13_on = (gr_x_12_13 <= x) && (x <= gr_x_12_13+18) && (gr_y_12_13 <= y) && (y <= gr_y_12_13+18);
wire tr12_14_on; assign tr12_14_on = (gr_x_12_14 <= x) && (x <= gr_x_12_14+18) && (gr_y_12_14 <= y) && (y <= gr_y_12_14+18);
wire tr12_15_on; assign tr12_15_on = (gr_x_12_15 <= x) && (x <= gr_x_12_15+18) && (gr_y_12_15 <= y) && (y <= gr_y_12_15+18);
wire tr12_16_on; assign tr12_16_on = (gr_x_12_16 <= x) && (x <= gr_x_12_16+18) && (gr_y_12_16 <= y) && (y <= gr_y_12_16+18);
wire tr12_17_on; assign tr12_17_on = (gr_x_12_17 <= x) && (x <= gr_x_12_17+18) && (gr_y_12_17 <= y) && (y <= gr_y_12_17+18);
wire tr12_18_on; assign tr12_18_on = (gr_x_12_18 <= x) && (x <= gr_x_12_18+18) && (gr_y_12_18 <= y) && (y <= gr_y_12_18+18);
wire tr12_19_on; assign tr12_19_on = (gr_x_12_19 <= x) && (x <= gr_x_12_19+18) && (gr_y_12_19 <= y) && (y <= gr_y_12_19+18);
wire tr12_20_on; assign tr12_20_on = (gr_x_12_20 <= x) && (x <= gr_x_12_20+18) && (gr_y_12_20 <= y) && (y <= gr_y_12_20+18);
wire tr12_21_on; assign tr12_21_on = (gr_x_12_21 <= x) && (x <= gr_x_12_21+18) && (gr_y_12_21 <= y) && (y <= gr_y_12_21+18);
wire tr12_22_on; assign tr12_22_on = (gr_x_12_22 <= x) && (x <= gr_x_12_22+18) && (gr_y_12_22 <= y) && (y <= gr_y_12_22+18);
wire tr12_23_on; assign tr12_23_on = (gr_x_12_23 <= x) && (x <= gr_x_12_23+18) && (gr_y_12_23 <= y) && (y <= gr_y_12_23+18);
wire tr12_24_on; assign tr12_24_on = (gr_x_12_24 <= x) && (x <= gr_x_12_24+18) && (gr_y_12_24 <= y) && (y <= gr_y_12_24+18);
wire tr13_0_on; assign tr13_0_on = (gr_x_13_0 <= x) && (x <= gr_x_13_0+18) && (gr_y_13_0 <= y) && (y <= gr_y_13_0+18);
wire tr13_1_on; assign tr13_1_on = (gr_x_13_1 <= x) && (x <= gr_x_13_1+18) && (gr_y_13_1 <= y) && (y <= gr_y_13_1+18);
wire tr13_2_on; assign tr13_2_on = (gr_x_13_2 <= x) && (x <= gr_x_13_2+18) && (gr_y_13_2 <= y) && (y <= gr_y_13_2+18);
wire tr13_3_on; assign tr13_3_on = (gr_x_13_3 <= x) && (x <= gr_x_13_3+18) && (gr_y_13_3 <= y) && (y <= gr_y_13_3+18);
wire tr13_4_on; assign tr13_4_on = (gr_x_13_4 <= x) && (x <= gr_x_13_4+18) && (gr_y_13_4 <= y) && (y <= gr_y_13_4+18);
wire tr13_5_on; assign tr13_5_on = (gr_x_13_5 <= x) && (x <= gr_x_13_5+18) && (gr_y_13_5 <= y) && (y <= gr_y_13_5+18);
wire tr13_6_on; assign tr13_6_on = (gr_x_13_6 <= x) && (x <= gr_x_13_6+18) && (gr_y_13_6 <= y) && (y <= gr_y_13_6+18);
wire tr13_7_on; assign tr13_7_on = (gr_x_13_7 <= x) && (x <= gr_x_13_7+18) && (gr_y_13_7 <= y) && (y <= gr_y_13_7+18);
wire tr13_8_on; assign tr13_8_on = (gr_x_13_8 <= x) && (x <= gr_x_13_8+18) && (gr_y_13_8 <= y) && (y <= gr_y_13_8+18);
wire tr13_9_on; assign tr13_9_on = (gr_x_13_9 <= x) && (x <= gr_x_13_9+18) && (gr_y_13_9 <= y) && (y <= gr_y_13_9+18);
wire tr13_10_on; assign tr13_10_on = (gr_x_13_10 <= x) && (x <= gr_x_13_10+18) && (gr_y_13_10 <= y) && (y <= gr_y_13_10+18);
wire tr13_11_on; assign tr13_11_on = (gr_x_13_11 <= x) && (x <= gr_x_13_11+18) && (gr_y_13_11 <= y) && (y <= gr_y_13_11+18);
wire tr13_12_on; assign tr13_12_on = (gr_x_13_12 <= x) && (x <= gr_x_13_12+18) && (gr_y_13_12 <= y) && (y <= gr_y_13_12+18);
wire tr13_13_on; assign tr13_13_on = (gr_x_13_13 <= x) && (x <= gr_x_13_13+18) && (gr_y_13_13 <= y) && (y <= gr_y_13_13+18);
wire tr13_14_on; assign tr13_14_on = (gr_x_13_14 <= x) && (x <= gr_x_13_14+18) && (gr_y_13_14 <= y) && (y <= gr_y_13_14+18);
wire tr13_15_on; assign tr13_15_on = (gr_x_13_15 <= x) && (x <= gr_x_13_15+18) && (gr_y_13_15 <= y) && (y <= gr_y_13_15+18);
wire tr13_16_on; assign tr13_16_on = (gr_x_13_16 <= x) && (x <= gr_x_13_16+18) && (gr_y_13_16 <= y) && (y <= gr_y_13_16+18);
wire tr13_17_on; assign tr13_17_on = (gr_x_13_17 <= x) && (x <= gr_x_13_17+18) && (gr_y_13_17 <= y) && (y <= gr_y_13_17+18);
wire tr13_18_on; assign tr13_18_on = (gr_x_13_18 <= x) && (x <= gr_x_13_18+18) && (gr_y_13_18 <= y) && (y <= gr_y_13_18+18);
wire tr13_19_on; assign tr13_19_on = (gr_x_13_19 <= x) && (x <= gr_x_13_19+18) && (gr_y_13_19 <= y) && (y <= gr_y_13_19+18);
wire tr13_20_on; assign tr13_20_on = (gr_x_13_20 <= x) && (x <= gr_x_13_20+18) && (gr_y_13_20 <= y) && (y <= gr_y_13_20+18);
wire tr13_21_on; assign tr13_21_on = (gr_x_13_21 <= x) && (x <= gr_x_13_21+18) && (gr_y_13_21 <= y) && (y <= gr_y_13_21+18);
wire tr13_22_on; assign tr13_22_on = (gr_x_13_22 <= x) && (x <= gr_x_13_22+18) && (gr_y_13_22 <= y) && (y <= gr_y_13_22+18);
wire tr13_23_on; assign tr13_23_on = (gr_x_13_23 <= x) && (x <= gr_x_13_23+18) && (gr_y_13_23 <= y) && (y <= gr_y_13_23+18);
wire tr13_24_on; assign tr13_24_on = (gr_x_13_24 <= x) && (x <= gr_x_13_24+18) && (gr_y_13_24 <= y) && (y <= gr_y_13_24+18);
wire tr14_0_on; assign tr14_0_on = (gr_x_14_0 <= x) && (x <= gr_x_14_0+18) && (gr_y_14_0 <= y) && (y <= gr_y_14_0+18);
wire tr14_1_on; assign tr14_1_on = (gr_x_14_1 <= x) && (x <= gr_x_14_1+18) && (gr_y_14_1 <= y) && (y <= gr_y_14_1+18);
wire tr14_2_on; assign tr14_2_on = (gr_x_14_2 <= x) && (x <= gr_x_14_2+18) && (gr_y_14_2 <= y) && (y <= gr_y_14_2+18);
wire tr14_3_on; assign tr14_3_on = (gr_x_14_3 <= x) && (x <= gr_x_14_3+18) && (gr_y_14_3 <= y) && (y <= gr_y_14_3+18);
wire tr14_4_on; assign tr14_4_on = (gr_x_14_4 <= x) && (x <= gr_x_14_4+18) && (gr_y_14_4 <= y) && (y <= gr_y_14_4+18);
wire tr14_5_on; assign tr14_5_on = (gr_x_14_5 <= x) && (x <= gr_x_14_5+18) && (gr_y_14_5 <= y) && (y <= gr_y_14_5+18);
wire tr14_6_on; assign tr14_6_on = (gr_x_14_6 <= x) && (x <= gr_x_14_6+18) && (gr_y_14_6 <= y) && (y <= gr_y_14_6+18);
wire tr14_7_on; assign tr14_7_on = (gr_x_14_7 <= x) && (x <= gr_x_14_7+18) && (gr_y_14_7 <= y) && (y <= gr_y_14_7+18);
wire tr14_8_on; assign tr14_8_on = (gr_x_14_8 <= x) && (x <= gr_x_14_8+18) && (gr_y_14_8 <= y) && (y <= gr_y_14_8+18);
wire tr14_9_on; assign tr14_9_on = (gr_x_14_9 <= x) && (x <= gr_x_14_9+18) && (gr_y_14_9 <= y) && (y <= gr_y_14_9+18);
wire tr14_10_on; assign tr14_10_on = (gr_x_14_10 <= x) && (x <= gr_x_14_10+18) && (gr_y_14_10 <= y) && (y <= gr_y_14_10+18);
wire tr14_11_on; assign tr14_11_on = (gr_x_14_11 <= x) && (x <= gr_x_14_11+18) && (gr_y_14_11 <= y) && (y <= gr_y_14_11+18);
wire tr14_12_on; assign tr14_12_on = (gr_x_14_12 <= x) && (x <= gr_x_14_12+18) && (gr_y_14_12 <= y) && (y <= gr_y_14_12+18);
wire tr14_13_on; assign tr14_13_on = (gr_x_14_13 <= x) && (x <= gr_x_14_13+18) && (gr_y_14_13 <= y) && (y <= gr_y_14_13+18);
wire tr14_14_on; assign tr14_14_on = (gr_x_14_14 <= x) && (x <= gr_x_14_14+18) && (gr_y_14_14 <= y) && (y <= gr_y_14_14+18);
wire tr14_15_on; assign tr14_15_on = (gr_x_14_15 <= x) && (x <= gr_x_14_15+18) && (gr_y_14_15 <= y) && (y <= gr_y_14_15+18);
wire tr14_16_on; assign tr14_16_on = (gr_x_14_16 <= x) && (x <= gr_x_14_16+18) && (gr_y_14_16 <= y) && (y <= gr_y_14_16+18);
wire tr14_17_on; assign tr14_17_on = (gr_x_14_17 <= x) && (x <= gr_x_14_17+18) && (gr_y_14_17 <= y) && (y <= gr_y_14_17+18);
wire tr14_18_on; assign tr14_18_on = (gr_x_14_18 <= x) && (x <= gr_x_14_18+18) && (gr_y_14_18 <= y) && (y <= gr_y_14_18+18);
wire tr14_19_on; assign tr14_19_on = (gr_x_14_19 <= x) && (x <= gr_x_14_19+18) && (gr_y_14_19 <= y) && (y <= gr_y_14_19+18);
wire tr14_20_on; assign tr14_20_on = (gr_x_14_20 <= x) && (x <= gr_x_14_20+18) && (gr_y_14_20 <= y) && (y <= gr_y_14_20+18);
wire tr14_21_on; assign tr14_21_on = (gr_x_14_21 <= x) && (x <= gr_x_14_21+18) && (gr_y_14_21 <= y) && (y <= gr_y_14_21+18);
wire tr14_22_on; assign tr14_22_on = (gr_x_14_22 <= x) && (x <= gr_x_14_22+18) && (gr_y_14_22 <= y) && (y <= gr_y_14_22+18);
wire tr14_23_on; assign tr14_23_on = (gr_x_14_23 <= x) && (x <= gr_x_14_23+18) && (gr_y_14_23 <= y) && (y <= gr_y_14_23+18);
wire tr14_24_on; assign tr14_24_on = (gr_x_14_24 <= x) && (x <= gr_x_14_24+18) && (gr_y_14_24 <= y) && (y <= gr_y_14_24+18);
wire tr15_0_on; assign tr15_0_on = (gr_x_15_0 <= x) && (x <= gr_x_15_0+18) && (gr_y_15_0 <= y) && (y <= gr_y_15_0+18);
wire tr15_1_on; assign tr15_1_on = (gr_x_15_1 <= x) && (x <= gr_x_15_1+18) && (gr_y_15_1 <= y) && (y <= gr_y_15_1+18);
wire tr15_2_on; assign tr15_2_on = (gr_x_15_2 <= x) && (x <= gr_x_15_2+18) && (gr_y_15_2 <= y) && (y <= gr_y_15_2+18);
wire tr15_3_on; assign tr15_3_on = (gr_x_15_3 <= x) && (x <= gr_x_15_3+18) && (gr_y_15_3 <= y) && (y <= gr_y_15_3+18);
wire tr15_4_on; assign tr15_4_on = (gr_x_15_4 <= x) && (x <= gr_x_15_4+18) && (gr_y_15_4 <= y) && (y <= gr_y_15_4+18);
wire tr15_5_on; assign tr15_5_on = (gr_x_15_5 <= x) && (x <= gr_x_15_5+18) && (gr_y_15_5 <= y) && (y <= gr_y_15_5+18);
wire tr15_6_on; assign tr15_6_on = (gr_x_15_6 <= x) && (x <= gr_x_15_6+18) && (gr_y_15_6 <= y) && (y <= gr_y_15_6+18);
wire tr15_7_on; assign tr15_7_on = (gr_x_15_7 <= x) && (x <= gr_x_15_7+18) && (gr_y_15_7 <= y) && (y <= gr_y_15_7+18);
wire tr15_8_on; assign tr15_8_on = (gr_x_15_8 <= x) && (x <= gr_x_15_8+18) && (gr_y_15_8 <= y) && (y <= gr_y_15_8+18);
wire tr15_9_on; assign tr15_9_on = (gr_x_15_9 <= x) && (x <= gr_x_15_9+18) && (gr_y_15_9 <= y) && (y <= gr_y_15_9+18);
wire tr15_10_on; assign tr15_10_on = (gr_x_15_10 <= x) && (x <= gr_x_15_10+18) && (gr_y_15_10 <= y) && (y <= gr_y_15_10+18);
wire tr15_11_on; assign tr15_11_on = (gr_x_15_11 <= x) && (x <= gr_x_15_11+18) && (gr_y_15_11 <= y) && (y <= gr_y_15_11+18);
wire tr15_12_on; assign tr15_12_on = (gr_x_15_12 <= x) && (x <= gr_x_15_12+18) && (gr_y_15_12 <= y) && (y <= gr_y_15_12+18);
wire tr15_13_on; assign tr15_13_on = (gr_x_15_13 <= x) && (x <= gr_x_15_13+18) && (gr_y_15_13 <= y) && (y <= gr_y_15_13+18);
wire tr15_14_on; assign tr15_14_on = (gr_x_15_14 <= x) && (x <= gr_x_15_14+18) && (gr_y_15_14 <= y) && (y <= gr_y_15_14+18);
wire tr15_15_on; assign tr15_15_on = (gr_x_15_15 <= x) && (x <= gr_x_15_15+18) && (gr_y_15_15 <= y) && (y <= gr_y_15_15+18);
wire tr15_16_on; assign tr15_16_on = (gr_x_15_16 <= x) && (x <= gr_x_15_16+18) && (gr_y_15_16 <= y) && (y <= gr_y_15_16+18);
wire tr15_17_on; assign tr15_17_on = (gr_x_15_17 <= x) && (x <= gr_x_15_17+18) && (gr_y_15_17 <= y) && (y <= gr_y_15_17+18);
wire tr15_18_on; assign tr15_18_on = (gr_x_15_18 <= x) && (x <= gr_x_15_18+18) && (gr_y_15_18 <= y) && (y <= gr_y_15_18+18);
wire tr15_19_on; assign tr15_19_on = (gr_x_15_19 <= x) && (x <= gr_x_15_19+18) && (gr_y_15_19 <= y) && (y <= gr_y_15_19+18);
wire tr15_20_on; assign tr15_20_on = (gr_x_15_20 <= x) && (x <= gr_x_15_20+18) && (gr_y_15_20 <= y) && (y <= gr_y_15_20+18);
wire tr15_21_on; assign tr15_21_on = (gr_x_15_21 <= x) && (x <= gr_x_15_21+18) && (gr_y_15_21 <= y) && (y <= gr_y_15_21+18);
wire tr15_22_on; assign tr15_22_on = (gr_x_15_22 <= x) && (x <= gr_x_15_22+18) && (gr_y_15_22 <= y) && (y <= gr_y_15_22+18);
wire tr15_23_on; assign tr15_23_on = (gr_x_15_23 <= x) && (x <= gr_x_15_23+18) && (gr_y_15_23 <= y) && (y <= gr_y_15_23+18);
wire tr15_24_on; assign tr15_24_on = (gr_x_15_24 <= x) && (x <= gr_x_15_24+18) && (gr_y_15_24 <= y) && (y <= gr_y_15_24+18);
wire tr16_0_on; assign tr16_0_on = (gr_x_16_0 <= x) && (x <= gr_x_16_0+18) && (gr_y_16_0 <= y) && (y <= gr_y_16_0+18);
wire tr16_1_on; assign tr16_1_on = (gr_x_16_1 <= x) && (x <= gr_x_16_1+18) && (gr_y_16_1 <= y) && (y <= gr_y_16_1+18);
wire tr16_2_on; assign tr16_2_on = (gr_x_16_2 <= x) && (x <= gr_x_16_2+18) && (gr_y_16_2 <= y) && (y <= gr_y_16_2+18);
wire tr16_3_on; assign tr16_3_on = (gr_x_16_3 <= x) && (x <= gr_x_16_3+18) && (gr_y_16_3 <= y) && (y <= gr_y_16_3+18);
wire tr16_4_on; assign tr16_4_on = (gr_x_16_4 <= x) && (x <= gr_x_16_4+18) && (gr_y_16_4 <= y) && (y <= gr_y_16_4+18);
wire tr16_5_on; assign tr16_5_on = (gr_x_16_5 <= x) && (x <= gr_x_16_5+18) && (gr_y_16_5 <= y) && (y <= gr_y_16_5+18);
wire tr16_6_on; assign tr16_6_on = (gr_x_16_6 <= x) && (x <= gr_x_16_6+18) && (gr_y_16_6 <= y) && (y <= gr_y_16_6+18);
wire tr16_7_on; assign tr16_7_on = (gr_x_16_7 <= x) && (x <= gr_x_16_7+18) && (gr_y_16_7 <= y) && (y <= gr_y_16_7+18);
wire tr16_8_on; assign tr16_8_on = (gr_x_16_8 <= x) && (x <= gr_x_16_8+18) && (gr_y_16_8 <= y) && (y <= gr_y_16_8+18);
wire tr16_9_on; assign tr16_9_on = (gr_x_16_9 <= x) && (x <= gr_x_16_9+18) && (gr_y_16_9 <= y) && (y <= gr_y_16_9+18);
wire tr16_10_on; assign tr16_10_on = (gr_x_16_10 <= x) && (x <= gr_x_16_10+18) && (gr_y_16_10 <= y) && (y <= gr_y_16_10+18);
wire tr16_11_on; assign tr16_11_on = (gr_x_16_11 <= x) && (x <= gr_x_16_11+18) && (gr_y_16_11 <= y) && (y <= gr_y_16_11+18);
wire tr16_12_on; assign tr16_12_on = (gr_x_16_12 <= x) && (x <= gr_x_16_12+18) && (gr_y_16_12 <= y) && (y <= gr_y_16_12+18);
wire tr16_13_on; assign tr16_13_on = (gr_x_16_13 <= x) && (x <= gr_x_16_13+18) && (gr_y_16_13 <= y) && (y <= gr_y_16_13+18);
wire tr16_14_on; assign tr16_14_on = (gr_x_16_14 <= x) && (x <= gr_x_16_14+18) && (gr_y_16_14 <= y) && (y <= gr_y_16_14+18);
wire tr16_15_on; assign tr16_15_on = (gr_x_16_15 <= x) && (x <= gr_x_16_15+18) && (gr_y_16_15 <= y) && (y <= gr_y_16_15+18);
wire tr16_16_on; assign tr16_16_on = (gr_x_16_16 <= x) && (x <= gr_x_16_16+18) && (gr_y_16_16 <= y) && (y <= gr_y_16_16+18);
wire tr16_17_on; assign tr16_17_on = (gr_x_16_17 <= x) && (x <= gr_x_16_17+18) && (gr_y_16_17 <= y) && (y <= gr_y_16_17+18);
wire tr16_18_on; assign tr16_18_on = (gr_x_16_18 <= x) && (x <= gr_x_16_18+18) && (gr_y_16_18 <= y) && (y <= gr_y_16_18+18);
wire tr16_19_on; assign tr16_19_on = (gr_x_16_19 <= x) && (x <= gr_x_16_19+18) && (gr_y_16_19 <= y) && (y <= gr_y_16_19+18);
wire tr16_20_on; assign tr16_20_on = (gr_x_16_20 <= x) && (x <= gr_x_16_20+18) && (gr_y_16_20 <= y) && (y <= gr_y_16_20+18);
wire tr16_21_on; assign tr16_21_on = (gr_x_16_21 <= x) && (x <= gr_x_16_21+18) && (gr_y_16_21 <= y) && (y <= gr_y_16_21+18);
wire tr16_22_on; assign tr16_22_on = (gr_x_16_22 <= x) && (x <= gr_x_16_22+18) && (gr_y_16_22 <= y) && (y <= gr_y_16_22+18);
wire tr16_23_on; assign tr16_23_on = (gr_x_16_23 <= x) && (x <= gr_x_16_23+18) && (gr_y_16_23 <= y) && (y <= gr_y_16_23+18);
wire tr16_24_on; assign tr16_24_on = (gr_x_16_24 <= x) && (x <= gr_x_16_24+18) && (gr_y_16_24 <= y) && (y <= gr_y_16_24+18);
wire tr17_0_on; assign tr17_0_on = (gr_x_17_0 <= x) && (x <= gr_x_17_0+18) && (gr_y_17_0 <= y) && (y <= gr_y_17_0+18);
wire tr17_1_on; assign tr17_1_on = (gr_x_17_1 <= x) && (x <= gr_x_17_1+18) && (gr_y_17_1 <= y) && (y <= gr_y_17_1+18);
wire tr17_2_on; assign tr17_2_on = (gr_x_17_2 <= x) && (x <= gr_x_17_2+18) && (gr_y_17_2 <= y) && (y <= gr_y_17_2+18);
wire tr17_3_on; assign tr17_3_on = (gr_x_17_3 <= x) && (x <= gr_x_17_3+18) && (gr_y_17_3 <= y) && (y <= gr_y_17_3+18);
wire tr17_4_on; assign tr17_4_on = (gr_x_17_4 <= x) && (x <= gr_x_17_4+18) && (gr_y_17_4 <= y) && (y <= gr_y_17_4+18);
wire tr17_5_on; assign tr17_5_on = (gr_x_17_5 <= x) && (x <= gr_x_17_5+18) && (gr_y_17_5 <= y) && (y <= gr_y_17_5+18);
wire tr17_6_on; assign tr17_6_on = (gr_x_17_6 <= x) && (x <= gr_x_17_6+18) && (gr_y_17_6 <= y) && (y <= gr_y_17_6+18);
wire tr17_7_on; assign tr17_7_on = (gr_x_17_7 <= x) && (x <= gr_x_17_7+18) && (gr_y_17_7 <= y) && (y <= gr_y_17_7+18);
wire tr17_8_on; assign tr17_8_on = (gr_x_17_8 <= x) && (x <= gr_x_17_8+18) && (gr_y_17_8 <= y) && (y <= gr_y_17_8+18);
wire tr17_9_on; assign tr17_9_on = (gr_x_17_9 <= x) && (x <= gr_x_17_9+18) && (gr_y_17_9 <= y) && (y <= gr_y_17_9+18);
wire tr17_10_on; assign tr17_10_on = (gr_x_17_10 <= x) && (x <= gr_x_17_10+18) && (gr_y_17_10 <= y) && (y <= gr_y_17_10+18);
wire tr17_11_on; assign tr17_11_on = (gr_x_17_11 <= x) && (x <= gr_x_17_11+18) && (gr_y_17_11 <= y) && (y <= gr_y_17_11+18);
wire tr17_12_on; assign tr17_12_on = (gr_x_17_12 <= x) && (x <= gr_x_17_12+18) && (gr_y_17_12 <= y) && (y <= gr_y_17_12+18);
wire tr17_13_on; assign tr17_13_on = (gr_x_17_13 <= x) && (x <= gr_x_17_13+18) && (gr_y_17_13 <= y) && (y <= gr_y_17_13+18);
wire tr17_14_on; assign tr17_14_on = (gr_x_17_14 <= x) && (x <= gr_x_17_14+18) && (gr_y_17_14 <= y) && (y <= gr_y_17_14+18);
wire tr17_15_on; assign tr17_15_on = (gr_x_17_15 <= x) && (x <= gr_x_17_15+18) && (gr_y_17_15 <= y) && (y <= gr_y_17_15+18);
wire tr17_16_on; assign tr17_16_on = (gr_x_17_16 <= x) && (x <= gr_x_17_16+18) && (gr_y_17_16 <= y) && (y <= gr_y_17_16+18);
wire tr17_17_on; assign tr17_17_on = (gr_x_17_17 <= x) && (x <= gr_x_17_17+18) && (gr_y_17_17 <= y) && (y <= gr_y_17_17+18);
wire tr17_18_on; assign tr17_18_on = (gr_x_17_18 <= x) && (x <= gr_x_17_18+18) && (gr_y_17_18 <= y) && (y <= gr_y_17_18+18);
wire tr17_19_on; assign tr17_19_on = (gr_x_17_19 <= x) && (x <= gr_x_17_19+18) && (gr_y_17_19 <= y) && (y <= gr_y_17_19+18);
wire tr17_20_on; assign tr17_20_on = (gr_x_17_20 <= x) && (x <= gr_x_17_20+18) && (gr_y_17_20 <= y) && (y <= gr_y_17_20+18);
wire tr17_21_on; assign tr17_21_on = (gr_x_17_21 <= x) && (x <= gr_x_17_21+18) && (gr_y_17_21 <= y) && (y <= gr_y_17_21+18);
wire tr17_22_on; assign tr17_22_on = (gr_x_17_22 <= x) && (x <= gr_x_17_22+18) && (gr_y_17_22 <= y) && (y <= gr_y_17_22+18);
wire tr17_23_on; assign tr17_23_on = (gr_x_17_23 <= x) && (x <= gr_x_17_23+18) && (gr_y_17_23 <= y) && (y <= gr_y_17_23+18);
wire tr17_24_on; assign tr17_24_on = (gr_x_17_24 <= x) && (x <= gr_x_17_24+18) && (gr_y_17_24 <= y) && (y <= gr_y_17_24+18);
wire tr18_0_on; assign tr18_0_on = (gr_x_18_0 <= x) && (x <= gr_x_18_0+18) && (gr_y_18_0 <= y) && (y <= gr_y_18_0+18);
wire tr18_1_on; assign tr18_1_on = (gr_x_18_1 <= x) && (x <= gr_x_18_1+18) && (gr_y_18_1 <= y) && (y <= gr_y_18_1+18);
wire tr18_2_on; assign tr18_2_on = (gr_x_18_2 <= x) && (x <= gr_x_18_2+18) && (gr_y_18_2 <= y) && (y <= gr_y_18_2+18);
wire tr18_3_on; assign tr18_3_on = (gr_x_18_3 <= x) && (x <= gr_x_18_3+18) && (gr_y_18_3 <= y) && (y <= gr_y_18_3+18);
wire tr18_4_on; assign tr18_4_on = (gr_x_18_4 <= x) && (x <= gr_x_18_4+18) && (gr_y_18_4 <= y) && (y <= gr_y_18_4+18);
wire tr18_5_on; assign tr18_5_on = (gr_x_18_5 <= x) && (x <= gr_x_18_5+18) && (gr_y_18_5 <= y) && (y <= gr_y_18_5+18);
wire tr18_6_on; assign tr18_6_on = (gr_x_18_6 <= x) && (x <= gr_x_18_6+18) && (gr_y_18_6 <= y) && (y <= gr_y_18_6+18);
wire tr18_7_on; assign tr18_7_on = (gr_x_18_7 <= x) && (x <= gr_x_18_7+18) && (gr_y_18_7 <= y) && (y <= gr_y_18_7+18);
wire tr18_8_on; assign tr18_8_on = (gr_x_18_8 <= x) && (x <= gr_x_18_8+18) && (gr_y_18_8 <= y) && (y <= gr_y_18_8+18);
wire tr18_9_on; assign tr18_9_on = (gr_x_18_9 <= x) && (x <= gr_x_18_9+18) && (gr_y_18_9 <= y) && (y <= gr_y_18_9+18);
wire tr18_10_on; assign tr18_10_on = (gr_x_18_10 <= x) && (x <= gr_x_18_10+18) && (gr_y_18_10 <= y) && (y <= gr_y_18_10+18);
wire tr18_11_on; assign tr18_11_on = (gr_x_18_11 <= x) && (x <= gr_x_18_11+18) && (gr_y_18_11 <= y) && (y <= gr_y_18_11+18);
wire tr18_12_on; assign tr18_12_on = (gr_x_18_12 <= x) && (x <= gr_x_18_12+18) && (gr_y_18_12 <= y) && (y <= gr_y_18_12+18);
wire tr18_13_on; assign tr18_13_on = (gr_x_18_13 <= x) && (x <= gr_x_18_13+18) && (gr_y_18_13 <= y) && (y <= gr_y_18_13+18);
wire tr18_14_on; assign tr18_14_on = (gr_x_18_14 <= x) && (x <= gr_x_18_14+18) && (gr_y_18_14 <= y) && (y <= gr_y_18_14+18);
wire tr18_15_on; assign tr18_15_on = (gr_x_18_15 <= x) && (x <= gr_x_18_15+18) && (gr_y_18_15 <= y) && (y <= gr_y_18_15+18);
wire tr18_16_on; assign tr18_16_on = (gr_x_18_16 <= x) && (x <= gr_x_18_16+18) && (gr_y_18_16 <= y) && (y <= gr_y_18_16+18);
wire tr18_17_on; assign tr18_17_on = (gr_x_18_17 <= x) && (x <= gr_x_18_17+18) && (gr_y_18_17 <= y) && (y <= gr_y_18_17+18);
wire tr18_18_on; assign tr18_18_on = (gr_x_18_18 <= x) && (x <= gr_x_18_18+18) && (gr_y_18_18 <= y) && (y <= gr_y_18_18+18);
wire tr18_19_on; assign tr18_19_on = (gr_x_18_19 <= x) && (x <= gr_x_18_19+18) && (gr_y_18_19 <= y) && (y <= gr_y_18_19+18);
wire tr18_20_on; assign tr18_20_on = (gr_x_18_20 <= x) && (x <= gr_x_18_20+18) && (gr_y_18_20 <= y) && (y <= gr_y_18_20+18);
wire tr18_21_on; assign tr18_21_on = (gr_x_18_21 <= x) && (x <= gr_x_18_21+18) && (gr_y_18_21 <= y) && (y <= gr_y_18_21+18);
wire tr18_22_on; assign tr18_22_on = (gr_x_18_22 <= x) && (x <= gr_x_18_22+18) && (gr_y_18_22 <= y) && (y <= gr_y_18_22+18);
wire tr18_23_on; assign tr18_23_on = (gr_x_18_23 <= x) && (x <= gr_x_18_23+18) && (gr_y_18_23 <= y) && (y <= gr_y_18_23+18);
wire tr18_24_on; assign tr18_24_on = (gr_x_18_24 <= x) && (x <= gr_x_18_24+18) && (gr_y_18_24 <= y) && (y <= gr_y_18_24+18);
wire tr19_0_on; assign tr19_0_on = (gr_x_19_0 <= x) && (x <= gr_x_19_0+18) && (gr_y_19_0 <= y) && (y <= gr_y_19_0+18);
wire tr19_1_on; assign tr19_1_on = (gr_x_19_1 <= x) && (x <= gr_x_19_1+18) && (gr_y_19_1 <= y) && (y <= gr_y_19_1+18);
wire tr19_2_on; assign tr19_2_on = (gr_x_19_2 <= x) && (x <= gr_x_19_2+18) && (gr_y_19_2 <= y) && (y <= gr_y_19_2+18);
wire tr19_3_on; assign tr19_3_on = (gr_x_19_3 <= x) && (x <= gr_x_19_3+18) && (gr_y_19_3 <= y) && (y <= gr_y_19_3+18);
wire tr19_4_on; assign tr19_4_on = (gr_x_19_4 <= x) && (x <= gr_x_19_4+18) && (gr_y_19_4 <= y) && (y <= gr_y_19_4+18);
wire tr19_5_on; assign tr19_5_on = (gr_x_19_5 <= x) && (x <= gr_x_19_5+18) && (gr_y_19_5 <= y) && (y <= gr_y_19_5+18);
wire tr19_6_on; assign tr19_6_on = (gr_x_19_6 <= x) && (x <= gr_x_19_6+18) && (gr_y_19_6 <= y) && (y <= gr_y_19_6+18);
wire tr19_7_on; assign tr19_7_on = (gr_x_19_7 <= x) && (x <= gr_x_19_7+18) && (gr_y_19_7 <= y) && (y <= gr_y_19_7+18);
wire tr19_8_on; assign tr19_8_on = (gr_x_19_8 <= x) && (x <= gr_x_19_8+18) && (gr_y_19_8 <= y) && (y <= gr_y_19_8+18);
wire tr19_9_on; assign tr19_9_on = (gr_x_19_9 <= x) && (x <= gr_x_19_9+18) && (gr_y_19_9 <= y) && (y <= gr_y_19_9+18);
wire tr19_10_on; assign tr19_10_on = (gr_x_19_10 <= x) && (x <= gr_x_19_10+18) && (gr_y_19_10 <= y) && (y <= gr_y_19_10+18);
wire tr19_11_on; assign tr19_11_on = (gr_x_19_11 <= x) && (x <= gr_x_19_11+18) && (gr_y_19_11 <= y) && (y <= gr_y_19_11+18);
wire tr19_12_on; assign tr19_12_on = (gr_x_19_12 <= x) && (x <= gr_x_19_12+18) && (gr_y_19_12 <= y) && (y <= gr_y_19_12+18);
wire tr19_13_on; assign tr19_13_on = (gr_x_19_13 <= x) && (x <= gr_x_19_13+18) && (gr_y_19_13 <= y) && (y <= gr_y_19_13+18);
wire tr19_14_on; assign tr19_14_on = (gr_x_19_14 <= x) && (x <= gr_x_19_14+18) && (gr_y_19_14 <= y) && (y <= gr_y_19_14+18);
wire tr19_15_on; assign tr19_15_on = (gr_x_19_15 <= x) && (x <= gr_x_19_15+18) && (gr_y_19_15 <= y) && (y <= gr_y_19_15+18);
wire tr19_16_on; assign tr19_16_on = (gr_x_19_16 <= x) && (x <= gr_x_19_16+18) && (gr_y_19_16 <= y) && (y <= gr_y_19_16+18);
wire tr19_17_on; assign tr19_17_on = (gr_x_19_17 <= x) && (x <= gr_x_19_17+18) && (gr_y_19_17 <= y) && (y <= gr_y_19_17+18);
wire tr19_18_on; assign tr19_18_on = (gr_x_19_18 <= x) && (x <= gr_x_19_18+18) && (gr_y_19_18 <= y) && (y <= gr_y_19_18+18);
wire tr19_19_on; assign tr19_19_on = (gr_x_19_19 <= x) && (x <= gr_x_19_19+18) && (gr_y_19_19 <= y) && (y <= gr_y_19_19+18);
wire tr19_20_on; assign tr19_20_on = (gr_x_19_20 <= x) && (x <= gr_x_19_20+18) && (gr_y_19_20 <= y) && (y <= gr_y_19_20+18);
wire tr19_21_on; assign tr19_21_on = (gr_x_19_21 <= x) && (x <= gr_x_19_21+18) && (gr_y_19_21 <= y) && (y <= gr_y_19_21+18);
wire tr19_22_on; assign tr19_22_on = (gr_x_19_22 <= x) && (x <= gr_x_19_22+18) && (gr_y_19_22 <= y) && (y <= gr_y_19_22+18);
wire tr19_23_on; assign tr19_23_on = (gr_x_19_23 <= x) && (x <= gr_x_19_23+18) && (gr_y_19_23 <= y) && (y <= gr_y_19_23+18);
wire tr19_24_on; assign tr19_24_on = (gr_x_19_24 <= x) && (x <= gr_x_19_24+18) && (gr_y_19_24 <= y) && (y <= gr_y_19_24+18);
wire tr20_0_on; assign tr20_0_on = (gr_x_20_0 <= x) && (x <= gr_x_20_0+18) && (gr_y_20_0 <= y) && (y <= gr_y_20_0+18);
wire tr20_1_on; assign tr20_1_on = (gr_x_20_1 <= x) && (x <= gr_x_20_1+18) && (gr_y_20_1 <= y) && (y <= gr_y_20_1+18);
wire tr20_2_on; assign tr20_2_on = (gr_x_20_2 <= x) && (x <= gr_x_20_2+18) && (gr_y_20_2 <= y) && (y <= gr_y_20_2+18);
wire tr20_3_on; assign tr20_3_on = (gr_x_20_3 <= x) && (x <= gr_x_20_3+18) && (gr_y_20_3 <= y) && (y <= gr_y_20_3+18);
wire tr20_4_on; assign tr20_4_on = (gr_x_20_4 <= x) && (x <= gr_x_20_4+18) && (gr_y_20_4 <= y) && (y <= gr_y_20_4+18);
wire tr20_5_on; assign tr20_5_on = (gr_x_20_5 <= x) && (x <= gr_x_20_5+18) && (gr_y_20_5 <= y) && (y <= gr_y_20_5+18);
wire tr20_6_on; assign tr20_6_on = (gr_x_20_6 <= x) && (x <= gr_x_20_6+18) && (gr_y_20_6 <= y) && (y <= gr_y_20_6+18);
wire tr20_7_on; assign tr20_7_on = (gr_x_20_7 <= x) && (x <= gr_x_20_7+18) && (gr_y_20_7 <= y) && (y <= gr_y_20_7+18);
wire tr20_8_on; assign tr20_8_on = (gr_x_20_8 <= x) && (x <= gr_x_20_8+18) && (gr_y_20_8 <= y) && (y <= gr_y_20_8+18);
wire tr20_9_on; assign tr20_9_on = (gr_x_20_9 <= x) && (x <= gr_x_20_9+18) && (gr_y_20_9 <= y) && (y <= gr_y_20_9+18);
wire tr20_10_on; assign tr20_10_on = (gr_x_20_10 <= x) && (x <= gr_x_20_10+18) && (gr_y_20_10 <= y) && (y <= gr_y_20_10+18);
wire tr20_11_on; assign tr20_11_on = (gr_x_20_11 <= x) && (x <= gr_x_20_11+18) && (gr_y_20_11 <= y) && (y <= gr_y_20_11+18);
wire tr20_12_on; assign tr20_12_on = (gr_x_20_12 <= x) && (x <= gr_x_20_12+18) && (gr_y_20_12 <= y) && (y <= gr_y_20_12+18);
wire tr20_13_on; assign tr20_13_on = (gr_x_20_13 <= x) && (x <= gr_x_20_13+18) && (gr_y_20_13 <= y) && (y <= gr_y_20_13+18);
wire tr20_14_on; assign tr20_14_on = (gr_x_20_14 <= x) && (x <= gr_x_20_14+18) && (gr_y_20_14 <= y) && (y <= gr_y_20_14+18);
wire tr20_15_on; assign tr20_15_on = (gr_x_20_15 <= x) && (x <= gr_x_20_15+18) && (gr_y_20_15 <= y) && (y <= gr_y_20_15+18);
wire tr20_16_on; assign tr20_16_on = (gr_x_20_16 <= x) && (x <= gr_x_20_16+18) && (gr_y_20_16 <= y) && (y <= gr_y_20_16+18);
wire tr20_17_on; assign tr20_17_on = (gr_x_20_17 <= x) && (x <= gr_x_20_17+18) && (gr_y_20_17 <= y) && (y <= gr_y_20_17+18);
wire tr20_18_on; assign tr20_18_on = (gr_x_20_18 <= x) && (x <= gr_x_20_18+18) && (gr_y_20_18 <= y) && (y <= gr_y_20_18+18);
wire tr20_19_on; assign tr20_19_on = (gr_x_20_19 <= x) && (x <= gr_x_20_19+18) && (gr_y_20_19 <= y) && (y <= gr_y_20_19+18);
wire tr20_20_on; assign tr20_20_on = (gr_x_20_20 <= x) && (x <= gr_x_20_20+18) && (gr_y_20_20 <= y) && (y <= gr_y_20_20+18);
wire tr20_21_on; assign tr20_21_on = (gr_x_20_21 <= x) && (x <= gr_x_20_21+18) && (gr_y_20_21 <= y) && (y <= gr_y_20_21+18);
wire tr20_22_on; assign tr20_22_on = (gr_x_20_22 <= x) && (x <= gr_x_20_22+18) && (gr_y_20_22 <= y) && (y <= gr_y_20_22+18);
wire tr20_23_on; assign tr20_23_on = (gr_x_20_23 <= x) && (x <= gr_x_20_23+18) && (gr_y_20_23 <= y) && (y <= gr_y_20_23+18);
wire tr20_24_on; assign tr20_24_on = (gr_x_20_24 <= x) && (x <= gr_x_20_24+18) && (gr_y_20_24 <= y) && (y <= gr_y_20_24+18);
wire tr21_0_on; assign tr21_0_on = (gr_x_21_0 <= x) && (x <= gr_x_21_0+18) && (gr_y_21_0 <= y) && (y <= gr_y_21_0+18);
wire tr21_1_on; assign tr21_1_on = (gr_x_21_1 <= x) && (x <= gr_x_21_1+18) && (gr_y_21_1 <= y) && (y <= gr_y_21_1+18);
wire tr21_2_on; assign tr21_2_on = (gr_x_21_2 <= x) && (x <= gr_x_21_2+18) && (gr_y_21_2 <= y) && (y <= gr_y_21_2+18);
wire tr21_3_on; assign tr21_3_on = (gr_x_21_3 <= x) && (x <= gr_x_21_3+18) && (gr_y_21_3 <= y) && (y <= gr_y_21_3+18);
wire tr21_4_on; assign tr21_4_on = (gr_x_21_4 <= x) && (x <= gr_x_21_4+18) && (gr_y_21_4 <= y) && (y <= gr_y_21_4+18);
wire tr21_5_on; assign tr21_5_on = (gr_x_21_5 <= x) && (x <= gr_x_21_5+18) && (gr_y_21_5 <= y) && (y <= gr_y_21_5+18);
wire tr21_6_on; assign tr21_6_on = (gr_x_21_6 <= x) && (x <= gr_x_21_6+18) && (gr_y_21_6 <= y) && (y <= gr_y_21_6+18);
wire tr21_7_on; assign tr21_7_on = (gr_x_21_7 <= x) && (x <= gr_x_21_7+18) && (gr_y_21_7 <= y) && (y <= gr_y_21_7+18);
wire tr21_8_on; assign tr21_8_on = (gr_x_21_8 <= x) && (x <= gr_x_21_8+18) && (gr_y_21_8 <= y) && (y <= gr_y_21_8+18);
wire tr21_9_on; assign tr21_9_on = (gr_x_21_9 <= x) && (x <= gr_x_21_9+18) && (gr_y_21_9 <= y) && (y <= gr_y_21_9+18);
wire tr21_10_on; assign tr21_10_on = (gr_x_21_10 <= x) && (x <= gr_x_21_10+18) && (gr_y_21_10 <= y) && (y <= gr_y_21_10+18);
wire tr21_11_on; assign tr21_11_on = (gr_x_21_11 <= x) && (x <= gr_x_21_11+18) && (gr_y_21_11 <= y) && (y <= gr_y_21_11+18);
wire tr21_12_on; assign tr21_12_on = (gr_x_21_12 <= x) && (x <= gr_x_21_12+18) && (gr_y_21_12 <= y) && (y <= gr_y_21_12+18);
wire tr21_13_on; assign tr21_13_on = (gr_x_21_13 <= x) && (x <= gr_x_21_13+18) && (gr_y_21_13 <= y) && (y <= gr_y_21_13+18);
wire tr21_14_on; assign tr21_14_on = (gr_x_21_14 <= x) && (x <= gr_x_21_14+18) && (gr_y_21_14 <= y) && (y <= gr_y_21_14+18);
wire tr21_15_on; assign tr21_15_on = (gr_x_21_15 <= x) && (x <= gr_x_21_15+18) && (gr_y_21_15 <= y) && (y <= gr_y_21_15+18);
wire tr21_16_on; assign tr21_16_on = (gr_x_21_16 <= x) && (x <= gr_x_21_16+18) && (gr_y_21_16 <= y) && (y <= gr_y_21_16+18);
wire tr21_17_on; assign tr21_17_on = (gr_x_21_17 <= x) && (x <= gr_x_21_17+18) && (gr_y_21_17 <= y) && (y <= gr_y_21_17+18);
wire tr21_18_on; assign tr21_18_on = (gr_x_21_18 <= x) && (x <= gr_x_21_18+18) && (gr_y_21_18 <= y) && (y <= gr_y_21_18+18);
wire tr21_19_on; assign tr21_19_on = (gr_x_21_19 <= x) && (x <= gr_x_21_19+18) && (gr_y_21_19 <= y) && (y <= gr_y_21_19+18);
wire tr21_20_on; assign tr21_20_on = (gr_x_21_20 <= x) && (x <= gr_x_21_20+18) && (gr_y_21_20 <= y) && (y <= gr_y_21_20+18);
wire tr21_21_on; assign tr21_21_on = (gr_x_21_21 <= x) && (x <= gr_x_21_21+18) && (gr_y_21_21 <= y) && (y <= gr_y_21_21+18);
wire tr21_22_on; assign tr21_22_on = (gr_x_21_22 <= x) && (x <= gr_x_21_22+18) && (gr_y_21_22 <= y) && (y <= gr_y_21_22+18);
wire tr21_23_on; assign tr21_23_on = (gr_x_21_23 <= x) && (x <= gr_x_21_23+18) && (gr_y_21_23 <= y) && (y <= gr_y_21_23+18);
wire tr21_24_on; assign tr21_24_on = (gr_x_21_24 <= x) && (x <= gr_x_21_24+18) && (gr_y_21_24 <= y) && (y <= gr_y_21_24+18);
wire tr22_0_on; assign tr22_0_on = (gr_x_22_0 <= x) && (x <= gr_x_22_0+18) && (gr_y_22_0 <= y) && (y <= gr_y_22_0+18);
wire tr22_1_on; assign tr22_1_on = (gr_x_22_1 <= x) && (x <= gr_x_22_1+18) && (gr_y_22_1 <= y) && (y <= gr_y_22_1+18);
wire tr22_2_on; assign tr22_2_on = (gr_x_22_2 <= x) && (x <= gr_x_22_2+18) && (gr_y_22_2 <= y) && (y <= gr_y_22_2+18);
wire tr22_3_on; assign tr22_3_on = (gr_x_22_3 <= x) && (x <= gr_x_22_3+18) && (gr_y_22_3 <= y) && (y <= gr_y_22_3+18);
wire tr22_4_on; assign tr22_4_on = (gr_x_22_4 <= x) && (x <= gr_x_22_4+18) && (gr_y_22_4 <= y) && (y <= gr_y_22_4+18);
wire tr22_5_on; assign tr22_5_on = (gr_x_22_5 <= x) && (x <= gr_x_22_5+18) && (gr_y_22_5 <= y) && (y <= gr_y_22_5+18);
wire tr22_6_on; assign tr22_6_on = (gr_x_22_6 <= x) && (x <= gr_x_22_6+18) && (gr_y_22_6 <= y) && (y <= gr_y_22_6+18);
wire tr22_7_on; assign tr22_7_on = (gr_x_22_7 <= x) && (x <= gr_x_22_7+18) && (gr_y_22_7 <= y) && (y <= gr_y_22_7+18);
wire tr22_8_on; assign tr22_8_on = (gr_x_22_8 <= x) && (x <= gr_x_22_8+18) && (gr_y_22_8 <= y) && (y <= gr_y_22_8+18);
wire tr22_9_on; assign tr22_9_on = (gr_x_22_9 <= x) && (x <= gr_x_22_9+18) && (gr_y_22_9 <= y) && (y <= gr_y_22_9+18);
wire tr22_10_on; assign tr22_10_on = (gr_x_22_10 <= x) && (x <= gr_x_22_10+18) && (gr_y_22_10 <= y) && (y <= gr_y_22_10+18);
wire tr22_11_on; assign tr22_11_on = (gr_x_22_11 <= x) && (x <= gr_x_22_11+18) && (gr_y_22_11 <= y) && (y <= gr_y_22_11+18);
wire tr22_12_on; assign tr22_12_on = (gr_x_22_12 <= x) && (x <= gr_x_22_12+18) && (gr_y_22_12 <= y) && (y <= gr_y_22_12+18);
wire tr22_13_on; assign tr22_13_on = (gr_x_22_13 <= x) && (x <= gr_x_22_13+18) && (gr_y_22_13 <= y) && (y <= gr_y_22_13+18);
wire tr22_14_on; assign tr22_14_on = (gr_x_22_14 <= x) && (x <= gr_x_22_14+18) && (gr_y_22_14 <= y) && (y <= gr_y_22_14+18);
wire tr22_15_on; assign tr22_15_on = (gr_x_22_15 <= x) && (x <= gr_x_22_15+18) && (gr_y_22_15 <= y) && (y <= gr_y_22_15+18);
wire tr22_16_on; assign tr22_16_on = (gr_x_22_16 <= x) && (x <= gr_x_22_16+18) && (gr_y_22_16 <= y) && (y <= gr_y_22_16+18);
wire tr22_17_on; assign tr22_17_on = (gr_x_22_17 <= x) && (x <= gr_x_22_17+18) && (gr_y_22_17 <= y) && (y <= gr_y_22_17+18);
wire tr22_18_on; assign tr22_18_on = (gr_x_22_18 <= x) && (x <= gr_x_22_18+18) && (gr_y_22_18 <= y) && (y <= gr_y_22_18+18);
wire tr22_19_on; assign tr22_19_on = (gr_x_22_19 <= x) && (x <= gr_x_22_19+18) && (gr_y_22_19 <= y) && (y <= gr_y_22_19+18);
wire tr22_20_on; assign tr22_20_on = (gr_x_22_20 <= x) && (x <= gr_x_22_20+18) && (gr_y_22_20 <= y) && (y <= gr_y_22_20+18);
wire tr22_21_on; assign tr22_21_on = (gr_x_22_21 <= x) && (x <= gr_x_22_21+18) && (gr_y_22_21 <= y) && (y <= gr_y_22_21+18);
wire tr22_22_on; assign tr22_22_on = (gr_x_22_22 <= x) && (x <= gr_x_22_22+18) && (gr_y_22_22 <= y) && (y <= gr_y_22_22+18);
wire tr22_23_on; assign tr22_23_on = (gr_x_22_23 <= x) && (x <= gr_x_22_23+18) && (gr_y_22_23 <= y) && (y <= gr_y_22_23+18);
wire tr22_24_on; assign tr22_24_on = (gr_x_22_24 <= x) && (x <= gr_x_22_24+18) && (gr_y_22_24 <= y) && (y <= gr_y_22_24+18);
wire tr23_0_on; assign tr23_0_on = (gr_x_23_0 <= x) && (x <= gr_x_23_0+18) && (gr_y_23_0 <= y) && (y <= gr_y_23_0+18);
wire tr23_1_on; assign tr23_1_on = (gr_x_23_1 <= x) && (x <= gr_x_23_1+18) && (gr_y_23_1 <= y) && (y <= gr_y_23_1+18);
wire tr23_2_on; assign tr23_2_on = (gr_x_23_2 <= x) && (x <= gr_x_23_2+18) && (gr_y_23_2 <= y) && (y <= gr_y_23_2+18);
wire tr23_3_on; assign tr23_3_on = (gr_x_23_3 <= x) && (x <= gr_x_23_3+18) && (gr_y_23_3 <= y) && (y <= gr_y_23_3+18);
wire tr23_4_on; assign tr23_4_on = (gr_x_23_4 <= x) && (x <= gr_x_23_4+18) && (gr_y_23_4 <= y) && (y <= gr_y_23_4+18);
wire tr23_5_on; assign tr23_5_on = (gr_x_23_5 <= x) && (x <= gr_x_23_5+18) && (gr_y_23_5 <= y) && (y <= gr_y_23_5+18);
wire tr23_6_on; assign tr23_6_on = (gr_x_23_6 <= x) && (x <= gr_x_23_6+18) && (gr_y_23_6 <= y) && (y <= gr_y_23_6+18);
wire tr23_7_on; assign tr23_7_on = (gr_x_23_7 <= x) && (x <= gr_x_23_7+18) && (gr_y_23_7 <= y) && (y <= gr_y_23_7+18);
wire tr23_8_on; assign tr23_8_on = (gr_x_23_8 <= x) && (x <= gr_x_23_8+18) && (gr_y_23_8 <= y) && (y <= gr_y_23_8+18);
wire tr23_9_on; assign tr23_9_on = (gr_x_23_9 <= x) && (x <= gr_x_23_9+18) && (gr_y_23_9 <= y) && (y <= gr_y_23_9+18);
wire tr23_10_on; assign tr23_10_on = (gr_x_23_10 <= x) && (x <= gr_x_23_10+18) && (gr_y_23_10 <= y) && (y <= gr_y_23_10+18);
wire tr23_11_on; assign tr23_11_on = (gr_x_23_11 <= x) && (x <= gr_x_23_11+18) && (gr_y_23_11 <= y) && (y <= gr_y_23_11+18);
wire tr23_12_on; assign tr23_12_on = (gr_x_23_12 <= x) && (x <= gr_x_23_12+18) && (gr_y_23_12 <= y) && (y <= gr_y_23_12+18);
wire tr23_13_on; assign tr23_13_on = (gr_x_23_13 <= x) && (x <= gr_x_23_13+18) && (gr_y_23_13 <= y) && (y <= gr_y_23_13+18);
wire tr23_14_on; assign tr23_14_on = (gr_x_23_14 <= x) && (x <= gr_x_23_14+18) && (gr_y_23_14 <= y) && (y <= gr_y_23_14+18);
wire tr23_15_on; assign tr23_15_on = (gr_x_23_15 <= x) && (x <= gr_x_23_15+18) && (gr_y_23_15 <= y) && (y <= gr_y_23_15+18);
wire tr23_16_on; assign tr23_16_on = (gr_x_23_16 <= x) && (x <= gr_x_23_16+18) && (gr_y_23_16 <= y) && (y <= gr_y_23_16+18);
wire tr23_17_on; assign tr23_17_on = (gr_x_23_17 <= x) && (x <= gr_x_23_17+18) && (gr_y_23_17 <= y) && (y <= gr_y_23_17+18);
wire tr23_18_on; assign tr23_18_on = (gr_x_23_18 <= x) && (x <= gr_x_23_18+18) && (gr_y_23_18 <= y) && (y <= gr_y_23_18+18);
wire tr23_19_on; assign tr23_19_on = (gr_x_23_19 <= x) && (x <= gr_x_23_19+18) && (gr_y_23_19 <= y) && (y <= gr_y_23_19+18);
wire tr23_20_on; assign tr23_20_on = (gr_x_23_20 <= x) && (x <= gr_x_23_20+18) && (gr_y_23_20 <= y) && (y <= gr_y_23_20+18);
wire tr23_21_on; assign tr23_21_on = (gr_x_23_21 <= x) && (x <= gr_x_23_21+18) && (gr_y_23_21 <= y) && (y <= gr_y_23_21+18);
wire tr23_22_on; assign tr23_22_on = (gr_x_23_22 <= x) && (x <= gr_x_23_22+18) && (gr_y_23_22 <= y) && (y <= gr_y_23_22+18);
wire tr23_23_on; assign tr23_23_on = (gr_x_23_23 <= x) && (x <= gr_x_23_23+18) && (gr_y_23_23 <= y) && (y <= gr_y_23_23+18);
wire tr23_24_on; assign tr23_24_on = (gr_x_23_24 <= x) && (x <= gr_x_23_24+18) && (gr_y_23_24 <= y) && (y <= gr_y_23_24+18);
wire tr24_0_on; assign tr24_0_on = (gr_x_24_0 <= x) && (x <= gr_x_24_0+18) && (gr_y_24_0 <= y) && (y <= gr_y_24_0+18);
wire tr24_1_on; assign tr24_1_on = (gr_x_24_1 <= x) && (x <= gr_x_24_1+18) && (gr_y_24_1 <= y) && (y <= gr_y_24_1+18);
wire tr24_2_on; assign tr24_2_on = (gr_x_24_2 <= x) && (x <= gr_x_24_2+18) && (gr_y_24_2 <= y) && (y <= gr_y_24_2+18);
wire tr24_3_on; assign tr24_3_on = (gr_x_24_3 <= x) && (x <= gr_x_24_3+18) && (gr_y_24_3 <= y) && (y <= gr_y_24_3+18);
wire tr24_4_on; assign tr24_4_on = (gr_x_24_4 <= x) && (x <= gr_x_24_4+18) && (gr_y_24_4 <= y) && (y <= gr_y_24_4+18);
wire tr24_5_on; assign tr24_5_on = (gr_x_24_5 <= x) && (x <= gr_x_24_5+18) && (gr_y_24_5 <= y) && (y <= gr_y_24_5+18);
wire tr24_6_on; assign tr24_6_on = (gr_x_24_6 <= x) && (x <= gr_x_24_6+18) && (gr_y_24_6 <= y) && (y <= gr_y_24_6+18);
wire tr24_7_on; assign tr24_7_on = (gr_x_24_7 <= x) && (x <= gr_x_24_7+18) && (gr_y_24_7 <= y) && (y <= gr_y_24_7+18);
wire tr24_8_on; assign tr24_8_on = (gr_x_24_8 <= x) && (x <= gr_x_24_8+18) && (gr_y_24_8 <= y) && (y <= gr_y_24_8+18);
wire tr24_9_on; assign tr24_9_on = (gr_x_24_9 <= x) && (x <= gr_x_24_9+18) && (gr_y_24_9 <= y) && (y <= gr_y_24_9+18);
wire tr24_10_on; assign tr24_10_on = (gr_x_24_10 <= x) && (x <= gr_x_24_10+18) && (gr_y_24_10 <= y) && (y <= gr_y_24_10+18);
wire tr24_11_on; assign tr24_11_on = (gr_x_24_11 <= x) && (x <= gr_x_24_11+18) && (gr_y_24_11 <= y) && (y <= gr_y_24_11+18);
wire tr24_12_on; assign tr24_12_on = (gr_x_24_12 <= x) && (x <= gr_x_24_12+18) && (gr_y_24_12 <= y) && (y <= gr_y_24_12+18);
wire tr24_13_on; assign tr24_13_on = (gr_x_24_13 <= x) && (x <= gr_x_24_13+18) && (gr_y_24_13 <= y) && (y <= gr_y_24_13+18);
wire tr24_14_on; assign tr24_14_on = (gr_x_24_14 <= x) && (x <= gr_x_24_14+18) && (gr_y_24_14 <= y) && (y <= gr_y_24_14+18);
wire tr24_15_on; assign tr24_15_on = (gr_x_24_15 <= x) && (x <= gr_x_24_15+18) && (gr_y_24_15 <= y) && (y <= gr_y_24_15+18);
wire tr24_16_on; assign tr24_16_on = (gr_x_24_16 <= x) && (x <= gr_x_24_16+18) && (gr_y_24_16 <= y) && (y <= gr_y_24_16+18);
wire tr24_17_on; assign tr24_17_on = (gr_x_24_17 <= x) && (x <= gr_x_24_17+18) && (gr_y_24_17 <= y) && (y <= gr_y_24_17+18);
wire tr24_18_on; assign tr24_18_on = (gr_x_24_18 <= x) && (x <= gr_x_24_18+18) && (gr_y_24_18 <= y) && (y <= gr_y_24_18+18);
wire tr24_19_on; assign tr24_19_on = (gr_x_24_19 <= x) && (x <= gr_x_24_19+18) && (gr_y_24_19 <= y) && (y <= gr_y_24_19+18);
wire tr24_20_on; assign tr24_20_on = (gr_x_24_20 <= x) && (x <= gr_x_24_20+18) && (gr_y_24_20 <= y) && (y <= gr_y_24_20+18);
wire tr24_21_on; assign tr24_21_on = (gr_x_24_21 <= x) && (x <= gr_x_24_21+18) && (gr_y_24_21 <= y) && (y <= gr_y_24_21+18);
wire tr24_22_on; assign tr24_22_on = (gr_x_24_22 <= x) && (x <= gr_x_24_22+18) && (gr_y_24_22 <= y) && (y <= gr_y_24_22+18);
wire tr24_23_on; assign tr24_23_on = (gr_x_24_23 <= x) && (x <= gr_x_24_23+18) && (gr_y_24_23 <= y) && (y <= gr_y_24_23+18);
wire tr24_24_on; assign tr24_24_on = (gr_x_24_24 <= x) && (x <= gr_x_24_24+18) && (gr_y_24_24 <= y) && (y <= gr_y_24_24+18);


    always @(posedge clk or posedge reset1)
    if (reset1) 
         begin
            sq1_x_reg <= 0;
            sq1_y_reg <= 0;
            sq2_x_reg <= 0;
            sq2_y_reg <= 0;
           end
        else
        begin
            sq1_x_reg <= sq1_x_next;
            sq1_y_reg <= sq1_y_next;
            sq2_x_reg <= sq2_x_next;
            sq2_y_reg <= sq2_y_next;
        end
    
    
    wire black_on;
//    assign black_on= (x>=107 && x<=571) && (y>=469 && y<=471) | (x>=107 && x<=571) && (y>=7 && y<=9)| (x>=569 && x<=571) && (y>=7 && y<=471)|(x>=107 && x<=109) && (y>=7 && y<=471);  
    assign black_on= (x>=95 && x<=545) && (y>=13 && y<=15)| (x>=545 && x<=547) && (y>=15 && y<=465);// | (x>=93 && x<=95) && (y>=15 && y<=500);// | (x>=95 && x<=565) && (y>=455 && y<=467);
    assign black_on1 = (x==95) && (y>=15 && y<=465);
    assign black_on2 = (x>=95 && x<=545) && (y==465);
//     new square position

    wire [1:0] sel;
selection sl (.clk(clk), .reset(reset3), .button1(S[0]), .button2(S[1]), .out(sel));


//    wire [11:0] rgb_start;
//    wire [11:0] rgb_easy;
//    wire [11:0] rgb_tort;
//    wire [11:0] rgb_win1;
//    wire [11:0] rgb_win2;
//    wire [11:0] rgb_draw;
    
    
    
//    romv2 init(clk, video_on, x/3, y[8:0]/2, rgb_start);
//    easyrom easy(clk, video_on, x/3, y[8:0]/2, rgb_easy);
//    tortrom tort(clk, video_on, x/3, y[8:0]/2, rgb_tort);
//    winrom w1(clk, video_on, x/3, y[8:0]/2, rgb_win1);
//    win2rom w2(clk, video_on, x/3, y[8:0]/2, rgb_win2);
//    drawrom dr(clk, video_on, x/3, y[8:0]/2, rgb_draw);

    always@(posedge clk_25)      
    
      begin
      
    if (main == 1)
    begin
        if (sel > 2'b00)
            main = 0;
    end
      
    else
    begin
    if (ply == 1)
    begin
        if(play)
            ply = 0;
        else if (reset3)
            main = 1;
    end
    else if (col == 1)
    begin
            if (reset2)
                col = 0;
//            else if (reset3)
//                main = 1;
    end
    else
    begin
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
                if (sq1_x_reg<=526)
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
                if (sq2_x_reg<=526)
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
         
if (sq1_x_next == gr_x_0_0 && sq1_y_next == gr_y_0_0)
if (gr0_0_on == 2'd0)
		begin
		gr0_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_0_on == 2'd2)
		begin
		gr0_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_1 && sq1_y_next == gr_y_0_1)
if (gr0_1_on == 2'd0)
		begin
		gr0_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_1_on == 2'd2)
		begin
		gr0_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_2 && sq1_y_next == gr_y_0_2)
if (gr0_2_on == 2'd0)
		begin
		gr0_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_2_on == 2'd2)
		begin
		gr0_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_3 && sq1_y_next == gr_y_0_3)
if (gr0_3_on == 2'd0)
		begin
		gr0_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_3_on == 2'd2)
		begin
		gr0_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_4 && sq1_y_next == gr_y_0_4)
if (gr0_4_on == 2'd0)
		begin
		gr0_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_4_on == 2'd2)
		begin
		gr0_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_5 && sq1_y_next == gr_y_0_5)
if (gr0_5_on == 2'd0)
		begin
		gr0_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_5_on == 2'd2)
		begin
		gr0_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_6 && sq1_y_next == gr_y_0_6)
if (gr0_6_on == 2'd0)
		begin
		gr0_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_6_on == 2'd2)
		begin
		gr0_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_7 && sq1_y_next == gr_y_0_7)
if (gr0_7_on == 2'd0)
		begin
		gr0_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_7_on == 2'd2)
		begin
		gr0_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_8 && sq1_y_next == gr_y_0_8)
if (gr0_8_on == 2'd0)
		begin
		gr0_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_8_on == 2'd2)
		begin
		gr0_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_9 && sq1_y_next == gr_y_0_9)
if (gr0_9_on == 2'd0)
		begin
		gr0_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_9_on == 2'd2)
		begin
		gr0_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_10 && sq1_y_next == gr_y_0_10)
if (gr0_10_on == 2'd0)
		begin
		gr0_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_10_on == 2'd2)
		begin
		gr0_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_11 && sq1_y_next == gr_y_0_11)
if (gr0_11_on == 2'd0)
		begin
		gr0_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_11_on == 2'd2)
		begin
		gr0_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_12 && sq1_y_next == gr_y_0_12)
if (gr0_12_on == 2'd0)
		begin
		gr0_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_12_on == 2'd2)
		begin
		gr0_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_13 && sq1_y_next == gr_y_0_13)
if (gr0_13_on == 2'd0)
		begin
		gr0_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_13_on == 2'd2)
		begin
		gr0_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_14 && sq1_y_next == gr_y_0_14)
if (gr0_14_on == 2'd0)
		begin
		gr0_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_14_on == 2'd2)
		begin
		gr0_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_15 && sq1_y_next == gr_y_0_15)
if (gr0_15_on == 2'd0)
		begin
		gr0_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_15_on == 2'd2)
		begin
		gr0_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_16 && sq1_y_next == gr_y_0_16)
if (gr0_16_on == 2'd0)
		begin
		gr0_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_16_on == 2'd2)
		begin
		gr0_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_17 && sq1_y_next == gr_y_0_17)
if (gr0_17_on == 2'd0)
		begin
		gr0_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_17_on == 2'd2)
		begin
		gr0_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_18 && sq1_y_next == gr_y_0_18)
if (gr0_18_on == 2'd0)
		begin
		gr0_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_18_on == 2'd2)
		begin
		gr0_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_19 && sq1_y_next == gr_y_0_19)
if (gr0_19_on == 2'd0)
		begin
		gr0_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_19_on == 2'd2)
		begin
		gr0_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_20 && sq1_y_next == gr_y_0_20)
if (gr0_20_on == 2'd0)
		begin
		gr0_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_20_on == 2'd2)
		begin
		gr0_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_21 && sq1_y_next == gr_y_0_21)
if (gr0_21_on == 2'd0)
		begin
		gr0_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_21_on == 2'd2)
		begin
		gr0_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_22 && sq1_y_next == gr_y_0_22)
if (gr0_22_on == 2'd0)
		begin
		gr0_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_22_on == 2'd2)
		begin
		gr0_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_23 && sq1_y_next == gr_y_0_23)
if (gr0_23_on == 2'd0)
		begin
		gr0_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_23_on == 2'd2)
		begin
		gr0_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_0_24 && sq1_y_next == gr_y_0_24)
if (gr0_24_on == 2'd0)
		begin
		gr0_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr0_24_on == 2'd2)
		begin
		gr0_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_0 && sq1_y_next == gr_y_1_0)
if (gr1_0_on == 2'd0)
		begin
		gr1_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_0_on == 2'd2)
		begin
		gr1_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_1 && sq1_y_next == gr_y_1_1)
if (gr1_1_on == 2'd0)
		begin
		gr1_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_1_on == 2'd2)
		begin
		gr1_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_2 && sq1_y_next == gr_y_1_2)
if (gr1_2_on == 2'd0)
		begin
		gr1_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_2_on == 2'd2)
		begin
		gr1_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_3 && sq1_y_next == gr_y_1_3)
if (gr1_3_on == 2'd0)
		begin
		gr1_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_3_on == 2'd2)
		begin
		gr1_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_4 && sq1_y_next == gr_y_1_4)
if (gr1_4_on == 2'd0)
		begin
		gr1_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_4_on == 2'd2)
		begin
		gr1_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_5 && sq1_y_next == gr_y_1_5)
if (gr1_5_on == 2'd0)
		begin
		gr1_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_5_on == 2'd2)
		begin
		gr1_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_6 && sq1_y_next == gr_y_1_6)
if (gr1_6_on == 2'd0)
		begin
		gr1_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_6_on == 2'd2)
		begin
		gr1_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_7 && sq1_y_next == gr_y_1_7)
if (gr1_7_on == 2'd0)
		begin
		gr1_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_7_on == 2'd2)
		begin
		gr1_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_8 && sq1_y_next == gr_y_1_8)
if (gr1_8_on == 2'd0)
		begin
		gr1_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_8_on == 2'd2)
		begin
		gr1_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_9 && sq1_y_next == gr_y_1_9)
if (gr1_9_on == 2'd0)
		begin
		gr1_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_9_on == 2'd2)
		begin
		gr1_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_10 && sq1_y_next == gr_y_1_10)
if (gr1_10_on == 2'd0)
		begin
		gr1_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_10_on == 2'd2)
		begin
		gr1_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_11 && sq1_y_next == gr_y_1_11)
if (gr1_11_on == 2'd0)
		begin
		gr1_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_11_on == 2'd2)
		begin
		gr1_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_12 && sq1_y_next == gr_y_1_12)
if (gr1_12_on == 2'd0)
		begin
		gr1_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_12_on == 2'd2)
		begin
		gr1_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_13 && sq1_y_next == gr_y_1_13)
if (gr1_13_on == 2'd0)
		begin
		gr1_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_13_on == 2'd2)
		begin
		gr1_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_14 && sq1_y_next == gr_y_1_14)
if (gr1_14_on == 2'd0)
		begin
		gr1_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_14_on == 2'd2)
		begin
		gr1_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_15 && sq1_y_next == gr_y_1_15)
if (gr1_15_on == 2'd0)
		begin
		gr1_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_15_on == 2'd2)
		begin
		gr1_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_16 && sq1_y_next == gr_y_1_16)
if (gr1_16_on == 2'd0)
		begin
		gr1_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_16_on == 2'd2)
		begin
		gr1_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_17 && sq1_y_next == gr_y_1_17)
if (gr1_17_on == 2'd0)
		begin
		gr1_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_17_on == 2'd2)
		begin
		gr1_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_18 && sq1_y_next == gr_y_1_18)
if (gr1_18_on == 2'd0)
		begin
		gr1_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_18_on == 2'd2)
		begin
		gr1_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_19 && sq1_y_next == gr_y_1_19)
if (gr1_19_on == 2'd0)
		begin
		gr1_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_19_on == 2'd2)
		begin
		gr1_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_20 && sq1_y_next == gr_y_1_20)
if (gr1_20_on == 2'd0)
		begin
		gr1_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_20_on == 2'd2)
		begin
		gr1_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_21 && sq1_y_next == gr_y_1_21)
if (gr1_21_on == 2'd0)
		begin
		gr1_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_21_on == 2'd2)
		begin
		gr1_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_22 && sq1_y_next == gr_y_1_22)
if (gr1_22_on == 2'd0)
		begin
		gr1_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_22_on == 2'd2)
		begin
		gr1_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_23 && sq1_y_next == gr_y_1_23)
if (gr1_23_on == 2'd0)
		begin
		gr1_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_23_on == 2'd2)
		begin
		gr1_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_1_24 && sq1_y_next == gr_y_1_24)
if (gr1_24_on == 2'd0)
		begin
		gr1_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr1_24_on == 2'd2)
		begin
		gr1_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_0 && sq1_y_next == gr_y_2_0)
if (gr2_0_on == 2'd0)
		begin
		gr2_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_0_on == 2'd2)
		begin
		gr2_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_1 && sq1_y_next == gr_y_2_1)
if (gr2_1_on == 2'd0)
		begin
		gr2_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_1_on == 2'd2)
		begin
		gr2_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_2 && sq1_y_next == gr_y_2_2)
if (gr2_2_on == 2'd0)
		begin
		gr2_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_2_on == 2'd2)
		begin
		gr2_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_3 && sq1_y_next == gr_y_2_3)
if (gr2_3_on == 2'd0)
		begin
		gr2_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_3_on == 2'd2)
		begin
		gr2_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_4 && sq1_y_next == gr_y_2_4)
if (gr2_4_on == 2'd0)
		begin
		gr2_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_4_on == 2'd2)
		begin
		gr2_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_5 && sq1_y_next == gr_y_2_5)
if (gr2_5_on == 2'd0)
		begin
		gr2_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_5_on == 2'd2)
		begin
		gr2_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_6 && sq1_y_next == gr_y_2_6)
if (gr2_6_on == 2'd0)
		begin
		gr2_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_6_on == 2'd2)
		begin
		gr2_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_7 && sq1_y_next == gr_y_2_7)
if (gr2_7_on == 2'd0)
		begin
		gr2_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_7_on == 2'd2)
		begin
		gr2_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_8 && sq1_y_next == gr_y_2_8)
if (gr2_8_on == 2'd0)
		begin
		gr2_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_8_on == 2'd2)
		begin
		gr2_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_9 && sq1_y_next == gr_y_2_9)
if (gr2_9_on == 2'd0)
		begin
		gr2_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_9_on == 2'd2)
		begin
		gr2_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_10 && sq1_y_next == gr_y_2_10)
if (gr2_10_on == 2'd0)
		begin
		gr2_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_10_on == 2'd2)
		begin
		gr2_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_11 && sq1_y_next == gr_y_2_11)
if (gr2_11_on == 2'd0)
		begin
		gr2_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_11_on == 2'd2)
		begin
		gr2_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_12 && sq1_y_next == gr_y_2_12)
if (gr2_12_on == 2'd0)
		begin
		gr2_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_12_on == 2'd2)
		begin
		gr2_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_13 && sq1_y_next == gr_y_2_13)
if (gr2_13_on == 2'd0)
		begin
		gr2_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_13_on == 2'd2)
		begin
		gr2_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_14 && sq1_y_next == gr_y_2_14)
if (gr2_14_on == 2'd0)
		begin
		gr2_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_14_on == 2'd2)
		begin
		gr2_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_15 && sq1_y_next == gr_y_2_15)
if (gr2_15_on == 2'd0)
		begin
		gr2_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_15_on == 2'd2)
		begin
		gr2_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_16 && sq1_y_next == gr_y_2_16)
if (gr2_16_on == 2'd0)
		begin
		gr2_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_16_on == 2'd2)
		begin
		gr2_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_17 && sq1_y_next == gr_y_2_17)
if (gr2_17_on == 2'd0)
		begin
		gr2_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_17_on == 2'd2)
		begin
		gr2_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_18 && sq1_y_next == gr_y_2_18)
if (gr2_18_on == 2'd0)
		begin
		gr2_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_18_on == 2'd2)
		begin
		gr2_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_19 && sq1_y_next == gr_y_2_19)
if (gr2_19_on == 2'd0)
		begin
		gr2_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_19_on == 2'd2)
		begin
		gr2_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_20 && sq1_y_next == gr_y_2_20)
if (gr2_20_on == 2'd0)
		begin
		gr2_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_20_on == 2'd2)
		begin
		gr2_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_21 && sq1_y_next == gr_y_2_21)
if (gr2_21_on == 2'd0)
		begin
		gr2_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_21_on == 2'd2)
		begin
		gr2_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_22 && sq1_y_next == gr_y_2_22)
if (gr2_22_on == 2'd0)
		begin
		gr2_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_22_on == 2'd2)
		begin
		gr2_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_23 && sq1_y_next == gr_y_2_23)
if (gr2_23_on == 2'd0)
		begin
		gr2_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_23_on == 2'd2)
		begin
		gr2_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_2_24 && sq1_y_next == gr_y_2_24)
if (gr2_24_on == 2'd0)
		begin
		gr2_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr2_24_on == 2'd2)
		begin
		gr2_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_0 && sq1_y_next == gr_y_3_0)
if (gr3_0_on == 2'd0)
		begin
		gr3_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_0_on == 2'd2)
		begin
		gr3_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_1 && sq1_y_next == gr_y_3_1)
if (gr3_1_on == 2'd0)
		begin
		gr3_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_1_on == 2'd2)
		begin
		gr3_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_2 && sq1_y_next == gr_y_3_2)
if (gr3_2_on == 2'd0)
		begin
		gr3_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_2_on == 2'd2)
		begin
		gr3_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_3 && sq1_y_next == gr_y_3_3)
if (gr3_3_on == 2'd0)
		begin
		gr3_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_3_on == 2'd2)
		begin
		gr3_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_4 && sq1_y_next == gr_y_3_4)
if (gr3_4_on == 2'd0)
		begin
		gr3_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_4_on == 2'd2)
		begin
		gr3_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_5 && sq1_y_next == gr_y_3_5)
if (gr3_5_on == 2'd0)
		begin
		gr3_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_5_on == 2'd2)
		begin
		gr3_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_6 && sq1_y_next == gr_y_3_6)
if (gr3_6_on == 2'd0)
		begin
		gr3_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_6_on == 2'd2)
		begin
		gr3_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_7 && sq1_y_next == gr_y_3_7)
if (gr3_7_on == 2'd0)
		begin
		gr3_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_7_on == 2'd2)
		begin
		gr3_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_8 && sq1_y_next == gr_y_3_8)
if (gr3_8_on == 2'd0)
		begin
		gr3_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_8_on == 2'd2)
		begin
		gr3_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_9 && sq1_y_next == gr_y_3_9)
if (gr3_9_on == 2'd0)
		begin
		gr3_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_9_on == 2'd2)
		begin
		gr3_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_10 && sq1_y_next == gr_y_3_10)
if (gr3_10_on == 2'd0)
		begin
		gr3_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_10_on == 2'd2)
		begin
		gr3_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_11 && sq1_y_next == gr_y_3_11)
if (gr3_11_on == 2'd0)
		begin
		gr3_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_11_on == 2'd2)
		begin
		gr3_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_12 && sq1_y_next == gr_y_3_12)
if (gr3_12_on == 2'd0)
		begin
		gr3_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_12_on == 2'd2)
		begin
		gr3_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_13 && sq1_y_next == gr_y_3_13)
if (gr3_13_on == 2'd0)
		begin
		gr3_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_13_on == 2'd2)
		begin
		gr3_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_14 && sq1_y_next == gr_y_3_14)
if (gr3_14_on == 2'd0)
		begin
		gr3_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_14_on == 2'd2)
		begin
		gr3_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_15 && sq1_y_next == gr_y_3_15)
if (gr3_15_on == 2'd0)
		begin
		gr3_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_15_on == 2'd2)
		begin
		gr3_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_16 && sq1_y_next == gr_y_3_16)
if (gr3_16_on == 2'd0)
		begin
		gr3_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_16_on == 2'd2)
		begin
		gr3_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_17 && sq1_y_next == gr_y_3_17)
if (gr3_17_on == 2'd0)
		begin
		gr3_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_17_on == 2'd2)
		begin
		gr3_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_18 && sq1_y_next == gr_y_3_18)
if (gr3_18_on == 2'd0)
		begin
		gr3_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_18_on == 2'd2)
		begin
		gr3_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_19 && sq1_y_next == gr_y_3_19)
if (gr3_19_on == 2'd0)
		begin
		gr3_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_19_on == 2'd2)
		begin
		gr3_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_20 && sq1_y_next == gr_y_3_20)
if (gr3_20_on == 2'd0)
		begin
		gr3_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_20_on == 2'd2)
		begin
		gr3_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_21 && sq1_y_next == gr_y_3_21)
if (gr3_21_on == 2'd0)
		begin
		gr3_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_21_on == 2'd2)
		begin
		gr3_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_22 && sq1_y_next == gr_y_3_22)
if (gr3_22_on == 2'd0)
		begin
		gr3_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_22_on == 2'd2)
		begin
		gr3_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_23 && sq1_y_next == gr_y_3_23)
if (gr3_23_on == 2'd0)
		begin
		gr3_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_23_on == 2'd2)
		begin
		gr3_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_3_24 && sq1_y_next == gr_y_3_24)
if (gr3_24_on == 2'd0)
		begin
		gr3_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr3_24_on == 2'd2)
		begin
		gr3_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_0 && sq1_y_next == gr_y_4_0)
if (gr4_0_on == 2'd0)
		begin
		gr4_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_0_on == 2'd2)
		begin
		gr4_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_1 && sq1_y_next == gr_y_4_1)
if (gr4_1_on == 2'd0)
		begin
		gr4_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_1_on == 2'd2)
		begin
		gr4_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_2 && sq1_y_next == gr_y_4_2)
if (gr4_2_on == 2'd0)
		begin
		gr4_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_2_on == 2'd2)
		begin
		gr4_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_3 && sq1_y_next == gr_y_4_3)
if (gr4_3_on == 2'd0)
		begin
		gr4_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_3_on == 2'd2)
		begin
		gr4_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_4 && sq1_y_next == gr_y_4_4)
if (gr4_4_on == 2'd0)
		begin
		gr4_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_4_on == 2'd2)
		begin
		gr4_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_5 && sq1_y_next == gr_y_4_5)
if (gr4_5_on == 2'd0)
		begin
		gr4_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_5_on == 2'd2)
		begin
		gr4_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_6 && sq1_y_next == gr_y_4_6)
if (gr4_6_on == 2'd0)
		begin
		gr4_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_6_on == 2'd2)
		begin
		gr4_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_7 && sq1_y_next == gr_y_4_7)
if (gr4_7_on == 2'd0)
		begin
		gr4_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_7_on == 2'd2)
		begin
		gr4_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_8 && sq1_y_next == gr_y_4_8)
if (gr4_8_on == 2'd0)
		begin
		gr4_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_8_on == 2'd2)
		begin
		gr4_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_9 && sq1_y_next == gr_y_4_9)
if (gr4_9_on == 2'd0)
		begin
		gr4_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_9_on == 2'd2)
		begin
		gr4_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_10 && sq1_y_next == gr_y_4_10)
if (gr4_10_on == 2'd0)
		begin
		gr4_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_10_on == 2'd2)
		begin
		gr4_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_11 && sq1_y_next == gr_y_4_11)
if (gr4_11_on == 2'd0)
		begin
		gr4_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_11_on == 2'd2)
		begin
		gr4_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_12 && sq1_y_next == gr_y_4_12)
if (gr4_12_on == 2'd0)
		begin
		gr4_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_12_on == 2'd2)
		begin
		gr4_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_13 && sq1_y_next == gr_y_4_13)
if (gr4_13_on == 2'd0)
		begin
		gr4_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_13_on == 2'd2)
		begin
		gr4_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_14 && sq1_y_next == gr_y_4_14)
if (gr4_14_on == 2'd0)
		begin
		gr4_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_14_on == 2'd2)
		begin
		gr4_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_15 && sq1_y_next == gr_y_4_15)
if (gr4_15_on == 2'd0)
		begin
		gr4_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_15_on == 2'd2)
		begin
		gr4_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_16 && sq1_y_next == gr_y_4_16)
if (gr4_16_on == 2'd0)
		begin
		gr4_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_16_on == 2'd2)
		begin
		gr4_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_17 && sq1_y_next == gr_y_4_17)
if (gr4_17_on == 2'd0)
		begin
		gr4_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_17_on == 2'd2)
		begin
		gr4_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_18 && sq1_y_next == gr_y_4_18)
if (gr4_18_on == 2'd0)
		begin
		gr4_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_18_on == 2'd2)
		begin
		gr4_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_19 && sq1_y_next == gr_y_4_19)
if (gr4_19_on == 2'd0)
		begin
		gr4_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_19_on == 2'd2)
		begin
		gr4_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_20 && sq1_y_next == gr_y_4_20)
if (gr4_20_on == 2'd0)
		begin
		gr4_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_20_on == 2'd2)
		begin
		gr4_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_21 && sq1_y_next == gr_y_4_21)
if (gr4_21_on == 2'd0)
		begin
		gr4_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_21_on == 2'd2)
		begin
		gr4_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_22 && sq1_y_next == gr_y_4_22)
if (gr4_22_on == 2'd0)
		begin
		gr4_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_22_on == 2'd2)
		begin
		gr4_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_23 && sq1_y_next == gr_y_4_23)
if (gr4_23_on == 2'd0)
		begin
		gr4_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_23_on == 2'd2)
		begin
		gr4_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_4_24 && sq1_y_next == gr_y_4_24)
if (gr4_24_on == 2'd0)
		begin
		gr4_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr4_24_on == 2'd2)
		begin
		gr4_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_0 && sq1_y_next == gr_y_5_0)
if (gr5_0_on == 2'd0)
		begin
		gr5_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_0_on == 2'd2)
		begin
		gr5_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_1 && sq1_y_next == gr_y_5_1)
if (gr5_1_on == 2'd0)
		begin
		gr5_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_1_on == 2'd2)
		begin
		gr5_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_2 && sq1_y_next == gr_y_5_2)
if (gr5_2_on == 2'd0)
		begin
		gr5_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_2_on == 2'd2)
		begin
		gr5_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_3 && sq1_y_next == gr_y_5_3)
if (gr5_3_on == 2'd0)
		begin
		gr5_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_3_on == 2'd2)
		begin
		gr5_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_4 && sq1_y_next == gr_y_5_4)
if (gr5_4_on == 2'd0)
		begin
		gr5_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_4_on == 2'd2)
		begin
		gr5_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_5 && sq1_y_next == gr_y_5_5)
if (gr5_5_on == 2'd0)
		begin
		gr5_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_5_on == 2'd2)
		begin
		gr5_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_6 && sq1_y_next == gr_y_5_6)
if (gr5_6_on == 2'd0)
		begin
		gr5_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_6_on == 2'd2)
		begin
		gr5_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_7 && sq1_y_next == gr_y_5_7)
if (gr5_7_on == 2'd0)
		begin
		gr5_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_7_on == 2'd2)
		begin
		gr5_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_8 && sq1_y_next == gr_y_5_8)
if (gr5_8_on == 2'd0)
		begin
		gr5_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_8_on == 2'd2)
		begin
		gr5_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_9 && sq1_y_next == gr_y_5_9)
if (gr5_9_on == 2'd0)
		begin
		gr5_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_9_on == 2'd2)
		begin
		gr5_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_10 && sq1_y_next == gr_y_5_10)
if (gr5_10_on == 2'd0)
		begin
		gr5_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_10_on == 2'd2)
		begin
		gr5_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_11 && sq1_y_next == gr_y_5_11)
if (gr5_11_on == 2'd0)
		begin
		gr5_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_11_on == 2'd2)
		begin
		gr5_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_12 && sq1_y_next == gr_y_5_12)
if (gr5_12_on == 2'd0)
		begin
		gr5_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_12_on == 2'd2)
		begin
		gr5_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_13 && sq1_y_next == gr_y_5_13)
if (gr5_13_on == 2'd0)
		begin
		gr5_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_13_on == 2'd2)
		begin
		gr5_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_14 && sq1_y_next == gr_y_5_14)
if (gr5_14_on == 2'd0)
		begin
		gr5_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_14_on == 2'd2)
		begin
		gr5_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_15 && sq1_y_next == gr_y_5_15)
if (gr5_15_on == 2'd0)
		begin
		gr5_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_15_on == 2'd2)
		begin
		gr5_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_16 && sq1_y_next == gr_y_5_16)
if (gr5_16_on == 2'd0)
		begin
		gr5_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_16_on == 2'd2)
		begin
		gr5_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_17 && sq1_y_next == gr_y_5_17)
if (gr5_17_on == 2'd0)
		begin
		gr5_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_17_on == 2'd2)
		begin
		gr5_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_18 && sq1_y_next == gr_y_5_18)
if (gr5_18_on == 2'd0)
		begin
		gr5_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_18_on == 2'd2)
		begin
		gr5_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_19 && sq1_y_next == gr_y_5_19)
if (gr5_19_on == 2'd0)
		begin
		gr5_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_19_on == 2'd2)
		begin
		gr5_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_20 && sq1_y_next == gr_y_5_20)
if (gr5_20_on == 2'd0)
		begin
		gr5_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_20_on == 2'd2)
		begin
		gr5_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_21 && sq1_y_next == gr_y_5_21)
if (gr5_21_on == 2'd0)
		begin
		gr5_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_21_on == 2'd2)
		begin
		gr5_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_22 && sq1_y_next == gr_y_5_22)
if (gr5_22_on == 2'd0)
		begin
		gr5_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_22_on == 2'd2)
		begin
		gr5_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_23 && sq1_y_next == gr_y_5_23)
if (gr5_23_on == 2'd0)
		begin
		gr5_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_23_on == 2'd2)
		begin
		gr5_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_5_24 && sq1_y_next == gr_y_5_24)
if (gr5_24_on == 2'd0)
		begin
		gr5_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr5_24_on == 2'd2)
		begin
		gr5_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_0 && sq1_y_next == gr_y_6_0)
if (gr6_0_on == 2'd0)
		begin
		gr6_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_0_on == 2'd2)
		begin
		gr6_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_1 && sq1_y_next == gr_y_6_1)
if (gr6_1_on == 2'd0)
		begin
		gr6_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_1_on == 2'd2)
		begin
		gr6_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_2 && sq1_y_next == gr_y_6_2)
if (gr6_2_on == 2'd0)
		begin
		gr6_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_2_on == 2'd2)
		begin
		gr6_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_3 && sq1_y_next == gr_y_6_3)
if (gr6_3_on == 2'd0)
		begin
		gr6_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_3_on == 2'd2)
		begin
		gr6_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_4 && sq1_y_next == gr_y_6_4)
if (gr6_4_on == 2'd0)
		begin
		gr6_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_4_on == 2'd2)
		begin
		gr6_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_5 && sq1_y_next == gr_y_6_5)
if (gr6_5_on == 2'd0)
		begin
		gr6_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_5_on == 2'd2)
		begin
		gr6_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_6 && sq1_y_next == gr_y_6_6)
if (gr6_6_on == 2'd0)
		begin
		gr6_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_6_on == 2'd2)
		begin
		gr6_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_7 && sq1_y_next == gr_y_6_7)
if (gr6_7_on == 2'd0)
		begin
		gr6_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_7_on == 2'd2)
		begin
		gr6_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_8 && sq1_y_next == gr_y_6_8)
if (gr6_8_on == 2'd0)
		begin
		gr6_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_8_on == 2'd2)
		begin
		gr6_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_9 && sq1_y_next == gr_y_6_9)
if (gr6_9_on == 2'd0)
		begin
		gr6_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_9_on == 2'd2)
		begin
		gr6_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_10 && sq1_y_next == gr_y_6_10)
if (gr6_10_on == 2'd0)
		begin
		gr6_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_10_on == 2'd2)
		begin
		gr6_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_11 && sq1_y_next == gr_y_6_11)
if (gr6_11_on == 2'd0)
		begin
		gr6_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_11_on == 2'd2)
		begin
		gr6_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_12 && sq1_y_next == gr_y_6_12)
if (gr6_12_on == 2'd0)
		begin
		gr6_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_12_on == 2'd2)
		begin
		gr6_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_13 && sq1_y_next == gr_y_6_13)
if (gr6_13_on == 2'd0)
		begin
		gr6_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_13_on == 2'd2)
		begin
		gr6_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_14 && sq1_y_next == gr_y_6_14)
if (gr6_14_on == 2'd0)
		begin
		gr6_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_14_on == 2'd2)
		begin
		gr6_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_15 && sq1_y_next == gr_y_6_15)
if (gr6_15_on == 2'd0)
		begin
		gr6_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_15_on == 2'd2)
		begin
		gr6_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_16 && sq1_y_next == gr_y_6_16)
if (gr6_16_on == 2'd0)
		begin
		gr6_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_16_on == 2'd2)
		begin
		gr6_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_17 && sq1_y_next == gr_y_6_17)
if (gr6_17_on == 2'd0)
		begin
		gr6_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_17_on == 2'd2)
		begin
		gr6_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_18 && sq1_y_next == gr_y_6_18)
if (gr6_18_on == 2'd0)
		begin
		gr6_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_18_on == 2'd2)
		begin
		gr6_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_19 && sq1_y_next == gr_y_6_19)
if (gr6_19_on == 2'd0)
		begin
		gr6_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_19_on == 2'd2)
		begin
		gr6_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_20 && sq1_y_next == gr_y_6_20)
if (gr6_20_on == 2'd0)
		begin
		gr6_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_20_on == 2'd2)
		begin
		gr6_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_21 && sq1_y_next == gr_y_6_21)
if (gr6_21_on == 2'd0)
		begin
		gr6_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_21_on == 2'd2)
		begin
		gr6_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_22 && sq1_y_next == gr_y_6_22)
if (gr6_22_on == 2'd0)
		begin
		gr6_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_22_on == 2'd2)
		begin
		gr6_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_23 && sq1_y_next == gr_y_6_23)
if (gr6_23_on == 2'd0)
		begin
		gr6_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_23_on == 2'd2)
		begin
		gr6_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_6_24 && sq1_y_next == gr_y_6_24)
if (gr6_24_on == 2'd0)
		begin
		gr6_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr6_24_on == 2'd2)
		begin
		gr6_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_0 && sq1_y_next == gr_y_7_0)
if (gr7_0_on == 2'd0)
		begin
		gr7_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_0_on == 2'd2)
		begin
		gr7_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_1 && sq1_y_next == gr_y_7_1)
if (gr7_1_on == 2'd0)
		begin
		gr7_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_1_on == 2'd2)
		begin
		gr7_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_2 && sq1_y_next == gr_y_7_2)
if (gr7_2_on == 2'd0)
		begin
		gr7_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_2_on == 2'd2)
		begin
		gr7_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_3 && sq1_y_next == gr_y_7_3)
if (gr7_3_on == 2'd0)
		begin
		gr7_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_3_on == 2'd2)
		begin
		gr7_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_4 && sq1_y_next == gr_y_7_4)
if (gr7_4_on == 2'd0)
		begin
		gr7_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_4_on == 2'd2)
		begin
		gr7_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_5 && sq1_y_next == gr_y_7_5)
if (gr7_5_on == 2'd0)
		begin
		gr7_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_5_on == 2'd2)
		begin
		gr7_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_6 && sq1_y_next == gr_y_7_6)
if (gr7_6_on == 2'd0)
		begin
		gr7_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_6_on == 2'd2)
		begin
		gr7_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_7 && sq1_y_next == gr_y_7_7)
if (gr7_7_on == 2'd0)
		begin
		gr7_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_7_on == 2'd2)
		begin
		gr7_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_8 && sq1_y_next == gr_y_7_8)
if (gr7_8_on == 2'd0)
		begin
		gr7_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_8_on == 2'd2)
		begin
		gr7_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_9 && sq1_y_next == gr_y_7_9)
if (gr7_9_on == 2'd0)
		begin
		gr7_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_9_on == 2'd2)
		begin
		gr7_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_10 && sq1_y_next == gr_y_7_10)
if (gr7_10_on == 2'd0)
		begin
		gr7_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_10_on == 2'd2)
		begin
		gr7_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_11 && sq1_y_next == gr_y_7_11)
if (gr7_11_on == 2'd0)
		begin
		gr7_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_11_on == 2'd2)
		begin
		gr7_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_12 && sq1_y_next == gr_y_7_12)
if (gr7_12_on == 2'd0)
		begin
		gr7_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_12_on == 2'd2)
		begin
		gr7_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_13 && sq1_y_next == gr_y_7_13)
if (gr7_13_on == 2'd0)
		begin
		gr7_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_13_on == 2'd2)
		begin
		gr7_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_14 && sq1_y_next == gr_y_7_14)
if (gr7_14_on == 2'd0)
		begin
		gr7_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_14_on == 2'd2)
		begin
		gr7_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_15 && sq1_y_next == gr_y_7_15)
if (gr7_15_on == 2'd0)
		begin
		gr7_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_15_on == 2'd2)
		begin
		gr7_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_16 && sq1_y_next == gr_y_7_16)
if (gr7_16_on == 2'd0)
		begin
		gr7_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_16_on == 2'd2)
		begin
		gr7_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_17 && sq1_y_next == gr_y_7_17)
if (gr7_17_on == 2'd0)
		begin
		gr7_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_17_on == 2'd2)
		begin
		gr7_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_18 && sq1_y_next == gr_y_7_18)
if (gr7_18_on == 2'd0)
		begin
		gr7_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_18_on == 2'd2)
		begin
		gr7_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_19 && sq1_y_next == gr_y_7_19)
if (gr7_19_on == 2'd0)
		begin
		gr7_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_19_on == 2'd2)
		begin
		gr7_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_20 && sq1_y_next == gr_y_7_20)
if (gr7_20_on == 2'd0)
		begin
		gr7_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_20_on == 2'd2)
		begin
		gr7_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_21 && sq1_y_next == gr_y_7_21)
if (gr7_21_on == 2'd0)
		begin
		gr7_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_21_on == 2'd2)
		begin
		gr7_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_22 && sq1_y_next == gr_y_7_22)
if (gr7_22_on == 2'd0)
		begin
		gr7_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_22_on == 2'd2)
		begin
		gr7_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_23 && sq1_y_next == gr_y_7_23)
if (gr7_23_on == 2'd0)
		begin
		gr7_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_23_on == 2'd2)
		begin
		gr7_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_7_24 && sq1_y_next == gr_y_7_24)
if (gr7_24_on == 2'd0)
		begin
		gr7_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr7_24_on == 2'd2)
		begin
		gr7_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_0 && sq1_y_next == gr_y_8_0)
if (gr8_0_on == 2'd0)
		begin
		gr8_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_0_on == 2'd2)
		begin
		gr8_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_1 && sq1_y_next == gr_y_8_1)
if (gr8_1_on == 2'd0)
		begin
		gr8_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_1_on == 2'd2)
		begin
		gr8_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_2 && sq1_y_next == gr_y_8_2)
if (gr8_2_on == 2'd0)
		begin
		gr8_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_2_on == 2'd2)
		begin
		gr8_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_3 && sq1_y_next == gr_y_8_3)
if (gr8_3_on == 2'd0)
		begin
		gr8_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_3_on == 2'd2)
		begin
		gr8_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_4 && sq1_y_next == gr_y_8_4)
if (gr8_4_on == 2'd0)
		begin
		gr8_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_4_on == 2'd2)
		begin
		gr8_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_5 && sq1_y_next == gr_y_8_5)
if (gr8_5_on == 2'd0)
		begin
		gr8_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_5_on == 2'd2)
		begin
		gr8_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_6 && sq1_y_next == gr_y_8_6)
if (gr8_6_on == 2'd0)
		begin
		gr8_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_6_on == 2'd2)
		begin
		gr8_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_7 && sq1_y_next == gr_y_8_7)
if (gr8_7_on == 2'd0)
		begin
		gr8_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_7_on == 2'd2)
		begin
		gr8_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_8 && sq1_y_next == gr_y_8_8)
if (gr8_8_on == 2'd0)
		begin
		gr8_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_8_on == 2'd2)
		begin
		gr8_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_9 && sq1_y_next == gr_y_8_9)
if (gr8_9_on == 2'd0)
		begin
		gr8_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_9_on == 2'd2)
		begin
		gr8_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_10 && sq1_y_next == gr_y_8_10)
if (gr8_10_on == 2'd0)
		begin
		gr8_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_10_on == 2'd2)
		begin
		gr8_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_11 && sq1_y_next == gr_y_8_11)
if (gr8_11_on == 2'd0)
		begin
		gr8_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_11_on == 2'd2)
		begin
		gr8_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_12 && sq1_y_next == gr_y_8_12)
if (gr8_12_on == 2'd0)
		begin
		gr8_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_12_on == 2'd2)
		begin
		gr8_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_13 && sq1_y_next == gr_y_8_13)
if (gr8_13_on == 2'd0)
		begin
		gr8_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_13_on == 2'd2)
		begin
		gr8_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_14 && sq1_y_next == gr_y_8_14)
if (gr8_14_on == 2'd0)
		begin
		gr8_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_14_on == 2'd2)
		begin
		gr8_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_15 && sq1_y_next == gr_y_8_15)
if (gr8_15_on == 2'd0)
		begin
		gr8_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_15_on == 2'd2)
		begin
		gr8_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_16 && sq1_y_next == gr_y_8_16)
if (gr8_16_on == 2'd0)
		begin
		gr8_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_16_on == 2'd2)
		begin
		gr8_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_17 && sq1_y_next == gr_y_8_17)
if (gr8_17_on == 2'd0)
		begin
		gr8_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_17_on == 2'd2)
		begin
		gr8_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_18 && sq1_y_next == gr_y_8_18)
if (gr8_18_on == 2'd0)
		begin
		gr8_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_18_on == 2'd2)
		begin
		gr8_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_19 && sq1_y_next == gr_y_8_19)
if (gr8_19_on == 2'd0)
		begin
		gr8_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_19_on == 2'd2)
		begin
		gr8_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_20 && sq1_y_next == gr_y_8_20)
if (gr8_20_on == 2'd0)
		begin
		gr8_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_20_on == 2'd2)
		begin
		gr8_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_21 && sq1_y_next == gr_y_8_21)
if (gr8_21_on == 2'd0)
		begin
		gr8_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_21_on == 2'd2)
		begin
		gr8_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_22 && sq1_y_next == gr_y_8_22)
if (gr8_22_on == 2'd0)
		begin
		gr8_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_22_on == 2'd2)
		begin
		gr8_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_23 && sq1_y_next == gr_y_8_23)
if (gr8_23_on == 2'd0)
		begin
		gr8_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_23_on == 2'd2)
		begin
		gr8_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_8_24 && sq1_y_next == gr_y_8_24)
if (gr8_24_on == 2'd0)
		begin
		gr8_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr8_24_on == 2'd2)
		begin
		gr8_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_0 && sq1_y_next == gr_y_9_0)
if (gr9_0_on == 2'd0)
		begin
		gr9_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_0_on == 2'd2)
		begin
		gr9_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_1 && sq1_y_next == gr_y_9_1)
if (gr9_1_on == 2'd0)
		begin
		gr9_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_1_on == 2'd2)
		begin
		gr9_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_2 && sq1_y_next == gr_y_9_2)
if (gr9_2_on == 2'd0)
		begin
		gr9_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_2_on == 2'd2)
		begin
		gr9_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_3 && sq1_y_next == gr_y_9_3)
if (gr9_3_on == 2'd0)
		begin
		gr9_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_3_on == 2'd2)
		begin
		gr9_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_4 && sq1_y_next == gr_y_9_4)
if (gr9_4_on == 2'd0)
		begin
		gr9_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_4_on == 2'd2)
		begin
		gr9_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_5 && sq1_y_next == gr_y_9_5)
if (gr9_5_on == 2'd0)
		begin
		gr9_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_5_on == 2'd2)
		begin
		gr9_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_6 && sq1_y_next == gr_y_9_6)
if (gr9_6_on == 2'd0)
		begin
		gr9_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_6_on == 2'd2)
		begin
		gr9_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_7 && sq1_y_next == gr_y_9_7)
if (gr9_7_on == 2'd0)
		begin
		gr9_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_7_on == 2'd2)
		begin
		gr9_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_8 && sq1_y_next == gr_y_9_8)
if (gr9_8_on == 2'd0)
		begin
		gr9_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_8_on == 2'd2)
		begin
		gr9_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_9 && sq1_y_next == gr_y_9_9)
if (gr9_9_on == 2'd0)
		begin
		gr9_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_9_on == 2'd2)
		begin
		gr9_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_10 && sq1_y_next == gr_y_9_10)
if (gr9_10_on == 2'd0)
		begin
		gr9_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_10_on == 2'd2)
		begin
		gr9_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_11 && sq1_y_next == gr_y_9_11)
if (gr9_11_on == 2'd0)
		begin
		gr9_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_11_on == 2'd2)
		begin
		gr9_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_12 && sq1_y_next == gr_y_9_12)
if (gr9_12_on == 2'd0)
		begin
		gr9_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_12_on == 2'd2)
		begin
		gr9_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_13 && sq1_y_next == gr_y_9_13)
if (gr9_13_on == 2'd0)
		begin
		gr9_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_13_on == 2'd2)
		begin
		gr9_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_14 && sq1_y_next == gr_y_9_14)
if (gr9_14_on == 2'd0)
		begin
		gr9_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_14_on == 2'd2)
		begin
		gr9_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_15 && sq1_y_next == gr_y_9_15)
if (gr9_15_on == 2'd0)
		begin
		gr9_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_15_on == 2'd2)
		begin
		gr9_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_16 && sq1_y_next == gr_y_9_16)
if (gr9_16_on == 2'd0)
		begin
		gr9_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_16_on == 2'd2)
		begin
		gr9_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_17 && sq1_y_next == gr_y_9_17)
if (gr9_17_on == 2'd0)
		begin
		gr9_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_17_on == 2'd2)
		begin
		gr9_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_18 && sq1_y_next == gr_y_9_18)
if (gr9_18_on == 2'd0)
		begin
		gr9_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_18_on == 2'd2)
		begin
		gr9_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_19 && sq1_y_next == gr_y_9_19)
if (gr9_19_on == 2'd0)
		begin
		gr9_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_19_on == 2'd2)
		begin
		gr9_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_20 && sq1_y_next == gr_y_9_20)
if (gr9_20_on == 2'd0)
		begin
		gr9_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_20_on == 2'd2)
		begin
		gr9_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_21 && sq1_y_next == gr_y_9_21)
if (gr9_21_on == 2'd0)
		begin
		gr9_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_21_on == 2'd2)
		begin
		gr9_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_22 && sq1_y_next == gr_y_9_22)
if (gr9_22_on == 2'd0)
		begin
		gr9_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_22_on == 2'd2)
		begin
		gr9_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_23 && sq1_y_next == gr_y_9_23)
if (gr9_23_on == 2'd0)
		begin
		gr9_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_23_on == 2'd2)
		begin
		gr9_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_9_24 && sq1_y_next == gr_y_9_24)
if (gr9_24_on == 2'd0)
		begin
		gr9_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr9_24_on == 2'd2)
		begin
		gr9_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_0 && sq1_y_next == gr_y_10_0)
if (gr10_0_on == 2'd0)
		begin
		gr10_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_0_on == 2'd2)
		begin
		gr10_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_1 && sq1_y_next == gr_y_10_1)
if (gr10_1_on == 2'd0)
		begin
		gr10_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_1_on == 2'd2)
		begin
		gr10_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_2 && sq1_y_next == gr_y_10_2)
if (gr10_2_on == 2'd0)
		begin
		gr10_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_2_on == 2'd2)
		begin
		gr10_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_3 && sq1_y_next == gr_y_10_3)
if (gr10_3_on == 2'd0)
		begin
		gr10_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_3_on == 2'd2)
		begin
		gr10_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_4 && sq1_y_next == gr_y_10_4)
if (gr10_4_on == 2'd0)
		begin
		gr10_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_4_on == 2'd2)
		begin
		gr10_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_5 && sq1_y_next == gr_y_10_5)
if (gr10_5_on == 2'd0)
		begin
		gr10_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_5_on == 2'd2)
		begin
		gr10_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_6 && sq1_y_next == gr_y_10_6)
if (gr10_6_on == 2'd0)
		begin
		gr10_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_6_on == 2'd2)
		begin
		gr10_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_7 && sq1_y_next == gr_y_10_7)
if (gr10_7_on == 2'd0)
		begin
		gr10_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_7_on == 2'd2)
		begin
		gr10_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_8 && sq1_y_next == gr_y_10_8)
if (gr10_8_on == 2'd0)
		begin
		gr10_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_8_on == 2'd2)
		begin
		gr10_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_9 && sq1_y_next == gr_y_10_9)
if (gr10_9_on == 2'd0)
		begin
		gr10_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_9_on == 2'd2)
		begin
		gr10_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_10 && sq1_y_next == gr_y_10_10)
if (gr10_10_on == 2'd0)
		begin
		gr10_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_10_on == 2'd2)
		begin
		gr10_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_11 && sq1_y_next == gr_y_10_11)
if (gr10_11_on == 2'd0)
		begin
		gr10_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_11_on == 2'd2)
		begin
		gr10_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_12 && sq1_y_next == gr_y_10_12)
if (gr10_12_on == 2'd0)
		begin
		gr10_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_12_on == 2'd2)
		begin
		gr10_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_13 && sq1_y_next == gr_y_10_13)
if (gr10_13_on == 2'd0)
		begin
		gr10_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_13_on == 2'd2)
		begin
		gr10_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_14 && sq1_y_next == gr_y_10_14)
if (gr10_14_on == 2'd0)
		begin
		gr10_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_14_on == 2'd2)
		begin
		gr10_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_15 && sq1_y_next == gr_y_10_15)
if (gr10_15_on == 2'd0)
		begin
		gr10_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_15_on == 2'd2)
		begin
		gr10_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_16 && sq1_y_next == gr_y_10_16)
if (gr10_16_on == 2'd0)
		begin
		gr10_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_16_on == 2'd2)
		begin
		gr10_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_17 && sq1_y_next == gr_y_10_17)
if (gr10_17_on == 2'd0)
		begin
		gr10_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_17_on == 2'd2)
		begin
		gr10_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_18 && sq1_y_next == gr_y_10_18)
if (gr10_18_on == 2'd0)
		begin
		gr10_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_18_on == 2'd2)
		begin
		gr10_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_19 && sq1_y_next == gr_y_10_19)
if (gr10_19_on == 2'd0)
		begin
		gr10_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_19_on == 2'd2)
		begin
		gr10_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_20 && sq1_y_next == gr_y_10_20)
if (gr10_20_on == 2'd0)
		begin
		gr10_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_20_on == 2'd2)
		begin
		gr10_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_21 && sq1_y_next == gr_y_10_21)
if (gr10_21_on == 2'd0)
		begin
		gr10_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_21_on == 2'd2)
		begin
		gr10_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_22 && sq1_y_next == gr_y_10_22)
if (gr10_22_on == 2'd0)
		begin
		gr10_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_22_on == 2'd2)
		begin
		gr10_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_23 && sq1_y_next == gr_y_10_23)
if (gr10_23_on == 2'd0)
		begin
		gr10_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_23_on == 2'd2)
		begin
		gr10_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_10_24 && sq1_y_next == gr_y_10_24)
if (gr10_24_on == 2'd0)
		begin
		gr10_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr10_24_on == 2'd2)
		begin
		gr10_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_0 && sq1_y_next == gr_y_11_0)
if (gr11_0_on == 2'd0)
		begin
		gr11_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_0_on == 2'd2)
		begin
		gr11_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_1 && sq1_y_next == gr_y_11_1)
if (gr11_1_on == 2'd0)
		begin
		gr11_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_1_on == 2'd2)
		begin
		gr11_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_2 && sq1_y_next == gr_y_11_2)
if (gr11_2_on == 2'd0)
		begin
		gr11_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_2_on == 2'd2)
		begin
		gr11_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_3 && sq1_y_next == gr_y_11_3)
if (gr11_3_on == 2'd0)
		begin
		gr11_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_3_on == 2'd2)
		begin
		gr11_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_4 && sq1_y_next == gr_y_11_4)
if (gr11_4_on == 2'd0)
		begin
		gr11_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_4_on == 2'd2)
		begin
		gr11_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_5 && sq1_y_next == gr_y_11_5)
if (gr11_5_on == 2'd0)
		begin
		gr11_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_5_on == 2'd2)
		begin
		gr11_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_6 && sq1_y_next == gr_y_11_6)
if (gr11_6_on == 2'd0)
		begin
		gr11_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_6_on == 2'd2)
		begin
		gr11_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_7 && sq1_y_next == gr_y_11_7)
if (gr11_7_on == 2'd0)
		begin
		gr11_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_7_on == 2'd2)
		begin
		gr11_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_8 && sq1_y_next == gr_y_11_8)
if (gr11_8_on == 2'd0)
		begin
		gr11_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_8_on == 2'd2)
		begin
		gr11_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_9 && sq1_y_next == gr_y_11_9)
if (gr11_9_on == 2'd0)
		begin
		gr11_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_9_on == 2'd2)
		begin
		gr11_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_10 && sq1_y_next == gr_y_11_10)
if (gr11_10_on == 2'd0)
		begin
		gr11_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_10_on == 2'd2)
		begin
		gr11_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_11 && sq1_y_next == gr_y_11_11)
if (gr11_11_on == 2'd0)
		begin
		gr11_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_11_on == 2'd2)
		begin
		gr11_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_12 && sq1_y_next == gr_y_11_12)
if (gr11_12_on == 2'd0)
		begin
		gr11_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_12_on == 2'd2)
		begin
		gr11_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_13 && sq1_y_next == gr_y_11_13)
if (gr11_13_on == 2'd0)
		begin
		gr11_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_13_on == 2'd2)
		begin
		gr11_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_14 && sq1_y_next == gr_y_11_14)
if (gr11_14_on == 2'd0)
		begin
		gr11_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_14_on == 2'd2)
		begin
		gr11_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_15 && sq1_y_next == gr_y_11_15)
if (gr11_15_on == 2'd0)
		begin
		gr11_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_15_on == 2'd2)
		begin
		gr11_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_16 && sq1_y_next == gr_y_11_16)
if (gr11_16_on == 2'd0)
		begin
		gr11_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_16_on == 2'd2)
		begin
		gr11_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_17 && sq1_y_next == gr_y_11_17)
if (gr11_17_on == 2'd0)
		begin
		gr11_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_17_on == 2'd2)
		begin
		gr11_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_18 && sq1_y_next == gr_y_11_18)
if (gr11_18_on == 2'd0)
		begin
		gr11_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_18_on == 2'd2)
		begin
		gr11_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_19 && sq1_y_next == gr_y_11_19)
if (gr11_19_on == 2'd0)
		begin
		gr11_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_19_on == 2'd2)
		begin
		gr11_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_20 && sq1_y_next == gr_y_11_20)
if (gr11_20_on == 2'd0)
		begin
		gr11_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_20_on == 2'd2)
		begin
		gr11_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_21 && sq1_y_next == gr_y_11_21)
if (gr11_21_on == 2'd0)
		begin
		gr11_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_21_on == 2'd2)
		begin
		gr11_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_22 && sq1_y_next == gr_y_11_22)
if (gr11_22_on == 2'd0)
		begin
		gr11_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_22_on == 2'd2)
		begin
		gr11_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_23 && sq1_y_next == gr_y_11_23)
if (gr11_23_on == 2'd0)
		begin
		gr11_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_23_on == 2'd2)
		begin
		gr11_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_11_24 && sq1_y_next == gr_y_11_24)
if (gr11_24_on == 2'd0)
		begin
		gr11_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr11_24_on == 2'd2)
		begin
		gr11_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_0 && sq1_y_next == gr_y_12_0)
if (gr12_0_on == 2'd0)
		begin
		gr12_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_0_on == 2'd2)
		begin
		gr12_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_1 && sq1_y_next == gr_y_12_1)
if (gr12_1_on == 2'd0)
		begin
		gr12_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_1_on == 2'd2)
		begin
		gr12_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_2 && sq1_y_next == gr_y_12_2)
if (gr12_2_on == 2'd0)
		begin
		gr12_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_2_on == 2'd2)
		begin
		gr12_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_3 && sq1_y_next == gr_y_12_3)
if (gr12_3_on == 2'd0)
		begin
		gr12_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_3_on == 2'd2)
		begin
		gr12_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_4 && sq1_y_next == gr_y_12_4)
if (gr12_4_on == 2'd0)
		begin
		gr12_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_4_on == 2'd2)
		begin
		gr12_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_5 && sq1_y_next == gr_y_12_5)
if (gr12_5_on == 2'd0)
		begin
		gr12_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_5_on == 2'd2)
		begin
		gr12_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_6 && sq1_y_next == gr_y_12_6)
if (gr12_6_on == 2'd0)
		begin
		gr12_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_6_on == 2'd2)
		begin
		gr12_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_7 && sq1_y_next == gr_y_12_7)
if (gr12_7_on == 2'd0)
		begin
		gr12_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_7_on == 2'd2)
		begin
		gr12_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_8 && sq1_y_next == gr_y_12_8)
if (gr12_8_on == 2'd0)
		begin
		gr12_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_8_on == 2'd2)
		begin
		gr12_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_9 && sq1_y_next == gr_y_12_9)
if (gr12_9_on == 2'd0)
		begin
		gr12_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_9_on == 2'd2)
		begin
		gr12_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_10 && sq1_y_next == gr_y_12_10)
if (gr12_10_on == 2'd0)
		begin
		gr12_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_10_on == 2'd2)
		begin
		gr12_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_11 && sq1_y_next == gr_y_12_11)
if (gr12_11_on == 2'd0)
		begin
		gr12_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_11_on == 2'd2)
		begin
		gr12_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_12 && sq1_y_next == gr_y_12_12)
if (gr12_12_on == 2'd0)
		begin
		gr12_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_12_on == 2'd2)
		begin
		gr12_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_13 && sq1_y_next == gr_y_12_13)
if (gr12_13_on == 2'd0)
		begin
		gr12_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_13_on == 2'd2)
		begin
		gr12_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_14 && sq1_y_next == gr_y_12_14)
if (gr12_14_on == 2'd0)
		begin
		gr12_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_14_on == 2'd2)
		begin
		gr12_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_15 && sq1_y_next == gr_y_12_15)
if (gr12_15_on == 2'd0)
		begin
		gr12_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_15_on == 2'd2)
		begin
		gr12_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_16 && sq1_y_next == gr_y_12_16)
if (gr12_16_on == 2'd0)
		begin
		gr12_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_16_on == 2'd2)
		begin
		gr12_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_17 && sq1_y_next == gr_y_12_17)
if (gr12_17_on == 2'd0)
		begin
		gr12_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_17_on == 2'd2)
		begin
		gr12_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_18 && sq1_y_next == gr_y_12_18)
if (gr12_18_on == 2'd0)
		begin
		gr12_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_18_on == 2'd2)
		begin
		gr12_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_19 && sq1_y_next == gr_y_12_19)
if (gr12_19_on == 2'd0)
		begin
		gr12_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_19_on == 2'd2)
		begin
		gr12_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_20 && sq1_y_next == gr_y_12_20)
if (gr12_20_on == 2'd0)
		begin
		gr12_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_20_on == 2'd2)
		begin
		gr12_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_21 && sq1_y_next == gr_y_12_21)
if (gr12_21_on == 2'd0)
		begin
		gr12_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_21_on == 2'd2)
		begin
		gr12_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_22 && sq1_y_next == gr_y_12_22)
if (gr12_22_on == 2'd0)
		begin
		gr12_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_22_on == 2'd2)
		begin
		gr12_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_23 && sq1_y_next == gr_y_12_23)
if (gr12_23_on == 2'd0)
		begin
		gr12_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_23_on == 2'd2)
		begin
		gr12_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_12_24 && sq1_y_next == gr_y_12_24)
if (gr12_24_on == 2'd0)
		begin
		gr12_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr12_24_on == 2'd2)
		begin
		gr12_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_0 && sq1_y_next == gr_y_13_0)
if (gr13_0_on == 2'd0)
		begin
		gr13_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_0_on == 2'd2)
		begin
		gr13_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_1 && sq1_y_next == gr_y_13_1)
if (gr13_1_on == 2'd0)
		begin
		gr13_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_1_on == 2'd2)
		begin
		gr13_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_2 && sq1_y_next == gr_y_13_2)
if (gr13_2_on == 2'd0)
		begin
		gr13_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_2_on == 2'd2)
		begin
		gr13_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_3 && sq1_y_next == gr_y_13_3)
if (gr13_3_on == 2'd0)
		begin
		gr13_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_3_on == 2'd2)
		begin
		gr13_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_4 && sq1_y_next == gr_y_13_4)
if (gr13_4_on == 2'd0)
		begin
		gr13_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_4_on == 2'd2)
		begin
		gr13_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_5 && sq1_y_next == gr_y_13_5)
if (gr13_5_on == 2'd0)
		begin
		gr13_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_5_on == 2'd2)
		begin
		gr13_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_6 && sq1_y_next == gr_y_13_6)
if (gr13_6_on == 2'd0)
		begin
		gr13_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_6_on == 2'd2)
		begin
		gr13_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_7 && sq1_y_next == gr_y_13_7)
if (gr13_7_on == 2'd0)
		begin
		gr13_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_7_on == 2'd2)
		begin
		gr13_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_8 && sq1_y_next == gr_y_13_8)
if (gr13_8_on == 2'd0)
		begin
		gr13_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_8_on == 2'd2)
		begin
		gr13_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_9 && sq1_y_next == gr_y_13_9)
if (gr13_9_on == 2'd0)
		begin
		gr13_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_9_on == 2'd2)
		begin
		gr13_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_10 && sq1_y_next == gr_y_13_10)
if (gr13_10_on == 2'd0)
		begin
		gr13_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_10_on == 2'd2)
		begin
		gr13_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_11 && sq1_y_next == gr_y_13_11)
if (gr13_11_on == 2'd0)
		begin
		gr13_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_11_on == 2'd2)
		begin
		gr13_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_12 && sq1_y_next == gr_y_13_12)
if (gr13_12_on == 2'd0)
		begin
		gr13_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_12_on == 2'd2)
		begin
		gr13_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_13 && sq1_y_next == gr_y_13_13)
if (gr13_13_on == 2'd0)
		begin
		gr13_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_13_on == 2'd2)
		begin
		gr13_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_14 && sq1_y_next == gr_y_13_14)
if (gr13_14_on == 2'd0)
		begin
		gr13_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_14_on == 2'd2)
		begin
		gr13_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_15 && sq1_y_next == gr_y_13_15)
if (gr13_15_on == 2'd0)
		begin
		gr13_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_15_on == 2'd2)
		begin
		gr13_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_16 && sq1_y_next == gr_y_13_16)
if (gr13_16_on == 2'd0)
		begin
		gr13_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_16_on == 2'd2)
		begin
		gr13_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_17 && sq1_y_next == gr_y_13_17)
if (gr13_17_on == 2'd0)
		begin
		gr13_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_17_on == 2'd2)
		begin
		gr13_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_18 && sq1_y_next == gr_y_13_18)
if (gr13_18_on == 2'd0)
		begin
		gr13_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_18_on == 2'd2)
		begin
		gr13_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_19 && sq1_y_next == gr_y_13_19)
if (gr13_19_on == 2'd0)
		begin
		gr13_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_19_on == 2'd2)
		begin
		gr13_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_20 && sq1_y_next == gr_y_13_20)
if (gr13_20_on == 2'd0)
		begin
		gr13_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_20_on == 2'd2)
		begin
		gr13_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_21 && sq1_y_next == gr_y_13_21)
if (gr13_21_on == 2'd0)
		begin
		gr13_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_21_on == 2'd2)
		begin
		gr13_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_22 && sq1_y_next == gr_y_13_22)
if (gr13_22_on == 2'd0)
		begin
		gr13_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_22_on == 2'd2)
		begin
		gr13_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_23 && sq1_y_next == gr_y_13_23)
if (gr13_23_on == 2'd0)
		begin
		gr13_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_23_on == 2'd2)
		begin
		gr13_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_13_24 && sq1_y_next == gr_y_13_24)
if (gr13_24_on == 2'd0)
		begin
		gr13_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr13_24_on == 2'd2)
		begin
		gr13_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_0 && sq1_y_next == gr_y_14_0)
if (gr14_0_on == 2'd0)
		begin
		gr14_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_0_on == 2'd2)
		begin
		gr14_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_1 && sq1_y_next == gr_y_14_1)
if (gr14_1_on == 2'd0)
		begin
		gr14_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_1_on == 2'd2)
		begin
		gr14_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_2 && sq1_y_next == gr_y_14_2)
if (gr14_2_on == 2'd0)
		begin
		gr14_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_2_on == 2'd2)
		begin
		gr14_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_3 && sq1_y_next == gr_y_14_3)
if (gr14_3_on == 2'd0)
		begin
		gr14_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_3_on == 2'd2)
		begin
		gr14_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_4 && sq1_y_next == gr_y_14_4)
if (gr14_4_on == 2'd0)
		begin
		gr14_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_4_on == 2'd2)
		begin
		gr14_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_5 && sq1_y_next == gr_y_14_5)
if (gr14_5_on == 2'd0)
		begin
		gr14_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_5_on == 2'd2)
		begin
		gr14_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_6 && sq1_y_next == gr_y_14_6)
if (gr14_6_on == 2'd0)
		begin
		gr14_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_6_on == 2'd2)
		begin
		gr14_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_7 && sq1_y_next == gr_y_14_7)
if (gr14_7_on == 2'd0)
		begin
		gr14_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_7_on == 2'd2)
		begin
		gr14_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_8 && sq1_y_next == gr_y_14_8)
if (gr14_8_on == 2'd0)
		begin
		gr14_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_8_on == 2'd2)
		begin
		gr14_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_9 && sq1_y_next == gr_y_14_9)
if (gr14_9_on == 2'd0)
		begin
		gr14_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_9_on == 2'd2)
		begin
		gr14_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_10 && sq1_y_next == gr_y_14_10)
if (gr14_10_on == 2'd0)
		begin
		gr14_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_10_on == 2'd2)
		begin
		gr14_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_11 && sq1_y_next == gr_y_14_11)
if (gr14_11_on == 2'd0)
		begin
		gr14_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_11_on == 2'd2)
		begin
		gr14_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_12 && sq1_y_next == gr_y_14_12)
if (gr14_12_on == 2'd0)
		begin
		gr14_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_12_on == 2'd2)
		begin
		gr14_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_13 && sq1_y_next == gr_y_14_13)
if (gr14_13_on == 2'd0)
		begin
		gr14_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_13_on == 2'd2)
		begin
		gr14_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_14 && sq1_y_next == gr_y_14_14)
if (gr14_14_on == 2'd0)
		begin
		gr14_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_14_on == 2'd2)
		begin
		gr14_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_15 && sq1_y_next == gr_y_14_15)
if (gr14_15_on == 2'd0)
		begin
		gr14_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_15_on == 2'd2)
		begin
		gr14_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_16 && sq1_y_next == gr_y_14_16)
if (gr14_16_on == 2'd0)
		begin
		gr14_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_16_on == 2'd2)
		begin
		gr14_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_17 && sq1_y_next == gr_y_14_17)
if (gr14_17_on == 2'd0)
		begin
		gr14_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_17_on == 2'd2)
		begin
		gr14_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_18 && sq1_y_next == gr_y_14_18)
if (gr14_18_on == 2'd0)
		begin
		gr14_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_18_on == 2'd2)
		begin
		gr14_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_19 && sq1_y_next == gr_y_14_19)
if (gr14_19_on == 2'd0)
		begin
		gr14_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_19_on == 2'd2)
		begin
		gr14_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_20 && sq1_y_next == gr_y_14_20)
if (gr14_20_on == 2'd0)
		begin
		gr14_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_20_on == 2'd2)
		begin
		gr14_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_21 && sq1_y_next == gr_y_14_21)
if (gr14_21_on == 2'd0)
		begin
		gr14_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_21_on == 2'd2)
		begin
		gr14_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_22 && sq1_y_next == gr_y_14_22)
if (gr14_22_on == 2'd0)
		begin
		gr14_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_22_on == 2'd2)
		begin
		gr14_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_23 && sq1_y_next == gr_y_14_23)
if (gr14_23_on == 2'd0)
		begin
		gr14_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_23_on == 2'd2)
		begin
		gr14_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_14_24 && sq1_y_next == gr_y_14_24)
if (gr14_24_on == 2'd0)
		begin
		gr14_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr14_24_on == 2'd2)
		begin
		gr14_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_0 && sq1_y_next == gr_y_15_0)
if (gr15_0_on == 2'd0)
		begin
		gr15_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_0_on == 2'd2)
		begin
		gr15_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_1 && sq1_y_next == gr_y_15_1)
if (gr15_1_on == 2'd0)
		begin
		gr15_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_1_on == 2'd2)
		begin
		gr15_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_2 && sq1_y_next == gr_y_15_2)
if (gr15_2_on == 2'd0)
		begin
		gr15_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_2_on == 2'd2)
		begin
		gr15_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_3 && sq1_y_next == gr_y_15_3)
if (gr15_3_on == 2'd0)
		begin
		gr15_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_3_on == 2'd2)
		begin
		gr15_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_4 && sq1_y_next == gr_y_15_4)
if (gr15_4_on == 2'd0)
		begin
		gr15_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_4_on == 2'd2)
		begin
		gr15_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_5 && sq1_y_next == gr_y_15_5)
if (gr15_5_on == 2'd0)
		begin
		gr15_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_5_on == 2'd2)
		begin
		gr15_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_6 && sq1_y_next == gr_y_15_6)
if (gr15_6_on == 2'd0)
		begin
		gr15_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_6_on == 2'd2)
		begin
		gr15_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_7 && sq1_y_next == gr_y_15_7)
if (gr15_7_on == 2'd0)
		begin
		gr15_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_7_on == 2'd2)
		begin
		gr15_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_8 && sq1_y_next == gr_y_15_8)
if (gr15_8_on == 2'd0)
		begin
		gr15_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_8_on == 2'd2)
		begin
		gr15_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_9 && sq1_y_next == gr_y_15_9)
if (gr15_9_on == 2'd0)
		begin
		gr15_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_9_on == 2'd2)
		begin
		gr15_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_10 && sq1_y_next == gr_y_15_10)
if (gr15_10_on == 2'd0)
		begin
		gr15_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_10_on == 2'd2)
		begin
		gr15_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_11 && sq1_y_next == gr_y_15_11)
if (gr15_11_on == 2'd0)
		begin
		gr15_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_11_on == 2'd2)
		begin
		gr15_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_12 && sq1_y_next == gr_y_15_12)
if (gr15_12_on == 2'd0)
		begin
		gr15_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_12_on == 2'd2)
		begin
		gr15_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_13 && sq1_y_next == gr_y_15_13)
if (gr15_13_on == 2'd0)
		begin
		gr15_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_13_on == 2'd2)
		begin
		gr15_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_14 && sq1_y_next == gr_y_15_14)
if (gr15_14_on == 2'd0)
		begin
		gr15_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_14_on == 2'd2)
		begin
		gr15_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_15 && sq1_y_next == gr_y_15_15)
if (gr15_15_on == 2'd0)
		begin
		gr15_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_15_on == 2'd2)
		begin
		gr15_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_16 && sq1_y_next == gr_y_15_16)
if (gr15_16_on == 2'd0)
		begin
		gr15_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_16_on == 2'd2)
		begin
		gr15_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_17 && sq1_y_next == gr_y_15_17)
if (gr15_17_on == 2'd0)
		begin
		gr15_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_17_on == 2'd2)
		begin
		gr15_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_18 && sq1_y_next == gr_y_15_18)
if (gr15_18_on == 2'd0)
		begin
		gr15_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_18_on == 2'd2)
		begin
		gr15_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_19 && sq1_y_next == gr_y_15_19)
if (gr15_19_on == 2'd0)
		begin
		gr15_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_19_on == 2'd2)
		begin
		gr15_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_20 && sq1_y_next == gr_y_15_20)
if (gr15_20_on == 2'd0)
		begin
		gr15_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_20_on == 2'd2)
		begin
		gr15_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_21 && sq1_y_next == gr_y_15_21)
if (gr15_21_on == 2'd0)
		begin
		gr15_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_21_on == 2'd2)
		begin
		gr15_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_22 && sq1_y_next == gr_y_15_22)
if (gr15_22_on == 2'd0)
		begin
		gr15_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_22_on == 2'd2)
		begin
		gr15_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_23 && sq1_y_next == gr_y_15_23)
if (gr15_23_on == 2'd0)
		begin
		gr15_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_23_on == 2'd2)
		begin
		gr15_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_15_24 && sq1_y_next == gr_y_15_24)
if (gr15_24_on == 2'd0)
		begin
		gr15_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr15_24_on == 2'd2)
		begin
		gr15_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_0 && sq1_y_next == gr_y_16_0)
if (gr16_0_on == 2'd0)
		begin
		gr16_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_0_on == 2'd2)
		begin
		gr16_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_1 && sq1_y_next == gr_y_16_1)
if (gr16_1_on == 2'd0)
		begin
		gr16_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_1_on == 2'd2)
		begin
		gr16_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_2 && sq1_y_next == gr_y_16_2)
if (gr16_2_on == 2'd0)
		begin
		gr16_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_2_on == 2'd2)
		begin
		gr16_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_3 && sq1_y_next == gr_y_16_3)
if (gr16_3_on == 2'd0)
		begin
		gr16_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_3_on == 2'd2)
		begin
		gr16_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_4 && sq1_y_next == gr_y_16_4)
if (gr16_4_on == 2'd0)
		begin
		gr16_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_4_on == 2'd2)
		begin
		gr16_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_5 && sq1_y_next == gr_y_16_5)
if (gr16_5_on == 2'd0)
		begin
		gr16_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_5_on == 2'd2)
		begin
		gr16_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_6 && sq1_y_next == gr_y_16_6)
if (gr16_6_on == 2'd0)
		begin
		gr16_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_6_on == 2'd2)
		begin
		gr16_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_7 && sq1_y_next == gr_y_16_7)
if (gr16_7_on == 2'd0)
		begin
		gr16_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_7_on == 2'd2)
		begin
		gr16_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_8 && sq1_y_next == gr_y_16_8)
if (gr16_8_on == 2'd0)
		begin
		gr16_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_8_on == 2'd2)
		begin
		gr16_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_9 && sq1_y_next == gr_y_16_9)
if (gr16_9_on == 2'd0)
		begin
		gr16_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_9_on == 2'd2)
		begin
		gr16_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_10 && sq1_y_next == gr_y_16_10)
if (gr16_10_on == 2'd0)
		begin
		gr16_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_10_on == 2'd2)
		begin
		gr16_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_11 && sq1_y_next == gr_y_16_11)
if (gr16_11_on == 2'd0)
		begin
		gr16_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_11_on == 2'd2)
		begin
		gr16_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_12 && sq1_y_next == gr_y_16_12)
if (gr16_12_on == 2'd0)
		begin
		gr16_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_12_on == 2'd2)
		begin
		gr16_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_13 && sq1_y_next == gr_y_16_13)
if (gr16_13_on == 2'd0)
		begin
		gr16_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_13_on == 2'd2)
		begin
		gr16_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_14 && sq1_y_next == gr_y_16_14)
if (gr16_14_on == 2'd0)
		begin
		gr16_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_14_on == 2'd2)
		begin
		gr16_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_15 && sq1_y_next == gr_y_16_15)
if (gr16_15_on == 2'd0)
		begin
		gr16_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_15_on == 2'd2)
		begin
		gr16_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_16 && sq1_y_next == gr_y_16_16)
if (gr16_16_on == 2'd0)
		begin
		gr16_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_16_on == 2'd2)
		begin
		gr16_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_17 && sq1_y_next == gr_y_16_17)
if (gr16_17_on == 2'd0)
		begin
		gr16_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_17_on == 2'd2)
		begin
		gr16_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_18 && sq1_y_next == gr_y_16_18)
if (gr16_18_on == 2'd0)
		begin
		gr16_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_18_on == 2'd2)
		begin
		gr16_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_19 && sq1_y_next == gr_y_16_19)
if (gr16_19_on == 2'd0)
		begin
		gr16_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_19_on == 2'd2)
		begin
		gr16_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_20 && sq1_y_next == gr_y_16_20)
if (gr16_20_on == 2'd0)
		begin
		gr16_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_20_on == 2'd2)
		begin
		gr16_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_21 && sq1_y_next == gr_y_16_21)
if (gr16_21_on == 2'd0)
		begin
		gr16_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_21_on == 2'd2)
		begin
		gr16_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_22 && sq1_y_next == gr_y_16_22)
if (gr16_22_on == 2'd0)
		begin
		gr16_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_22_on == 2'd2)
		begin
		gr16_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_23 && sq1_y_next == gr_y_16_23)
if (gr16_23_on == 2'd0)
		begin
		gr16_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_23_on == 2'd2)
		begin
		gr16_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_16_24 && sq1_y_next == gr_y_16_24)
if (gr16_24_on == 2'd0)
		begin
		gr16_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr16_24_on == 2'd2)
		begin
		gr16_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_0 && sq1_y_next == gr_y_17_0)
if (gr17_0_on == 2'd0)
		begin
		gr17_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_0_on == 2'd2)
		begin
		gr17_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_1 && sq1_y_next == gr_y_17_1)
if (gr17_1_on == 2'd0)
		begin
		gr17_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_1_on == 2'd2)
		begin
		gr17_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_2 && sq1_y_next == gr_y_17_2)
if (gr17_2_on == 2'd0)
		begin
		gr17_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_2_on == 2'd2)
		begin
		gr17_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_3 && sq1_y_next == gr_y_17_3)
if (gr17_3_on == 2'd0)
		begin
		gr17_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_3_on == 2'd2)
		begin
		gr17_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_4 && sq1_y_next == gr_y_17_4)
if (gr17_4_on == 2'd0)
		begin
		gr17_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_4_on == 2'd2)
		begin
		gr17_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_5 && sq1_y_next == gr_y_17_5)
if (gr17_5_on == 2'd0)
		begin
		gr17_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_5_on == 2'd2)
		begin
		gr17_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_6 && sq1_y_next == gr_y_17_6)
if (gr17_6_on == 2'd0)
		begin
		gr17_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_6_on == 2'd2)
		begin
		gr17_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_7 && sq1_y_next == gr_y_17_7)
if (gr17_7_on == 2'd0)
		begin
		gr17_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_7_on == 2'd2)
		begin
		gr17_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_8 && sq1_y_next == gr_y_17_8)
if (gr17_8_on == 2'd0)
		begin
		gr17_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_8_on == 2'd2)
		begin
		gr17_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_9 && sq1_y_next == gr_y_17_9)
if (gr17_9_on == 2'd0)
		begin
		gr17_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_9_on == 2'd2)
		begin
		gr17_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_10 && sq1_y_next == gr_y_17_10)
if (gr17_10_on == 2'd0)
		begin
		gr17_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_10_on == 2'd2)
		begin
		gr17_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_11 && sq1_y_next == gr_y_17_11)
if (gr17_11_on == 2'd0)
		begin
		gr17_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_11_on == 2'd2)
		begin
		gr17_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_12 && sq1_y_next == gr_y_17_12)
if (gr17_12_on == 2'd0)
		begin
		gr17_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_12_on == 2'd2)
		begin
		gr17_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_13 && sq1_y_next == gr_y_17_13)
if (gr17_13_on == 2'd0)
		begin
		gr17_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_13_on == 2'd2)
		begin
		gr17_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_14 && sq1_y_next == gr_y_17_14)
if (gr17_14_on == 2'd0)
		begin
		gr17_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_14_on == 2'd2)
		begin
		gr17_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_15 && sq1_y_next == gr_y_17_15)
if (gr17_15_on == 2'd0)
		begin
		gr17_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_15_on == 2'd2)
		begin
		gr17_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_16 && sq1_y_next == gr_y_17_16)
if (gr17_16_on == 2'd0)
		begin
		gr17_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_16_on == 2'd2)
		begin
		gr17_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_17 && sq1_y_next == gr_y_17_17)
if (gr17_17_on == 2'd0)
		begin
		gr17_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_17_on == 2'd2)
		begin
		gr17_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_18 && sq1_y_next == gr_y_17_18)
if (gr17_18_on == 2'd0)
		begin
		gr17_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_18_on == 2'd2)
		begin
		gr17_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_19 && sq1_y_next == gr_y_17_19)
if (gr17_19_on == 2'd0)
		begin
		gr17_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_19_on == 2'd2)
		begin
		gr17_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_20 && sq1_y_next == gr_y_17_20)
if (gr17_20_on == 2'd0)
		begin
		gr17_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_20_on == 2'd2)
		begin
		gr17_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_21 && sq1_y_next == gr_y_17_21)
if (gr17_21_on == 2'd0)
		begin
		gr17_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_21_on == 2'd2)
		begin
		gr17_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_22 && sq1_y_next == gr_y_17_22)
if (gr17_22_on == 2'd0)
		begin
		gr17_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_22_on == 2'd2)
		begin
		gr17_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_23 && sq1_y_next == gr_y_17_23)
if (gr17_23_on == 2'd0)
		begin
		gr17_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_23_on == 2'd2)
		begin
		gr17_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_17_24 && sq1_y_next == gr_y_17_24)
if (gr17_24_on == 2'd0)
		begin
		gr17_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr17_24_on == 2'd2)
		begin
		gr17_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_0 && sq1_y_next == gr_y_18_0)
if (gr18_0_on == 2'd0)
		begin
		gr18_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_0_on == 2'd2)
		begin
		gr18_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_1 && sq1_y_next == gr_y_18_1)
if (gr18_1_on == 2'd0)
		begin
		gr18_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_1_on == 2'd2)
		begin
		gr18_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_2 && sq1_y_next == gr_y_18_2)
if (gr18_2_on == 2'd0)
		begin
		gr18_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_2_on == 2'd2)
		begin
		gr18_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_3 && sq1_y_next == gr_y_18_3)
if (gr18_3_on == 2'd0)
		begin
		gr18_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_3_on == 2'd2)
		begin
		gr18_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_4 && sq1_y_next == gr_y_18_4)
if (gr18_4_on == 2'd0)
		begin
		gr18_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_4_on == 2'd2)
		begin
		gr18_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_5 && sq1_y_next == gr_y_18_5)
if (gr18_5_on == 2'd0)
		begin
		gr18_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_5_on == 2'd2)
		begin
		gr18_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_6 && sq1_y_next == gr_y_18_6)
if (gr18_6_on == 2'd0)
		begin
		gr18_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_6_on == 2'd2)
		begin
		gr18_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_7 && sq1_y_next == gr_y_18_7)
if (gr18_7_on == 2'd0)
		begin
		gr18_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_7_on == 2'd2)
		begin
		gr18_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_8 && sq1_y_next == gr_y_18_8)
if (gr18_8_on == 2'd0)
		begin
		gr18_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_8_on == 2'd2)
		begin
		gr18_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_9 && sq1_y_next == gr_y_18_9)
if (gr18_9_on == 2'd0)
		begin
		gr18_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_9_on == 2'd2)
		begin
		gr18_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_10 && sq1_y_next == gr_y_18_10)
if (gr18_10_on == 2'd0)
		begin
		gr18_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_10_on == 2'd2)
		begin
		gr18_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_11 && sq1_y_next == gr_y_18_11)
if (gr18_11_on == 2'd0)
		begin
		gr18_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_11_on == 2'd2)
		begin
		gr18_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_12 && sq1_y_next == gr_y_18_12)
if (gr18_12_on == 2'd0)
		begin
		gr18_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_12_on == 2'd2)
		begin
		gr18_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_13 && sq1_y_next == gr_y_18_13)
if (gr18_13_on == 2'd0)
		begin
		gr18_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_13_on == 2'd2)
		begin
		gr18_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_14 && sq1_y_next == gr_y_18_14)
if (gr18_14_on == 2'd0)
		begin
		gr18_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_14_on == 2'd2)
		begin
		gr18_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_15 && sq1_y_next == gr_y_18_15)
if (gr18_15_on == 2'd0)
		begin
		gr18_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_15_on == 2'd2)
		begin
		gr18_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_16 && sq1_y_next == gr_y_18_16)
if (gr18_16_on == 2'd0)
		begin
		gr18_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_16_on == 2'd2)
		begin
		gr18_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_17 && sq1_y_next == gr_y_18_17)
if (gr18_17_on == 2'd0)
		begin
		gr18_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_17_on == 2'd2)
		begin
		gr18_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_18 && sq1_y_next == gr_y_18_18)
if (gr18_18_on == 2'd0)
		begin
		gr18_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_18_on == 2'd2)
		begin
		gr18_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_19 && sq1_y_next == gr_y_18_19)
if (gr18_19_on == 2'd0)
		begin
		gr18_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_19_on == 2'd2)
		begin
		gr18_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_20 && sq1_y_next == gr_y_18_20)
if (gr18_20_on == 2'd0)
		begin
		gr18_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_20_on == 2'd2)
		begin
		gr18_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_21 && sq1_y_next == gr_y_18_21)
if (gr18_21_on == 2'd0)
		begin
		gr18_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_21_on == 2'd2)
		begin
		gr18_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_22 && sq1_y_next == gr_y_18_22)
if (gr18_22_on == 2'd0)
		begin
		gr18_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_22_on == 2'd2)
		begin
		gr18_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_23 && sq1_y_next == gr_y_18_23)
if (gr18_23_on == 2'd0)
		begin
		gr18_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_23_on == 2'd2)
		begin
		gr18_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_18_24 && sq1_y_next == gr_y_18_24)
if (gr18_24_on == 2'd0)
		begin
		gr18_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr18_24_on == 2'd2)
		begin
		gr18_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_0 && sq1_y_next == gr_y_19_0)
if (gr19_0_on == 2'd0)
		begin
		gr19_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_0_on == 2'd2)
		begin
		gr19_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_1 && sq1_y_next == gr_y_19_1)
if (gr19_1_on == 2'd0)
		begin
		gr19_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_1_on == 2'd2)
		begin
		gr19_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_2 && sq1_y_next == gr_y_19_2)
if (gr19_2_on == 2'd0)
		begin
		gr19_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_2_on == 2'd2)
		begin
		gr19_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_3 && sq1_y_next == gr_y_19_3)
if (gr19_3_on == 2'd0)
		begin
		gr19_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_3_on == 2'd2)
		begin
		gr19_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_4 && sq1_y_next == gr_y_19_4)
if (gr19_4_on == 2'd0)
		begin
		gr19_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_4_on == 2'd2)
		begin
		gr19_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_5 && sq1_y_next == gr_y_19_5)
if (gr19_5_on == 2'd0)
		begin
		gr19_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_5_on == 2'd2)
		begin
		gr19_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_6 && sq1_y_next == gr_y_19_6)
if (gr19_6_on == 2'd0)
		begin
		gr19_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_6_on == 2'd2)
		begin
		gr19_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_7 && sq1_y_next == gr_y_19_7)
if (gr19_7_on == 2'd0)
		begin
		gr19_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_7_on == 2'd2)
		begin
		gr19_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_8 && sq1_y_next == gr_y_19_8)
if (gr19_8_on == 2'd0)
		begin
		gr19_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_8_on == 2'd2)
		begin
		gr19_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_9 && sq1_y_next == gr_y_19_9)
if (gr19_9_on == 2'd0)
		begin
		gr19_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_9_on == 2'd2)
		begin
		gr19_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_10 && sq1_y_next == gr_y_19_10)
if (gr19_10_on == 2'd0)
		begin
		gr19_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_10_on == 2'd2)
		begin
		gr19_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_11 && sq1_y_next == gr_y_19_11)
if (gr19_11_on == 2'd0)
		begin
		gr19_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_11_on == 2'd2)
		begin
		gr19_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_12 && sq1_y_next == gr_y_19_12)
if (gr19_12_on == 2'd0)
		begin
		gr19_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_12_on == 2'd2)
		begin
		gr19_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_13 && sq1_y_next == gr_y_19_13)
if (gr19_13_on == 2'd0)
		begin
		gr19_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_13_on == 2'd2)
		begin
		gr19_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_14 && sq1_y_next == gr_y_19_14)
if (gr19_14_on == 2'd0)
		begin
		gr19_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_14_on == 2'd2)
		begin
		gr19_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_15 && sq1_y_next == gr_y_19_15)
if (gr19_15_on == 2'd0)
		begin
		gr19_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_15_on == 2'd2)
		begin
		gr19_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_16 && sq1_y_next == gr_y_19_16)
if (gr19_16_on == 2'd0)
		begin
		gr19_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_16_on == 2'd2)
		begin
		gr19_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_17 && sq1_y_next == gr_y_19_17)
if (gr19_17_on == 2'd0)
		begin
		gr19_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_17_on == 2'd2)
		begin
		gr19_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_18 && sq1_y_next == gr_y_19_18)
if (gr19_18_on == 2'd0)
		begin
		gr19_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_18_on == 2'd2)
		begin
		gr19_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_19 && sq1_y_next == gr_y_19_19)
if (gr19_19_on == 2'd0)
		begin
		gr19_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_19_on == 2'd2)
		begin
		gr19_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_20 && sq1_y_next == gr_y_19_20)
if (gr19_20_on == 2'd0)
		begin
		gr19_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_20_on == 2'd2)
		begin
		gr19_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_21 && sq1_y_next == gr_y_19_21)
if (gr19_21_on == 2'd0)
		begin
		gr19_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_21_on == 2'd2)
		begin
		gr19_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_22 && sq1_y_next == gr_y_19_22)
if (gr19_22_on == 2'd0)
		begin
		gr19_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_22_on == 2'd2)
		begin
		gr19_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_23 && sq1_y_next == gr_y_19_23)
if (gr19_23_on == 2'd0)
		begin
		gr19_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_23_on == 2'd2)
		begin
		gr19_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_19_24 && sq1_y_next == gr_y_19_24)
if (gr19_24_on == 2'd0)
		begin
		gr19_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr19_24_on == 2'd2)
		begin
		gr19_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_0 && sq1_y_next == gr_y_20_0)
if (gr20_0_on == 2'd0)
		begin
		gr20_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_0_on == 2'd2)
		begin
		gr20_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_1 && sq1_y_next == gr_y_20_1)
if (gr20_1_on == 2'd0)
		begin
		gr20_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_1_on == 2'd2)
		begin
		gr20_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_2 && sq1_y_next == gr_y_20_2)
if (gr20_2_on == 2'd0)
		begin
		gr20_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_2_on == 2'd2)
		begin
		gr20_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_3 && sq1_y_next == gr_y_20_3)
if (gr20_3_on == 2'd0)
		begin
		gr20_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_3_on == 2'd2)
		begin
		gr20_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_4 && sq1_y_next == gr_y_20_4)
if (gr20_4_on == 2'd0)
		begin
		gr20_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_4_on == 2'd2)
		begin
		gr20_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_5 && sq1_y_next == gr_y_20_5)
if (gr20_5_on == 2'd0)
		begin
		gr20_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_5_on == 2'd2)
		begin
		gr20_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_6 && sq1_y_next == gr_y_20_6)
if (gr20_6_on == 2'd0)
		begin
		gr20_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_6_on == 2'd2)
		begin
		gr20_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_7 && sq1_y_next == gr_y_20_7)
if (gr20_7_on == 2'd0)
		begin
		gr20_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_7_on == 2'd2)
		begin
		gr20_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_8 && sq1_y_next == gr_y_20_8)
if (gr20_8_on == 2'd0)
		begin
		gr20_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_8_on == 2'd2)
		begin
		gr20_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_9 && sq1_y_next == gr_y_20_9)
if (gr20_9_on == 2'd0)
		begin
		gr20_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_9_on == 2'd2)
		begin
		gr20_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_10 && sq1_y_next == gr_y_20_10)
if (gr20_10_on == 2'd0)
		begin
		gr20_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_10_on == 2'd2)
		begin
		gr20_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_11 && sq1_y_next == gr_y_20_11)
if (gr20_11_on == 2'd0)
		begin
		gr20_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_11_on == 2'd2)
		begin
		gr20_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_12 && sq1_y_next == gr_y_20_12)
if (gr20_12_on == 2'd0)
		begin
		gr20_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_12_on == 2'd2)
		begin
		gr20_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_13 && sq1_y_next == gr_y_20_13)
if (gr20_13_on == 2'd0)
		begin
		gr20_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_13_on == 2'd2)
		begin
		gr20_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_14 && sq1_y_next == gr_y_20_14)
if (gr20_14_on == 2'd0)
		begin
		gr20_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_14_on == 2'd2)
		begin
		gr20_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_15 && sq1_y_next == gr_y_20_15)
if (gr20_15_on == 2'd0)
		begin
		gr20_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_15_on == 2'd2)
		begin
		gr20_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_16 && sq1_y_next == gr_y_20_16)
if (gr20_16_on == 2'd0)
		begin
		gr20_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_16_on == 2'd2)
		begin
		gr20_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_17 && sq1_y_next == gr_y_20_17)
if (gr20_17_on == 2'd0)
		begin
		gr20_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_17_on == 2'd2)
		begin
		gr20_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_18 && sq1_y_next == gr_y_20_18)
if (gr20_18_on == 2'd0)
		begin
		gr20_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_18_on == 2'd2)
		begin
		gr20_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_19 && sq1_y_next == gr_y_20_19)
if (gr20_19_on == 2'd0)
		begin
		gr20_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_19_on == 2'd2)
		begin
		gr20_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_20 && sq1_y_next == gr_y_20_20)
if (gr20_20_on == 2'd0)
		begin
		gr20_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_20_on == 2'd2)
		begin
		gr20_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_21 && sq1_y_next == gr_y_20_21)
if (gr20_21_on == 2'd0)
		begin
		gr20_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_21_on == 2'd2)
		begin
		gr20_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_22 && sq1_y_next == gr_y_20_22)
if (gr20_22_on == 2'd0)
		begin
		gr20_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_22_on == 2'd2)
		begin
		gr20_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_23 && sq1_y_next == gr_y_20_23)
if (gr20_23_on == 2'd0)
		begin
		gr20_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_23_on == 2'd2)
		begin
		gr20_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_20_24 && sq1_y_next == gr_y_20_24)
if (gr20_24_on == 2'd0)
		begin
		gr20_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr20_24_on == 2'd2)
		begin
		gr20_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_0 && sq1_y_next == gr_y_21_0)
if (gr21_0_on == 2'd0)
		begin
		gr21_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_0_on == 2'd2)
		begin
		gr21_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_1 && sq1_y_next == gr_y_21_1)
if (gr21_1_on == 2'd0)
		begin
		gr21_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_1_on == 2'd2)
		begin
		gr21_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_2 && sq1_y_next == gr_y_21_2)
if (gr21_2_on == 2'd0)
		begin
		gr21_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_2_on == 2'd2)
		begin
		gr21_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_3 && sq1_y_next == gr_y_21_3)
if (gr21_3_on == 2'd0)
		begin
		gr21_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_3_on == 2'd2)
		begin
		gr21_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_4 && sq1_y_next == gr_y_21_4)
if (gr21_4_on == 2'd0)
		begin
		gr21_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_4_on == 2'd2)
		begin
		gr21_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_5 && sq1_y_next == gr_y_21_5)
if (gr21_5_on == 2'd0)
		begin
		gr21_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_5_on == 2'd2)
		begin
		gr21_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_6 && sq1_y_next == gr_y_21_6)
if (gr21_6_on == 2'd0)
		begin
		gr21_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_6_on == 2'd2)
		begin
		gr21_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_7 && sq1_y_next == gr_y_21_7)
if (gr21_7_on == 2'd0)
		begin
		gr21_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_7_on == 2'd2)
		begin
		gr21_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_8 && sq1_y_next == gr_y_21_8)
if (gr21_8_on == 2'd0)
		begin
		gr21_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_8_on == 2'd2)
		begin
		gr21_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_9 && sq1_y_next == gr_y_21_9)
if (gr21_9_on == 2'd0)
		begin
		gr21_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_9_on == 2'd2)
		begin
		gr21_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_10 && sq1_y_next == gr_y_21_10)
if (gr21_10_on == 2'd0)
		begin
		gr21_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_10_on == 2'd2)
		begin
		gr21_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_11 && sq1_y_next == gr_y_21_11)
if (gr21_11_on == 2'd0)
		begin
		gr21_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_11_on == 2'd2)
		begin
		gr21_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_12 && sq1_y_next == gr_y_21_12)
if (gr21_12_on == 2'd0)
		begin
		gr21_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_12_on == 2'd2)
		begin
		gr21_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_13 && sq1_y_next == gr_y_21_13)
if (gr21_13_on == 2'd0)
		begin
		gr21_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_13_on == 2'd2)
		begin
		gr21_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_14 && sq1_y_next == gr_y_21_14)
if (gr21_14_on == 2'd0)
		begin
		gr21_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_14_on == 2'd2)
		begin
		gr21_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_15 && sq1_y_next == gr_y_21_15)
if (gr21_15_on == 2'd0)
		begin
		gr21_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_15_on == 2'd2)
		begin
		gr21_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_16 && sq1_y_next == gr_y_21_16)
if (gr21_16_on == 2'd0)
		begin
		gr21_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_16_on == 2'd2)
		begin
		gr21_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_17 && sq1_y_next == gr_y_21_17)
if (gr21_17_on == 2'd0)
		begin
		gr21_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_17_on == 2'd2)
		begin
		gr21_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_18 && sq1_y_next == gr_y_21_18)
if (gr21_18_on == 2'd0)
		begin
		gr21_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_18_on == 2'd2)
		begin
		gr21_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_19 && sq1_y_next == gr_y_21_19)
if (gr21_19_on == 2'd0)
		begin
		gr21_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_19_on == 2'd2)
		begin
		gr21_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_20 && sq1_y_next == gr_y_21_20)
if (gr21_20_on == 2'd0)
		begin
		gr21_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_20_on == 2'd2)
		begin
		gr21_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_21 && sq1_y_next == gr_y_21_21)
if (gr21_21_on == 2'd0)
		begin
		gr21_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_21_on == 2'd2)
		begin
		gr21_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_22 && sq1_y_next == gr_y_21_22)
if (gr21_22_on == 2'd0)
		begin
		gr21_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_22_on == 2'd2)
		begin
		gr21_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_23 && sq1_y_next == gr_y_21_23)
if (gr21_23_on == 2'd0)
		begin
		gr21_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_23_on == 2'd2)
		begin
		gr21_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_21_24 && sq1_y_next == gr_y_21_24)
if (gr21_24_on == 2'd0)
		begin
		gr21_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr21_24_on == 2'd2)
		begin
		gr21_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_0 && sq1_y_next == gr_y_22_0)
if (gr22_0_on == 2'd0)
		begin
		gr22_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_0_on == 2'd2)
		begin
		gr22_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_1 && sq1_y_next == gr_y_22_1)
if (gr22_1_on == 2'd0)
		begin
		gr22_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_1_on == 2'd2)
		begin
		gr22_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_2 && sq1_y_next == gr_y_22_2)
if (gr22_2_on == 2'd0)
		begin
		gr22_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_2_on == 2'd2)
		begin
		gr22_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_3 && sq1_y_next == gr_y_22_3)
if (gr22_3_on == 2'd0)
		begin
		gr22_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_3_on == 2'd2)
		begin
		gr22_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_4 && sq1_y_next == gr_y_22_4)
if (gr22_4_on == 2'd0)
		begin
		gr22_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_4_on == 2'd2)
		begin
		gr22_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_5 && sq1_y_next == gr_y_22_5)
if (gr22_5_on == 2'd0)
		begin
		gr22_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_5_on == 2'd2)
		begin
		gr22_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_6 && sq1_y_next == gr_y_22_6)
if (gr22_6_on == 2'd0)
		begin
		gr22_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_6_on == 2'd2)
		begin
		gr22_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_7 && sq1_y_next == gr_y_22_7)
if (gr22_7_on == 2'd0)
		begin
		gr22_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_7_on == 2'd2)
		begin
		gr22_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_8 && sq1_y_next == gr_y_22_8)
if (gr22_8_on == 2'd0)
		begin
		gr22_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_8_on == 2'd2)
		begin
		gr22_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_9 && sq1_y_next == gr_y_22_9)
if (gr22_9_on == 2'd0)
		begin
		gr22_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_9_on == 2'd2)
		begin
		gr22_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_10 && sq1_y_next == gr_y_22_10)
if (gr22_10_on == 2'd0)
		begin
		gr22_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_10_on == 2'd2)
		begin
		gr22_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_11 && sq1_y_next == gr_y_22_11)
if (gr22_11_on == 2'd0)
		begin
		gr22_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_11_on == 2'd2)
		begin
		gr22_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_12 && sq1_y_next == gr_y_22_12)
if (gr22_12_on == 2'd0)
		begin
		gr22_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_12_on == 2'd2)
		begin
		gr22_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_13 && sq1_y_next == gr_y_22_13)
if (gr22_13_on == 2'd0)
		begin
		gr22_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_13_on == 2'd2)
		begin
		gr22_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_14 && sq1_y_next == gr_y_22_14)
if (gr22_14_on == 2'd0)
		begin
		gr22_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_14_on == 2'd2)
		begin
		gr22_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_15 && sq1_y_next == gr_y_22_15)
if (gr22_15_on == 2'd0)
		begin
		gr22_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_15_on == 2'd2)
		begin
		gr22_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_16 && sq1_y_next == gr_y_22_16)
if (gr22_16_on == 2'd0)
		begin
		gr22_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_16_on == 2'd2)
		begin
		gr22_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_17 && sq1_y_next == gr_y_22_17)
if (gr22_17_on == 2'd0)
		begin
		gr22_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_17_on == 2'd2)
		begin
		gr22_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_18 && sq1_y_next == gr_y_22_18)
if (gr22_18_on == 2'd0)
		begin
		gr22_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_18_on == 2'd2)
		begin
		gr22_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_19 && sq1_y_next == gr_y_22_19)
if (gr22_19_on == 2'd0)
		begin
		gr22_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_19_on == 2'd2)
		begin
		gr22_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_20 && sq1_y_next == gr_y_22_20)
if (gr22_20_on == 2'd0)
		begin
		gr22_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_20_on == 2'd2)
		begin
		gr22_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_21 && sq1_y_next == gr_y_22_21)
if (gr22_21_on == 2'd0)
		begin
		gr22_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_21_on == 2'd2)
		begin
		gr22_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_22 && sq1_y_next == gr_y_22_22)
if (gr22_22_on == 2'd0)
		begin
		gr22_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_22_on == 2'd2)
		begin
		gr22_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_23 && sq1_y_next == gr_y_22_23)
if (gr22_23_on == 2'd0)
		begin
		gr22_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_23_on == 2'd2)
		begin
		gr22_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_22_24 && sq1_y_next == gr_y_22_24)
if (gr22_24_on == 2'd0)
		begin
		gr22_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr22_24_on == 2'd2)
		begin
		gr22_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_0 && sq1_y_next == gr_y_23_0)
if (gr23_0_on == 2'd0)
		begin
		gr23_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_0_on == 2'd2)
		begin
		gr23_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_1 && sq1_y_next == gr_y_23_1)
if (gr23_1_on == 2'd0)
		begin
		gr23_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_1_on == 2'd2)
		begin
		gr23_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_2 && sq1_y_next == gr_y_23_2)
if (gr23_2_on == 2'd0)
		begin
		gr23_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_2_on == 2'd2)
		begin
		gr23_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_3 && sq1_y_next == gr_y_23_3)
if (gr23_3_on == 2'd0)
		begin
		gr23_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_3_on == 2'd2)
		begin
		gr23_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_4 && sq1_y_next == gr_y_23_4)
if (gr23_4_on == 2'd0)
		begin
		gr23_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_4_on == 2'd2)
		begin
		gr23_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_5 && sq1_y_next == gr_y_23_5)
if (gr23_5_on == 2'd0)
		begin
		gr23_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_5_on == 2'd2)
		begin
		gr23_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_6 && sq1_y_next == gr_y_23_6)
if (gr23_6_on == 2'd0)
		begin
		gr23_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_6_on == 2'd2)
		begin
		gr23_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_7 && sq1_y_next == gr_y_23_7)
if (gr23_7_on == 2'd0)
		begin
		gr23_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_7_on == 2'd2)
		begin
		gr23_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_8 && sq1_y_next == gr_y_23_8)
if (gr23_8_on == 2'd0)
		begin
		gr23_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_8_on == 2'd2)
		begin
		gr23_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_9 && sq1_y_next == gr_y_23_9)
if (gr23_9_on == 2'd0)
		begin
		gr23_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_9_on == 2'd2)
		begin
		gr23_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_10 && sq1_y_next == gr_y_23_10)
if (gr23_10_on == 2'd0)
		begin
		gr23_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_10_on == 2'd2)
		begin
		gr23_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_11 && sq1_y_next == gr_y_23_11)
if (gr23_11_on == 2'd0)
		begin
		gr23_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_11_on == 2'd2)
		begin
		gr23_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_12 && sq1_y_next == gr_y_23_12)
if (gr23_12_on == 2'd0)
		begin
		gr23_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_12_on == 2'd2)
		begin
		gr23_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_13 && sq1_y_next == gr_y_23_13)
if (gr23_13_on == 2'd0)
		begin
		gr23_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_13_on == 2'd2)
		begin
		gr23_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_14 && sq1_y_next == gr_y_23_14)
if (gr23_14_on == 2'd0)
		begin
		gr23_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_14_on == 2'd2)
		begin
		gr23_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_15 && sq1_y_next == gr_y_23_15)
if (gr23_15_on == 2'd0)
		begin
		gr23_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_15_on == 2'd2)
		begin
		gr23_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_16 && sq1_y_next == gr_y_23_16)
if (gr23_16_on == 2'd0)
		begin
		gr23_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_16_on == 2'd2)
		begin
		gr23_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_17 && sq1_y_next == gr_y_23_17)
if (gr23_17_on == 2'd0)
		begin
		gr23_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_17_on == 2'd2)
		begin
		gr23_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_18 && sq1_y_next == gr_y_23_18)
if (gr23_18_on == 2'd0)
		begin
		gr23_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_18_on == 2'd2)
		begin
		gr23_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_19 && sq1_y_next == gr_y_23_19)
if (gr23_19_on == 2'd0)
		begin
		gr23_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_19_on == 2'd2)
		begin
		gr23_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_20 && sq1_y_next == gr_y_23_20)
if (gr23_20_on == 2'd0)
		begin
		gr23_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_20_on == 2'd2)
		begin
		gr23_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_21 && sq1_y_next == gr_y_23_21)
if (gr23_21_on == 2'd0)
		begin
		gr23_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_21_on == 2'd2)
		begin
		gr23_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_22 && sq1_y_next == gr_y_23_22)
if (gr23_22_on == 2'd0)
		begin
		gr23_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_22_on == 2'd2)
		begin
		gr23_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_23 && sq1_y_next == gr_y_23_23)
if (gr23_23_on == 2'd0)
		begin
		gr23_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_23_on == 2'd2)
		begin
		gr23_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_23_24 && sq1_y_next == gr_y_23_24)
if (gr23_24_on == 2'd0)
		begin
		gr23_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr23_24_on == 2'd2)
		begin
		gr23_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_0 && sq1_y_next == gr_y_24_0)
if (gr24_0_on == 2'd0)
		begin
		gr24_0_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_0_on == 2'd2)
		begin
		gr24_0_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_1 && sq1_y_next == gr_y_24_1)
if (gr24_1_on == 2'd0)
		begin
		gr24_1_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_1_on == 2'd2)
		begin
		gr24_1_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_2 && sq1_y_next == gr_y_24_2)
if (gr24_2_on == 2'd0)
		begin
		gr24_2_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_2_on == 2'd2)
		begin
		gr24_2_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_3 && sq1_y_next == gr_y_24_3)
if (gr24_3_on == 2'd0)
		begin
		gr24_3_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_3_on == 2'd2)
		begin
		gr24_3_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_4 && sq1_y_next == gr_y_24_4)
if (gr24_4_on == 2'd0)
		begin
		gr24_4_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_4_on == 2'd2)
		begin
		gr24_4_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_5 && sq1_y_next == gr_y_24_5)
if (gr24_5_on == 2'd0)
		begin
		gr24_5_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_5_on == 2'd2)
		begin
		gr24_5_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_6 && sq1_y_next == gr_y_24_6)
if (gr24_6_on == 2'd0)
		begin
		gr24_6_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_6_on == 2'd2)
		begin
		gr24_6_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_7 && sq1_y_next == gr_y_24_7)
if (gr24_7_on == 2'd0)
		begin
		gr24_7_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_7_on == 2'd2)
		begin
		gr24_7_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_8 && sq1_y_next == gr_y_24_8)
if (gr24_8_on == 2'd0)
		begin
		gr24_8_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_8_on == 2'd2)
		begin
		gr24_8_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_9 && sq1_y_next == gr_y_24_9)
if (gr24_9_on == 2'd0)
		begin
		gr24_9_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_9_on == 2'd2)
		begin
		gr24_9_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_10 && sq1_y_next == gr_y_24_10)
if (gr24_10_on == 2'd0)
		begin
		gr24_10_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_10_on == 2'd2)
		begin
		gr24_10_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_11 && sq1_y_next == gr_y_24_11)
if (gr24_11_on == 2'd0)
		begin
		gr24_11_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_11_on == 2'd2)
		begin
		gr24_11_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_12 && sq1_y_next == gr_y_24_12)
if (gr24_12_on == 2'd0)
		begin
		gr24_12_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_12_on == 2'd2)
		begin
		gr24_12_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_13 && sq1_y_next == gr_y_24_13)
if (gr24_13_on == 2'd0)
		begin
		gr24_13_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_13_on == 2'd2)
		begin
		gr24_13_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_14 && sq1_y_next == gr_y_24_14)
if (gr24_14_on == 2'd0)
		begin
		gr24_14_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_14_on == 2'd2)
		begin
		gr24_14_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_15 && sq1_y_next == gr_y_24_15)
if (gr24_15_on == 2'd0)
		begin
		gr24_15_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_15_on == 2'd2)
		begin
		gr24_15_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_16 && sq1_y_next == gr_y_24_16)
if (gr24_16_on == 2'd0)
		begin
		gr24_16_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_16_on == 2'd2)
		begin
		gr24_16_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_17 && sq1_y_next == gr_y_24_17)
if (gr24_17_on == 2'd0)
		begin
		gr24_17_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_17_on == 2'd2)
		begin
		gr24_17_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_18 && sq1_y_next == gr_y_24_18)
if (gr24_18_on == 2'd0)
		begin
		gr24_18_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_18_on == 2'd2)
		begin
		gr24_18_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_19 && sq1_y_next == gr_y_24_19)
if (gr24_19_on == 2'd0)
		begin
		gr24_19_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_19_on == 2'd2)
		begin
		gr24_19_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_20 && sq1_y_next == gr_y_24_20)
if (gr24_20_on == 2'd0)
		begin
		gr24_20_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_20_on == 2'd2)
		begin
		gr24_20_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_21 && sq1_y_next == gr_y_24_21)
if (gr24_21_on == 2'd0)
		begin
		gr24_21_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_21_on == 2'd2)
		begin
		gr24_21_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_22 && sq1_y_next == gr_y_24_22)
if (gr24_22_on == 2'd0)
		begin
		gr24_22_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_22_on == 2'd2)
		begin
		gr24_22_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_23 && sq1_y_next == gr_y_24_23)
if (gr24_23_on == 2'd0)
		begin
		gr24_23_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_23_on == 2'd2)
		begin
		gr24_23_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end
if (sq1_x_next == gr_x_24_24 && sq1_y_next == gr_y_24_24)
if (gr24_24_on == 2'd0)
		begin
		gr24_24_on = 2'd1;
		count_b = count_b + 1;
		end
else if (gr24_24_on == 2'd2)
		begin
		gr24_24_on = 2'd1;
		count_b = count_b + 1;
		count_r = count_r - 1;
		end




if (sq2_x_next == gr_x_0_0 && sq2_y_next == gr_y_0_0)
if (gr0_0_on == 2'd0)
		begin
		gr0_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_0_on == 2'd1)
		begin
		gr0_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_1 && sq2_y_next == gr_y_0_1)
if (gr0_1_on == 2'd0)
		begin
		gr0_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_1_on == 2'd1)
		begin
		gr0_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_2 && sq2_y_next == gr_y_0_2)
if (gr0_2_on == 2'd0)
		begin
		gr0_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_2_on == 2'd1)
		begin
		gr0_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_3 && sq2_y_next == gr_y_0_3)
if (gr0_3_on == 2'd0)
		begin
		gr0_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_3_on == 2'd1)
		begin
		gr0_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_4 && sq2_y_next == gr_y_0_4)
if (gr0_4_on == 2'd0)
		begin
		gr0_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_4_on == 2'd1)
		begin
		gr0_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_5 && sq2_y_next == gr_y_0_5)
if (gr0_5_on == 2'd0)
		begin
		gr0_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_5_on == 2'd1)
		begin
		gr0_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_6 && sq2_y_next == gr_y_0_6)
if (gr0_6_on == 2'd0)
		begin
		gr0_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_6_on == 2'd1)
		begin
		gr0_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_7 && sq2_y_next == gr_y_0_7)
if (gr0_7_on == 2'd0)
		begin
		gr0_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_7_on == 2'd1)
		begin
		gr0_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_8 && sq2_y_next == gr_y_0_8)
if (gr0_8_on == 2'd0)
		begin
		gr0_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_8_on == 2'd1)
		begin
		gr0_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_9 && sq2_y_next == gr_y_0_9)
if (gr0_9_on == 2'd0)
		begin
		gr0_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_9_on == 2'd1)
		begin
		gr0_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_10 && sq2_y_next == gr_y_0_10)
if (gr0_10_on == 2'd0)
		begin
		gr0_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_10_on == 2'd1)
		begin
		gr0_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_11 && sq2_y_next == gr_y_0_11)
if (gr0_11_on == 2'd0)
		begin
		gr0_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_11_on == 2'd1)
		begin
		gr0_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_12 && sq2_y_next == gr_y_0_12)
if (gr0_12_on == 2'd0)
		begin
		gr0_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_12_on == 2'd1)
		begin
		gr0_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_13 && sq2_y_next == gr_y_0_13)
if (gr0_13_on == 2'd0)
		begin
		gr0_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_13_on == 2'd1)
		begin
		gr0_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_14 && sq2_y_next == gr_y_0_14)
if (gr0_14_on == 2'd0)
		begin
		gr0_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_14_on == 2'd1)
		begin
		gr0_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_15 && sq2_y_next == gr_y_0_15)
if (gr0_15_on == 2'd0)
		begin
		gr0_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_15_on == 2'd1)
		begin
		gr0_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_16 && sq2_y_next == gr_y_0_16)
if (gr0_16_on == 2'd0)
		begin
		gr0_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_16_on == 2'd1)
		begin
		gr0_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_17 && sq2_y_next == gr_y_0_17)
if (gr0_17_on == 2'd0)
		begin
		gr0_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_17_on == 2'd1)
		begin
		gr0_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_18 && sq2_y_next == gr_y_0_18)
if (gr0_18_on == 2'd0)
		begin
		gr0_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_18_on == 2'd1)
		begin
		gr0_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_19 && sq2_y_next == gr_y_0_19)
if (gr0_19_on == 2'd0)
		begin
		gr0_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_19_on == 2'd1)
		begin
		gr0_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_20 && sq2_y_next == gr_y_0_20)
if (gr0_20_on == 2'd0)
		begin
		gr0_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_20_on == 2'd1)
		begin
		gr0_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_21 && sq2_y_next == gr_y_0_21)
if (gr0_21_on == 2'd0)
		begin
		gr0_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_21_on == 2'd1)
		begin
		gr0_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_22 && sq2_y_next == gr_y_0_22)
if (gr0_22_on == 2'd0)
		begin
		gr0_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_22_on == 2'd1)
		begin
		gr0_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_23 && sq2_y_next == gr_y_0_23)
if (gr0_23_on == 2'd0)
		begin
		gr0_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_23_on == 2'd1)
		begin
		gr0_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_0_24 && sq2_y_next == gr_y_0_24)
if (gr0_24_on == 2'd0)
		begin
		gr0_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr0_24_on == 2'd1)
		begin
		gr0_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_0 && sq2_y_next == gr_y_1_0)
if (gr1_0_on == 2'd0)
		begin
		gr1_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_0_on == 2'd1)
		begin
		gr1_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_1 && sq2_y_next == gr_y_1_1)
if (gr1_1_on == 2'd0)
		begin
		gr1_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_1_on == 2'd1)
		begin
		gr1_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_2 && sq2_y_next == gr_y_1_2)
if (gr1_2_on == 2'd0)
		begin
		gr1_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_2_on == 2'd1)
		begin
		gr1_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_3 && sq2_y_next == gr_y_1_3)
if (gr1_3_on == 2'd0)
		begin
		gr1_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_3_on == 2'd1)
		begin
		gr1_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_4 && sq2_y_next == gr_y_1_4)
if (gr1_4_on == 2'd0)
		begin
		gr1_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_4_on == 2'd1)
		begin
		gr1_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_5 && sq2_y_next == gr_y_1_5)
if (gr1_5_on == 2'd0)
		begin
		gr1_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_5_on == 2'd1)
		begin
		gr1_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_6 && sq2_y_next == gr_y_1_6)
if (gr1_6_on == 2'd0)
		begin
		gr1_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_6_on == 2'd1)
		begin
		gr1_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_7 && sq2_y_next == gr_y_1_7)
if (gr1_7_on == 2'd0)
		begin
		gr1_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_7_on == 2'd1)
		begin
		gr1_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_8 && sq2_y_next == gr_y_1_8)
if (gr1_8_on == 2'd0)
		begin
		gr1_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_8_on == 2'd1)
		begin
		gr1_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_9 && sq2_y_next == gr_y_1_9)
if (gr1_9_on == 2'd0)
		begin
		gr1_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_9_on == 2'd1)
		begin
		gr1_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_10 && sq2_y_next == gr_y_1_10)
if (gr1_10_on == 2'd0)
		begin
		gr1_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_10_on == 2'd1)
		begin
		gr1_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_11 && sq2_y_next == gr_y_1_11)
if (gr1_11_on == 2'd0)
		begin
		gr1_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_11_on == 2'd1)
		begin
		gr1_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_12 && sq2_y_next == gr_y_1_12)
if (gr1_12_on == 2'd0)
		begin
		gr1_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_12_on == 2'd1)
		begin
		gr1_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_13 && sq2_y_next == gr_y_1_13)
if (gr1_13_on == 2'd0)
		begin
		gr1_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_13_on == 2'd1)
		begin
		gr1_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_14 && sq2_y_next == gr_y_1_14)
if (gr1_14_on == 2'd0)
		begin
		gr1_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_14_on == 2'd1)
		begin
		gr1_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_15 && sq2_y_next == gr_y_1_15)
if (gr1_15_on == 2'd0)
		begin
		gr1_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_15_on == 2'd1)
		begin
		gr1_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_16 && sq2_y_next == gr_y_1_16)
if (gr1_16_on == 2'd0)
		begin
		gr1_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_16_on == 2'd1)
		begin
		gr1_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_17 && sq2_y_next == gr_y_1_17)
if (gr1_17_on == 2'd0)
		begin
		gr1_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_17_on == 2'd1)
		begin
		gr1_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_18 && sq2_y_next == gr_y_1_18)
if (gr1_18_on == 2'd0)
		begin
		gr1_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_18_on == 2'd1)
		begin
		gr1_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_19 && sq2_y_next == gr_y_1_19)
if (gr1_19_on == 2'd0)
		begin
		gr1_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_19_on == 2'd1)
		begin
		gr1_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_20 && sq2_y_next == gr_y_1_20)
if (gr1_20_on == 2'd0)
		begin
		gr1_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_20_on == 2'd1)
		begin
		gr1_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_21 && sq2_y_next == gr_y_1_21)
if (gr1_21_on == 2'd0)
		begin
		gr1_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_21_on == 2'd1)
		begin
		gr1_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_22 && sq2_y_next == gr_y_1_22)
if (gr1_22_on == 2'd0)
		begin
		gr1_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_22_on == 2'd1)
		begin
		gr1_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_23 && sq2_y_next == gr_y_1_23)
if (gr1_23_on == 2'd0)
		begin
		gr1_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_23_on == 2'd1)
		begin
		gr1_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_1_24 && sq2_y_next == gr_y_1_24)
if (gr1_24_on == 2'd0)
		begin
		gr1_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr1_24_on == 2'd1)
		begin
		gr1_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_0 && sq2_y_next == gr_y_2_0)
if (gr2_0_on == 2'd0)
		begin
		gr2_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_0_on == 2'd1)
		begin
		gr2_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_1 && sq2_y_next == gr_y_2_1)
if (gr2_1_on == 2'd0)
		begin
		gr2_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_1_on == 2'd1)
		begin
		gr2_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_2 && sq2_y_next == gr_y_2_2)
if (gr2_2_on == 2'd0)
		begin
		gr2_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_2_on == 2'd1)
		begin
		gr2_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_3 && sq2_y_next == gr_y_2_3)
if (gr2_3_on == 2'd0)
		begin
		gr2_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_3_on == 2'd1)
		begin
		gr2_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_4 && sq2_y_next == gr_y_2_4)
if (gr2_4_on == 2'd0)
		begin
		gr2_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_4_on == 2'd1)
		begin
		gr2_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_5 && sq2_y_next == gr_y_2_5)
if (gr2_5_on == 2'd0)
		begin
		gr2_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_5_on == 2'd1)
		begin
		gr2_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_6 && sq2_y_next == gr_y_2_6)
if (gr2_6_on == 2'd0)
		begin
		gr2_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_6_on == 2'd1)
		begin
		gr2_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_7 && sq2_y_next == gr_y_2_7)
if (gr2_7_on == 2'd0)
		begin
		gr2_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_7_on == 2'd1)
		begin
		gr2_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_8 && sq2_y_next == gr_y_2_8)
if (gr2_8_on == 2'd0)
		begin
		gr2_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_8_on == 2'd1)
		begin
		gr2_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_9 && sq2_y_next == gr_y_2_9)
if (gr2_9_on == 2'd0)
		begin
		gr2_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_9_on == 2'd1)
		begin
		gr2_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_10 && sq2_y_next == gr_y_2_10)
if (gr2_10_on == 2'd0)
		begin
		gr2_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_10_on == 2'd1)
		begin
		gr2_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_11 && sq2_y_next == gr_y_2_11)
if (gr2_11_on == 2'd0)
		begin
		gr2_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_11_on == 2'd1)
		begin
		gr2_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_12 && sq2_y_next == gr_y_2_12)
if (gr2_12_on == 2'd0)
		begin
		gr2_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_12_on == 2'd1)
		begin
		gr2_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_13 && sq2_y_next == gr_y_2_13)
if (gr2_13_on == 2'd0)
		begin
		gr2_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_13_on == 2'd1)
		begin
		gr2_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_14 && sq2_y_next == gr_y_2_14)
if (gr2_14_on == 2'd0)
		begin
		gr2_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_14_on == 2'd1)
		begin
		gr2_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_15 && sq2_y_next == gr_y_2_15)
if (gr2_15_on == 2'd0)
		begin
		gr2_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_15_on == 2'd1)
		begin
		gr2_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_16 && sq2_y_next == gr_y_2_16)
if (gr2_16_on == 2'd0)
		begin
		gr2_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_16_on == 2'd1)
		begin
		gr2_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_17 && sq2_y_next == gr_y_2_17)
if (gr2_17_on == 2'd0)
		begin
		gr2_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_17_on == 2'd1)
		begin
		gr2_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_18 && sq2_y_next == gr_y_2_18)
if (gr2_18_on == 2'd0)
		begin
		gr2_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_18_on == 2'd1)
		begin
		gr2_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_19 && sq2_y_next == gr_y_2_19)
if (gr2_19_on == 2'd0)
		begin
		gr2_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_19_on == 2'd1)
		begin
		gr2_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_20 && sq2_y_next == gr_y_2_20)
if (gr2_20_on == 2'd0)
		begin
		gr2_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_20_on == 2'd1)
		begin
		gr2_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_21 && sq2_y_next == gr_y_2_21)
if (gr2_21_on == 2'd0)
		begin
		gr2_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_21_on == 2'd1)
		begin
		gr2_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_22 && sq2_y_next == gr_y_2_22)
if (gr2_22_on == 2'd0)
		begin
		gr2_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_22_on == 2'd1)
		begin
		gr2_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_23 && sq2_y_next == gr_y_2_23)
if (gr2_23_on == 2'd0)
		begin
		gr2_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_23_on == 2'd1)
		begin
		gr2_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_2_24 && sq2_y_next == gr_y_2_24)
if (gr2_24_on == 2'd0)
		begin
		gr2_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr2_24_on == 2'd1)
		begin
		gr2_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_0 && sq2_y_next == gr_y_3_0)
if (gr3_0_on == 2'd0)
		begin
		gr3_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_0_on == 2'd1)
		begin
		gr3_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_1 && sq2_y_next == gr_y_3_1)
if (gr3_1_on == 2'd0)
		begin
		gr3_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_1_on == 2'd1)
		begin
		gr3_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_2 && sq2_y_next == gr_y_3_2)
if (gr3_2_on == 2'd0)
		begin
		gr3_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_2_on == 2'd1)
		begin
		gr3_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_3 && sq2_y_next == gr_y_3_3)
if (gr3_3_on == 2'd0)
		begin
		gr3_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_3_on == 2'd1)
		begin
		gr3_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_4 && sq2_y_next == gr_y_3_4)
if (gr3_4_on == 2'd0)
		begin
		gr3_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_4_on == 2'd1)
		begin
		gr3_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_5 && sq2_y_next == gr_y_3_5)
if (gr3_5_on == 2'd0)
		begin
		gr3_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_5_on == 2'd1)
		begin
		gr3_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_6 && sq2_y_next == gr_y_3_6)
if (gr3_6_on == 2'd0)
		begin
		gr3_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_6_on == 2'd1)
		begin
		gr3_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_7 && sq2_y_next == gr_y_3_7)
if (gr3_7_on == 2'd0)
		begin
		gr3_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_7_on == 2'd1)
		begin
		gr3_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_8 && sq2_y_next == gr_y_3_8)
if (gr3_8_on == 2'd0)
		begin
		gr3_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_8_on == 2'd1)
		begin
		gr3_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_9 && sq2_y_next == gr_y_3_9)
if (gr3_9_on == 2'd0)
		begin
		gr3_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_9_on == 2'd1)
		begin
		gr3_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_10 && sq2_y_next == gr_y_3_10)
if (gr3_10_on == 2'd0)
		begin
		gr3_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_10_on == 2'd1)
		begin
		gr3_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_11 && sq2_y_next == gr_y_3_11)
if (gr3_11_on == 2'd0)
		begin
		gr3_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_11_on == 2'd1)
		begin
		gr3_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_12 && sq2_y_next == gr_y_3_12)
if (gr3_12_on == 2'd0)
		begin
		gr3_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_12_on == 2'd1)
		begin
		gr3_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_13 && sq2_y_next == gr_y_3_13)
if (gr3_13_on == 2'd0)
		begin
		gr3_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_13_on == 2'd1)
		begin
		gr3_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_14 && sq2_y_next == gr_y_3_14)
if (gr3_14_on == 2'd0)
		begin
		gr3_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_14_on == 2'd1)
		begin
		gr3_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_15 && sq2_y_next == gr_y_3_15)
if (gr3_15_on == 2'd0)
		begin
		gr3_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_15_on == 2'd1)
		begin
		gr3_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_16 && sq2_y_next == gr_y_3_16)
if (gr3_16_on == 2'd0)
		begin
		gr3_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_16_on == 2'd1)
		begin
		gr3_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_17 && sq2_y_next == gr_y_3_17)
if (gr3_17_on == 2'd0)
		begin
		gr3_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_17_on == 2'd1)
		begin
		gr3_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_18 && sq2_y_next == gr_y_3_18)
if (gr3_18_on == 2'd0)
		begin
		gr3_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_18_on == 2'd1)
		begin
		gr3_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_19 && sq2_y_next == gr_y_3_19)
if (gr3_19_on == 2'd0)
		begin
		gr3_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_19_on == 2'd1)
		begin
		gr3_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_20 && sq2_y_next == gr_y_3_20)
if (gr3_20_on == 2'd0)
		begin
		gr3_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_20_on == 2'd1)
		begin
		gr3_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_21 && sq2_y_next == gr_y_3_21)
if (gr3_21_on == 2'd0)
		begin
		gr3_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_21_on == 2'd1)
		begin
		gr3_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_22 && sq2_y_next == gr_y_3_22)
if (gr3_22_on == 2'd0)
		begin
		gr3_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_22_on == 2'd1)
		begin
		gr3_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_23 && sq2_y_next == gr_y_3_23)
if (gr3_23_on == 2'd0)
		begin
		gr3_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_23_on == 2'd1)
		begin
		gr3_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_3_24 && sq2_y_next == gr_y_3_24)
if (gr3_24_on == 2'd0)
		begin
		gr3_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr3_24_on == 2'd1)
		begin
		gr3_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_0 && sq2_y_next == gr_y_4_0)
if (gr4_0_on == 2'd0)
		begin
		gr4_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_0_on == 2'd1)
		begin
		gr4_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_1 && sq2_y_next == gr_y_4_1)
if (gr4_1_on == 2'd0)
		begin
		gr4_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_1_on == 2'd1)
		begin
		gr4_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_2 && sq2_y_next == gr_y_4_2)
if (gr4_2_on == 2'd0)
		begin
		gr4_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_2_on == 2'd1)
		begin
		gr4_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_3 && sq2_y_next == gr_y_4_3)
if (gr4_3_on == 2'd0)
		begin
		gr4_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_3_on == 2'd1)
		begin
		gr4_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_4 && sq2_y_next == gr_y_4_4)
if (gr4_4_on == 2'd0)
		begin
		gr4_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_4_on == 2'd1)
		begin
		gr4_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_5 && sq2_y_next == gr_y_4_5)
if (gr4_5_on == 2'd0)
		begin
		gr4_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_5_on == 2'd1)
		begin
		gr4_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_6 && sq2_y_next == gr_y_4_6)
if (gr4_6_on == 2'd0)
		begin
		gr4_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_6_on == 2'd1)
		begin
		gr4_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_7 && sq2_y_next == gr_y_4_7)
if (gr4_7_on == 2'd0)
		begin
		gr4_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_7_on == 2'd1)
		begin
		gr4_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_8 && sq2_y_next == gr_y_4_8)
if (gr4_8_on == 2'd0)
		begin
		gr4_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_8_on == 2'd1)
		begin
		gr4_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_9 && sq2_y_next == gr_y_4_9)
if (gr4_9_on == 2'd0)
		begin
		gr4_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_9_on == 2'd1)
		begin
		gr4_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_10 && sq2_y_next == gr_y_4_10)
if (gr4_10_on == 2'd0)
		begin
		gr4_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_10_on == 2'd1)
		begin
		gr4_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_11 && sq2_y_next == gr_y_4_11)
if (gr4_11_on == 2'd0)
		begin
		gr4_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_11_on == 2'd1)
		begin
		gr4_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_12 && sq2_y_next == gr_y_4_12)
if (gr4_12_on == 2'd0)
		begin
		gr4_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_12_on == 2'd1)
		begin
		gr4_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_13 && sq2_y_next == gr_y_4_13)
if (gr4_13_on == 2'd0)
		begin
		gr4_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_13_on == 2'd1)
		begin
		gr4_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_14 && sq2_y_next == gr_y_4_14)
if (gr4_14_on == 2'd0)
		begin
		gr4_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_14_on == 2'd1)
		begin
		gr4_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_15 && sq2_y_next == gr_y_4_15)
if (gr4_15_on == 2'd0)
		begin
		gr4_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_15_on == 2'd1)
		begin
		gr4_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_16 && sq2_y_next == gr_y_4_16)
if (gr4_16_on == 2'd0)
		begin
		gr4_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_16_on == 2'd1)
		begin
		gr4_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_17 && sq2_y_next == gr_y_4_17)
if (gr4_17_on == 2'd0)
		begin
		gr4_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_17_on == 2'd1)
		begin
		gr4_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_18 && sq2_y_next == gr_y_4_18)
if (gr4_18_on == 2'd0)
		begin
		gr4_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_18_on == 2'd1)
		begin
		gr4_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_19 && sq2_y_next == gr_y_4_19)
if (gr4_19_on == 2'd0)
		begin
		gr4_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_19_on == 2'd1)
		begin
		gr4_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_20 && sq2_y_next == gr_y_4_20)
if (gr4_20_on == 2'd0)
		begin
		gr4_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_20_on == 2'd1)
		begin
		gr4_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_21 && sq2_y_next == gr_y_4_21)
if (gr4_21_on == 2'd0)
		begin
		gr4_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_21_on == 2'd1)
		begin
		gr4_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_22 && sq2_y_next == gr_y_4_22)
if (gr4_22_on == 2'd0)
		begin
		gr4_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_22_on == 2'd1)
		begin
		gr4_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_23 && sq2_y_next == gr_y_4_23)
if (gr4_23_on == 2'd0)
		begin
		gr4_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_23_on == 2'd1)
		begin
		gr4_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_4_24 && sq2_y_next == gr_y_4_24)
if (gr4_24_on == 2'd0)
		begin
		gr4_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr4_24_on == 2'd1)
		begin
		gr4_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_0 && sq2_y_next == gr_y_5_0)
if (gr5_0_on == 2'd0)
		begin
		gr5_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_0_on == 2'd1)
		begin
		gr5_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_1 && sq2_y_next == gr_y_5_1)
if (gr5_1_on == 2'd0)
		begin
		gr5_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_1_on == 2'd1)
		begin
		gr5_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_2 && sq2_y_next == gr_y_5_2)
if (gr5_2_on == 2'd0)
		begin
		gr5_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_2_on == 2'd1)
		begin
		gr5_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_3 && sq2_y_next == gr_y_5_3)
if (gr5_3_on == 2'd0)
		begin
		gr5_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_3_on == 2'd1)
		begin
		gr5_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_4 && sq2_y_next == gr_y_5_4)
if (gr5_4_on == 2'd0)
		begin
		gr5_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_4_on == 2'd1)
		begin
		gr5_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_5 && sq2_y_next == gr_y_5_5)
if (gr5_5_on == 2'd0)
		begin
		gr5_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_5_on == 2'd1)
		begin
		gr5_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_6 && sq2_y_next == gr_y_5_6)
if (gr5_6_on == 2'd0)
		begin
		gr5_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_6_on == 2'd1)
		begin
		gr5_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_7 && sq2_y_next == gr_y_5_7)
if (gr5_7_on == 2'd0)
		begin
		gr5_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_7_on == 2'd1)
		begin
		gr5_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_8 && sq2_y_next == gr_y_5_8)
if (gr5_8_on == 2'd0)
		begin
		gr5_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_8_on == 2'd1)
		begin
		gr5_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_9 && sq2_y_next == gr_y_5_9)
if (gr5_9_on == 2'd0)
		begin
		gr5_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_9_on == 2'd1)
		begin
		gr5_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_10 && sq2_y_next == gr_y_5_10)
if (gr5_10_on == 2'd0)
		begin
		gr5_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_10_on == 2'd1)
		begin
		gr5_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_11 && sq2_y_next == gr_y_5_11)
if (gr5_11_on == 2'd0)
		begin
		gr5_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_11_on == 2'd1)
		begin
		gr5_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_12 && sq2_y_next == gr_y_5_12)
if (gr5_12_on == 2'd0)
		begin
		gr5_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_12_on == 2'd1)
		begin
		gr5_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_13 && sq2_y_next == gr_y_5_13)
if (gr5_13_on == 2'd0)
		begin
		gr5_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_13_on == 2'd1)
		begin
		gr5_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_14 && sq2_y_next == gr_y_5_14)
if (gr5_14_on == 2'd0)
		begin
		gr5_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_14_on == 2'd1)
		begin
		gr5_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_15 && sq2_y_next == gr_y_5_15)
if (gr5_15_on == 2'd0)
		begin
		gr5_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_15_on == 2'd1)
		begin
		gr5_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_16 && sq2_y_next == gr_y_5_16)
if (gr5_16_on == 2'd0)
		begin
		gr5_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_16_on == 2'd1)
		begin
		gr5_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_17 && sq2_y_next == gr_y_5_17)
if (gr5_17_on == 2'd0)
		begin
		gr5_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_17_on == 2'd1)
		begin
		gr5_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_18 && sq2_y_next == gr_y_5_18)
if (gr5_18_on == 2'd0)
		begin
		gr5_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_18_on == 2'd1)
		begin
		gr5_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_19 && sq2_y_next == gr_y_5_19)
if (gr5_19_on == 2'd0)
		begin
		gr5_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_19_on == 2'd1)
		begin
		gr5_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_20 && sq2_y_next == gr_y_5_20)
if (gr5_20_on == 2'd0)
		begin
		gr5_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_20_on == 2'd1)
		begin
		gr5_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_21 && sq2_y_next == gr_y_5_21)
if (gr5_21_on == 2'd0)
		begin
		gr5_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_21_on == 2'd1)
		begin
		gr5_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_22 && sq2_y_next == gr_y_5_22)
if (gr5_22_on == 2'd0)
		begin
		gr5_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_22_on == 2'd1)
		begin
		gr5_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_23 && sq2_y_next == gr_y_5_23)
if (gr5_23_on == 2'd0)
		begin
		gr5_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_23_on == 2'd1)
		begin
		gr5_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_5_24 && sq2_y_next == gr_y_5_24)
if (gr5_24_on == 2'd0)
		begin
		gr5_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr5_24_on == 2'd1)
		begin
		gr5_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_0 && sq2_y_next == gr_y_6_0)
if (gr6_0_on == 2'd0)
		begin
		gr6_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_0_on == 2'd1)
		begin
		gr6_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_1 && sq2_y_next == gr_y_6_1)
if (gr6_1_on == 2'd0)
		begin
		gr6_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_1_on == 2'd1)
		begin
		gr6_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_2 && sq2_y_next == gr_y_6_2)
if (gr6_2_on == 2'd0)
		begin
		gr6_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_2_on == 2'd1)
		begin
		gr6_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_3 && sq2_y_next == gr_y_6_3)
if (gr6_3_on == 2'd0)
		begin
		gr6_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_3_on == 2'd1)
		begin
		gr6_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_4 && sq2_y_next == gr_y_6_4)
if (gr6_4_on == 2'd0)
		begin
		gr6_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_4_on == 2'd1)
		begin
		gr6_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_5 && sq2_y_next == gr_y_6_5)
if (gr6_5_on == 2'd0)
		begin
		gr6_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_5_on == 2'd1)
		begin
		gr6_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_6 && sq2_y_next == gr_y_6_6)
if (gr6_6_on == 2'd0)
		begin
		gr6_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_6_on == 2'd1)
		begin
		gr6_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_7 && sq2_y_next == gr_y_6_7)
if (gr6_7_on == 2'd0)
		begin
		gr6_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_7_on == 2'd1)
		begin
		gr6_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_8 && sq2_y_next == gr_y_6_8)
if (gr6_8_on == 2'd0)
		begin
		gr6_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_8_on == 2'd1)
		begin
		gr6_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_9 && sq2_y_next == gr_y_6_9)
if (gr6_9_on == 2'd0)
		begin
		gr6_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_9_on == 2'd1)
		begin
		gr6_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_10 && sq2_y_next == gr_y_6_10)
if (gr6_10_on == 2'd0)
		begin
		gr6_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_10_on == 2'd1)
		begin
		gr6_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_11 && sq2_y_next == gr_y_6_11)
if (gr6_11_on == 2'd0)
		begin
		gr6_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_11_on == 2'd1)
		begin
		gr6_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_12 && sq2_y_next == gr_y_6_12)
if (gr6_12_on == 2'd0)
		begin
		gr6_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_12_on == 2'd1)
		begin
		gr6_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_13 && sq2_y_next == gr_y_6_13)
if (gr6_13_on == 2'd0)
		begin
		gr6_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_13_on == 2'd1)
		begin
		gr6_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_14 && sq2_y_next == gr_y_6_14)
if (gr6_14_on == 2'd0)
		begin
		gr6_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_14_on == 2'd1)
		begin
		gr6_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_15 && sq2_y_next == gr_y_6_15)
if (gr6_15_on == 2'd0)
		begin
		gr6_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_15_on == 2'd1)
		begin
		gr6_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_16 && sq2_y_next == gr_y_6_16)
if (gr6_16_on == 2'd0)
		begin
		gr6_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_16_on == 2'd1)
		begin
		gr6_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_17 && sq2_y_next == gr_y_6_17)
if (gr6_17_on == 2'd0)
		begin
		gr6_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_17_on == 2'd1)
		begin
		gr6_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_18 && sq2_y_next == gr_y_6_18)
if (gr6_18_on == 2'd0)
		begin
		gr6_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_18_on == 2'd1)
		begin
		gr6_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_19 && sq2_y_next == gr_y_6_19)
if (gr6_19_on == 2'd0)
		begin
		gr6_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_19_on == 2'd1)
		begin
		gr6_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_20 && sq2_y_next == gr_y_6_20)
if (gr6_20_on == 2'd0)
		begin
		gr6_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_20_on == 2'd1)
		begin
		gr6_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_21 && sq2_y_next == gr_y_6_21)
if (gr6_21_on == 2'd0)
		begin
		gr6_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_21_on == 2'd1)
		begin
		gr6_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_22 && sq2_y_next == gr_y_6_22)
if (gr6_22_on == 2'd0)
		begin
		gr6_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_22_on == 2'd1)
		begin
		gr6_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_23 && sq2_y_next == gr_y_6_23)
if (gr6_23_on == 2'd0)
		begin
		gr6_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_23_on == 2'd1)
		begin
		gr6_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_6_24 && sq2_y_next == gr_y_6_24)
if (gr6_24_on == 2'd0)
		begin
		gr6_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr6_24_on == 2'd1)
		begin
		gr6_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_0 && sq2_y_next == gr_y_7_0)
if (gr7_0_on == 2'd0)
		begin
		gr7_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_0_on == 2'd1)
		begin
		gr7_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_1 && sq2_y_next == gr_y_7_1)
if (gr7_1_on == 2'd0)
		begin
		gr7_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_1_on == 2'd1)
		begin
		gr7_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_2 && sq2_y_next == gr_y_7_2)
if (gr7_2_on == 2'd0)
		begin
		gr7_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_2_on == 2'd1)
		begin
		gr7_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_3 && sq2_y_next == gr_y_7_3)
if (gr7_3_on == 2'd0)
		begin
		gr7_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_3_on == 2'd1)
		begin
		gr7_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_4 && sq2_y_next == gr_y_7_4)
if (gr7_4_on == 2'd0)
		begin
		gr7_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_4_on == 2'd1)
		begin
		gr7_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_5 && sq2_y_next == gr_y_7_5)
if (gr7_5_on == 2'd0)
		begin
		gr7_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_5_on == 2'd1)
		begin
		gr7_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_6 && sq2_y_next == gr_y_7_6)
if (gr7_6_on == 2'd0)
		begin
		gr7_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_6_on == 2'd1)
		begin
		gr7_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_7 && sq2_y_next == gr_y_7_7)
if (gr7_7_on == 2'd0)
		begin
		gr7_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_7_on == 2'd1)
		begin
		gr7_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_8 && sq2_y_next == gr_y_7_8)
if (gr7_8_on == 2'd0)
		begin
		gr7_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_8_on == 2'd1)
		begin
		gr7_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_9 && sq2_y_next == gr_y_7_9)
if (gr7_9_on == 2'd0)
		begin
		gr7_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_9_on == 2'd1)
		begin
		gr7_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_10 && sq2_y_next == gr_y_7_10)
if (gr7_10_on == 2'd0)
		begin
		gr7_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_10_on == 2'd1)
		begin
		gr7_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_11 && sq2_y_next == gr_y_7_11)
if (gr7_11_on == 2'd0)
		begin
		gr7_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_11_on == 2'd1)
		begin
		gr7_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_12 && sq2_y_next == gr_y_7_12)
if (gr7_12_on == 2'd0)
		begin
		gr7_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_12_on == 2'd1)
		begin
		gr7_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_13 && sq2_y_next == gr_y_7_13)
if (gr7_13_on == 2'd0)
		begin
		gr7_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_13_on == 2'd1)
		begin
		gr7_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_14 && sq2_y_next == gr_y_7_14)
if (gr7_14_on == 2'd0)
		begin
		gr7_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_14_on == 2'd1)
		begin
		gr7_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_15 && sq2_y_next == gr_y_7_15)
if (gr7_15_on == 2'd0)
		begin
		gr7_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_15_on == 2'd1)
		begin
		gr7_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_16 && sq2_y_next == gr_y_7_16)
if (gr7_16_on == 2'd0)
		begin
		gr7_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_16_on == 2'd1)
		begin
		gr7_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_17 && sq2_y_next == gr_y_7_17)
if (gr7_17_on == 2'd0)
		begin
		gr7_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_17_on == 2'd1)
		begin
		gr7_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_18 && sq2_y_next == gr_y_7_18)
if (gr7_18_on == 2'd0)
		begin
		gr7_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_18_on == 2'd1)
		begin
		gr7_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_19 && sq2_y_next == gr_y_7_19)
if (gr7_19_on == 2'd0)
		begin
		gr7_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_19_on == 2'd1)
		begin
		gr7_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_20 && sq2_y_next == gr_y_7_20)
if (gr7_20_on == 2'd0)
		begin
		gr7_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_20_on == 2'd1)
		begin
		gr7_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_21 && sq2_y_next == gr_y_7_21)
if (gr7_21_on == 2'd0)
		begin
		gr7_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_21_on == 2'd1)
		begin
		gr7_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_22 && sq2_y_next == gr_y_7_22)
if (gr7_22_on == 2'd0)
		begin
		gr7_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_22_on == 2'd1)
		begin
		gr7_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_23 && sq2_y_next == gr_y_7_23)
if (gr7_23_on == 2'd0)
		begin
		gr7_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_23_on == 2'd1)
		begin
		gr7_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_7_24 && sq2_y_next == gr_y_7_24)
if (gr7_24_on == 2'd0)
		begin
		gr7_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr7_24_on == 2'd1)
		begin
		gr7_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_0 && sq2_y_next == gr_y_8_0)
if (gr8_0_on == 2'd0)
		begin
		gr8_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_0_on == 2'd1)
		begin
		gr8_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_1 && sq2_y_next == gr_y_8_1)
if (gr8_1_on == 2'd0)
		begin
		gr8_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_1_on == 2'd1)
		begin
		gr8_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_2 && sq2_y_next == gr_y_8_2)
if (gr8_2_on == 2'd0)
		begin
		gr8_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_2_on == 2'd1)
		begin
		gr8_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_3 && sq2_y_next == gr_y_8_3)
if (gr8_3_on == 2'd0)
		begin
		gr8_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_3_on == 2'd1)
		begin
		gr8_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_4 && sq2_y_next == gr_y_8_4)
if (gr8_4_on == 2'd0)
		begin
		gr8_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_4_on == 2'd1)
		begin
		gr8_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_5 && sq2_y_next == gr_y_8_5)
if (gr8_5_on == 2'd0)
		begin
		gr8_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_5_on == 2'd1)
		begin
		gr8_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_6 && sq2_y_next == gr_y_8_6)
if (gr8_6_on == 2'd0)
		begin
		gr8_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_6_on == 2'd1)
		begin
		gr8_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_7 && sq2_y_next == gr_y_8_7)
if (gr8_7_on == 2'd0)
		begin
		gr8_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_7_on == 2'd1)
		begin
		gr8_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_8 && sq2_y_next == gr_y_8_8)
if (gr8_8_on == 2'd0)
		begin
		gr8_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_8_on == 2'd1)
		begin
		gr8_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_9 && sq2_y_next == gr_y_8_9)
if (gr8_9_on == 2'd0)
		begin
		gr8_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_9_on == 2'd1)
		begin
		gr8_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_10 && sq2_y_next == gr_y_8_10)
if (gr8_10_on == 2'd0)
		begin
		gr8_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_10_on == 2'd1)
		begin
		gr8_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_11 && sq2_y_next == gr_y_8_11)
if (gr8_11_on == 2'd0)
		begin
		gr8_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_11_on == 2'd1)
		begin
		gr8_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_12 && sq2_y_next == gr_y_8_12)
if (gr8_12_on == 2'd0)
		begin
		gr8_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_12_on == 2'd1)
		begin
		gr8_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_13 && sq2_y_next == gr_y_8_13)
if (gr8_13_on == 2'd0)
		begin
		gr8_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_13_on == 2'd1)
		begin
		gr8_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_14 && sq2_y_next == gr_y_8_14)
if (gr8_14_on == 2'd0)
		begin
		gr8_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_14_on == 2'd1)
		begin
		gr8_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_15 && sq2_y_next == gr_y_8_15)
if (gr8_15_on == 2'd0)
		begin
		gr8_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_15_on == 2'd1)
		begin
		gr8_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_16 && sq2_y_next == gr_y_8_16)
if (gr8_16_on == 2'd0)
		begin
		gr8_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_16_on == 2'd1)
		begin
		gr8_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_17 && sq2_y_next == gr_y_8_17)
if (gr8_17_on == 2'd0)
		begin
		gr8_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_17_on == 2'd1)
		begin
		gr8_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_18 && sq2_y_next == gr_y_8_18)
if (gr8_18_on == 2'd0)
		begin
		gr8_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_18_on == 2'd1)
		begin
		gr8_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_19 && sq2_y_next == gr_y_8_19)
if (gr8_19_on == 2'd0)
		begin
		gr8_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_19_on == 2'd1)
		begin
		gr8_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_20 && sq2_y_next == gr_y_8_20)
if (gr8_20_on == 2'd0)
		begin
		gr8_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_20_on == 2'd1)
		begin
		gr8_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_21 && sq2_y_next == gr_y_8_21)
if (gr8_21_on == 2'd0)
		begin
		gr8_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_21_on == 2'd1)
		begin
		gr8_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_22 && sq2_y_next == gr_y_8_22)
if (gr8_22_on == 2'd0)
		begin
		gr8_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_22_on == 2'd1)
		begin
		gr8_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_23 && sq2_y_next == gr_y_8_23)
if (gr8_23_on == 2'd0)
		begin
		gr8_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_23_on == 2'd1)
		begin
		gr8_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_8_24 && sq2_y_next == gr_y_8_24)
if (gr8_24_on == 2'd0)
		begin
		gr8_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr8_24_on == 2'd1)
		begin
		gr8_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_0 && sq2_y_next == gr_y_9_0)
if (gr9_0_on == 2'd0)
		begin
		gr9_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_0_on == 2'd1)
		begin
		gr9_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_1 && sq2_y_next == gr_y_9_1)
if (gr9_1_on == 2'd0)
		begin
		gr9_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_1_on == 2'd1)
		begin
		gr9_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_2 && sq2_y_next == gr_y_9_2)
if (gr9_2_on == 2'd0)
		begin
		gr9_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_2_on == 2'd1)
		begin
		gr9_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_3 && sq2_y_next == gr_y_9_3)
if (gr9_3_on == 2'd0)
		begin
		gr9_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_3_on == 2'd1)
		begin
		gr9_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_4 && sq2_y_next == gr_y_9_4)
if (gr9_4_on == 2'd0)
		begin
		gr9_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_4_on == 2'd1)
		begin
		gr9_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_5 && sq2_y_next == gr_y_9_5)
if (gr9_5_on == 2'd0)
		begin
		gr9_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_5_on == 2'd1)
		begin
		gr9_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_6 && sq2_y_next == gr_y_9_6)
if (gr9_6_on == 2'd0)
		begin
		gr9_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_6_on == 2'd1)
		begin
		gr9_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_7 && sq2_y_next == gr_y_9_7)
if (gr9_7_on == 2'd0)
		begin
		gr9_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_7_on == 2'd1)
		begin
		gr9_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_8 && sq2_y_next == gr_y_9_8)
if (gr9_8_on == 2'd0)
		begin
		gr9_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_8_on == 2'd1)
		begin
		gr9_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_9 && sq2_y_next == gr_y_9_9)
if (gr9_9_on == 2'd0)
		begin
		gr9_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_9_on == 2'd1)
		begin
		gr9_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_10 && sq2_y_next == gr_y_9_10)
if (gr9_10_on == 2'd0)
		begin
		gr9_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_10_on == 2'd1)
		begin
		gr9_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_11 && sq2_y_next == gr_y_9_11)
if (gr9_11_on == 2'd0)
		begin
		gr9_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_11_on == 2'd1)
		begin
		gr9_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_12 && sq2_y_next == gr_y_9_12)
if (gr9_12_on == 2'd0)
		begin
		gr9_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_12_on == 2'd1)
		begin
		gr9_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_13 && sq2_y_next == gr_y_9_13)
if (gr9_13_on == 2'd0)
		begin
		gr9_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_13_on == 2'd1)
		begin
		gr9_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_14 && sq2_y_next == gr_y_9_14)
if (gr9_14_on == 2'd0)
		begin
		gr9_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_14_on == 2'd1)
		begin
		gr9_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_15 && sq2_y_next == gr_y_9_15)
if (gr9_15_on == 2'd0)
		begin
		gr9_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_15_on == 2'd1)
		begin
		gr9_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_16 && sq2_y_next == gr_y_9_16)
if (gr9_16_on == 2'd0)
		begin
		gr9_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_16_on == 2'd1)
		begin
		gr9_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_17 && sq2_y_next == gr_y_9_17)
if (gr9_17_on == 2'd0)
		begin
		gr9_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_17_on == 2'd1)
		begin
		gr9_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_18 && sq2_y_next == gr_y_9_18)
if (gr9_18_on == 2'd0)
		begin
		gr9_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_18_on == 2'd1)
		begin
		gr9_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_19 && sq2_y_next == gr_y_9_19)
if (gr9_19_on == 2'd0)
		begin
		gr9_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_19_on == 2'd1)
		begin
		gr9_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_20 && sq2_y_next == gr_y_9_20)
if (gr9_20_on == 2'd0)
		begin
		gr9_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_20_on == 2'd1)
		begin
		gr9_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_21 && sq2_y_next == gr_y_9_21)
if (gr9_21_on == 2'd0)
		begin
		gr9_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_21_on == 2'd1)
		begin
		gr9_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_22 && sq2_y_next == gr_y_9_22)
if (gr9_22_on == 2'd0)
		begin
		gr9_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_22_on == 2'd1)
		begin
		gr9_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_23 && sq2_y_next == gr_y_9_23)
if (gr9_23_on == 2'd0)
		begin
		gr9_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_23_on == 2'd1)
		begin
		gr9_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_9_24 && sq2_y_next == gr_y_9_24)
if (gr9_24_on == 2'd0)
		begin
		gr9_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr9_24_on == 2'd1)
		begin
		gr9_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_0 && sq2_y_next == gr_y_10_0)
if (gr10_0_on == 2'd0)
		begin
		gr10_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_0_on == 2'd1)
		begin
		gr10_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_1 && sq2_y_next == gr_y_10_1)
if (gr10_1_on == 2'd0)
		begin
		gr10_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_1_on == 2'd1)
		begin
		gr10_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_2 && sq2_y_next == gr_y_10_2)
if (gr10_2_on == 2'd0)
		begin
		gr10_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_2_on == 2'd1)
		begin
		gr10_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_3 && sq2_y_next == gr_y_10_3)
if (gr10_3_on == 2'd0)
		begin
		gr10_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_3_on == 2'd1)
		begin
		gr10_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_4 && sq2_y_next == gr_y_10_4)
if (gr10_4_on == 2'd0)
		begin
		gr10_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_4_on == 2'd1)
		begin
		gr10_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_5 && sq2_y_next == gr_y_10_5)
if (gr10_5_on == 2'd0)
		begin
		gr10_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_5_on == 2'd1)
		begin
		gr10_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_6 && sq2_y_next == gr_y_10_6)
if (gr10_6_on == 2'd0)
		begin
		gr10_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_6_on == 2'd1)
		begin
		gr10_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_7 && sq2_y_next == gr_y_10_7)
if (gr10_7_on == 2'd0)
		begin
		gr10_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_7_on == 2'd1)
		begin
		gr10_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_8 && sq2_y_next == gr_y_10_8)
if (gr10_8_on == 2'd0)
		begin
		gr10_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_8_on == 2'd1)
		begin
		gr10_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_9 && sq2_y_next == gr_y_10_9)
if (gr10_9_on == 2'd0)
		begin
		gr10_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_9_on == 2'd1)
		begin
		gr10_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_10 && sq2_y_next == gr_y_10_10)
if (gr10_10_on == 2'd0)
		begin
		gr10_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_10_on == 2'd1)
		begin
		gr10_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_11 && sq2_y_next == gr_y_10_11)
if (gr10_11_on == 2'd0)
		begin
		gr10_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_11_on == 2'd1)
		begin
		gr10_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_12 && sq2_y_next == gr_y_10_12)
if (gr10_12_on == 2'd0)
		begin
		gr10_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_12_on == 2'd1)
		begin
		gr10_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_13 && sq2_y_next == gr_y_10_13)
if (gr10_13_on == 2'd0)
		begin
		gr10_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_13_on == 2'd1)
		begin
		gr10_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_14 && sq2_y_next == gr_y_10_14)
if (gr10_14_on == 2'd0)
		begin
		gr10_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_14_on == 2'd1)
		begin
		gr10_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_15 && sq2_y_next == gr_y_10_15)
if (gr10_15_on == 2'd0)
		begin
		gr10_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_15_on == 2'd1)
		begin
		gr10_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_16 && sq2_y_next == gr_y_10_16)
if (gr10_16_on == 2'd0)
		begin
		gr10_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_16_on == 2'd1)
		begin
		gr10_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_17 && sq2_y_next == gr_y_10_17)
if (gr10_17_on == 2'd0)
		begin
		gr10_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_17_on == 2'd1)
		begin
		gr10_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_18 && sq2_y_next == gr_y_10_18)
if (gr10_18_on == 2'd0)
		begin
		gr10_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_18_on == 2'd1)
		begin
		gr10_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_19 && sq2_y_next == gr_y_10_19)
if (gr10_19_on == 2'd0)
		begin
		gr10_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_19_on == 2'd1)
		begin
		gr10_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_20 && sq2_y_next == gr_y_10_20)
if (gr10_20_on == 2'd0)
		begin
		gr10_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_20_on == 2'd1)
		begin
		gr10_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_21 && sq2_y_next == gr_y_10_21)
if (gr10_21_on == 2'd0)
		begin
		gr10_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_21_on == 2'd1)
		begin
		gr10_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_22 && sq2_y_next == gr_y_10_22)
if (gr10_22_on == 2'd0)
		begin
		gr10_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_22_on == 2'd1)
		begin
		gr10_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_23 && sq2_y_next == gr_y_10_23)
if (gr10_23_on == 2'd0)
		begin
		gr10_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_23_on == 2'd1)
		begin
		gr10_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_10_24 && sq2_y_next == gr_y_10_24)
if (gr10_24_on == 2'd0)
		begin
		gr10_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr10_24_on == 2'd1)
		begin
		gr10_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_0 && sq2_y_next == gr_y_11_0)
if (gr11_0_on == 2'd0)
		begin
		gr11_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_0_on == 2'd1)
		begin
		gr11_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_1 && sq2_y_next == gr_y_11_1)
if (gr11_1_on == 2'd0)
		begin
		gr11_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_1_on == 2'd1)
		begin
		gr11_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_2 && sq2_y_next == gr_y_11_2)
if (gr11_2_on == 2'd0)
		begin
		gr11_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_2_on == 2'd1)
		begin
		gr11_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_3 && sq2_y_next == gr_y_11_3)
if (gr11_3_on == 2'd0)
		begin
		gr11_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_3_on == 2'd1)
		begin
		gr11_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_4 && sq2_y_next == gr_y_11_4)
if (gr11_4_on == 2'd0)
		begin
		gr11_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_4_on == 2'd1)
		begin
		gr11_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_5 && sq2_y_next == gr_y_11_5)
if (gr11_5_on == 2'd0)
		begin
		gr11_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_5_on == 2'd1)
		begin
		gr11_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_6 && sq2_y_next == gr_y_11_6)
if (gr11_6_on == 2'd0)
		begin
		gr11_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_6_on == 2'd1)
		begin
		gr11_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_7 && sq2_y_next == gr_y_11_7)
if (gr11_7_on == 2'd0)
		begin
		gr11_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_7_on == 2'd1)
		begin
		gr11_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_8 && sq2_y_next == gr_y_11_8)
if (gr11_8_on == 2'd0)
		begin
		gr11_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_8_on == 2'd1)
		begin
		gr11_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_9 && sq2_y_next == gr_y_11_9)
if (gr11_9_on == 2'd0)
		begin
		gr11_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_9_on == 2'd1)
		begin
		gr11_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_10 && sq2_y_next == gr_y_11_10)
if (gr11_10_on == 2'd0)
		begin
		gr11_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_10_on == 2'd1)
		begin
		gr11_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_11 && sq2_y_next == gr_y_11_11)
if (gr11_11_on == 2'd0)
		begin
		gr11_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_11_on == 2'd1)
		begin
		gr11_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_12 && sq2_y_next == gr_y_11_12)
if (gr11_12_on == 2'd0)
		begin
		gr11_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_12_on == 2'd1)
		begin
		gr11_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_13 && sq2_y_next == gr_y_11_13)
if (gr11_13_on == 2'd0)
		begin
		gr11_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_13_on == 2'd1)
		begin
		gr11_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_14 && sq2_y_next == gr_y_11_14)
if (gr11_14_on == 2'd0)
		begin
		gr11_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_14_on == 2'd1)
		begin
		gr11_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_15 && sq2_y_next == gr_y_11_15)
if (gr11_15_on == 2'd0)
		begin
		gr11_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_15_on == 2'd1)
		begin
		gr11_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_16 && sq2_y_next == gr_y_11_16)
if (gr11_16_on == 2'd0)
		begin
		gr11_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_16_on == 2'd1)
		begin
		gr11_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_17 && sq2_y_next == gr_y_11_17)
if (gr11_17_on == 2'd0)
		begin
		gr11_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_17_on == 2'd1)
		begin
		gr11_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_18 && sq2_y_next == gr_y_11_18)
if (gr11_18_on == 2'd0)
		begin
		gr11_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_18_on == 2'd1)
		begin
		gr11_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_19 && sq2_y_next == gr_y_11_19)
if (gr11_19_on == 2'd0)
		begin
		gr11_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_19_on == 2'd1)
		begin
		gr11_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_20 && sq2_y_next == gr_y_11_20)
if (gr11_20_on == 2'd0)
		begin
		gr11_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_20_on == 2'd1)
		begin
		gr11_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_21 && sq2_y_next == gr_y_11_21)
if (gr11_21_on == 2'd0)
		begin
		gr11_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_21_on == 2'd1)
		begin
		gr11_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_22 && sq2_y_next == gr_y_11_22)
if (gr11_22_on == 2'd0)
		begin
		gr11_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_22_on == 2'd1)
		begin
		gr11_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_23 && sq2_y_next == gr_y_11_23)
if (gr11_23_on == 2'd0)
		begin
		gr11_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_23_on == 2'd1)
		begin
		gr11_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_11_24 && sq2_y_next == gr_y_11_24)
if (gr11_24_on == 2'd0)
		begin
		gr11_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr11_24_on == 2'd1)
		begin
		gr11_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_0 && sq2_y_next == gr_y_12_0)
if (gr12_0_on == 2'd0)
		begin
		gr12_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_0_on == 2'd1)
		begin
		gr12_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_1 && sq2_y_next == gr_y_12_1)
if (gr12_1_on == 2'd0)
		begin
		gr12_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_1_on == 2'd1)
		begin
		gr12_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_2 && sq2_y_next == gr_y_12_2)
if (gr12_2_on == 2'd0)
		begin
		gr12_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_2_on == 2'd1)
		begin
		gr12_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_3 && sq2_y_next == gr_y_12_3)
if (gr12_3_on == 2'd0)
		begin
		gr12_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_3_on == 2'd1)
		begin
		gr12_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_4 && sq2_y_next == gr_y_12_4)
if (gr12_4_on == 2'd0)
		begin
		gr12_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_4_on == 2'd1)
		begin
		gr12_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_5 && sq2_y_next == gr_y_12_5)
if (gr12_5_on == 2'd0)
		begin
		gr12_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_5_on == 2'd1)
		begin
		gr12_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_6 && sq2_y_next == gr_y_12_6)
if (gr12_6_on == 2'd0)
		begin
		gr12_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_6_on == 2'd1)
		begin
		gr12_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_7 && sq2_y_next == gr_y_12_7)
if (gr12_7_on == 2'd0)
		begin
		gr12_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_7_on == 2'd1)
		begin
		gr12_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_8 && sq2_y_next == gr_y_12_8)
if (gr12_8_on == 2'd0)
		begin
		gr12_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_8_on == 2'd1)
		begin
		gr12_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_9 && sq2_y_next == gr_y_12_9)
if (gr12_9_on == 2'd0)
		begin
		gr12_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_9_on == 2'd1)
		begin
		gr12_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_10 && sq2_y_next == gr_y_12_10)
if (gr12_10_on == 2'd0)
		begin
		gr12_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_10_on == 2'd1)
		begin
		gr12_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_11 && sq2_y_next == gr_y_12_11)
if (gr12_11_on == 2'd0)
		begin
		gr12_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_11_on == 2'd1)
		begin
		gr12_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_12 && sq2_y_next == gr_y_12_12)
if (gr12_12_on == 2'd0)
		begin
		gr12_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_12_on == 2'd1)
		begin
		gr12_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_13 && sq2_y_next == gr_y_12_13)
if (gr12_13_on == 2'd0)
		begin
		gr12_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_13_on == 2'd1)
		begin
		gr12_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_14 && sq2_y_next == gr_y_12_14)
if (gr12_14_on == 2'd0)
		begin
		gr12_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_14_on == 2'd1)
		begin
		gr12_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_15 && sq2_y_next == gr_y_12_15)
if (gr12_15_on == 2'd0)
		begin
		gr12_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_15_on == 2'd1)
		begin
		gr12_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_16 && sq2_y_next == gr_y_12_16)
if (gr12_16_on == 2'd0)
		begin
		gr12_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_16_on == 2'd1)
		begin
		gr12_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_17 && sq2_y_next == gr_y_12_17)
if (gr12_17_on == 2'd0)
		begin
		gr12_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_17_on == 2'd1)
		begin
		gr12_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_18 && sq2_y_next == gr_y_12_18)
if (gr12_18_on == 2'd0)
		begin
		gr12_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_18_on == 2'd1)
		begin
		gr12_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_19 && sq2_y_next == gr_y_12_19)
if (gr12_19_on == 2'd0)
		begin
		gr12_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_19_on == 2'd1)
		begin
		gr12_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_20 && sq2_y_next == gr_y_12_20)
if (gr12_20_on == 2'd0)
		begin
		gr12_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_20_on == 2'd1)
		begin
		gr12_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_21 && sq2_y_next == gr_y_12_21)
if (gr12_21_on == 2'd0)
		begin
		gr12_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_21_on == 2'd1)
		begin
		gr12_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_22 && sq2_y_next == gr_y_12_22)
if (gr12_22_on == 2'd0)
		begin
		gr12_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_22_on == 2'd1)
		begin
		gr12_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_23 && sq2_y_next == gr_y_12_23)
if (gr12_23_on == 2'd0)
		begin
		gr12_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_23_on == 2'd1)
		begin
		gr12_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_12_24 && sq2_y_next == gr_y_12_24)
if (gr12_24_on == 2'd0)
		begin
		gr12_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr12_24_on == 2'd1)
		begin
		gr12_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_0 && sq2_y_next == gr_y_13_0)
if (gr13_0_on == 2'd0)
		begin
		gr13_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_0_on == 2'd1)
		begin
		gr13_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_1 && sq2_y_next == gr_y_13_1)
if (gr13_1_on == 2'd0)
		begin
		gr13_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_1_on == 2'd1)
		begin
		gr13_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_2 && sq2_y_next == gr_y_13_2)
if (gr13_2_on == 2'd0)
		begin
		gr13_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_2_on == 2'd1)
		begin
		gr13_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_3 && sq2_y_next == gr_y_13_3)
if (gr13_3_on == 2'd0)
		begin
		gr13_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_3_on == 2'd1)
		begin
		gr13_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_4 && sq2_y_next == gr_y_13_4)
if (gr13_4_on == 2'd0)
		begin
		gr13_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_4_on == 2'd1)
		begin
		gr13_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_5 && sq2_y_next == gr_y_13_5)
if (gr13_5_on == 2'd0)
		begin
		gr13_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_5_on == 2'd1)
		begin
		gr13_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_6 && sq2_y_next == gr_y_13_6)
if (gr13_6_on == 2'd0)
		begin
		gr13_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_6_on == 2'd1)
		begin
		gr13_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_7 && sq2_y_next == gr_y_13_7)
if (gr13_7_on == 2'd0)
		begin
		gr13_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_7_on == 2'd1)
		begin
		gr13_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_8 && sq2_y_next == gr_y_13_8)
if (gr13_8_on == 2'd0)
		begin
		gr13_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_8_on == 2'd1)
		begin
		gr13_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_9 && sq2_y_next == gr_y_13_9)
if (gr13_9_on == 2'd0)
		begin
		gr13_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_9_on == 2'd1)
		begin
		gr13_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_10 && sq2_y_next == gr_y_13_10)
if (gr13_10_on == 2'd0)
		begin
		gr13_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_10_on == 2'd1)
		begin
		gr13_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_11 && sq2_y_next == gr_y_13_11)
if (gr13_11_on == 2'd0)
		begin
		gr13_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_11_on == 2'd1)
		begin
		gr13_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_12 && sq2_y_next == gr_y_13_12)
if (gr13_12_on == 2'd0)
		begin
		gr13_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_12_on == 2'd1)
		begin
		gr13_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_13 && sq2_y_next == gr_y_13_13)
if (gr13_13_on == 2'd0)
		begin
		gr13_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_13_on == 2'd1)
		begin
		gr13_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_14 && sq2_y_next == gr_y_13_14)
if (gr13_14_on == 2'd0)
		begin
		gr13_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_14_on == 2'd1)
		begin
		gr13_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_15 && sq2_y_next == gr_y_13_15)
if (gr13_15_on == 2'd0)
		begin
		gr13_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_15_on == 2'd1)
		begin
		gr13_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_16 && sq2_y_next == gr_y_13_16)
if (gr13_16_on == 2'd0)
		begin
		gr13_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_16_on == 2'd1)
		begin
		gr13_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_17 && sq2_y_next == gr_y_13_17)
if (gr13_17_on == 2'd0)
		begin
		gr13_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_17_on == 2'd1)
		begin
		gr13_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_18 && sq2_y_next == gr_y_13_18)
if (gr13_18_on == 2'd0)
		begin
		gr13_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_18_on == 2'd1)
		begin
		gr13_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_19 && sq2_y_next == gr_y_13_19)
if (gr13_19_on == 2'd0)
		begin
		gr13_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_19_on == 2'd1)
		begin
		gr13_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_20 && sq2_y_next == gr_y_13_20)
if (gr13_20_on == 2'd0)
		begin
		gr13_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_20_on == 2'd1)
		begin
		gr13_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_21 && sq2_y_next == gr_y_13_21)
if (gr13_21_on == 2'd0)
		begin
		gr13_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_21_on == 2'd1)
		begin
		gr13_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_22 && sq2_y_next == gr_y_13_22)
if (gr13_22_on == 2'd0)
		begin
		gr13_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_22_on == 2'd1)
		begin
		gr13_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_23 && sq2_y_next == gr_y_13_23)
if (gr13_23_on == 2'd0)
		begin
		gr13_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_23_on == 2'd1)
		begin
		gr13_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_13_24 && sq2_y_next == gr_y_13_24)
if (gr13_24_on == 2'd0)
		begin
		gr13_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr13_24_on == 2'd1)
		begin
		gr13_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_0 && sq2_y_next == gr_y_14_0)
if (gr14_0_on == 2'd0)
		begin
		gr14_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_0_on == 2'd1)
		begin
		gr14_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_1 && sq2_y_next == gr_y_14_1)
if (gr14_1_on == 2'd0)
		begin
		gr14_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_1_on == 2'd1)
		begin
		gr14_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_2 && sq2_y_next == gr_y_14_2)
if (gr14_2_on == 2'd0)
		begin
		gr14_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_2_on == 2'd1)
		begin
		gr14_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_3 && sq2_y_next == gr_y_14_3)
if (gr14_3_on == 2'd0)
		begin
		gr14_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_3_on == 2'd1)
		begin
		gr14_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_4 && sq2_y_next == gr_y_14_4)
if (gr14_4_on == 2'd0)
		begin
		gr14_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_4_on == 2'd1)
		begin
		gr14_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_5 && sq2_y_next == gr_y_14_5)
if (gr14_5_on == 2'd0)
		begin
		gr14_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_5_on == 2'd1)
		begin
		gr14_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_6 && sq2_y_next == gr_y_14_6)
if (gr14_6_on == 2'd0)
		begin
		gr14_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_6_on == 2'd1)
		begin
		gr14_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_7 && sq2_y_next == gr_y_14_7)
if (gr14_7_on == 2'd0)
		begin
		gr14_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_7_on == 2'd1)
		begin
		gr14_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_8 && sq2_y_next == gr_y_14_8)
if (gr14_8_on == 2'd0)
		begin
		gr14_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_8_on == 2'd1)
		begin
		gr14_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_9 && sq2_y_next == gr_y_14_9)
if (gr14_9_on == 2'd0)
		begin
		gr14_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_9_on == 2'd1)
		begin
		gr14_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_10 && sq2_y_next == gr_y_14_10)
if (gr14_10_on == 2'd0)
		begin
		gr14_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_10_on == 2'd1)
		begin
		gr14_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_11 && sq2_y_next == gr_y_14_11)
if (gr14_11_on == 2'd0)
		begin
		gr14_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_11_on == 2'd1)
		begin
		gr14_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_12 && sq2_y_next == gr_y_14_12)
if (gr14_12_on == 2'd0)
		begin
		gr14_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_12_on == 2'd1)
		begin
		gr14_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_13 && sq2_y_next == gr_y_14_13)
if (gr14_13_on == 2'd0)
		begin
		gr14_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_13_on == 2'd1)
		begin
		gr14_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_14 && sq2_y_next == gr_y_14_14)
if (gr14_14_on == 2'd0)
		begin
		gr14_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_14_on == 2'd1)
		begin
		gr14_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_15 && sq2_y_next == gr_y_14_15)
if (gr14_15_on == 2'd0)
		begin
		gr14_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_15_on == 2'd1)
		begin
		gr14_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_16 && sq2_y_next == gr_y_14_16)
if (gr14_16_on == 2'd0)
		begin
		gr14_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_16_on == 2'd1)
		begin
		gr14_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_17 && sq2_y_next == gr_y_14_17)
if (gr14_17_on == 2'd0)
		begin
		gr14_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_17_on == 2'd1)
		begin
		gr14_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_18 && sq2_y_next == gr_y_14_18)
if (gr14_18_on == 2'd0)
		begin
		gr14_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_18_on == 2'd1)
		begin
		gr14_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_19 && sq2_y_next == gr_y_14_19)
if (gr14_19_on == 2'd0)
		begin
		gr14_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_19_on == 2'd1)
		begin
		gr14_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_20 && sq2_y_next == gr_y_14_20)
if (gr14_20_on == 2'd0)
		begin
		gr14_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_20_on == 2'd1)
		begin
		gr14_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_21 && sq2_y_next == gr_y_14_21)
if (gr14_21_on == 2'd0)
		begin
		gr14_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_21_on == 2'd1)
		begin
		gr14_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_22 && sq2_y_next == gr_y_14_22)
if (gr14_22_on == 2'd0)
		begin
		gr14_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_22_on == 2'd1)
		begin
		gr14_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_23 && sq2_y_next == gr_y_14_23)
if (gr14_23_on == 2'd0)
		begin
		gr14_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_23_on == 2'd1)
		begin
		gr14_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_14_24 && sq2_y_next == gr_y_14_24)
if (gr14_24_on == 2'd0)
		begin
		gr14_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr14_24_on == 2'd1)
		begin
		gr14_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_0 && sq2_y_next == gr_y_15_0)
if (gr15_0_on == 2'd0)
		begin
		gr15_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_0_on == 2'd1)
		begin
		gr15_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_1 && sq2_y_next == gr_y_15_1)
if (gr15_1_on == 2'd0)
		begin
		gr15_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_1_on == 2'd1)
		begin
		gr15_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_2 && sq2_y_next == gr_y_15_2)
if (gr15_2_on == 2'd0)
		begin
		gr15_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_2_on == 2'd1)
		begin
		gr15_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_3 && sq2_y_next == gr_y_15_3)
if (gr15_3_on == 2'd0)
		begin
		gr15_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_3_on == 2'd1)
		begin
		gr15_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_4 && sq2_y_next == gr_y_15_4)
if (gr15_4_on == 2'd0)
		begin
		gr15_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_4_on == 2'd1)
		begin
		gr15_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_5 && sq2_y_next == gr_y_15_5)
if (gr15_5_on == 2'd0)
		begin
		gr15_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_5_on == 2'd1)
		begin
		gr15_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_6 && sq2_y_next == gr_y_15_6)
if (gr15_6_on == 2'd0)
		begin
		gr15_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_6_on == 2'd1)
		begin
		gr15_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_7 && sq2_y_next == gr_y_15_7)
if (gr15_7_on == 2'd0)
		begin
		gr15_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_7_on == 2'd1)
		begin
		gr15_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_8 && sq2_y_next == gr_y_15_8)
if (gr15_8_on == 2'd0)
		begin
		gr15_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_8_on == 2'd1)
		begin
		gr15_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_9 && sq2_y_next == gr_y_15_9)
if (gr15_9_on == 2'd0)
		begin
		gr15_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_9_on == 2'd1)
		begin
		gr15_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_10 && sq2_y_next == gr_y_15_10)
if (gr15_10_on == 2'd0)
		begin
		gr15_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_10_on == 2'd1)
		begin
		gr15_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_11 && sq2_y_next == gr_y_15_11)
if (gr15_11_on == 2'd0)
		begin
		gr15_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_11_on == 2'd1)
		begin
		gr15_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_12 && sq2_y_next == gr_y_15_12)
if (gr15_12_on == 2'd0)
		begin
		gr15_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_12_on == 2'd1)
		begin
		gr15_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_13 && sq2_y_next == gr_y_15_13)
if (gr15_13_on == 2'd0)
		begin
		gr15_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_13_on == 2'd1)
		begin
		gr15_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_14 && sq2_y_next == gr_y_15_14)
if (gr15_14_on == 2'd0)
		begin
		gr15_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_14_on == 2'd1)
		begin
		gr15_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_15 && sq2_y_next == gr_y_15_15)
if (gr15_15_on == 2'd0)
		begin
		gr15_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_15_on == 2'd1)
		begin
		gr15_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_16 && sq2_y_next == gr_y_15_16)
if (gr15_16_on == 2'd0)
		begin
		gr15_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_16_on == 2'd1)
		begin
		gr15_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_17 && sq2_y_next == gr_y_15_17)
if (gr15_17_on == 2'd0)
		begin
		gr15_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_17_on == 2'd1)
		begin
		gr15_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_18 && sq2_y_next == gr_y_15_18)
if (gr15_18_on == 2'd0)
		begin
		gr15_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_18_on == 2'd1)
		begin
		gr15_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_19 && sq2_y_next == gr_y_15_19)
if (gr15_19_on == 2'd0)
		begin
		gr15_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_19_on == 2'd1)
		begin
		gr15_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_20 && sq2_y_next == gr_y_15_20)
if (gr15_20_on == 2'd0)
		begin
		gr15_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_20_on == 2'd1)
		begin
		gr15_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_21 && sq2_y_next == gr_y_15_21)
if (gr15_21_on == 2'd0)
		begin
		gr15_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_21_on == 2'd1)
		begin
		gr15_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_22 && sq2_y_next == gr_y_15_22)
if (gr15_22_on == 2'd0)
		begin
		gr15_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_22_on == 2'd1)
		begin
		gr15_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_23 && sq2_y_next == gr_y_15_23)
if (gr15_23_on == 2'd0)
		begin
		gr15_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_23_on == 2'd1)
		begin
		gr15_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_15_24 && sq2_y_next == gr_y_15_24)
if (gr15_24_on == 2'd0)
		begin
		gr15_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr15_24_on == 2'd1)
		begin
		gr15_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_0 && sq2_y_next == gr_y_16_0)
if (gr16_0_on == 2'd0)
		begin
		gr16_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_0_on == 2'd1)
		begin
		gr16_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_1 && sq2_y_next == gr_y_16_1)
if (gr16_1_on == 2'd0)
		begin
		gr16_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_1_on == 2'd1)
		begin
		gr16_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_2 && sq2_y_next == gr_y_16_2)
if (gr16_2_on == 2'd0)
		begin
		gr16_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_2_on == 2'd1)
		begin
		gr16_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_3 && sq2_y_next == gr_y_16_3)
if (gr16_3_on == 2'd0)
		begin
		gr16_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_3_on == 2'd1)
		begin
		gr16_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_4 && sq2_y_next == gr_y_16_4)
if (gr16_4_on == 2'd0)
		begin
		gr16_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_4_on == 2'd1)
		begin
		gr16_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_5 && sq2_y_next == gr_y_16_5)
if (gr16_5_on == 2'd0)
		begin
		gr16_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_5_on == 2'd1)
		begin
		gr16_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_6 && sq2_y_next == gr_y_16_6)
if (gr16_6_on == 2'd0)
		begin
		gr16_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_6_on == 2'd1)
		begin
		gr16_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_7 && sq2_y_next == gr_y_16_7)
if (gr16_7_on == 2'd0)
		begin
		gr16_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_7_on == 2'd1)
		begin
		gr16_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_8 && sq2_y_next == gr_y_16_8)
if (gr16_8_on == 2'd0)
		begin
		gr16_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_8_on == 2'd1)
		begin
		gr16_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_9 && sq2_y_next == gr_y_16_9)
if (gr16_9_on == 2'd0)
		begin
		gr16_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_9_on == 2'd1)
		begin
		gr16_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_10 && sq2_y_next == gr_y_16_10)
if (gr16_10_on == 2'd0)
		begin
		gr16_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_10_on == 2'd1)
		begin
		gr16_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_11 && sq2_y_next == gr_y_16_11)
if (gr16_11_on == 2'd0)
		begin
		gr16_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_11_on == 2'd1)
		begin
		gr16_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_12 && sq2_y_next == gr_y_16_12)
if (gr16_12_on == 2'd0)
		begin
		gr16_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_12_on == 2'd1)
		begin
		gr16_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_13 && sq2_y_next == gr_y_16_13)
if (gr16_13_on == 2'd0)
		begin
		gr16_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_13_on == 2'd1)
		begin
		gr16_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_14 && sq2_y_next == gr_y_16_14)
if (gr16_14_on == 2'd0)
		begin
		gr16_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_14_on == 2'd1)
		begin
		gr16_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_15 && sq2_y_next == gr_y_16_15)
if (gr16_15_on == 2'd0)
		begin
		gr16_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_15_on == 2'd1)
		begin
		gr16_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_16 && sq2_y_next == gr_y_16_16)
if (gr16_16_on == 2'd0)
		begin
		gr16_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_16_on == 2'd1)
		begin
		gr16_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_17 && sq2_y_next == gr_y_16_17)
if (gr16_17_on == 2'd0)
		begin
		gr16_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_17_on == 2'd1)
		begin
		gr16_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_18 && sq2_y_next == gr_y_16_18)
if (gr16_18_on == 2'd0)
		begin
		gr16_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_18_on == 2'd1)
		begin
		gr16_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_19 && sq2_y_next == gr_y_16_19)
if (gr16_19_on == 2'd0)
		begin
		gr16_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_19_on == 2'd1)
		begin
		gr16_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_20 && sq2_y_next == gr_y_16_20)
if (gr16_20_on == 2'd0)
		begin
		gr16_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_20_on == 2'd1)
		begin
		gr16_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_21 && sq2_y_next == gr_y_16_21)
if (gr16_21_on == 2'd0)
		begin
		gr16_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_21_on == 2'd1)
		begin
		gr16_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_22 && sq2_y_next == gr_y_16_22)
if (gr16_22_on == 2'd0)
		begin
		gr16_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_22_on == 2'd1)
		begin
		gr16_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_23 && sq2_y_next == gr_y_16_23)
if (gr16_23_on == 2'd0)
		begin
		gr16_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_23_on == 2'd1)
		begin
		gr16_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_16_24 && sq2_y_next == gr_y_16_24)
if (gr16_24_on == 2'd0)
		begin
		gr16_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr16_24_on == 2'd1)
		begin
		gr16_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_0 && sq2_y_next == gr_y_17_0)
if (gr17_0_on == 2'd0)
		begin
		gr17_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_0_on == 2'd1)
		begin
		gr17_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_1 && sq2_y_next == gr_y_17_1)
if (gr17_1_on == 2'd0)
		begin
		gr17_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_1_on == 2'd1)
		begin
		gr17_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_2 && sq2_y_next == gr_y_17_2)
if (gr17_2_on == 2'd0)
		begin
		gr17_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_2_on == 2'd1)
		begin
		gr17_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_3 && sq2_y_next == gr_y_17_3)
if (gr17_3_on == 2'd0)
		begin
		gr17_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_3_on == 2'd1)
		begin
		gr17_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_4 && sq2_y_next == gr_y_17_4)
if (gr17_4_on == 2'd0)
		begin
		gr17_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_4_on == 2'd1)
		begin
		gr17_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_5 && sq2_y_next == gr_y_17_5)
if (gr17_5_on == 2'd0)
		begin
		gr17_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_5_on == 2'd1)
		begin
		gr17_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_6 && sq2_y_next == gr_y_17_6)
if (gr17_6_on == 2'd0)
		begin
		gr17_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_6_on == 2'd1)
		begin
		gr17_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_7 && sq2_y_next == gr_y_17_7)
if (gr17_7_on == 2'd0)
		begin
		gr17_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_7_on == 2'd1)
		begin
		gr17_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_8 && sq2_y_next == gr_y_17_8)
if (gr17_8_on == 2'd0)
		begin
		gr17_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_8_on == 2'd1)
		begin
		gr17_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_9 && sq2_y_next == gr_y_17_9)
if (gr17_9_on == 2'd0)
		begin
		gr17_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_9_on == 2'd1)
		begin
		gr17_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_10 && sq2_y_next == gr_y_17_10)
if (gr17_10_on == 2'd0)
		begin
		gr17_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_10_on == 2'd1)
		begin
		gr17_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_11 && sq2_y_next == gr_y_17_11)
if (gr17_11_on == 2'd0)
		begin
		gr17_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_11_on == 2'd1)
		begin
		gr17_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_12 && sq2_y_next == gr_y_17_12)
if (gr17_12_on == 2'd0)
		begin
		gr17_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_12_on == 2'd1)
		begin
		gr17_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_13 && sq2_y_next == gr_y_17_13)
if (gr17_13_on == 2'd0)
		begin
		gr17_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_13_on == 2'd1)
		begin
		gr17_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_14 && sq2_y_next == gr_y_17_14)
if (gr17_14_on == 2'd0)
		begin
		gr17_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_14_on == 2'd1)
		begin
		gr17_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_15 && sq2_y_next == gr_y_17_15)
if (gr17_15_on == 2'd0)
		begin
		gr17_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_15_on == 2'd1)
		begin
		gr17_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_16 && sq2_y_next == gr_y_17_16)
if (gr17_16_on == 2'd0)
		begin
		gr17_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_16_on == 2'd1)
		begin
		gr17_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_17 && sq2_y_next == gr_y_17_17)
if (gr17_17_on == 2'd0)
		begin
		gr17_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_17_on == 2'd1)
		begin
		gr17_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_18 && sq2_y_next == gr_y_17_18)
if (gr17_18_on == 2'd0)
		begin
		gr17_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_18_on == 2'd1)
		begin
		gr17_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_19 && sq2_y_next == gr_y_17_19)
if (gr17_19_on == 2'd0)
		begin
		gr17_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_19_on == 2'd1)
		begin
		gr17_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_20 && sq2_y_next == gr_y_17_20)
if (gr17_20_on == 2'd0)
		begin
		gr17_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_20_on == 2'd1)
		begin
		gr17_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_21 && sq2_y_next == gr_y_17_21)
if (gr17_21_on == 2'd0)
		begin
		gr17_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_21_on == 2'd1)
		begin
		gr17_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_22 && sq2_y_next == gr_y_17_22)
if (gr17_22_on == 2'd0)
		begin
		gr17_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_22_on == 2'd1)
		begin
		gr17_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_23 && sq2_y_next == gr_y_17_23)
if (gr17_23_on == 2'd0)
		begin
		gr17_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_23_on == 2'd1)
		begin
		gr17_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_17_24 && sq2_y_next == gr_y_17_24)
if (gr17_24_on == 2'd0)
		begin
		gr17_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr17_24_on == 2'd1)
		begin
		gr17_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_0 && sq2_y_next == gr_y_18_0)
if (gr18_0_on == 2'd0)
		begin
		gr18_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_0_on == 2'd1)
		begin
		gr18_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_1 && sq2_y_next == gr_y_18_1)
if (gr18_1_on == 2'd0)
		begin
		gr18_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_1_on == 2'd1)
		begin
		gr18_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_2 && sq2_y_next == gr_y_18_2)
if (gr18_2_on == 2'd0)
		begin
		gr18_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_2_on == 2'd1)
		begin
		gr18_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_3 && sq2_y_next == gr_y_18_3)
if (gr18_3_on == 2'd0)
		begin
		gr18_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_3_on == 2'd1)
		begin
		gr18_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_4 && sq2_y_next == gr_y_18_4)
if (gr18_4_on == 2'd0)
		begin
		gr18_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_4_on == 2'd1)
		begin
		gr18_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_5 && sq2_y_next == gr_y_18_5)
if (gr18_5_on == 2'd0)
		begin
		gr18_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_5_on == 2'd1)
		begin
		gr18_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_6 && sq2_y_next == gr_y_18_6)
if (gr18_6_on == 2'd0)
		begin
		gr18_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_6_on == 2'd1)
		begin
		gr18_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_7 && sq2_y_next == gr_y_18_7)
if (gr18_7_on == 2'd0)
		begin
		gr18_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_7_on == 2'd1)
		begin
		gr18_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_8 && sq2_y_next == gr_y_18_8)
if (gr18_8_on == 2'd0)
		begin
		gr18_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_8_on == 2'd1)
		begin
		gr18_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_9 && sq2_y_next == gr_y_18_9)
if (gr18_9_on == 2'd0)
		begin
		gr18_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_9_on == 2'd1)
		begin
		gr18_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_10 && sq2_y_next == gr_y_18_10)
if (gr18_10_on == 2'd0)
		begin
		gr18_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_10_on == 2'd1)
		begin
		gr18_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_11 && sq2_y_next == gr_y_18_11)
if (gr18_11_on == 2'd0)
		begin
		gr18_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_11_on == 2'd1)
		begin
		gr18_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_12 && sq2_y_next == gr_y_18_12)
if (gr18_12_on == 2'd0)
		begin
		gr18_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_12_on == 2'd1)
		begin
		gr18_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_13 && sq2_y_next == gr_y_18_13)
if (gr18_13_on == 2'd0)
		begin
		gr18_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_13_on == 2'd1)
		begin
		gr18_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_14 && sq2_y_next == gr_y_18_14)
if (gr18_14_on == 2'd0)
		begin
		gr18_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_14_on == 2'd1)
		begin
		gr18_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_15 && sq2_y_next == gr_y_18_15)
if (gr18_15_on == 2'd0)
		begin
		gr18_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_15_on == 2'd1)
		begin
		gr18_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_16 && sq2_y_next == gr_y_18_16)
if (gr18_16_on == 2'd0)
		begin
		gr18_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_16_on == 2'd1)
		begin
		gr18_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_17 && sq2_y_next == gr_y_18_17)
if (gr18_17_on == 2'd0)
		begin
		gr18_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_17_on == 2'd1)
		begin
		gr18_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_18 && sq2_y_next == gr_y_18_18)
if (gr18_18_on == 2'd0)
		begin
		gr18_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_18_on == 2'd1)
		begin
		gr18_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_19 && sq2_y_next == gr_y_18_19)
if (gr18_19_on == 2'd0)
		begin
		gr18_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_19_on == 2'd1)
		begin
		gr18_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_20 && sq2_y_next == gr_y_18_20)
if (gr18_20_on == 2'd0)
		begin
		gr18_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_20_on == 2'd1)
		begin
		gr18_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_21 && sq2_y_next == gr_y_18_21)
if (gr18_21_on == 2'd0)
		begin
		gr18_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_21_on == 2'd1)
		begin
		gr18_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_22 && sq2_y_next == gr_y_18_22)
if (gr18_22_on == 2'd0)
		begin
		gr18_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_22_on == 2'd1)
		begin
		gr18_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_23 && sq2_y_next == gr_y_18_23)
if (gr18_23_on == 2'd0)
		begin
		gr18_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_23_on == 2'd1)
		begin
		gr18_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_18_24 && sq2_y_next == gr_y_18_24)
if (gr18_24_on == 2'd0)
		begin
		gr18_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr18_24_on == 2'd1)
		begin
		gr18_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_0 && sq2_y_next == gr_y_19_0)
if (gr19_0_on == 2'd0)
		begin
		gr19_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_0_on == 2'd1)
		begin
		gr19_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_1 && sq2_y_next == gr_y_19_1)
if (gr19_1_on == 2'd0)
		begin
		gr19_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_1_on == 2'd1)
		begin
		gr19_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_2 && sq2_y_next == gr_y_19_2)
if (gr19_2_on == 2'd0)
		begin
		gr19_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_2_on == 2'd1)
		begin
		gr19_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_3 && sq2_y_next == gr_y_19_3)
if (gr19_3_on == 2'd0)
		begin
		gr19_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_3_on == 2'd1)
		begin
		gr19_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_4 && sq2_y_next == gr_y_19_4)
if (gr19_4_on == 2'd0)
		begin
		gr19_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_4_on == 2'd1)
		begin
		gr19_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_5 && sq2_y_next == gr_y_19_5)
if (gr19_5_on == 2'd0)
		begin
		gr19_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_5_on == 2'd1)
		begin
		gr19_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_6 && sq2_y_next == gr_y_19_6)
if (gr19_6_on == 2'd0)
		begin
		gr19_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_6_on == 2'd1)
		begin
		gr19_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_7 && sq2_y_next == gr_y_19_7)
if (gr19_7_on == 2'd0)
		begin
		gr19_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_7_on == 2'd1)
		begin
		gr19_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_8 && sq2_y_next == gr_y_19_8)
if (gr19_8_on == 2'd0)
		begin
		gr19_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_8_on == 2'd1)
		begin
		gr19_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_9 && sq2_y_next == gr_y_19_9)
if (gr19_9_on == 2'd0)
		begin
		gr19_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_9_on == 2'd1)
		begin
		gr19_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_10 && sq2_y_next == gr_y_19_10)
if (gr19_10_on == 2'd0)
		begin
		gr19_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_10_on == 2'd1)
		begin
		gr19_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_11 && sq2_y_next == gr_y_19_11)
if (gr19_11_on == 2'd0)
		begin
		gr19_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_11_on == 2'd1)
		begin
		gr19_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_12 && sq2_y_next == gr_y_19_12)
if (gr19_12_on == 2'd0)
		begin
		gr19_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_12_on == 2'd1)
		begin
		gr19_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_13 && sq2_y_next == gr_y_19_13)
if (gr19_13_on == 2'd0)
		begin
		gr19_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_13_on == 2'd1)
		begin
		gr19_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_14 && sq2_y_next == gr_y_19_14)
if (gr19_14_on == 2'd0)
		begin
		gr19_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_14_on == 2'd1)
		begin
		gr19_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_15 && sq2_y_next == gr_y_19_15)
if (gr19_15_on == 2'd0)
		begin
		gr19_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_15_on == 2'd1)
		begin
		gr19_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_16 && sq2_y_next == gr_y_19_16)
if (gr19_16_on == 2'd0)
		begin
		gr19_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_16_on == 2'd1)
		begin
		gr19_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_17 && sq2_y_next == gr_y_19_17)
if (gr19_17_on == 2'd0)
		begin
		gr19_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_17_on == 2'd1)
		begin
		gr19_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_18 && sq2_y_next == gr_y_19_18)
if (gr19_18_on == 2'd0)
		begin
		gr19_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_18_on == 2'd1)
		begin
		gr19_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_19 && sq2_y_next == gr_y_19_19)
if (gr19_19_on == 2'd0)
		begin
		gr19_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_19_on == 2'd1)
		begin
		gr19_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_20 && sq2_y_next == gr_y_19_20)
if (gr19_20_on == 2'd0)
		begin
		gr19_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_20_on == 2'd1)
		begin
		gr19_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_21 && sq2_y_next == gr_y_19_21)
if (gr19_21_on == 2'd0)
		begin
		gr19_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_21_on == 2'd1)
		begin
		gr19_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_22 && sq2_y_next == gr_y_19_22)
if (gr19_22_on == 2'd0)
		begin
		gr19_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_22_on == 2'd1)
		begin
		gr19_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_23 && sq2_y_next == gr_y_19_23)
if (gr19_23_on == 2'd0)
		begin
		gr19_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_23_on == 2'd1)
		begin
		gr19_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_19_24 && sq2_y_next == gr_y_19_24)
if (gr19_24_on == 2'd0)
		begin
		gr19_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr19_24_on == 2'd1)
		begin
		gr19_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_0 && sq2_y_next == gr_y_20_0)
if (gr20_0_on == 2'd0)
		begin
		gr20_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_0_on == 2'd1)
		begin
		gr20_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_1 && sq2_y_next == gr_y_20_1)
if (gr20_1_on == 2'd0)
		begin
		gr20_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_1_on == 2'd1)
		begin
		gr20_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_2 && sq2_y_next == gr_y_20_2)
if (gr20_2_on == 2'd0)
		begin
		gr20_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_2_on == 2'd1)
		begin
		gr20_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_3 && sq2_y_next == gr_y_20_3)
if (gr20_3_on == 2'd0)
		begin
		gr20_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_3_on == 2'd1)
		begin
		gr20_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_4 && sq2_y_next == gr_y_20_4)
if (gr20_4_on == 2'd0)
		begin
		gr20_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_4_on == 2'd1)
		begin
		gr20_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_5 && sq2_y_next == gr_y_20_5)
if (gr20_5_on == 2'd0)
		begin
		gr20_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_5_on == 2'd1)
		begin
		gr20_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_6 && sq2_y_next == gr_y_20_6)
if (gr20_6_on == 2'd0)
		begin
		gr20_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_6_on == 2'd1)
		begin
		gr20_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_7 && sq2_y_next == gr_y_20_7)
if (gr20_7_on == 2'd0)
		begin
		gr20_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_7_on == 2'd1)
		begin
		gr20_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_8 && sq2_y_next == gr_y_20_8)
if (gr20_8_on == 2'd0)
		begin
		gr20_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_8_on == 2'd1)
		begin
		gr20_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_9 && sq2_y_next == gr_y_20_9)
if (gr20_9_on == 2'd0)
		begin
		gr20_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_9_on == 2'd1)
		begin
		gr20_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_10 && sq2_y_next == gr_y_20_10)
if (gr20_10_on == 2'd0)
		begin
		gr20_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_10_on == 2'd1)
		begin
		gr20_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_11 && sq2_y_next == gr_y_20_11)
if (gr20_11_on == 2'd0)
		begin
		gr20_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_11_on == 2'd1)
		begin
		gr20_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_12 && sq2_y_next == gr_y_20_12)
if (gr20_12_on == 2'd0)
		begin
		gr20_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_12_on == 2'd1)
		begin
		gr20_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_13 && sq2_y_next == gr_y_20_13)
if (gr20_13_on == 2'd0)
		begin
		gr20_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_13_on == 2'd1)
		begin
		gr20_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_14 && sq2_y_next == gr_y_20_14)
if (gr20_14_on == 2'd0)
		begin
		gr20_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_14_on == 2'd1)
		begin
		gr20_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_15 && sq2_y_next == gr_y_20_15)
if (gr20_15_on == 2'd0)
		begin
		gr20_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_15_on == 2'd1)
		begin
		gr20_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_16 && sq2_y_next == gr_y_20_16)
if (gr20_16_on == 2'd0)
		begin
		gr20_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_16_on == 2'd1)
		begin
		gr20_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_17 && sq2_y_next == gr_y_20_17)
if (gr20_17_on == 2'd0)
		begin
		gr20_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_17_on == 2'd1)
		begin
		gr20_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_18 && sq2_y_next == gr_y_20_18)
if (gr20_18_on == 2'd0)
		begin
		gr20_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_18_on == 2'd1)
		begin
		gr20_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_19 && sq2_y_next == gr_y_20_19)
if (gr20_19_on == 2'd0)
		begin
		gr20_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_19_on == 2'd1)
		begin
		gr20_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_20 && sq2_y_next == gr_y_20_20)
if (gr20_20_on == 2'd0)
		begin
		gr20_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_20_on == 2'd1)
		begin
		gr20_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_21 && sq2_y_next == gr_y_20_21)
if (gr20_21_on == 2'd0)
		begin
		gr20_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_21_on == 2'd1)
		begin
		gr20_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_22 && sq2_y_next == gr_y_20_22)
if (gr20_22_on == 2'd0)
		begin
		gr20_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_22_on == 2'd1)
		begin
		gr20_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_23 && sq2_y_next == gr_y_20_23)
if (gr20_23_on == 2'd0)
		begin
		gr20_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_23_on == 2'd1)
		begin
		gr20_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_20_24 && sq2_y_next == gr_y_20_24)
if (gr20_24_on == 2'd0)
		begin
		gr20_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr20_24_on == 2'd1)
		begin
		gr20_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_0 && sq2_y_next == gr_y_21_0)
if (gr21_0_on == 2'd0)
		begin
		gr21_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_0_on == 2'd1)
		begin
		gr21_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_1 && sq2_y_next == gr_y_21_1)
if (gr21_1_on == 2'd0)
		begin
		gr21_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_1_on == 2'd1)
		begin
		gr21_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_2 && sq2_y_next == gr_y_21_2)
if (gr21_2_on == 2'd0)
		begin
		gr21_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_2_on == 2'd1)
		begin
		gr21_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_3 && sq2_y_next == gr_y_21_3)
if (gr21_3_on == 2'd0)
		begin
		gr21_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_3_on == 2'd1)
		begin
		gr21_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_4 && sq2_y_next == gr_y_21_4)
if (gr21_4_on == 2'd0)
		begin
		gr21_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_4_on == 2'd1)
		begin
		gr21_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_5 && sq2_y_next == gr_y_21_5)
if (gr21_5_on == 2'd0)
		begin
		gr21_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_5_on == 2'd1)
		begin
		gr21_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_6 && sq2_y_next == gr_y_21_6)
if (gr21_6_on == 2'd0)
		begin
		gr21_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_6_on == 2'd1)
		begin
		gr21_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_7 && sq2_y_next == gr_y_21_7)
if (gr21_7_on == 2'd0)
		begin
		gr21_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_7_on == 2'd1)
		begin
		gr21_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_8 && sq2_y_next == gr_y_21_8)
if (gr21_8_on == 2'd0)
		begin
		gr21_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_8_on == 2'd1)
		begin
		gr21_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_9 && sq2_y_next == gr_y_21_9)
if (gr21_9_on == 2'd0)
		begin
		gr21_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_9_on == 2'd1)
		begin
		gr21_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_10 && sq2_y_next == gr_y_21_10)
if (gr21_10_on == 2'd0)
		begin
		gr21_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_10_on == 2'd1)
		begin
		gr21_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_11 && sq2_y_next == gr_y_21_11)
if (gr21_11_on == 2'd0)
		begin
		gr21_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_11_on == 2'd1)
		begin
		gr21_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_12 && sq2_y_next == gr_y_21_12)
if (gr21_12_on == 2'd0)
		begin
		gr21_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_12_on == 2'd1)
		begin
		gr21_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_13 && sq2_y_next == gr_y_21_13)
if (gr21_13_on == 2'd0)
		begin
		gr21_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_13_on == 2'd1)
		begin
		gr21_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_14 && sq2_y_next == gr_y_21_14)
if (gr21_14_on == 2'd0)
		begin
		gr21_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_14_on == 2'd1)
		begin
		gr21_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_15 && sq2_y_next == gr_y_21_15)
if (gr21_15_on == 2'd0)
		begin
		gr21_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_15_on == 2'd1)
		begin
		gr21_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_16 && sq2_y_next == gr_y_21_16)
if (gr21_16_on == 2'd0)
		begin
		gr21_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_16_on == 2'd1)
		begin
		gr21_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_17 && sq2_y_next == gr_y_21_17)
if (gr21_17_on == 2'd0)
		begin
		gr21_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_17_on == 2'd1)
		begin
		gr21_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_18 && sq2_y_next == gr_y_21_18)
if (gr21_18_on == 2'd0)
		begin
		gr21_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_18_on == 2'd1)
		begin
		gr21_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_19 && sq2_y_next == gr_y_21_19)
if (gr21_19_on == 2'd0)
		begin
		gr21_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_19_on == 2'd1)
		begin
		gr21_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_20 && sq2_y_next == gr_y_21_20)
if (gr21_20_on == 2'd0)
		begin
		gr21_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_20_on == 2'd1)
		begin
		gr21_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_21 && sq2_y_next == gr_y_21_21)
if (gr21_21_on == 2'd0)
		begin
		gr21_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_21_on == 2'd1)
		begin
		gr21_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_22 && sq2_y_next == gr_y_21_22)
if (gr21_22_on == 2'd0)
		begin
		gr21_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_22_on == 2'd1)
		begin
		gr21_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_23 && sq2_y_next == gr_y_21_23)
if (gr21_23_on == 2'd0)
		begin
		gr21_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_23_on == 2'd1)
		begin
		gr21_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_21_24 && sq2_y_next == gr_y_21_24)
if (gr21_24_on == 2'd0)
		begin
		gr21_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr21_24_on == 2'd1)
		begin
		gr21_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_0 && sq2_y_next == gr_y_22_0)
if (gr22_0_on == 2'd0)
		begin
		gr22_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_0_on == 2'd1)
		begin
		gr22_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_1 && sq2_y_next == gr_y_22_1)
if (gr22_1_on == 2'd0)
		begin
		gr22_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_1_on == 2'd1)
		begin
		gr22_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_2 && sq2_y_next == gr_y_22_2)
if (gr22_2_on == 2'd0)
		begin
		gr22_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_2_on == 2'd1)
		begin
		gr22_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_3 && sq2_y_next == gr_y_22_3)
if (gr22_3_on == 2'd0)
		begin
		gr22_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_3_on == 2'd1)
		begin
		gr22_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_4 && sq2_y_next == gr_y_22_4)
if (gr22_4_on == 2'd0)
		begin
		gr22_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_4_on == 2'd1)
		begin
		gr22_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_5 && sq2_y_next == gr_y_22_5)
if (gr22_5_on == 2'd0)
		begin
		gr22_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_5_on == 2'd1)
		begin
		gr22_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_6 && sq2_y_next == gr_y_22_6)
if (gr22_6_on == 2'd0)
		begin
		gr22_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_6_on == 2'd1)
		begin
		gr22_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_7 && sq2_y_next == gr_y_22_7)
if (gr22_7_on == 2'd0)
		begin
		gr22_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_7_on == 2'd1)
		begin
		gr22_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_8 && sq2_y_next == gr_y_22_8)
if (gr22_8_on == 2'd0)
		begin
		gr22_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_8_on == 2'd1)
		begin
		gr22_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_9 && sq2_y_next == gr_y_22_9)
if (gr22_9_on == 2'd0)
		begin
		gr22_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_9_on == 2'd1)
		begin
		gr22_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_10 && sq2_y_next == gr_y_22_10)
if (gr22_10_on == 2'd0)
		begin
		gr22_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_10_on == 2'd1)
		begin
		gr22_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_11 && sq2_y_next == gr_y_22_11)
if (gr22_11_on == 2'd0)
		begin
		gr22_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_11_on == 2'd1)
		begin
		gr22_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_12 && sq2_y_next == gr_y_22_12)
if (gr22_12_on == 2'd0)
		begin
		gr22_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_12_on == 2'd1)
		begin
		gr22_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_13 && sq2_y_next == gr_y_22_13)
if (gr22_13_on == 2'd0)
		begin
		gr22_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_13_on == 2'd1)
		begin
		gr22_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_14 && sq2_y_next == gr_y_22_14)
if (gr22_14_on == 2'd0)
		begin
		gr22_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_14_on == 2'd1)
		begin
		gr22_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_15 && sq2_y_next == gr_y_22_15)
if (gr22_15_on == 2'd0)
		begin
		gr22_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_15_on == 2'd1)
		begin
		gr22_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_16 && sq2_y_next == gr_y_22_16)
if (gr22_16_on == 2'd0)
		begin
		gr22_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_16_on == 2'd1)
		begin
		gr22_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_17 && sq2_y_next == gr_y_22_17)
if (gr22_17_on == 2'd0)
		begin
		gr22_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_17_on == 2'd1)
		begin
		gr22_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_18 && sq2_y_next == gr_y_22_18)
if (gr22_18_on == 2'd0)
		begin
		gr22_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_18_on == 2'd1)
		begin
		gr22_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_19 && sq2_y_next == gr_y_22_19)
if (gr22_19_on == 2'd0)
		begin
		gr22_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_19_on == 2'd1)
		begin
		gr22_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_20 && sq2_y_next == gr_y_22_20)
if (gr22_20_on == 2'd0)
		begin
		gr22_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_20_on == 2'd1)
		begin
		gr22_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_21 && sq2_y_next == gr_y_22_21)
if (gr22_21_on == 2'd0)
		begin
		gr22_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_21_on == 2'd1)
		begin
		gr22_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_22 && sq2_y_next == gr_y_22_22)
if (gr22_22_on == 2'd0)
		begin
		gr22_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_22_on == 2'd1)
		begin
		gr22_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_23 && sq2_y_next == gr_y_22_23)
if (gr22_23_on == 2'd0)
		begin
		gr22_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_23_on == 2'd1)
		begin
		gr22_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_22_24 && sq2_y_next == gr_y_22_24)
if (gr22_24_on == 2'd0)
		begin
		gr22_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr22_24_on == 2'd1)
		begin
		gr22_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_0 && sq2_y_next == gr_y_23_0)
if (gr23_0_on == 2'd0)
		begin
		gr23_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_0_on == 2'd1)
		begin
		gr23_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_1 && sq2_y_next == gr_y_23_1)
if (gr23_1_on == 2'd0)
		begin
		gr23_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_1_on == 2'd1)
		begin
		gr23_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_2 && sq2_y_next == gr_y_23_2)
if (gr23_2_on == 2'd0)
		begin
		gr23_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_2_on == 2'd1)
		begin
		gr23_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_3 && sq2_y_next == gr_y_23_3)
if (gr23_3_on == 2'd0)
		begin
		gr23_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_3_on == 2'd1)
		begin
		gr23_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_4 && sq2_y_next == gr_y_23_4)
if (gr23_4_on == 2'd0)
		begin
		gr23_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_4_on == 2'd1)
		begin
		gr23_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_5 && sq2_y_next == gr_y_23_5)
if (gr23_5_on == 2'd0)
		begin
		gr23_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_5_on == 2'd1)
		begin
		gr23_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_6 && sq2_y_next == gr_y_23_6)
if (gr23_6_on == 2'd0)
		begin
		gr23_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_6_on == 2'd1)
		begin
		gr23_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_7 && sq2_y_next == gr_y_23_7)
if (gr23_7_on == 2'd0)
		begin
		gr23_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_7_on == 2'd1)
		begin
		gr23_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_8 && sq2_y_next == gr_y_23_8)
if (gr23_8_on == 2'd0)
		begin
		gr23_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_8_on == 2'd1)
		begin
		gr23_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_9 && sq2_y_next == gr_y_23_9)
if (gr23_9_on == 2'd0)
		begin
		gr23_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_9_on == 2'd1)
		begin
		gr23_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_10 && sq2_y_next == gr_y_23_10)
if (gr23_10_on == 2'd0)
		begin
		gr23_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_10_on == 2'd1)
		begin
		gr23_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_11 && sq2_y_next == gr_y_23_11)
if (gr23_11_on == 2'd0)
		begin
		gr23_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_11_on == 2'd1)
		begin
		gr23_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_12 && sq2_y_next == gr_y_23_12)
if (gr23_12_on == 2'd0)
		begin
		gr23_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_12_on == 2'd1)
		begin
		gr23_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_13 && sq2_y_next == gr_y_23_13)
if (gr23_13_on == 2'd0)
		begin
		gr23_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_13_on == 2'd1)
		begin
		gr23_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_14 && sq2_y_next == gr_y_23_14)
if (gr23_14_on == 2'd0)
		begin
		gr23_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_14_on == 2'd1)
		begin
		gr23_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_15 && sq2_y_next == gr_y_23_15)
if (gr23_15_on == 2'd0)
		begin
		gr23_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_15_on == 2'd1)
		begin
		gr23_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_16 && sq2_y_next == gr_y_23_16)
if (gr23_16_on == 2'd0)
		begin
		gr23_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_16_on == 2'd1)
		begin
		gr23_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_17 && sq2_y_next == gr_y_23_17)
if (gr23_17_on == 2'd0)
		begin
		gr23_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_17_on == 2'd1)
		begin
		gr23_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_18 && sq2_y_next == gr_y_23_18)
if (gr23_18_on == 2'd0)
		begin
		gr23_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_18_on == 2'd1)
		begin
		gr23_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_19 && sq2_y_next == gr_y_23_19)
if (gr23_19_on == 2'd0)
		begin
		gr23_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_19_on == 2'd1)
		begin
		gr23_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_20 && sq2_y_next == gr_y_23_20)
if (gr23_20_on == 2'd0)
		begin
		gr23_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_20_on == 2'd1)
		begin
		gr23_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_21 && sq2_y_next == gr_y_23_21)
if (gr23_21_on == 2'd0)
		begin
		gr23_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_21_on == 2'd1)
		begin
		gr23_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_22 && sq2_y_next == gr_y_23_22)
if (gr23_22_on == 2'd0)
		begin
		gr23_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_22_on == 2'd1)
		begin
		gr23_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_23 && sq2_y_next == gr_y_23_23)
if (gr23_23_on == 2'd0)
		begin
		gr23_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_23_on == 2'd1)
		begin
		gr23_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_23_24 && sq2_y_next == gr_y_23_24)
if (gr23_24_on == 2'd0)
		begin
		gr23_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr23_24_on == 2'd1)
		begin
		gr23_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_0 && sq2_y_next == gr_y_24_0)
if (gr24_0_on == 2'd0)
		begin
		gr24_0_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_0_on == 2'd1)
		begin
		gr24_0_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_1 && sq2_y_next == gr_y_24_1)
if (gr24_1_on == 2'd0)
		begin
		gr24_1_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_1_on == 2'd1)
		begin
		gr24_1_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_2 && sq2_y_next == gr_y_24_2)
if (gr24_2_on == 2'd0)
		begin
		gr24_2_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_2_on == 2'd1)
		begin
		gr24_2_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_3 && sq2_y_next == gr_y_24_3)
if (gr24_3_on == 2'd0)
		begin
		gr24_3_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_3_on == 2'd1)
		begin
		gr24_3_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_4 && sq2_y_next == gr_y_24_4)
if (gr24_4_on == 2'd0)
		begin
		gr24_4_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_4_on == 2'd1)
		begin
		gr24_4_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_5 && sq2_y_next == gr_y_24_5)
if (gr24_5_on == 2'd0)
		begin
		gr24_5_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_5_on == 2'd1)
		begin
		gr24_5_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_6 && sq2_y_next == gr_y_24_6)
if (gr24_6_on == 2'd0)
		begin
		gr24_6_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_6_on == 2'd1)
		begin
		gr24_6_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_7 && sq2_y_next == gr_y_24_7)
if (gr24_7_on == 2'd0)
		begin
		gr24_7_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_7_on == 2'd1)
		begin
		gr24_7_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_8 && sq2_y_next == gr_y_24_8)
if (gr24_8_on == 2'd0)
		begin
		gr24_8_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_8_on == 2'd1)
		begin
		gr24_8_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_9 && sq2_y_next == gr_y_24_9)
if (gr24_9_on == 2'd0)
		begin
		gr24_9_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_9_on == 2'd1)
		begin
		gr24_9_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_10 && sq2_y_next == gr_y_24_10)
if (gr24_10_on == 2'd0)
		begin
		gr24_10_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_10_on == 2'd1)
		begin
		gr24_10_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_11 && sq2_y_next == gr_y_24_11)
if (gr24_11_on == 2'd0)
		begin
		gr24_11_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_11_on == 2'd1)
		begin
		gr24_11_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_12 && sq2_y_next == gr_y_24_12)
if (gr24_12_on == 2'd0)
		begin
		gr24_12_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_12_on == 2'd1)
		begin
		gr24_12_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_13 && sq2_y_next == gr_y_24_13)
if (gr24_13_on == 2'd0)
		begin
		gr24_13_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_13_on == 2'd1)
		begin
		gr24_13_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_14 && sq2_y_next == gr_y_24_14)
if (gr24_14_on == 2'd0)
		begin
		gr24_14_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_14_on == 2'd1)
		begin
		gr24_14_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_15 && sq2_y_next == gr_y_24_15)
if (gr24_15_on == 2'd0)
		begin
		gr24_15_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_15_on == 2'd1)
		begin
		gr24_15_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_16 && sq2_y_next == gr_y_24_16)
if (gr24_16_on == 2'd0)
		begin
		gr24_16_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_16_on == 2'd1)
		begin
		gr24_16_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_17 && sq2_y_next == gr_y_24_17)
if (gr24_17_on == 2'd0)
		begin
		gr24_17_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_17_on == 2'd1)
		begin
		gr24_17_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_18 && sq2_y_next == gr_y_24_18)
if (gr24_18_on == 2'd0)
		begin
		gr24_18_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_18_on == 2'd1)
		begin
		gr24_18_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_19 && sq2_y_next == gr_y_24_19)
if (gr24_19_on == 2'd0)
		begin
		gr24_19_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_19_on == 2'd1)
		begin
		gr24_19_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_20 && sq2_y_next == gr_y_24_20)
if (gr24_20_on == 2'd0)
		begin
		gr24_20_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_20_on == 2'd1)
		begin
		gr24_20_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_21 && sq2_y_next == gr_y_24_21)
if (gr24_21_on == 2'd0)
		begin
		gr24_21_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_21_on == 2'd1)
		begin
		gr24_21_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_22 && sq2_y_next == gr_y_24_22)
if (gr24_22_on == 2'd0)
		begin
		gr24_22_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_22_on == 2'd1)
		begin
		gr24_22_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_23 && sq2_y_next == gr_y_24_23)
if (gr24_23_on == 2'd0)
		begin
		gr24_23_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_23_on == 2'd1)
		begin
		gr24_23_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end
if (sq2_x_next == gr_x_24_24 && sq2_y_next == gr_y_24_24)
if (gr24_24_on == 2'd0)
		begin
		gr24_24_on = 2'd2;
		count_r = count_r + 1;
		end
else if (gr24_24_on == 2'd1)
		begin
		gr24_24_on = 2'd2;
		count_r = count_r + 1;
		count_b = count_b - 1;
		end



if (sq1_x_next == sq2_x_next && sq1_y_next == sq2_y_next)
begin
col = 1;
if (count_b > count_r)
    win = 2'd1;
else if (count_r > count_b)
    win = 2'd2;
else
    win = 2'd0;
end

if (sel == 2'b10)
begin
if (color == 6'd20)
    color = 0;
else
    color = color + 1;
end


if (timer_count == 10'd40)
    bonus = 1;


if (bonus == 1)
begin
if (sq1_x_next == gr_x_12_12 && sq1_y_next == gr_y_12_12)
begin
bonus = 0;
    if (sel == 2'b10)
        count_r = count_r - 10'd10;
    else if (sel == 2'b01)
        count_b = count_b + 10'd10;
end

if (sq2_x_next == gr_x_12_12 && sq2_y_next == gr_y_12_12)
begin
bonus = 0;
    if (sel == 2'b10)
        count_b = count_b - 10'd10;
    else if (sel == 2'b01)
        count_r = count_r + 10'd10;
end

end



if (timer_count == 10'd0)
    begin
    col = 1;
    if (count_b > count_r)
        win = 2'd1;
    else if (count_r > count_b)
        win = 2'd2;
    else if (count_r == count_b)
        win = 2'd0;
    end
else if (timer_count > 10'd0)
    begin
    if (timer_check == 4'd9)
        begin
        timer_count = timer_count - 1;
        timer_check = 4'd0;
        end
    else
        timer_check = timer_check + 1;
    end
        
//end
if (reset2)
begin
sq1_x_next <= 527;
sq1_y_next <= 447;
sq2_x_next <= 95;
sq2_y_next <= 15;

gr0_0_on = 2'd0; gr0_1_on = 2'd0; gr0_2_on = 2'd0; gr0_3_on = 2'd0; gr0_4_on = 2'd0; gr0_5_on = 2'd0; gr0_6_on = 2'd0; gr0_7_on = 2'd0; gr0_8_on = 2'd0; gr0_9_on = 2'd0; gr0_10_on = 2'd0; gr0_11_on = 2'd0; gr0_12_on = 2'd0; gr0_13_on = 2'd0; gr0_14_on = 2'd0; gr0_15_on = 2'd0; gr0_16_on = 2'd0; gr0_17_on = 2'd0; gr0_18_on = 2'd0; gr0_19_on = 2'd0; gr0_20_on = 2'd0; gr0_21_on = 2'd0; gr0_22_on = 2'd0; gr0_23_on = 2'd0; gr0_24_on = 2'd0;
gr1_0_on = 2'd0; gr1_1_on = 2'd0; gr1_2_on = 2'd0; gr1_3_on = 2'd0; gr1_4_on = 2'd0; gr1_5_on = 2'd0; gr1_6_on = 2'd0; gr1_7_on = 2'd0; gr1_8_on = 2'd0; gr1_9_on = 2'd0; gr1_10_on = 2'd0; gr1_11_on = 2'd0; gr1_12_on = 2'd0; gr1_13_on = 2'd0; gr1_14_on = 2'd0; gr1_15_on = 2'd0; gr1_16_on = 2'd0; gr1_17_on = 2'd0; gr1_18_on = 2'd0; gr1_19_on = 2'd0; gr1_20_on = 2'd0; gr1_21_on = 2'd0; gr1_22_on = 2'd0; gr1_23_on = 2'd0; gr1_24_on = 2'd0;
gr2_0_on = 2'd0; gr2_1_on = 2'd0; gr2_2_on = 2'd0; gr2_3_on = 2'd0; gr2_4_on = 2'd0; gr2_5_on = 2'd0; gr2_6_on = 2'd0; gr2_7_on = 2'd0; gr2_8_on = 2'd0; gr2_9_on = 2'd0; gr2_10_on = 2'd0; gr2_11_on = 2'd0; gr2_12_on = 2'd0; gr2_13_on = 2'd0; gr2_14_on = 2'd0; gr2_15_on = 2'd0; gr2_16_on = 2'd0; gr2_17_on = 2'd0; gr2_18_on = 2'd0; gr2_19_on = 2'd0; gr2_20_on = 2'd0; gr2_21_on = 2'd0; gr2_22_on = 2'd0; gr2_23_on = 2'd0; gr2_24_on = 2'd0;
gr3_0_on = 2'd0; gr3_1_on = 2'd0; gr3_2_on = 2'd0; gr3_3_on = 2'd0; gr3_4_on = 2'd0; gr3_5_on = 2'd0; gr3_6_on = 2'd0; gr3_7_on = 2'd0; gr3_8_on = 2'd0; gr3_9_on = 2'd0; gr3_10_on = 2'd0; gr3_11_on = 2'd0; gr3_12_on = 2'd0; gr3_13_on = 2'd0; gr3_14_on = 2'd0; gr3_15_on = 2'd0; gr3_16_on = 2'd0; gr3_17_on = 2'd0; gr3_18_on = 2'd0; gr3_19_on = 2'd0; gr3_20_on = 2'd0; gr3_21_on = 2'd0; gr3_22_on = 2'd0; gr3_23_on = 2'd0; gr3_24_on = 2'd0; 
gr4_0_on = 2'd0; gr4_1_on = 2'd0; gr4_2_on = 2'd0; gr4_3_on = 2'd0; gr4_4_on = 2'd0; gr4_5_on = 2'd0; gr4_6_on = 2'd0; gr4_7_on = 2'd0; gr4_8_on = 2'd0; gr4_9_on = 2'd0; gr4_10_on = 2'd0; gr4_11_on = 2'd0; gr4_12_on = 2'd0; gr4_13_on = 2'd0; gr4_14_on = 2'd0; gr4_15_on = 2'd0; gr4_16_on = 2'd0; gr4_17_on = 2'd0; gr4_18_on = 2'd0; gr4_19_on = 2'd0; gr4_20_on = 2'd0; gr4_21_on = 2'd0; gr4_22_on = 2'd0; gr4_23_on = 2'd0; gr4_24_on = 2'd0;
gr5_0_on = 2'd0; gr5_1_on = 2'd0; gr5_2_on = 2'd0; gr5_3_on = 2'd0; gr5_4_on = 2'd0; gr5_5_on = 2'd0; gr5_6_on = 2'd0; gr5_7_on = 2'd0; gr5_8_on = 2'd0; gr5_9_on = 2'd0; gr5_10_on = 2'd0; gr5_11_on = 2'd0; gr5_12_on = 2'd0; gr5_13_on = 2'd0; gr5_14_on = 2'd0; gr5_15_on = 2'd0; gr5_16_on = 2'd0; gr5_17_on = 2'd0; gr5_18_on = 2'd0; gr5_19_on = 2'd0; gr5_20_on = 2'd0; gr5_21_on = 2'd0; gr5_22_on = 2'd0; gr5_23_on = 2'd0; gr5_24_on = 2'd0;
gr6_0_on = 2'd0; gr6_1_on = 2'd0; gr6_2_on = 2'd0; gr6_3_on = 2'd0; gr6_4_on = 2'd0; gr6_5_on = 2'd0; gr6_6_on = 2'd0; gr6_7_on = 2'd0; gr6_8_on = 2'd0; gr6_9_on = 2'd0; gr6_10_on = 2'd0; gr6_11_on = 2'd0; gr6_12_on = 2'd0; gr6_13_on = 2'd0; gr6_14_on = 2'd0; gr6_15_on = 2'd0; gr6_16_on = 2'd0; gr6_17_on = 2'd0; gr6_18_on = 2'd0; gr6_19_on = 2'd0; gr6_20_on = 2'd0; gr6_21_on = 2'd0; gr6_22_on = 2'd0; gr6_23_on = 2'd0; gr6_24_on = 2'd0;
gr7_0_on = 2'd0; gr7_1_on = 2'd0; gr7_2_on = 2'd0; gr7_3_on = 2'd0; gr7_4_on = 2'd0; gr7_5_on = 2'd0; gr7_6_on = 2'd0; gr7_7_on = 2'd0; gr7_8_on = 2'd0; gr7_9_on = 2'd0; gr7_10_on = 2'd0; gr7_11_on = 2'd0; gr7_12_on = 2'd0; gr7_13_on = 2'd0; gr7_14_on = 2'd0; gr7_15_on = 2'd0; gr7_16_on = 2'd0; gr7_17_on = 2'd0; gr7_18_on = 2'd0; gr7_19_on = 2'd0; gr7_20_on = 2'd0; gr7_21_on = 2'd0; gr7_22_on = 2'd0; gr7_23_on = 2'd0; gr7_24_on = 2'd0;
gr8_0_on = 2'd0; gr8_1_on = 2'd0; gr8_2_on = 2'd0; gr8_3_on = 2'd0; gr8_4_on = 2'd0; gr8_5_on = 2'd0; gr8_6_on = 2'd0; gr8_7_on = 2'd0; gr8_8_on = 2'd0; gr8_9_on = 2'd0; gr8_10_on = 2'd0; gr8_11_on = 2'd0; gr8_12_on = 2'd0; gr8_13_on = 2'd0; gr8_14_on = 2'd0; gr8_15_on = 2'd0; gr8_16_on = 2'd0; gr8_17_on = 2'd0; gr8_18_on = 2'd0; gr8_19_on = 2'd0; gr8_20_on = 2'd0; gr8_21_on = 2'd0; gr8_22_on = 2'd0; gr8_23_on = 2'd0; gr8_24_on = 2'd0;
gr9_0_on = 2'd0; gr9_1_on = 2'd0; gr9_2_on = 2'd0; gr9_3_on = 2'd0; gr9_4_on = 2'd0; gr9_5_on = 2'd0; gr9_6_on = 2'd0; gr9_7_on = 2'd0; gr9_8_on = 2'd0; gr9_9_on = 2'd0; gr9_10_on = 2'd0; gr9_11_on = 2'd0; gr9_12_on = 2'd0; gr9_13_on = 2'd0; gr9_14_on = 2'd0; gr9_15_on = 2'd0; gr9_16_on = 2'd0; gr9_17_on = 2'd0; gr9_18_on = 2'd0; gr9_19_on = 2'd0; gr9_20_on = 2'd0; gr9_21_on = 2'd0; gr9_22_on = 2'd0; gr9_23_on = 2'd0; gr9_24_on = 2'd0;
gr10_0_on = 2'd0; gr10_1_on = 2'd0; gr10_2_on = 2'd0; gr10_3_on = 2'd0; gr10_4_on = 2'd0; gr10_5_on = 2'd0; gr10_6_on = 2'd0; gr10_7_on = 2'd0; gr10_8_on = 2'd0; gr10_9_on = 2'd0; gr10_10_on = 2'd0; gr10_11_on = 2'd0; gr10_12_on = 2'd0; gr10_13_on = 2'd0; gr10_14_on = 2'd0; gr10_15_on = 2'd0; gr10_16_on = 2'd0; gr10_17_on = 2'd0; gr10_18_on = 2'd0; gr10_19_on = 2'd0; gr10_20_on = 2'd0; gr10_21_on = 2'd0; gr10_22_on = 2'd0; gr10_23_on = 2'd0; gr10_24_on = 2'd0;
gr11_0_on = 2'd0; gr11_1_on = 2'd0; gr11_2_on = 2'd0; gr11_3_on = 2'd0; gr11_4_on = 2'd0; gr11_5_on = 2'd0; gr11_6_on = 2'd0; gr11_7_on = 2'd0; gr11_8_on = 2'd0; gr11_9_on = 2'd0; gr11_10_on = 2'd0; gr11_11_on = 2'd0; gr11_12_on = 2'd0; gr11_13_on = 2'd0; gr11_14_on = 2'd0; gr11_15_on = 2'd0; gr11_16_on = 2'd0; gr11_17_on = 2'd0; gr11_18_on = 2'd0; gr11_19_on = 2'd0; gr11_20_on = 2'd0; gr11_21_on = 2'd0; gr11_22_on = 2'd0; gr11_23_on = 2'd0; gr11_24_on = 2'd0;
gr12_0_on = 2'd0; gr12_1_on = 2'd0; gr12_2_on = 2'd0; gr12_3_on = 2'd0; gr12_4_on = 2'd0; gr12_5_on = 2'd0; gr12_6_on = 2'd0; gr12_7_on = 2'd0; gr12_8_on = 2'd0; gr12_9_on = 2'd0; gr12_10_on = 2'd0; gr12_11_on = 2'd0; gr12_12_on = 2'd0; gr12_13_on = 2'd0; gr12_14_on = 2'd0; gr12_15_on = 2'd0; gr12_16_on = 2'd0; gr12_17_on = 2'd0; gr12_18_on = 2'd0; gr12_19_on = 2'd0; gr12_20_on = 2'd0; gr12_21_on = 2'd0; gr12_22_on = 2'd0; gr12_23_on = 2'd0; gr12_24_on = 2'd0;
gr13_0_on = 2'd0; gr13_1_on = 2'd0; gr13_2_on = 2'd0; gr13_3_on = 2'd0; gr13_4_on = 2'd0; gr13_5_on = 2'd0; gr13_6_on = 2'd0; gr13_7_on = 2'd0; gr13_8_on = 2'd0; gr13_9_on = 2'd0; gr13_10_on = 2'd0; gr13_11_on = 2'd0; gr13_12_on = 2'd0; gr13_13_on = 2'd0; gr13_14_on = 2'd0; gr13_15_on = 2'd0; gr13_16_on = 2'd0; gr13_17_on = 2'd0; gr13_18_on = 2'd0; gr13_19_on = 2'd0; gr13_20_on = 2'd0; gr13_21_on = 2'd0; gr13_22_on = 2'd0; gr13_23_on = 2'd0; gr13_24_on = 2'd0;
gr14_0_on = 2'd0; gr14_1_on = 2'd0; gr14_2_on = 2'd0; gr14_3_on = 2'd0; gr14_4_on = 2'd0; gr14_5_on = 2'd0; gr14_6_on = 2'd0; gr14_7_on = 2'd0; gr14_8_on = 2'd0; gr14_9_on = 2'd0; gr14_10_on = 2'd0; gr14_11_on = 2'd0; gr14_12_on = 2'd0; gr14_13_on = 2'd0; gr14_14_on = 2'd0; gr14_15_on = 2'd0; gr14_16_on = 2'd0; gr14_17_on = 2'd0; gr14_18_on = 2'd0; gr14_19_on = 2'd0; gr14_20_on = 2'd0; gr14_21_on = 2'd0; gr14_22_on = 2'd0; gr14_23_on = 2'd0; gr14_24_on = 2'd0;
gr15_0_on = 2'd0; gr15_1_on = 2'd0; gr15_2_on = 2'd0; gr15_3_on = 2'd0; gr15_4_on = 2'd0; gr15_5_on = 2'd0; gr15_6_on = 2'd0; gr15_7_on = 2'd0; gr15_8_on = 2'd0; gr15_9_on = 2'd0; gr15_10_on = 2'd0; gr15_11_on = 2'd0; gr15_12_on = 2'd0; gr15_13_on = 2'd0; gr15_14_on = 2'd0; gr15_15_on = 2'd0; gr15_16_on = 2'd0; gr15_17_on = 2'd0; gr15_18_on = 2'd0; gr15_19_on = 2'd0; gr15_20_on = 2'd0; gr15_21_on = 2'd0; gr15_22_on = 2'd0; gr15_23_on = 2'd0; gr15_24_on = 2'd0;
gr16_0_on = 2'd0; gr16_1_on = 2'd0; gr16_2_on = 2'd0; gr16_3_on = 2'd0; gr16_4_on = 2'd0; gr16_5_on = 2'd0; gr16_6_on = 2'd0; gr16_7_on = 2'd0; gr16_8_on = 2'd0; gr16_9_on = 2'd0; gr16_10_on = 2'd0; gr16_11_on = 2'd0; gr16_12_on = 2'd0; gr16_13_on = 2'd0; gr16_14_on = 2'd0; gr16_15_on = 2'd0; gr16_16_on = 2'd0; gr16_17_on = 2'd0; gr16_18_on = 2'd0; gr16_19_on = 2'd0; gr16_20_on = 2'd0; gr16_21_on = 2'd0; gr16_22_on = 2'd0; gr16_23_on = 2'd0; gr16_24_on = 2'd0;
gr17_0_on = 2'd0; gr17_1_on = 2'd0; gr17_2_on = 2'd0; gr17_3_on = 2'd0; gr17_4_on = 2'd0; gr17_5_on = 2'd0; gr17_6_on = 2'd0; gr17_7_on = 2'd0; gr17_8_on = 2'd0; gr17_9_on = 2'd0; gr17_10_on = 2'd0; gr17_11_on = 2'd0; gr17_12_on = 2'd0; gr17_13_on = 2'd0; gr17_14_on = 2'd0; gr17_15_on = 2'd0; gr17_16_on = 2'd0; gr17_17_on = 2'd0; gr17_18_on = 2'd0; gr17_19_on = 2'd0; gr17_20_on = 2'd0; gr17_21_on = 2'd0; gr17_22_on = 2'd0; gr17_23_on = 2'd0; gr17_24_on = 2'd0;
gr18_0_on = 2'd0; gr18_1_on = 2'd0; gr18_2_on = 2'd0; gr18_3_on = 2'd0; gr18_4_on = 2'd0; gr18_5_on = 2'd0; gr18_6_on = 2'd0; gr18_7_on = 2'd0; gr18_8_on = 2'd0; gr18_9_on = 2'd0; gr18_10_on = 2'd0; gr18_11_on = 2'd0; gr18_12_on = 2'd0; gr18_13_on = 2'd0; gr18_14_on = 2'd0; gr18_15_on = 2'd0; gr18_16_on = 2'd0; gr18_17_on = 2'd0; gr18_18_on = 2'd0; gr18_19_on = 2'd0; gr18_20_on = 2'd0; gr18_21_on = 2'd0; gr18_22_on = 2'd0; gr18_23_on = 2'd0; gr18_24_on = 2'd0;
gr19_0_on = 2'd0; gr19_1_on = 2'd0; gr19_2_on = 2'd0; gr19_3_on = 2'd0; gr19_4_on = 2'd0; gr19_5_on = 2'd0; gr19_6_on = 2'd0; gr19_7_on = 2'd0; gr19_8_on = 2'd0; gr19_9_on = 2'd0; gr19_10_on = 2'd0; gr19_11_on = 2'd0; gr19_12_on = 2'd0; gr19_13_on = 2'd0; gr19_14_on = 2'd0; gr19_15_on = 2'd0; gr19_16_on = 2'd0; gr19_17_on = 2'd0; gr19_18_on = 2'd0; gr19_19_on = 2'd0; gr19_20_on = 2'd0; gr19_21_on = 2'd0; gr19_22_on = 2'd0; gr19_23_on = 2'd0; gr19_24_on = 2'd0;
gr20_0_on = 2'd0; gr20_1_on = 2'd0; gr20_2_on = 2'd0; gr20_3_on = 2'd0; gr20_4_on = 2'd0; gr20_5_on = 2'd0; gr20_6_on = 2'd0; gr20_7_on = 2'd0; gr20_8_on = 2'd0; gr20_9_on = 2'd0; gr20_10_on = 2'd0; gr20_11_on = 2'd0; gr20_12_on = 2'd0; gr20_13_on = 2'd0; gr20_14_on = 2'd0; gr20_15_on = 2'd0; gr20_16_on = 2'd0; gr20_17_on = 2'd0; gr20_18_on = 2'd0; gr20_19_on = 2'd0; gr20_20_on = 2'd0; gr20_21_on = 2'd0; gr20_22_on = 2'd0; gr20_23_on = 2'd0; gr20_24_on = 2'd0;
gr21_0_on = 2'd0; gr21_1_on = 2'd0; gr21_2_on = 2'd0; gr21_3_on = 2'd0; gr21_4_on = 2'd0; gr21_5_on = 2'd0; gr21_6_on = 2'd0; gr21_7_on = 2'd0; gr21_8_on = 2'd0; gr21_9_on = 2'd0; gr21_10_on = 2'd0; gr21_11_on = 2'd0; gr21_12_on = 2'd0; gr21_13_on = 2'd0; gr21_14_on = 2'd0; gr21_15_on = 2'd0; gr21_16_on = 2'd0; gr21_17_on = 2'd0; gr21_18_on = 2'd0; gr21_19_on = 2'd0; gr21_20_on = 2'd0; gr21_21_on = 2'd0; gr21_22_on = 2'd0; gr21_23_on = 2'd0; gr21_24_on = 2'd0;
gr22_0_on = 2'd0; gr22_1_on = 2'd0; gr22_2_on = 2'd0; gr22_3_on = 2'd0; gr22_4_on = 2'd0; gr22_5_on = 2'd0; gr22_6_on = 2'd0; gr22_7_on = 2'd0; gr22_8_on = 2'd0; gr22_9_on = 2'd0; gr22_10_on = 2'd0; gr22_11_on = 2'd0; gr22_12_on = 2'd0; gr22_13_on = 2'd0; gr22_14_on = 2'd0; gr22_15_on = 2'd0; gr22_16_on = 2'd0; gr22_17_on = 2'd0; gr22_18_on = 2'd0; gr22_19_on = 2'd0; gr22_20_on = 2'd0; gr22_21_on = 2'd0; gr22_22_on = 2'd0; gr22_23_on = 2'd0; gr22_24_on = 2'd0;
gr23_0_on = 2'd0; gr23_1_on = 2'd0; gr23_2_on = 2'd0; gr23_3_on = 2'd0; gr23_4_on = 2'd0; gr23_5_on = 2'd0; gr23_6_on = 2'd0; gr23_7_on = 2'd0; gr23_8_on = 2'd0; gr23_9_on = 2'd0; gr23_10_on = 2'd0; gr23_11_on = 2'd0; gr23_12_on = 2'd0; gr23_13_on = 2'd0; gr23_14_on = 2'd0; gr23_15_on = 2'd0; gr23_16_on = 2'd0; gr23_17_on = 2'd0; gr23_18_on = 2'd0; gr23_19_on = 2'd0; gr23_20_on = 2'd0; gr23_21_on = 2'd0; gr23_22_on = 2'd0; gr23_23_on = 2'd0; gr23_24_on = 2'd0;
gr24_0_on = 2'd0; gr24_1_on = 2'd0; gr24_2_on = 2'd0; gr24_3_on = 2'd0; gr24_4_on = 2'd0; gr24_5_on = 2'd0; gr24_6_on = 2'd0; gr24_7_on = 2'd0; gr24_8_on = 2'd0; gr24_9_on = 2'd0; gr24_10_on = 2'd0; gr24_11_on = 2'd0; gr24_12_on = 2'd0; gr24_13_on = 2'd0; gr24_14_on = 2'd0; gr24_15_on = 2'd0; gr24_16_on = 2'd0; gr24_17_on = 2'd0; gr24_18_on = 2'd0; gr24_19_on = 2'd0; gr24_20_on = 2'd0; gr24_21_on = 2'd0; gr24_22_on = 2'd0; gr24_23_on = 2'd0; gr24_24_on = 2'd0;

col = 0;
ply = 1;
count_r = 0;
count_b = 0;
bonus = 0;
timer_count = 12'd60;


end
end
end
end

//wire bonus_on; assign bonus_on = (bonus_x <= x) && (x <= bonus+18) && (bonus_y <= y) && (y <= bonus_y+18);
//always @(posedge timer_clk)
//    if (timer_count==10'd0)
//        col=1;
//    else 
//        if (ply==0 && col==0)
//            timer_count=timer_count-1;



wire [3:0] num0;
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;


binary_2_bcd b2b (.clk(clk), .num(timer_count), .num0(num0), .num1(num1), .num2(num2), .num3(num3));

score_count sc (.clk_100MHz(clk), .reset(en), .ones(num0), .tens(num1), .hundreds(num2), .thousands(num3), .seg(Y), .digit(digit));
    
wire [3:0] numb0;
wire [3:0] numb1;
wire [3:0] numb2;
wire [3:0] numb3;  
wire [6:0] asciib_char0;
wire [6:0] asciib_char1;
wire [6:0] asciib_char2; 
binary_2_bcd b2b1 (.clk(clk), .num(count_b), .num0(numb0), .num1(numb1), .num2(numb2), .num3(numb3));
bcd_2_hex b2h1 (.clk(clk), .bcd(numb0), .hex(asciib_char0));
bcd_2_hex b2h2 (.clk(clk), .bcd(numb1), .hex(asciib_char1));
bcd_2_hex b2h3 (.clk(clk), .bcd(numb2), .hex(asciib_char2));

wire [3:0] numr0;
wire [3:0] numr1;
wire [3:0] numr2;
wire [3:0] numr3;  
wire [6:0] asciir_char0;
wire [6:0] asciir_char1;
wire [6:0] asciir_char2; 
binary_2_bcd b2b2 (.clk(clk), .num(count_r), .num0(numr0), .num1(numr1), .num2(numr2), .num3(numr3));
bcd_2_hex b2h4 (.clk(clk), .bcd(numr0), .hex(asciir_char0));
bcd_2_hex b2h5 (.clk(clk), .bcd(numr1), .hex(asciir_char1));
bcd_2_hex b2h6 (.clk(clk), .bcd(numr2), .hex(asciir_char2));

    
    
    
wire [11:0] ascii_rgb;

wire asciib_on0;
wire asciib_on1;
wire asciib_on2; 

wire asciir_on0;
wire asciir_on1;
wire asciir_on2; 

ascii_test_1 test1(.ascii_char(asciib_char2),.clk(clk),.video_on(video_on),.x(x),.y(y),.x_loc(10'd15),.y_loc(10'd15), .on(asciib_on3),.rgb(ascii_rgb));    
ascii_test_1 test2(.ascii_char(asciib_char1),.clk(clk),.video_on(video_on),.x(x),.y(y),.x_loc(10'd23),.y_loc(10'd15), .on(asciib_on2),.rgb(ascii_rgb));    
ascii_test_1 test3(.ascii_char(asciib_char0),.clk(clk),.video_on(video_on),.x(x),.y(y),.x_loc(10'd31),.y_loc(10'd15), .on(asciib_on1),.rgb(ascii_rgb));    
  
ascii_test_1 test4(.ascii_char(asciir_char2),.clk(clk),.video_on(video_on),.x(x),.y(y),.x_loc(10'd567),.y_loc(10'd15), .on(asciir_on3),.rgb(ascii_rgb));    
ascii_test_1 test5(.ascii_char(asciir_char1),.clk(clk),.video_on(video_on),.x(x),.y(y),.x_loc(10'd575),.y_loc(10'd15), .on(asciir_on2),.rgb(ascii_rgb));    
ascii_test_1 test6(.ascii_char(asciir_char0),.clk(clk),.video_on(video_on),.x(x),.y(y),.x_loc(10'd583),.y_loc(10'd15), .on(asciir_on1),.rgb(ascii_rgb));    
   
//    wire [11:0] rgb_init;
//    wire [11:0] rgb_easy;
//    wire [11:0] rgb_tort;
    wire [11:0] rgb_win1;
//    wire [11:0] rgb_win2;
    wire [11:0] rgb_draw;
//    romv2 init(clk, video_on, x/3, y[8:0]/2, rgb_init);
//    easyrom easy(clk, video_on, x/3, y[8:0]/2, rgb_easy);
//    tortrom tort(clk, video_on, x/3, y[8:0]/2, rgb_tort);
    winrom win11(clk, video_on, x/3, y[8:0]/2, rgb_win1);
//    win2rom win22(clk, video_on, x/3, y[8:0]/2, rgb_win2);
    drawrom draw(clk, video_on, x/3, y[8:0]/2, rgb_draw);
    
    
    // RGB control
    always @(posedge clk)
        if(~video_on)
            rgb = 12'h000;          // black(no value) outside display area
        else
            if (main)
                rgb = rgb_draw;
            else if (ply)
                rgb = start;
            else if (col)
                if (win == 2'd1)
                    rgb = SQ1_RGB;
                else if (win == 2'd2)
                    rgb = SQ2_RGB;
                else
                    rgb = rgb_draw;
            else if(sq1_on)
                if (sel == 2'b10)
                begin
                if (color >= 6'd15)
                    rgb = BG4;
                else if (color >= 6'd10) 
                    rgb = BG3; 
                else if (color >= 6'd5) 
                    rgb = BG2;
                else if (color >= 6'd0)
                    rgb = BG1;
                end 
                else
                    rgb = SQ1_RGB;
            else if(sq2_on)
                if (sel == 2'b10)
                begin
                if (color >= 6'd15)
                    rgb = BG3;
                else if (color >= 6'd10) 
                    rgb = BG4; 
                else if (color >= 6'd5) 
                    rgb = BG1;
                else if (color >= 6'd0)
                    rgb = BG2;
                end 
                else
                    rgb = SQ2_RGB;
            else if(black_on1)
                rgb = BLACK;
            else if (black_on2)
                rgb = BLACK;
            else if (black_on)
                rgb = BLACK;
            else if (bonus == 1 && tr12_12_on)
                rgb = bonus_rgb;
            else if (asciib_on1 | asciib_on2 | asciib_on3)
                rgb = SQ1_RGB;
            else if (asciir_on1 | asciir_on2 | asciir_on3)
                rgb = SQ2_RGB;
            else if ((tr0_0_on && gr0_0_on == 2'd1) | (tr0_1_on && gr0_1_on == 2'd1) | (tr0_2_on && gr0_2_on == 2'd1) | (tr0_3_on && gr0_3_on == 2'd1) | (tr0_4_on && gr0_4_on == 2'd1) | (tr0_5_on && gr0_5_on == 2'd1) | (tr0_6_on && gr0_6_on == 2'd1) | (tr0_7_on && gr0_7_on == 2'd1) | (tr0_8_on && gr0_8_on == 2'd1) | (tr0_9_on && gr0_9_on == 2'd1) | (tr0_10_on && gr0_10_on == 2'd1) | (tr0_11_on && gr0_11_on == 2'd1) | (tr0_12_on && gr0_12_on == 2'd1) | (tr0_13_on && gr0_13_on == 2'd1) | (tr0_14_on && gr0_14_on == 2'd1) | (tr0_15_on && gr0_15_on == 2'd1) | (tr0_16_on && gr0_16_on == 2'd1) | (tr0_17_on && gr0_17_on == 2'd1) | (tr0_18_on && gr0_18_on == 2'd1) | (tr0_19_on && gr0_19_on == 2'd1) | (tr0_20_on && gr0_20_on == 2'd1) | (tr0_21_on && gr0_21_on == 2'd1) | (tr0_22_on && gr0_22_on == 2'd1) | (tr0_23_on && gr0_23_on == 2'd1) | (tr0_24_on && gr0_24_on == 2'd1) | (tr1_0_on && gr1_0_on == 2'd1) | (tr1_1_on && gr1_1_on == 2'd1) | (tr1_2_on && gr1_2_on == 2'd1) | (tr1_3_on && gr1_3_on == 2'd1) | (tr1_4_on && gr1_4_on == 2'd1) | (tr1_5_on && gr1_5_on == 2'd1) | (tr1_6_on && gr1_6_on == 2'd1) | (tr1_7_on && gr1_7_on == 2'd1) | (tr1_8_on && gr1_8_on == 2'd1) | (tr1_9_on && gr1_9_on == 2'd1) | (tr1_10_on && gr1_10_on == 2'd1) | (tr1_11_on && gr1_11_on == 2'd1) | (tr1_12_on && gr1_12_on == 2'd1) | (tr1_13_on && gr1_13_on == 2'd1) | (tr1_14_on && gr1_14_on == 2'd1) | (tr1_15_on && gr1_15_on == 2'd1) | (tr1_16_on && gr1_16_on == 2'd1) | (tr1_17_on && gr1_17_on == 2'd1) | (tr1_18_on && gr1_18_on == 2'd1) | (tr1_19_on && gr1_19_on == 2'd1) | (tr1_20_on && gr1_20_on == 2'd1) | (tr1_21_on && gr1_21_on == 2'd1) | (tr1_22_on && gr1_22_on == 2'd1) | (tr1_23_on && gr1_23_on == 2'd1) | (tr1_24_on && gr1_24_on == 2'd1) | (tr2_0_on && gr2_0_on == 2'd1) | (tr2_1_on && gr2_1_on == 2'd1) | (tr2_2_on && gr2_2_on == 2'd1) | (tr2_3_on && gr2_3_on == 2'd1) | (tr2_4_on && gr2_4_on == 2'd1) | (tr2_5_on && gr2_5_on == 2'd1) | (tr2_6_on && gr2_6_on == 2'd1) | (tr2_7_on && gr2_7_on == 2'd1) | (tr2_8_on && gr2_8_on == 2'd1) | (tr2_9_on && gr2_9_on == 2'd1) | (tr2_10_on && gr2_10_on == 2'd1) | (tr2_11_on && gr2_11_on == 2'd1) | (tr2_12_on && gr2_12_on == 2'd1) | (tr2_13_on && gr2_13_on == 2'd1) | (tr2_14_on && gr2_14_on == 2'd1) | (tr2_15_on && gr2_15_on == 2'd1) | (tr2_16_on && gr2_16_on == 2'd1) | (tr2_17_on && gr2_17_on == 2'd1) | (tr2_18_on && gr2_18_on == 2'd1) | (tr2_19_on && gr2_19_on == 2'd1) | (tr2_20_on && gr2_20_on == 2'd1) | (tr2_21_on && gr2_21_on == 2'd1) | (tr2_22_on && gr2_22_on == 2'd1) | (tr2_23_on && gr2_23_on == 2'd1) | (tr2_24_on && gr2_24_on == 2'd1) | (tr3_0_on && gr3_0_on == 2'd1) | (tr3_1_on && gr3_1_on == 2'd1) | (tr3_2_on && gr3_2_on == 2'd1) | (tr3_3_on && gr3_3_on == 2'd1) | (tr3_4_on && gr3_4_on == 2'd1) | (tr3_5_on && gr3_5_on == 2'd1) | (tr3_6_on && gr3_6_on == 2'd1) | (tr3_7_on && gr3_7_on == 2'd1) | (tr3_8_on && gr3_8_on == 2'd1) | (tr3_9_on && gr3_9_on == 2'd1) | (tr3_10_on && gr3_10_on == 2'd1) | (tr3_11_on && gr3_11_on == 2'd1) | (tr3_12_on && gr3_12_on == 2'd1) | (tr3_13_on && gr3_13_on == 2'd1) | (tr3_14_on && gr3_14_on == 2'd1) | (tr3_15_on && gr3_15_on == 2'd1) | (tr3_16_on && gr3_16_on == 2'd1) | (tr3_17_on && gr3_17_on == 2'd1) | (tr3_18_on && gr3_18_on == 2'd1) | (tr3_19_on && gr3_19_on == 2'd1) | (tr3_20_on && gr3_20_on == 2'd1) | (tr3_21_on && gr3_21_on == 2'd1) | (tr3_22_on && gr3_22_on == 2'd1) | (tr3_23_on && gr3_23_on == 2'd1) | (tr3_24_on && gr3_24_on == 2'd1) | (tr4_0_on && gr4_0_on == 2'd1) | (tr4_1_on && gr4_1_on == 2'd1) | (tr4_2_on && gr4_2_on == 2'd1) | (tr4_3_on && gr4_3_on == 2'd1) | (tr4_4_on && gr4_4_on == 2'd1) | (tr4_5_on && gr4_5_on == 2'd1) | (tr4_6_on && gr4_6_on == 2'd1) | (tr4_7_on && gr4_7_on == 2'd1) | (tr4_8_on && gr4_8_on == 2'd1) | (tr4_9_on && gr4_9_on == 2'd1) | (tr4_10_on && gr4_10_on == 2'd1) | (tr4_11_on && gr4_11_on == 2'd1) | (tr4_12_on && gr4_12_on == 2'd1) | (tr4_13_on && gr4_13_on == 2'd1) | (tr4_14_on && gr4_14_on == 2'd1) | (tr4_15_on && gr4_15_on == 2'd1) | (tr4_16_on && gr4_16_on == 2'd1) | (tr4_17_on && gr4_17_on == 2'd1) | (tr4_18_on && gr4_18_on == 2'd1) | (tr4_19_on && gr4_19_on == 2'd1) | (tr4_20_on && gr4_20_on == 2'd1) | (tr4_21_on && gr4_21_on == 2'd1) | (tr4_22_on && gr4_22_on == 2'd1) | (tr4_23_on && gr4_23_on == 2'd1) | (tr4_24_on && gr4_24_on == 2'd1) | (tr5_0_on && gr5_0_on == 2'd1) | (tr5_1_on && gr5_1_on == 2'd1) | (tr5_2_on && gr5_2_on == 2'd1) | (tr5_3_on && gr5_3_on == 2'd1) | (tr5_4_on && gr5_4_on == 2'd1) | (tr5_5_on && gr5_5_on == 2'd1) | (tr5_6_on && gr5_6_on == 2'd1) | (tr5_7_on && gr5_7_on == 2'd1) | (tr5_8_on && gr5_8_on == 2'd1) | (tr5_9_on && gr5_9_on == 2'd1) | (tr5_10_on && gr5_10_on == 2'd1) | (tr5_11_on && gr5_11_on == 2'd1) | (tr5_12_on && gr5_12_on == 2'd1) | (tr5_13_on && gr5_13_on == 2'd1) | (tr5_14_on && gr5_14_on == 2'd1) | (tr5_15_on && gr5_15_on == 2'd1) | (tr5_16_on && gr5_16_on == 2'd1) | (tr5_17_on && gr5_17_on == 2'd1) | (tr5_18_on && gr5_18_on == 2'd1) | (tr5_19_on && gr5_19_on == 2'd1) | (tr5_20_on && gr5_20_on == 2'd1) | (tr5_21_on && gr5_21_on == 2'd1) | (tr5_22_on && gr5_22_on == 2'd1) | (tr5_23_on && gr5_23_on == 2'd1) | (tr5_24_on && gr5_24_on == 2'd1) | (tr6_0_on && gr6_0_on == 2'd1) | (tr6_1_on && gr6_1_on == 2'd1) | (tr6_2_on && gr6_2_on == 2'd1) | (tr6_3_on && gr6_3_on == 2'd1) | (tr6_4_on && gr6_4_on == 2'd1) | (tr6_5_on && gr6_5_on == 2'd1) | (tr6_6_on && gr6_6_on == 2'd1) | (tr6_7_on && gr6_7_on == 2'd1) | (tr6_8_on && gr6_8_on == 2'd1) | (tr6_9_on && gr6_9_on == 2'd1) | (tr6_10_on && gr6_10_on == 2'd1) | (tr6_11_on && gr6_11_on == 2'd1) | (tr6_12_on && gr6_12_on == 2'd1) | (tr6_13_on && gr6_13_on == 2'd1) | (tr6_14_on && gr6_14_on == 2'd1) | (tr6_15_on && gr6_15_on == 2'd1) | (tr6_16_on && gr6_16_on == 2'd1) | (tr6_17_on && gr6_17_on == 2'd1) | (tr6_18_on && gr6_18_on == 2'd1) | (tr6_19_on && gr6_19_on == 2'd1) | (tr6_20_on && gr6_20_on == 2'd1) | (tr6_21_on && gr6_21_on == 2'd1) | (tr6_22_on && gr6_22_on == 2'd1) | (tr6_23_on && gr6_23_on == 2'd1) | (tr6_24_on && gr6_24_on == 2'd1) | (tr7_0_on && gr7_0_on == 2'd1) | (tr7_1_on && gr7_1_on == 2'd1) | (tr7_2_on && gr7_2_on == 2'd1) | (tr7_3_on && gr7_3_on == 2'd1) | (tr7_4_on && gr7_4_on == 2'd1) | (tr7_5_on && gr7_5_on == 2'd1) | (tr7_6_on && gr7_6_on == 2'd1) | (tr7_7_on && gr7_7_on == 2'd1) | (tr7_8_on && gr7_8_on == 2'd1) | (tr7_9_on && gr7_9_on == 2'd1) | (tr7_10_on && gr7_10_on == 2'd1) | (tr7_11_on && gr7_11_on == 2'd1) | (tr7_12_on && gr7_12_on == 2'd1) | (tr7_13_on && gr7_13_on == 2'd1) | (tr7_14_on && gr7_14_on == 2'd1) | (tr7_15_on && gr7_15_on == 2'd1) | (tr7_16_on && gr7_16_on == 2'd1) | (tr7_17_on && gr7_17_on == 2'd1) | (tr7_18_on && gr7_18_on == 2'd1) | (tr7_19_on && gr7_19_on == 2'd1) | (tr7_20_on && gr7_20_on == 2'd1) | (tr7_21_on && gr7_21_on == 2'd1) | (tr7_22_on && gr7_22_on == 2'd1) | (tr7_23_on && gr7_23_on == 2'd1) | (tr7_24_on && gr7_24_on == 2'd1) | (tr8_0_on && gr8_0_on == 2'd1) | (tr8_1_on && gr8_1_on == 2'd1) | (tr8_2_on && gr8_2_on == 2'd1) | (tr8_3_on && gr8_3_on == 2'd1) | (tr8_4_on && gr8_4_on == 2'd1) | (tr8_5_on && gr8_5_on == 2'd1) | (tr8_6_on && gr8_6_on == 2'd1) | (tr8_7_on && gr8_7_on == 2'd1) | (tr8_8_on && gr8_8_on == 2'd1) | (tr8_9_on && gr8_9_on == 2'd1) | (tr8_10_on && gr8_10_on == 2'd1) | (tr8_11_on && gr8_11_on == 2'd1) | (tr8_12_on && gr8_12_on == 2'd1) | (tr8_13_on && gr8_13_on == 2'd1) | (tr8_14_on && gr8_14_on == 2'd1) | (tr8_15_on && gr8_15_on == 2'd1) | (tr8_16_on && gr8_16_on == 2'd1) | (tr8_17_on && gr8_17_on == 2'd1) | (tr8_18_on && gr8_18_on == 2'd1) | (tr8_19_on && gr8_19_on == 2'd1) | (tr8_20_on && gr8_20_on == 2'd1) | (tr8_21_on && gr8_21_on == 2'd1) | (tr8_22_on && gr8_22_on == 2'd1) | (tr8_23_on && gr8_23_on == 2'd1) | (tr8_24_on && gr8_24_on == 2'd1) | (tr9_0_on && gr9_0_on == 2'd1) | (tr9_1_on && gr9_1_on == 2'd1) | (tr9_2_on && gr9_2_on == 2'd1) | (tr9_3_on && gr9_3_on == 2'd1) | (tr9_4_on && gr9_4_on == 2'd1) | (tr9_5_on && gr9_5_on == 2'd1) | (tr9_6_on && gr9_6_on == 2'd1) | (tr9_7_on && gr9_7_on == 2'd1) | (tr9_8_on && gr9_8_on == 2'd1) | (tr9_9_on && gr9_9_on == 2'd1) | (tr9_10_on && gr9_10_on == 2'd1) | (tr9_11_on && gr9_11_on == 2'd1) | (tr9_12_on && gr9_12_on == 2'd1) | (tr9_13_on && gr9_13_on == 2'd1) | (tr9_14_on && gr9_14_on == 2'd1) | (tr9_15_on && gr9_15_on == 2'd1) | (tr9_16_on && gr9_16_on == 2'd1) | (tr9_17_on && gr9_17_on == 2'd1) | (tr9_18_on && gr9_18_on == 2'd1) | (tr9_19_on && gr9_19_on == 2'd1) | (tr9_20_on && gr9_20_on == 2'd1) | (tr9_21_on && gr9_21_on == 2'd1) | (tr9_22_on && gr9_22_on == 2'd1) | (tr9_23_on && gr9_23_on == 2'd1) | (tr9_24_on && gr9_24_on == 2'd1) | (tr10_0_on && gr10_0_on == 2'd1) | (tr10_1_on && gr10_1_on == 2'd1) | (tr10_2_on && gr10_2_on == 2'd1) | (tr10_3_on && gr10_3_on == 2'd1) | (tr10_4_on && gr10_4_on == 2'd1) | (tr10_5_on && gr10_5_on == 2'd1) | (tr10_6_on && gr10_6_on == 2'd1) | (tr10_7_on && gr10_7_on == 2'd1) | (tr10_8_on && gr10_8_on == 2'd1) | (tr10_9_on && gr10_9_on == 2'd1) | (tr10_10_on && gr10_10_on == 2'd1) | (tr10_11_on && gr10_11_on == 2'd1) | (tr10_12_on && gr10_12_on == 2'd1) | (tr10_13_on && gr10_13_on == 2'd1) | (tr10_14_on && gr10_14_on == 2'd1) | (tr10_15_on && gr10_15_on == 2'd1) | (tr10_16_on && gr10_16_on == 2'd1) | (tr10_17_on && gr10_17_on == 2'd1) | (tr10_18_on && gr10_18_on == 2'd1) | (tr10_19_on && gr10_19_on == 2'd1) | (tr10_20_on && gr10_20_on == 2'd1) | (tr10_21_on && gr10_21_on == 2'd1) | (tr10_22_on && gr10_22_on == 2'd1) | (tr10_23_on && gr10_23_on == 2'd1) | (tr10_24_on && gr10_24_on == 2'd1) | (tr11_0_on && gr11_0_on == 2'd1) | (tr11_1_on && gr11_1_on == 2'd1) | (tr11_2_on && gr11_2_on == 2'd1) | (tr11_3_on && gr11_3_on == 2'd1) | (tr11_4_on && gr11_4_on == 2'd1) | (tr11_5_on && gr11_5_on == 2'd1) | (tr11_6_on && gr11_6_on == 2'd1) | (tr11_7_on && gr11_7_on == 2'd1) | (tr11_8_on && gr11_8_on == 2'd1) | (tr11_9_on && gr11_9_on == 2'd1) | (tr11_10_on && gr11_10_on == 2'd1) | (tr11_11_on && gr11_11_on == 2'd1) | (tr11_12_on && gr11_12_on == 2'd1) | (tr11_13_on && gr11_13_on == 2'd1) | (tr11_14_on && gr11_14_on == 2'd1) | (tr11_15_on && gr11_15_on == 2'd1) | (tr11_16_on && gr11_16_on == 2'd1) | (tr11_17_on && gr11_17_on == 2'd1) | (tr11_18_on && gr11_18_on == 2'd1) | (tr11_19_on && gr11_19_on == 2'd1) | (tr11_20_on && gr11_20_on == 2'd1) | (tr11_21_on && gr11_21_on == 2'd1) | (tr11_22_on && gr11_22_on == 2'd1) | (tr11_23_on && gr11_23_on == 2'd1) | (tr11_24_on && gr11_24_on == 2'd1) | (tr12_0_on && gr12_0_on == 2'd1) | (tr12_1_on && gr12_1_on == 2'd1) | (tr12_2_on && gr12_2_on == 2'd1) | (tr12_3_on && gr12_3_on == 2'd1) | (tr12_4_on && gr12_4_on == 2'd1) | (tr12_5_on && gr12_5_on == 2'd1) | (tr12_6_on && gr12_6_on == 2'd1) | (tr12_7_on && gr12_7_on == 2'd1) | (tr12_8_on && gr12_8_on == 2'd1) | (tr12_9_on && gr12_9_on == 2'd1) | (tr12_10_on && gr12_10_on == 2'd1) | (tr12_11_on && gr12_11_on == 2'd1) | (tr12_12_on && gr12_12_on == 2'd1) | (tr12_13_on && gr12_13_on == 2'd1) | (tr12_14_on && gr12_14_on == 2'd1) | (tr12_15_on && gr12_15_on == 2'd1) | (tr12_16_on && gr12_16_on == 2'd1) | (tr12_17_on && gr12_17_on == 2'd1) | (tr12_18_on && gr12_18_on == 2'd1) | (tr12_19_on && gr12_19_on == 2'd1) | (tr12_20_on && gr12_20_on == 2'd1) | (tr12_21_on && gr12_21_on == 2'd1) | (tr12_22_on && gr12_22_on == 2'd1) | (tr12_23_on && gr12_23_on == 2'd1) | (tr12_24_on && gr12_24_on == 2'd1) | (tr13_0_on && gr13_0_on == 2'd1) | (tr13_1_on && gr13_1_on == 2'd1) | (tr13_2_on && gr13_2_on == 2'd1) | (tr13_3_on && gr13_3_on == 2'd1) | (tr13_4_on && gr13_4_on == 2'd1) | (tr13_5_on && gr13_5_on == 2'd1) | (tr13_6_on && gr13_6_on == 2'd1) | (tr13_7_on && gr13_7_on == 2'd1) | (tr13_8_on && gr13_8_on == 2'd1) | (tr13_9_on && gr13_9_on == 2'd1) | (tr13_10_on && gr13_10_on == 2'd1) | (tr13_11_on && gr13_11_on == 2'd1) | (tr13_12_on && gr13_12_on == 2'd1) | (tr13_13_on && gr13_13_on == 2'd1) | (tr13_14_on && gr13_14_on == 2'd1) | (tr13_15_on && gr13_15_on == 2'd1) | (tr13_16_on && gr13_16_on == 2'd1) | (tr13_17_on && gr13_17_on == 2'd1) | (tr13_18_on && gr13_18_on == 2'd1) | (tr13_19_on && gr13_19_on == 2'd1) | (tr13_20_on && gr13_20_on == 2'd1) | (tr13_21_on && gr13_21_on == 2'd1) | (tr13_22_on && gr13_22_on == 2'd1) | (tr13_23_on && gr13_23_on == 2'd1) | (tr13_24_on && gr13_24_on == 2'd1) | (tr14_0_on && gr14_0_on == 2'd1) | (tr14_1_on && gr14_1_on == 2'd1) | (tr14_2_on && gr14_2_on == 2'd1) | (tr14_3_on && gr14_3_on == 2'd1) | (tr14_4_on && gr14_4_on == 2'd1) | (tr14_5_on && gr14_5_on == 2'd1) | (tr14_6_on && gr14_6_on == 2'd1) | (tr14_7_on && gr14_7_on == 2'd1) | (tr14_8_on && gr14_8_on == 2'd1) | (tr14_9_on && gr14_9_on == 2'd1) | (tr14_10_on && gr14_10_on == 2'd1) | (tr14_11_on && gr14_11_on == 2'd1) | (tr14_12_on && gr14_12_on == 2'd1) | (tr14_13_on && gr14_13_on == 2'd1) | (tr14_14_on && gr14_14_on == 2'd1) | (tr14_15_on && gr14_15_on == 2'd1) | (tr14_16_on && gr14_16_on == 2'd1) | (tr14_17_on && gr14_17_on == 2'd1) | (tr14_18_on && gr14_18_on == 2'd1) | (tr14_19_on && gr14_19_on == 2'd1) | (tr14_20_on && gr14_20_on == 2'd1) | (tr14_21_on && gr14_21_on == 2'd1) | (tr14_22_on && gr14_22_on == 2'd1) | (tr14_23_on && gr14_23_on == 2'd1) | (tr14_24_on && gr14_24_on == 2'd1) | (tr15_0_on && gr15_0_on == 2'd1) | (tr15_1_on && gr15_1_on == 2'd1) | (tr15_2_on && gr15_2_on == 2'd1) | (tr15_3_on && gr15_3_on == 2'd1) | (tr15_4_on && gr15_4_on == 2'd1) | (tr15_5_on && gr15_5_on == 2'd1) | (tr15_6_on && gr15_6_on == 2'd1) | (tr15_7_on && gr15_7_on == 2'd1) | (tr15_8_on && gr15_8_on == 2'd1) | (tr15_9_on && gr15_9_on == 2'd1) | (tr15_10_on && gr15_10_on == 2'd1) | (tr15_11_on && gr15_11_on == 2'd1) | (tr15_12_on && gr15_12_on == 2'd1) | (tr15_13_on && gr15_13_on == 2'd1) | (tr15_14_on && gr15_14_on == 2'd1) | (tr15_15_on && gr15_15_on == 2'd1) | (tr15_16_on && gr15_16_on == 2'd1) | (tr15_17_on && gr15_17_on == 2'd1) | (tr15_18_on && gr15_18_on == 2'd1) | (tr15_19_on && gr15_19_on == 2'd1) | (tr15_20_on && gr15_20_on == 2'd1) | (tr15_21_on && gr15_21_on == 2'd1) | (tr15_22_on && gr15_22_on == 2'd1) | (tr15_23_on && gr15_23_on == 2'd1) | (tr15_24_on && gr15_24_on == 2'd1) | (tr16_0_on && gr16_0_on == 2'd1) | (tr16_1_on && gr16_1_on == 2'd1) | (tr16_2_on && gr16_2_on == 2'd1) | (tr16_3_on && gr16_3_on == 2'd1) | (tr16_4_on && gr16_4_on == 2'd1) | (tr16_5_on && gr16_5_on == 2'd1) | (tr16_6_on && gr16_6_on == 2'd1) | (tr16_7_on && gr16_7_on == 2'd1) | (tr16_8_on && gr16_8_on == 2'd1) | (tr16_9_on && gr16_9_on == 2'd1) | (tr16_10_on && gr16_10_on == 2'd1) | (tr16_11_on && gr16_11_on == 2'd1) | (tr16_12_on && gr16_12_on == 2'd1) | (tr16_13_on && gr16_13_on == 2'd1) | (tr16_14_on && gr16_14_on == 2'd1) | (tr16_15_on && gr16_15_on == 2'd1) | (tr16_16_on && gr16_16_on == 2'd1) | (tr16_17_on && gr16_17_on == 2'd1) | (tr16_18_on && gr16_18_on == 2'd1) | (tr16_19_on && gr16_19_on == 2'd1) | (tr16_20_on && gr16_20_on == 2'd1) | (tr16_21_on && gr16_21_on == 2'd1) | (tr16_22_on && gr16_22_on == 2'd1) | (tr16_23_on && gr16_23_on == 2'd1) | (tr16_24_on && gr16_24_on == 2'd1) | (tr17_0_on && gr17_0_on == 2'd1) | (tr17_1_on && gr17_1_on == 2'd1) | (tr17_2_on && gr17_2_on == 2'd1) | (tr17_3_on && gr17_3_on == 2'd1) | (tr17_4_on && gr17_4_on == 2'd1) | (tr17_5_on && gr17_5_on == 2'd1) | (tr17_6_on && gr17_6_on == 2'd1) | (tr17_7_on && gr17_7_on == 2'd1) | (tr17_8_on && gr17_8_on == 2'd1) | (tr17_9_on && gr17_9_on == 2'd1) | (tr17_10_on && gr17_10_on == 2'd1) | (tr17_11_on && gr17_11_on == 2'd1) | (tr17_12_on && gr17_12_on == 2'd1) | (tr17_13_on && gr17_13_on == 2'd1) | (tr17_14_on && gr17_14_on == 2'd1) | (tr17_15_on && gr17_15_on == 2'd1) | (tr17_16_on && gr17_16_on == 2'd1) | (tr17_17_on && gr17_17_on == 2'd1) | (tr17_18_on && gr17_18_on == 2'd1) | (tr17_19_on && gr17_19_on == 2'd1) | (tr17_20_on && gr17_20_on == 2'd1) | (tr17_21_on && gr17_21_on == 2'd1) | (tr17_22_on && gr17_22_on == 2'd1) | (tr17_23_on && gr17_23_on == 2'd1) | (tr17_24_on && gr17_24_on == 2'd1) | (tr18_0_on && gr18_0_on == 2'd1) | (tr18_1_on && gr18_1_on == 2'd1) | (tr18_2_on && gr18_2_on == 2'd1) | (tr18_3_on && gr18_3_on == 2'd1) | (tr18_4_on && gr18_4_on == 2'd1) | (tr18_5_on && gr18_5_on == 2'd1) | (tr18_6_on && gr18_6_on == 2'd1) | (tr18_7_on && gr18_7_on == 2'd1) | (tr18_8_on && gr18_8_on == 2'd1) | (tr18_9_on && gr18_9_on == 2'd1) | (tr18_10_on && gr18_10_on == 2'd1) | (tr18_11_on && gr18_11_on == 2'd1) | (tr18_12_on && gr18_12_on == 2'd1) | (tr18_13_on && gr18_13_on == 2'd1) | (tr18_14_on && gr18_14_on == 2'd1) | (tr18_15_on && gr18_15_on == 2'd1) | (tr18_16_on && gr18_16_on == 2'd1) | (tr18_17_on && gr18_17_on == 2'd1) | (tr18_18_on && gr18_18_on == 2'd1) | (tr18_19_on && gr18_19_on == 2'd1) | (tr18_20_on && gr18_20_on == 2'd1) | (tr18_21_on && gr18_21_on == 2'd1) | (tr18_22_on && gr18_22_on == 2'd1) | (tr18_23_on && gr18_23_on == 2'd1) | (tr18_24_on && gr18_24_on == 2'd1) | (tr19_0_on && gr19_0_on == 2'd1) | (tr19_1_on && gr19_1_on == 2'd1) | (tr19_2_on && gr19_2_on == 2'd1) | (tr19_3_on && gr19_3_on == 2'd1) | (tr19_4_on && gr19_4_on == 2'd1) | (tr19_5_on && gr19_5_on == 2'd1) | (tr19_6_on && gr19_6_on == 2'd1) | (tr19_7_on && gr19_7_on == 2'd1) | (tr19_8_on && gr19_8_on == 2'd1) | (tr19_9_on && gr19_9_on == 2'd1) | (tr19_10_on && gr19_10_on == 2'd1) | (tr19_11_on && gr19_11_on == 2'd1) | (tr19_12_on && gr19_12_on == 2'd1) | (tr19_13_on && gr19_13_on == 2'd1) | (tr19_14_on && gr19_14_on == 2'd1) | (tr19_15_on && gr19_15_on == 2'd1) | (tr19_16_on && gr19_16_on == 2'd1) | (tr19_17_on && gr19_17_on == 2'd1) | (tr19_18_on && gr19_18_on == 2'd1) | (tr19_19_on && gr19_19_on == 2'd1) | (tr19_20_on && gr19_20_on == 2'd1) | (tr19_21_on && gr19_21_on == 2'd1) | (tr19_22_on && gr19_22_on == 2'd1) | (tr19_23_on && gr19_23_on == 2'd1) | (tr19_24_on && gr19_24_on == 2'd1) | (tr20_0_on && gr20_0_on == 2'd1) | (tr20_1_on && gr20_1_on == 2'd1) | (tr20_2_on && gr20_2_on == 2'd1) | (tr20_3_on && gr20_3_on == 2'd1) | (tr20_4_on && gr20_4_on == 2'd1) | (tr20_5_on && gr20_5_on == 2'd1) | (tr20_6_on && gr20_6_on == 2'd1) | (tr20_7_on && gr20_7_on == 2'd1) | (tr20_8_on && gr20_8_on == 2'd1) | (tr20_9_on && gr20_9_on == 2'd1) | (tr20_10_on && gr20_10_on == 2'd1) | (tr20_11_on && gr20_11_on == 2'd1) | (tr20_12_on && gr20_12_on == 2'd1) | (tr20_13_on && gr20_13_on == 2'd1) | (tr20_14_on && gr20_14_on == 2'd1) | (tr20_15_on && gr20_15_on == 2'd1) | (tr20_16_on && gr20_16_on == 2'd1) | (tr20_17_on && gr20_17_on == 2'd1) | (tr20_18_on && gr20_18_on == 2'd1) | (tr20_19_on && gr20_19_on == 2'd1) | (tr20_20_on && gr20_20_on == 2'd1) | (tr20_21_on && gr20_21_on == 2'd1) | (tr20_22_on && gr20_22_on == 2'd1) | (tr20_23_on && gr20_23_on == 2'd1) | (tr20_24_on && gr20_24_on == 2'd1) | (tr21_0_on && gr21_0_on == 2'd1) | (tr21_1_on && gr21_1_on == 2'd1) | (tr21_2_on && gr21_2_on == 2'd1) | (tr21_3_on && gr21_3_on == 2'd1) | (tr21_4_on && gr21_4_on == 2'd1) | (tr21_5_on && gr21_5_on == 2'd1) | (tr21_6_on && gr21_6_on == 2'd1) | (tr21_7_on && gr21_7_on == 2'd1) | (tr21_8_on && gr21_8_on == 2'd1) | (tr21_9_on && gr21_9_on == 2'd1) | (tr21_10_on && gr21_10_on == 2'd1) | (tr21_11_on && gr21_11_on == 2'd1) | (tr21_12_on && gr21_12_on == 2'd1) | (tr21_13_on && gr21_13_on == 2'd1) | (tr21_14_on && gr21_14_on == 2'd1) | (tr21_15_on && gr21_15_on == 2'd1) | (tr21_16_on && gr21_16_on == 2'd1) | (tr21_17_on && gr21_17_on == 2'd1) | (tr21_18_on && gr21_18_on == 2'd1) | (tr21_19_on && gr21_19_on == 2'd1) | (tr21_20_on && gr21_20_on == 2'd1) | (tr21_21_on && gr21_21_on == 2'd1) | (tr21_22_on && gr21_22_on == 2'd1) | (tr21_23_on && gr21_23_on == 2'd1) | (tr21_24_on && gr21_24_on == 2'd1) | (tr22_0_on && gr22_0_on == 2'd1) | (tr22_1_on && gr22_1_on == 2'd1) | (tr22_2_on && gr22_2_on == 2'd1) | (tr22_3_on && gr22_3_on == 2'd1) | (tr22_4_on && gr22_4_on == 2'd1) | (tr22_5_on && gr22_5_on == 2'd1) | (tr22_6_on && gr22_6_on == 2'd1) | (tr22_7_on && gr22_7_on == 2'd1) | (tr22_8_on && gr22_8_on == 2'd1) | (tr22_9_on && gr22_9_on == 2'd1) | (tr22_10_on && gr22_10_on == 2'd1) | (tr22_11_on && gr22_11_on == 2'd1) | (tr22_12_on && gr22_12_on == 2'd1) | (tr22_13_on && gr22_13_on == 2'd1) | (tr22_14_on && gr22_14_on == 2'd1) | (tr22_15_on && gr22_15_on == 2'd1) | (tr22_16_on && gr22_16_on == 2'd1) | (tr22_17_on && gr22_17_on == 2'd1) | (tr22_18_on && gr22_18_on == 2'd1) | (tr22_19_on && gr22_19_on == 2'd1) | (tr22_20_on && gr22_20_on == 2'd1) | (tr22_21_on && gr22_21_on == 2'd1) | (tr22_22_on && gr22_22_on == 2'd1) | (tr22_23_on && gr22_23_on == 2'd1) | (tr22_24_on && gr22_24_on == 2'd1) | (tr23_0_on && gr23_0_on == 2'd1) | (tr23_1_on && gr23_1_on == 2'd1) | (tr23_2_on && gr23_2_on == 2'd1) | (tr23_3_on && gr23_3_on == 2'd1) | (tr23_4_on && gr23_4_on == 2'd1) | (tr23_5_on && gr23_5_on == 2'd1) | (tr23_6_on && gr23_6_on == 2'd1) | (tr23_7_on && gr23_7_on == 2'd1) | (tr23_8_on && gr23_8_on == 2'd1) | (tr23_9_on && gr23_9_on == 2'd1) | (tr23_10_on && gr23_10_on == 2'd1) | (tr23_11_on && gr23_11_on == 2'd1) | (tr23_12_on && gr23_12_on == 2'd1) | (tr23_13_on && gr23_13_on == 2'd1) | (tr23_14_on && gr23_14_on == 2'd1) | (tr23_15_on && gr23_15_on == 2'd1) | (tr23_16_on && gr23_16_on == 2'd1) | (tr23_17_on && gr23_17_on == 2'd1) | (tr23_18_on && gr23_18_on == 2'd1) | (tr23_19_on && gr23_19_on == 2'd1) | (tr23_20_on && gr23_20_on == 2'd1) | (tr23_21_on && gr23_21_on == 2'd1) | (tr23_22_on && gr23_22_on == 2'd1) | (tr23_23_on && gr23_23_on == 2'd1) | (tr23_24_on && gr23_24_on == 2'd1) | (tr24_0_on && gr24_0_on == 2'd1) | (tr24_1_on && gr24_1_on == 2'd1) | (tr24_2_on && gr24_2_on == 2'd1) | (tr24_3_on && gr24_3_on == 2'd1) | (tr24_4_on && gr24_4_on == 2'd1) | (tr24_5_on && gr24_5_on == 2'd1) | (tr24_6_on && gr24_6_on == 2'd1) | (tr24_7_on && gr24_7_on == 2'd1) | (tr24_8_on && gr24_8_on == 2'd1) | (tr24_9_on && gr24_9_on == 2'd1) | (tr24_10_on && gr24_10_on == 2'd1) | (tr24_11_on && gr24_11_on == 2'd1) | (tr24_12_on && gr24_12_on == 2'd1) | (tr24_13_on && gr24_13_on == 2'd1) | (tr24_14_on && gr24_14_on == 2'd1) | (tr24_15_on && gr24_15_on == 2'd1) | (tr24_16_on && gr24_16_on == 2'd1) | (tr24_17_on && gr24_17_on == 2'd1) | (tr24_18_on && gr24_18_on == 2'd1) | (tr24_19_on && gr24_19_on == 2'd1) | (tr24_20_on && gr24_20_on == 2'd1) | (tr24_21_on && gr24_21_on == 2'd1) | (tr24_22_on && gr24_22_on == 2'd1) | (tr24_23_on && gr24_23_on == 2'd1) | (tr24_24_on && gr24_24_on == 2'd1))
                rgb = trail1;
            else if ((tr0_0_on && gr0_0_on == 2'd2) | (tr0_1_on && gr0_1_on == 2'd2) | (tr0_2_on && gr0_2_on == 2'd2) | (tr0_3_on && gr0_3_on == 2'd2) | (tr0_4_on && gr0_4_on == 2'd2) | (tr0_5_on && gr0_5_on == 2'd2) | (tr0_6_on && gr0_6_on == 2'd2) | (tr0_7_on && gr0_7_on == 2'd2) | (tr0_8_on && gr0_8_on == 2'd2) | (tr0_9_on && gr0_9_on == 2'd2) | (tr0_10_on && gr0_10_on == 2'd2) | (tr0_11_on && gr0_11_on == 2'd2) | (tr0_12_on && gr0_12_on == 2'd2) | (tr0_13_on && gr0_13_on == 2'd2) | (tr0_14_on && gr0_14_on == 2'd2) | (tr0_15_on && gr0_15_on == 2'd2) | (tr0_16_on && gr0_16_on == 2'd2) | (tr0_17_on && gr0_17_on == 2'd2) | (tr0_18_on && gr0_18_on == 2'd2) | (tr0_19_on && gr0_19_on == 2'd2) | (tr0_20_on && gr0_20_on == 2'd2) | (tr0_21_on && gr0_21_on == 2'd2) | (tr0_22_on && gr0_22_on == 2'd2) | (tr0_23_on && gr0_23_on == 2'd2) | (tr0_24_on && gr0_24_on == 2'd2) | (tr1_0_on && gr1_0_on == 2'd2) | (tr1_1_on && gr1_1_on == 2'd2) | (tr1_2_on && gr1_2_on == 2'd2) | (tr1_3_on && gr1_3_on == 2'd2) | (tr1_4_on && gr1_4_on == 2'd2) | (tr1_5_on && gr1_5_on == 2'd2) | (tr1_6_on && gr1_6_on == 2'd2) | (tr1_7_on && gr1_7_on == 2'd2) | (tr1_8_on && gr1_8_on == 2'd2) | (tr1_9_on && gr1_9_on == 2'd2) | (tr1_10_on && gr1_10_on == 2'd2) | (tr1_11_on && gr1_11_on == 2'd2) | (tr1_12_on && gr1_12_on == 2'd2) | (tr1_13_on && gr1_13_on == 2'd2) | (tr1_14_on && gr1_14_on == 2'd2) | (tr1_15_on && gr1_15_on == 2'd2) | (tr1_16_on && gr1_16_on == 2'd2) | (tr1_17_on && gr1_17_on == 2'd2) | (tr1_18_on && gr1_18_on == 2'd2) | (tr1_19_on && gr1_19_on == 2'd2) | (tr1_20_on && gr1_20_on == 2'd2) | (tr1_21_on && gr1_21_on == 2'd2) | (tr1_22_on && gr1_22_on == 2'd2) | (tr1_23_on && gr1_23_on == 2'd2) | (tr1_24_on && gr1_24_on == 2'd2) | (tr2_0_on && gr2_0_on == 2'd2) | (tr2_1_on && gr2_1_on == 2'd2) | (tr2_2_on && gr2_2_on == 2'd2) | (tr2_3_on && gr2_3_on == 2'd2) | (tr2_4_on && gr2_4_on == 2'd2) | (tr2_5_on && gr2_5_on == 2'd2) | (tr2_6_on && gr2_6_on == 2'd2) | (tr2_7_on && gr2_7_on == 2'd2) | (tr2_8_on && gr2_8_on == 2'd2) | (tr2_9_on && gr2_9_on == 2'd2) | (tr2_10_on && gr2_10_on == 2'd2) | (tr2_11_on && gr2_11_on == 2'd2) | (tr2_12_on && gr2_12_on == 2'd2) | (tr2_13_on && gr2_13_on == 2'd2) | (tr2_14_on && gr2_14_on == 2'd2) | (tr2_15_on && gr2_15_on == 2'd2) | (tr2_16_on && gr2_16_on == 2'd2) | (tr2_17_on && gr2_17_on == 2'd2) | (tr2_18_on && gr2_18_on == 2'd2) | (tr2_19_on && gr2_19_on == 2'd2) | (tr2_20_on && gr2_20_on == 2'd2) | (tr2_21_on && gr2_21_on == 2'd2) | (tr2_22_on && gr2_22_on == 2'd2) | (tr2_23_on && gr2_23_on == 2'd2) | (tr2_24_on && gr2_24_on == 2'd2) | (tr3_0_on && gr3_0_on == 2'd2) | (tr3_1_on && gr3_1_on == 2'd2) | (tr3_2_on && gr3_2_on == 2'd2) | (tr3_3_on && gr3_3_on == 2'd2) | (tr3_4_on && gr3_4_on == 2'd2) | (tr3_5_on && gr3_5_on == 2'd2) | (tr3_6_on && gr3_6_on == 2'd2) | (tr3_7_on && gr3_7_on == 2'd2) | (tr3_8_on && gr3_8_on == 2'd2) | (tr3_9_on && gr3_9_on == 2'd2) | (tr3_10_on && gr3_10_on == 2'd2) | (tr3_11_on && gr3_11_on == 2'd2) | (tr3_12_on && gr3_12_on == 2'd2) | (tr3_13_on && gr3_13_on == 2'd2) | (tr3_14_on && gr3_14_on == 2'd2) | (tr3_15_on && gr3_15_on == 2'd2) | (tr3_16_on && gr3_16_on == 2'd2) | (tr3_17_on && gr3_17_on == 2'd2) | (tr3_18_on && gr3_18_on == 2'd2) | (tr3_19_on && gr3_19_on == 2'd2) | (tr3_20_on && gr3_20_on == 2'd2) | (tr3_21_on && gr3_21_on == 2'd2) | (tr3_22_on && gr3_22_on == 2'd2) | (tr3_23_on && gr3_23_on == 2'd2) | (tr3_24_on && gr3_24_on == 2'd2) | (tr4_0_on && gr4_0_on == 2'd2) | (tr4_1_on && gr4_1_on == 2'd2) | (tr4_2_on && gr4_2_on == 2'd2) | (tr4_3_on && gr4_3_on == 2'd2) | (tr4_4_on && gr4_4_on == 2'd2) | (tr4_5_on && gr4_5_on == 2'd2) | (tr4_6_on && gr4_6_on == 2'd2) | (tr4_7_on && gr4_7_on == 2'd2) | (tr4_8_on && gr4_8_on == 2'd2) | (tr4_9_on && gr4_9_on == 2'd2) | (tr4_10_on && gr4_10_on == 2'd2) | (tr4_11_on && gr4_11_on == 2'd2) | (tr4_12_on && gr4_12_on == 2'd2) | (tr4_13_on && gr4_13_on == 2'd2) | (tr4_14_on && gr4_14_on == 2'd2) | (tr4_15_on && gr4_15_on == 2'd2) | (tr4_16_on && gr4_16_on == 2'd2) | (tr4_17_on && gr4_17_on == 2'd2) | (tr4_18_on && gr4_18_on == 2'd2) | (tr4_19_on && gr4_19_on == 2'd2) | (tr4_20_on && gr4_20_on == 2'd2) | (tr4_21_on && gr4_21_on == 2'd2) | (tr4_22_on && gr4_22_on == 2'd2) | (tr4_23_on && gr4_23_on == 2'd2) | (tr4_24_on && gr4_24_on == 2'd2) | (tr5_0_on && gr5_0_on == 2'd2) | (tr5_1_on && gr5_1_on == 2'd2) | (tr5_2_on && gr5_2_on == 2'd2) | (tr5_3_on && gr5_3_on == 2'd2) | (tr5_4_on && gr5_4_on == 2'd2) | (tr5_5_on && gr5_5_on == 2'd2) | (tr5_6_on && gr5_6_on == 2'd2) | (tr5_7_on && gr5_7_on == 2'd2) | (tr5_8_on && gr5_8_on == 2'd2) | (tr5_9_on && gr5_9_on == 2'd2) | (tr5_10_on && gr5_10_on == 2'd2) | (tr5_11_on && gr5_11_on == 2'd2) | (tr5_12_on && gr5_12_on == 2'd2) | (tr5_13_on && gr5_13_on == 2'd2) | (tr5_14_on && gr5_14_on == 2'd2) | (tr5_15_on && gr5_15_on == 2'd2) | (tr5_16_on && gr5_16_on == 2'd2) | (tr5_17_on && gr5_17_on == 2'd2) | (tr5_18_on && gr5_18_on == 2'd2) | (tr5_19_on && gr5_19_on == 2'd2) | (tr5_20_on && gr5_20_on == 2'd2) | (tr5_21_on && gr5_21_on == 2'd2) | (tr5_22_on && gr5_22_on == 2'd2) | (tr5_23_on && gr5_23_on == 2'd2) | (tr5_24_on && gr5_24_on == 2'd2) | (tr6_0_on && gr6_0_on == 2'd2) | (tr6_1_on && gr6_1_on == 2'd2) | (tr6_2_on && gr6_2_on == 2'd2) | (tr6_3_on && gr6_3_on == 2'd2) | (tr6_4_on && gr6_4_on == 2'd2) | (tr6_5_on && gr6_5_on == 2'd2) | (tr6_6_on && gr6_6_on == 2'd2) | (tr6_7_on && gr6_7_on == 2'd2) | (tr6_8_on && gr6_8_on == 2'd2) | (tr6_9_on && gr6_9_on == 2'd2) | (tr6_10_on && gr6_10_on == 2'd2) | (tr6_11_on && gr6_11_on == 2'd2) | (tr6_12_on && gr6_12_on == 2'd2) | (tr6_13_on && gr6_13_on == 2'd2) | (tr6_14_on && gr6_14_on == 2'd2) | (tr6_15_on && gr6_15_on == 2'd2) | (tr6_16_on && gr6_16_on == 2'd2) | (tr6_17_on && gr6_17_on == 2'd2) | (tr6_18_on && gr6_18_on == 2'd2) | (tr6_19_on && gr6_19_on == 2'd2) | (tr6_20_on && gr6_20_on == 2'd2) | (tr6_21_on && gr6_21_on == 2'd2) | (tr6_22_on && gr6_22_on == 2'd2) | (tr6_23_on && gr6_23_on == 2'd2) | (tr6_24_on && gr6_24_on == 2'd2) | (tr7_0_on && gr7_0_on == 2'd2) | (tr7_1_on && gr7_1_on == 2'd2) | (tr7_2_on && gr7_2_on == 2'd2) | (tr7_3_on && gr7_3_on == 2'd2) | (tr7_4_on && gr7_4_on == 2'd2) | (tr7_5_on && gr7_5_on == 2'd2) | (tr7_6_on && gr7_6_on == 2'd2) | (tr7_7_on && gr7_7_on == 2'd2) | (tr7_8_on && gr7_8_on == 2'd2) | (tr7_9_on && gr7_9_on == 2'd2) | (tr7_10_on && gr7_10_on == 2'd2) | (tr7_11_on && gr7_11_on == 2'd2) | (tr7_12_on && gr7_12_on == 2'd2) | (tr7_13_on && gr7_13_on == 2'd2) | (tr7_14_on && gr7_14_on == 2'd2) | (tr7_15_on && gr7_15_on == 2'd2) | (tr7_16_on && gr7_16_on == 2'd2) | (tr7_17_on && gr7_17_on == 2'd2) | (tr7_18_on && gr7_18_on == 2'd2) | (tr7_19_on && gr7_19_on == 2'd2) | (tr7_20_on && gr7_20_on == 2'd2) | (tr7_21_on && gr7_21_on == 2'd2) | (tr7_22_on && gr7_22_on == 2'd2) | (tr7_23_on && gr7_23_on == 2'd2) | (tr7_24_on && gr7_24_on == 2'd2) | (tr8_0_on && gr8_0_on == 2'd2) | (tr8_1_on && gr8_1_on == 2'd2) | (tr8_2_on && gr8_2_on == 2'd2) | (tr8_3_on && gr8_3_on == 2'd2) | (tr8_4_on && gr8_4_on == 2'd2) | (tr8_5_on && gr8_5_on == 2'd2) | (tr8_6_on && gr8_6_on == 2'd2) | (tr8_7_on && gr8_7_on == 2'd2) | (tr8_8_on && gr8_8_on == 2'd2) | (tr8_9_on && gr8_9_on == 2'd2) | (tr8_10_on && gr8_10_on == 2'd2) | (tr8_11_on && gr8_11_on == 2'd2) | (tr8_12_on && gr8_12_on == 2'd2) | (tr8_13_on && gr8_13_on == 2'd2) | (tr8_14_on && gr8_14_on == 2'd2) | (tr8_15_on && gr8_15_on == 2'd2) | (tr8_16_on && gr8_16_on == 2'd2) | (tr8_17_on && gr8_17_on == 2'd2) | (tr8_18_on && gr8_18_on == 2'd2) | (tr8_19_on && gr8_19_on == 2'd2) | (tr8_20_on && gr8_20_on == 2'd2) | (tr8_21_on && gr8_21_on == 2'd2) | (tr8_22_on && gr8_22_on == 2'd2) | (tr8_23_on && gr8_23_on == 2'd2) | (tr8_24_on && gr8_24_on == 2'd2) | (tr9_0_on && gr9_0_on == 2'd2) | (tr9_1_on && gr9_1_on == 2'd2) | (tr9_2_on && gr9_2_on == 2'd2) | (tr9_3_on && gr9_3_on == 2'd2) | (tr9_4_on && gr9_4_on == 2'd2) | (tr9_5_on && gr9_5_on == 2'd2) | (tr9_6_on && gr9_6_on == 2'd2) | (tr9_7_on && gr9_7_on == 2'd2) | (tr9_8_on && gr9_8_on == 2'd2) | (tr9_9_on && gr9_9_on == 2'd2) | (tr9_10_on && gr9_10_on == 2'd2) | (tr9_11_on && gr9_11_on == 2'd2) | (tr9_12_on && gr9_12_on == 2'd2) | (tr9_13_on && gr9_13_on == 2'd2) | (tr9_14_on && gr9_14_on == 2'd2) | (tr9_15_on && gr9_15_on == 2'd2) | (tr9_16_on && gr9_16_on == 2'd2) | (tr9_17_on && gr9_17_on == 2'd2) | (tr9_18_on && gr9_18_on == 2'd2) | (tr9_19_on && gr9_19_on == 2'd2) | (tr9_20_on && gr9_20_on == 2'd2) | (tr9_21_on && gr9_21_on == 2'd2) | (tr9_22_on && gr9_22_on == 2'd2) | (tr9_23_on && gr9_23_on == 2'd2) | (tr9_24_on && gr9_24_on == 2'd2) | (tr10_0_on && gr10_0_on == 2'd2) | (tr10_1_on && gr10_1_on == 2'd2) | (tr10_2_on && gr10_2_on == 2'd2) | (tr10_3_on && gr10_3_on == 2'd2) | (tr10_4_on && gr10_4_on == 2'd2) | (tr10_5_on && gr10_5_on == 2'd2) | (tr10_6_on && gr10_6_on == 2'd2) | (tr10_7_on && gr10_7_on == 2'd2) | (tr10_8_on && gr10_8_on == 2'd2) | (tr10_9_on && gr10_9_on == 2'd2) | (tr10_10_on && gr10_10_on == 2'd2) | (tr10_11_on && gr10_11_on == 2'd2) | (tr10_12_on && gr10_12_on == 2'd2) | (tr10_13_on && gr10_13_on == 2'd2) | (tr10_14_on && gr10_14_on == 2'd2) | (tr10_15_on && gr10_15_on == 2'd2) | (tr10_16_on && gr10_16_on == 2'd2) | (tr10_17_on && gr10_17_on == 2'd2) | (tr10_18_on && gr10_18_on == 2'd2) | (tr10_19_on && gr10_19_on == 2'd2) | (tr10_20_on && gr10_20_on == 2'd2) | (tr10_21_on && gr10_21_on == 2'd2) | (tr10_22_on && gr10_22_on == 2'd2) | (tr10_23_on && gr10_23_on == 2'd2) | (tr10_24_on && gr10_24_on == 2'd2) | (tr11_0_on && gr11_0_on == 2'd2) | (tr11_1_on && gr11_1_on == 2'd2) | (tr11_2_on && gr11_2_on == 2'd2) | (tr11_3_on && gr11_3_on == 2'd2) | (tr11_4_on && gr11_4_on == 2'd2) | (tr11_5_on && gr11_5_on == 2'd2) | (tr11_6_on && gr11_6_on == 2'd2) | (tr11_7_on && gr11_7_on == 2'd2) | (tr11_8_on && gr11_8_on == 2'd2) | (tr11_9_on && gr11_9_on == 2'd2) | (tr11_10_on && gr11_10_on == 2'd2) | (tr11_11_on && gr11_11_on == 2'd2) | (tr11_12_on && gr11_12_on == 2'd2) | (tr11_13_on && gr11_13_on == 2'd2) | (tr11_14_on && gr11_14_on == 2'd2) | (tr11_15_on && gr11_15_on == 2'd2) | (tr11_16_on && gr11_16_on == 2'd2) | (tr11_17_on && gr11_17_on == 2'd2) | (tr11_18_on && gr11_18_on == 2'd2) | (tr11_19_on && gr11_19_on == 2'd2) | (tr11_20_on && gr11_20_on == 2'd2) | (tr11_21_on && gr11_21_on == 2'd2) | (tr11_22_on && gr11_22_on == 2'd2) | (tr11_23_on && gr11_23_on == 2'd2) | (tr11_24_on && gr11_24_on == 2'd2) | (tr12_0_on && gr12_0_on == 2'd2) | (tr12_1_on && gr12_1_on == 2'd2) | (tr12_2_on && gr12_2_on == 2'd2) | (tr12_3_on && gr12_3_on == 2'd2) | (tr12_4_on && gr12_4_on == 2'd2) | (tr12_5_on && gr12_5_on == 2'd2) | (tr12_6_on && gr12_6_on == 2'd2) | (tr12_7_on && gr12_7_on == 2'd2) | (tr12_8_on && gr12_8_on == 2'd2) | (tr12_9_on && gr12_9_on == 2'd2) | (tr12_10_on && gr12_10_on == 2'd2) | (tr12_11_on && gr12_11_on == 2'd2) | (tr12_12_on && gr12_12_on == 2'd2) | (tr12_13_on && gr12_13_on == 2'd2) | (tr12_14_on && gr12_14_on == 2'd2) | (tr12_15_on && gr12_15_on == 2'd2) | (tr12_16_on && gr12_16_on == 2'd2) | (tr12_17_on && gr12_17_on == 2'd2) | (tr12_18_on && gr12_18_on == 2'd2) | (tr12_19_on && gr12_19_on == 2'd2) | (tr12_20_on && gr12_20_on == 2'd2) | (tr12_21_on && gr12_21_on == 2'd2) | (tr12_22_on && gr12_22_on == 2'd2) | (tr12_23_on && gr12_23_on == 2'd2) | (tr12_24_on && gr12_24_on == 2'd2) | (tr13_0_on && gr13_0_on == 2'd2) | (tr13_1_on && gr13_1_on == 2'd2) | (tr13_2_on && gr13_2_on == 2'd2) | (tr13_3_on && gr13_3_on == 2'd2) | (tr13_4_on && gr13_4_on == 2'd2) | (tr13_5_on && gr13_5_on == 2'd2) | (tr13_6_on && gr13_6_on == 2'd2) | (tr13_7_on && gr13_7_on == 2'd2) | (tr13_8_on && gr13_8_on == 2'd2) | (tr13_9_on && gr13_9_on == 2'd2) | (tr13_10_on && gr13_10_on == 2'd2) | (tr13_11_on && gr13_11_on == 2'd2) | (tr13_12_on && gr13_12_on == 2'd2) | (tr13_13_on && gr13_13_on == 2'd2) | (tr13_14_on && gr13_14_on == 2'd2) | (tr13_15_on && gr13_15_on == 2'd2) | (tr13_16_on && gr13_16_on == 2'd2) | (tr13_17_on && gr13_17_on == 2'd2) | (tr13_18_on && gr13_18_on == 2'd2) | (tr13_19_on && gr13_19_on == 2'd2) | (tr13_20_on && gr13_20_on == 2'd2) | (tr13_21_on && gr13_21_on == 2'd2) | (tr13_22_on && gr13_22_on == 2'd2) | (tr13_23_on && gr13_23_on == 2'd2) | (tr13_24_on && gr13_24_on == 2'd2) | (tr14_0_on && gr14_0_on == 2'd2) | (tr14_1_on && gr14_1_on == 2'd2) | (tr14_2_on && gr14_2_on == 2'd2) | (tr14_3_on && gr14_3_on == 2'd2) | (tr14_4_on && gr14_4_on == 2'd2) | (tr14_5_on && gr14_5_on == 2'd2) | (tr14_6_on && gr14_6_on == 2'd2) | (tr14_7_on && gr14_7_on == 2'd2) | (tr14_8_on && gr14_8_on == 2'd2) | (tr14_9_on && gr14_9_on == 2'd2) | (tr14_10_on && gr14_10_on == 2'd2) | (tr14_11_on && gr14_11_on == 2'd2) | (tr14_12_on && gr14_12_on == 2'd2) | (tr14_13_on && gr14_13_on == 2'd2) | (tr14_14_on && gr14_14_on == 2'd2) | (tr14_15_on && gr14_15_on == 2'd2) | (tr14_16_on && gr14_16_on == 2'd2) | (tr14_17_on && gr14_17_on == 2'd2) | (tr14_18_on && gr14_18_on == 2'd2) | (tr14_19_on && gr14_19_on == 2'd2) | (tr14_20_on && gr14_20_on == 2'd2) | (tr14_21_on && gr14_21_on == 2'd2) | (tr14_22_on && gr14_22_on == 2'd2) | (tr14_23_on && gr14_23_on == 2'd2) | (tr14_24_on && gr14_24_on == 2'd2) | (tr15_0_on && gr15_0_on == 2'd2) | (tr15_1_on && gr15_1_on == 2'd2) | (tr15_2_on && gr15_2_on == 2'd2) | (tr15_3_on && gr15_3_on == 2'd2) | (tr15_4_on && gr15_4_on == 2'd2) | (tr15_5_on && gr15_5_on == 2'd2) | (tr15_6_on && gr15_6_on == 2'd2) | (tr15_7_on && gr15_7_on == 2'd2) | (tr15_8_on && gr15_8_on == 2'd2) | (tr15_9_on && gr15_9_on == 2'd2) | (tr15_10_on && gr15_10_on == 2'd2) | (tr15_11_on && gr15_11_on == 2'd2) | (tr15_12_on && gr15_12_on == 2'd2) | (tr15_13_on && gr15_13_on == 2'd2) | (tr15_14_on && gr15_14_on == 2'd2) | (tr15_15_on && gr15_15_on == 2'd2) | (tr15_16_on && gr15_16_on == 2'd2) | (tr15_17_on && gr15_17_on == 2'd2) | (tr15_18_on && gr15_18_on == 2'd2) | (tr15_19_on && gr15_19_on == 2'd2) | (tr15_20_on && gr15_20_on == 2'd2) | (tr15_21_on && gr15_21_on == 2'd2) | (tr15_22_on && gr15_22_on == 2'd2) | (tr15_23_on && gr15_23_on == 2'd2) | (tr15_24_on && gr15_24_on == 2'd2) | (tr16_0_on && gr16_0_on == 2'd2) | (tr16_1_on && gr16_1_on == 2'd2) | (tr16_2_on && gr16_2_on == 2'd2) | (tr16_3_on && gr16_3_on == 2'd2) | (tr16_4_on && gr16_4_on == 2'd2) | (tr16_5_on && gr16_5_on == 2'd2) | (tr16_6_on && gr16_6_on == 2'd2) | (tr16_7_on && gr16_7_on == 2'd2) | (tr16_8_on && gr16_8_on == 2'd2) | (tr16_9_on && gr16_9_on == 2'd2) | (tr16_10_on && gr16_10_on == 2'd2) | (tr16_11_on && gr16_11_on == 2'd2) | (tr16_12_on && gr16_12_on == 2'd2) | (tr16_13_on && gr16_13_on == 2'd2) | (tr16_14_on && gr16_14_on == 2'd2) | (tr16_15_on && gr16_15_on == 2'd2) | (tr16_16_on && gr16_16_on == 2'd2) | (tr16_17_on && gr16_17_on == 2'd2) | (tr16_18_on && gr16_18_on == 2'd2) | (tr16_19_on && gr16_19_on == 2'd2) | (tr16_20_on && gr16_20_on == 2'd2) | (tr16_21_on && gr16_21_on == 2'd2) | (tr16_22_on && gr16_22_on == 2'd2) | (tr16_23_on && gr16_23_on == 2'd2) | (tr16_24_on && gr16_24_on == 2'd2) | (tr17_0_on && gr17_0_on == 2'd2) | (tr17_1_on && gr17_1_on == 2'd2) | (tr17_2_on && gr17_2_on == 2'd2) | (tr17_3_on && gr17_3_on == 2'd2) | (tr17_4_on && gr17_4_on == 2'd2) | (tr17_5_on && gr17_5_on == 2'd2) | (tr17_6_on && gr17_6_on == 2'd2) | (tr17_7_on && gr17_7_on == 2'd2) | (tr17_8_on && gr17_8_on == 2'd2) | (tr17_9_on && gr17_9_on == 2'd2) | (tr17_10_on && gr17_10_on == 2'd2) | (tr17_11_on && gr17_11_on == 2'd2) | (tr17_12_on && gr17_12_on == 2'd2) | (tr17_13_on && gr17_13_on == 2'd2) | (tr17_14_on && gr17_14_on == 2'd2) | (tr17_15_on && gr17_15_on == 2'd2) | (tr17_16_on && gr17_16_on == 2'd2) | (tr17_17_on && gr17_17_on == 2'd2) | (tr17_18_on && gr17_18_on == 2'd2) | (tr17_19_on && gr17_19_on == 2'd2) | (tr17_20_on && gr17_20_on == 2'd2) | (tr17_21_on && gr17_21_on == 2'd2) | (tr17_22_on && gr17_22_on == 2'd2) | (tr17_23_on && gr17_23_on == 2'd2) | (tr17_24_on && gr17_24_on == 2'd2) | (tr18_0_on && gr18_0_on == 2'd2) | (tr18_1_on && gr18_1_on == 2'd2) | (tr18_2_on && gr18_2_on == 2'd2) | (tr18_3_on && gr18_3_on == 2'd2) | (tr18_4_on && gr18_4_on == 2'd2) | (tr18_5_on && gr18_5_on == 2'd2) | (tr18_6_on && gr18_6_on == 2'd2) | (tr18_7_on && gr18_7_on == 2'd2) | (tr18_8_on && gr18_8_on == 2'd2) | (tr18_9_on && gr18_9_on == 2'd2) | (tr18_10_on && gr18_10_on == 2'd2) | (tr18_11_on && gr18_11_on == 2'd2) | (tr18_12_on && gr18_12_on == 2'd2) | (tr18_13_on && gr18_13_on == 2'd2) | (tr18_14_on && gr18_14_on == 2'd2) | (tr18_15_on && gr18_15_on == 2'd2) | (tr18_16_on && gr18_16_on == 2'd2) | (tr18_17_on && gr18_17_on == 2'd2) | (tr18_18_on && gr18_18_on == 2'd2) | (tr18_19_on && gr18_19_on == 2'd2) | (tr18_20_on && gr18_20_on == 2'd2) | (tr18_21_on && gr18_21_on == 2'd2) | (tr18_22_on && gr18_22_on == 2'd2) | (tr18_23_on && gr18_23_on == 2'd2) | (tr18_24_on && gr18_24_on == 2'd2) | (tr19_0_on && gr19_0_on == 2'd2) | (tr19_1_on && gr19_1_on == 2'd2) | (tr19_2_on && gr19_2_on == 2'd2) | (tr19_3_on && gr19_3_on == 2'd2) | (tr19_4_on && gr19_4_on == 2'd2) | (tr19_5_on && gr19_5_on == 2'd2) | (tr19_6_on && gr19_6_on == 2'd2) | (tr19_7_on && gr19_7_on == 2'd2) | (tr19_8_on && gr19_8_on == 2'd2) | (tr19_9_on && gr19_9_on == 2'd2) | (tr19_10_on && gr19_10_on == 2'd2) | (tr19_11_on && gr19_11_on == 2'd2) | (tr19_12_on && gr19_12_on == 2'd2) | (tr19_13_on && gr19_13_on == 2'd2) | (tr19_14_on && gr19_14_on == 2'd2) | (tr19_15_on && gr19_15_on == 2'd2) | (tr19_16_on && gr19_16_on == 2'd2) | (tr19_17_on && gr19_17_on == 2'd2) | (tr19_18_on && gr19_18_on == 2'd2) | (tr19_19_on && gr19_19_on == 2'd2) | (tr19_20_on && gr19_20_on == 2'd2) | (tr19_21_on && gr19_21_on == 2'd2) | (tr19_22_on && gr19_22_on == 2'd2) | (tr19_23_on && gr19_23_on == 2'd2) | (tr19_24_on && gr19_24_on == 2'd2) | (tr20_0_on && gr20_0_on == 2'd2) | (tr20_1_on && gr20_1_on == 2'd2) | (tr20_2_on && gr20_2_on == 2'd2) | (tr20_3_on && gr20_3_on == 2'd2) | (tr20_4_on && gr20_4_on == 2'd2) | (tr20_5_on && gr20_5_on == 2'd2) | (tr20_6_on && gr20_6_on == 2'd2) | (tr20_7_on && gr20_7_on == 2'd2) | (tr20_8_on && gr20_8_on == 2'd2) | (tr20_9_on && gr20_9_on == 2'd2) | (tr20_10_on && gr20_10_on == 2'd2) | (tr20_11_on && gr20_11_on == 2'd2) | (tr20_12_on && gr20_12_on == 2'd2) | (tr20_13_on && gr20_13_on == 2'd2) | (tr20_14_on && gr20_14_on == 2'd2) | (tr20_15_on && gr20_15_on == 2'd2) | (tr20_16_on && gr20_16_on == 2'd2) | (tr20_17_on && gr20_17_on == 2'd2) | (tr20_18_on && gr20_18_on == 2'd2) | (tr20_19_on && gr20_19_on == 2'd2) | (tr20_20_on && gr20_20_on == 2'd2) | (tr20_21_on && gr20_21_on == 2'd2) | (tr20_22_on && gr20_22_on == 2'd2) | (tr20_23_on && gr20_23_on == 2'd2) | (tr20_24_on && gr20_24_on == 2'd2) | (tr21_0_on && gr21_0_on == 2'd2) | (tr21_1_on && gr21_1_on == 2'd2) | (tr21_2_on && gr21_2_on == 2'd2) | (tr21_3_on && gr21_3_on == 2'd2) | (tr21_4_on && gr21_4_on == 2'd2) | (tr21_5_on && gr21_5_on == 2'd2) | (tr21_6_on && gr21_6_on == 2'd2) | (tr21_7_on && gr21_7_on == 2'd2) | (tr21_8_on && gr21_8_on == 2'd2) | (tr21_9_on && gr21_9_on == 2'd2) | (tr21_10_on && gr21_10_on == 2'd2) | (tr21_11_on && gr21_11_on == 2'd2) | (tr21_12_on && gr21_12_on == 2'd2) | (tr21_13_on && gr21_13_on == 2'd2) | (tr21_14_on && gr21_14_on == 2'd2) | (tr21_15_on && gr21_15_on == 2'd2) | (tr21_16_on && gr21_16_on == 2'd2) | (tr21_17_on && gr21_17_on == 2'd2) | (tr21_18_on && gr21_18_on == 2'd2) | (tr21_19_on && gr21_19_on == 2'd2) | (tr21_20_on && gr21_20_on == 2'd2) | (tr21_21_on && gr21_21_on == 2'd2) | (tr21_22_on && gr21_22_on == 2'd2) | (tr21_23_on && gr21_23_on == 2'd2) | (tr21_24_on && gr21_24_on == 2'd2) | (tr22_0_on && gr22_0_on == 2'd2) | (tr22_1_on && gr22_1_on == 2'd2) | (tr22_2_on && gr22_2_on == 2'd2) | (tr22_3_on && gr22_3_on == 2'd2) | (tr22_4_on && gr22_4_on == 2'd2) | (tr22_5_on && gr22_5_on == 2'd2) | (tr22_6_on && gr22_6_on == 2'd2) | (tr22_7_on && gr22_7_on == 2'd2) | (tr22_8_on && gr22_8_on == 2'd2) | (tr22_9_on && gr22_9_on == 2'd2) | (tr22_10_on && gr22_10_on == 2'd2) | (tr22_11_on && gr22_11_on == 2'd2) | (tr22_12_on && gr22_12_on == 2'd2) | (tr22_13_on && gr22_13_on == 2'd2) | (tr22_14_on && gr22_14_on == 2'd2) | (tr22_15_on && gr22_15_on == 2'd2) | (tr22_16_on && gr22_16_on == 2'd2) | (tr22_17_on && gr22_17_on == 2'd2) | (tr22_18_on && gr22_18_on == 2'd2) | (tr22_19_on && gr22_19_on == 2'd2) | (tr22_20_on && gr22_20_on == 2'd2) | (tr22_21_on && gr22_21_on == 2'd2) | (tr22_22_on && gr22_22_on == 2'd2) | (tr22_23_on && gr22_23_on == 2'd2) | (tr22_24_on && gr22_24_on == 2'd2) | (tr23_0_on && gr23_0_on == 2'd2) | (tr23_1_on && gr23_1_on == 2'd2) | (tr23_2_on && gr23_2_on == 2'd2) | (tr23_3_on && gr23_3_on == 2'd2) | (tr23_4_on && gr23_4_on == 2'd2) | (tr23_5_on && gr23_5_on == 2'd2) | (tr23_6_on && gr23_6_on == 2'd2) | (tr23_7_on && gr23_7_on == 2'd2) | (tr23_8_on && gr23_8_on == 2'd2) | (tr23_9_on && gr23_9_on == 2'd2) | (tr23_10_on && gr23_10_on == 2'd2) | (tr23_11_on && gr23_11_on == 2'd2) | (tr23_12_on && gr23_12_on == 2'd2) | (tr23_13_on && gr23_13_on == 2'd2) | (tr23_14_on && gr23_14_on == 2'd2) | (tr23_15_on && gr23_15_on == 2'd2) | (tr23_16_on && gr23_16_on == 2'd2) | (tr23_17_on && gr23_17_on == 2'd2) | (tr23_18_on && gr23_18_on == 2'd2) | (tr23_19_on && gr23_19_on == 2'd2) | (tr23_20_on && gr23_20_on == 2'd2) | (tr23_21_on && gr23_21_on == 2'd2) | (tr23_22_on && gr23_22_on == 2'd2) | (tr23_23_on && gr23_23_on == 2'd2) | (tr23_24_on && gr23_24_on == 2'd2) | (tr24_0_on && gr24_0_on == 2'd2) | (tr24_1_on && gr24_1_on == 2'd2) | (tr24_2_on && gr24_2_on == 2'd2) | (tr24_3_on && gr24_3_on == 2'd2) | (tr24_4_on && gr24_4_on == 2'd2) | (tr24_5_on && gr24_5_on == 2'd2) | (tr24_6_on && gr24_6_on == 2'd2) | (tr24_7_on && gr24_7_on == 2'd2) | (tr24_8_on && gr24_8_on == 2'd2) | (tr24_9_on && gr24_9_on == 2'd2) | (tr24_10_on && gr24_10_on == 2'd2) | (tr24_11_on && gr24_11_on == 2'd2) | (tr24_12_on && gr24_12_on == 2'd2) | (tr24_13_on && gr24_13_on == 2'd2) | (tr24_14_on && gr24_14_on == 2'd2) | (tr24_15_on && gr24_15_on == 2'd2) | (tr24_16_on && gr24_16_on == 2'd2) | (tr24_17_on && gr24_17_on == 2'd2) | (tr24_18_on && gr24_18_on == 2'd2) | (tr24_19_on && gr24_19_on == 2'd2) | (tr24_20_on && gr24_20_on == 2'd2) | (tr24_21_on && gr24_21_on == 2'd2) | (tr24_22_on && gr24_22_on == 2'd2) | (tr24_23_on && gr24_23_on == 2'd2) | (tr24_24_on && gr24_24_on == 2'd2))
                rgb = trail2;
            else
                if (sel == 2'b10)
                begin
                if (color == 6'd15)
                    rgb = BG1;
                else if (color == 6'd10) 
                    rgb = BG2; 
                else if (color == 6'd5) 
                    rgb = BG3;
                else if (color == 6'd0)
                    rgb = BG4;
                end 
                else
                rgb = BG1;   
    
endmodule

