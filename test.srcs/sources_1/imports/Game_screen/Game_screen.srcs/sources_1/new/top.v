`timescale 1ns / 1ps

//module top(
//    input clk_100MHz,       // from Basys 3
//    input reset,
//    input up,
//    input down,
//    input right,
//    input left,        // btnC on Basys 3
//    output hsync,           // VGA port on Basys 3
//    output vsync,           // VGA port on Basys 3
//    output [11:0] rgb       // to DAC, 3 bits to VGA port on Basys 3
//    );
    
//    wire w_video_on, w_p_tick;
//    wire [9:0] w_x, w_y;
//    reg [11:0] rgb_reg;
//    wire[11:0] rgb_next;
    
//    vga_controller vc(.clk_100MHz(clk_100MHz), .reset(reset), .video_on(w_video_on), .hsync(hsync), 
//                      .vsync(vsync), .p_tick(w_p_tick), .x(w_x), .y(w_y));
//    pixel_generation_two pg(.clk(clk_100MHz), .reset(reset),.up(up),.down(down),.right(right),.left(left), .video_on(w_video_on), 
//                        .x(w_x), .y(w_y), .rgb(rgb_next));
    
//    always @(posedge clk_100MHz)
//        if(w_p_tick)
//            rgb_reg <= rgb_next;
            
//    assign rgb = rgb_reg;
 
//endmodule



module top_new(
    input clk_100MHz,       // from Basys 3
    input reset1,
    input reset2,
    input reset3,
    input random,
    input up1,  
    input down1,
    input right1,
    input left1,
    input up2,  
    input down2,
    input right2,
    input left2, 
    input [1:0] S,
    input en,
    output [6:0]Y,
    output [3:0] digit,        // btnC on Basys 3
    output hsync,           // VGA port on Basys 3
    output vsync,           // VGA port on Basys 3
    output [11:0] rgb       // to DAC, 3 bits to VGA port on Basys 3
    );
    
   wire w_video_on, w_p_tick;
    wire [9:0] w_x, w_y;
    reg [11:0] rgb_reg;
    wire[11:0] rgb_next;
    wire clk_d2;
    
    
    clk_div2 cd2(.clk(clk_100MHz), .clk_d(clk_d2));
    vga_controller vc(.clk_100MHz(clk_100MHz), .reset(reset1), .video_on(w_video_on), .hsync(hsync), 
                      .vsync(vsync), .p_tick(w_p_tick), .x(w_x), .y(w_y));
    pixel_generation_three pg(.clk(clk_100MHz), .clk_25(clk_d2), .reset1(reset1), .reset2(reset2), .reset3(reset3), .play(random), .up1(up1),.down1(down1),.right1(right1),.left1(left1),.up2(up2),.down2(down2),.right2(right2),.left2(left2), .video_on(w_video_on), 
                        .x(w_x), .y(w_y), .S(S), .en(en), .Y(Y), .digit(digit), .rgb(rgb_next));
    
    always @(posedge clk_100MHz)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    assign rgb = rgb_reg;
 
endmodule