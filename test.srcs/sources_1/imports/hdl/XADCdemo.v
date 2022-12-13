`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: // Project Name: 
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
 

module XADCdemo(
   input CLK100MHZ,
   input vauxp6,
   input vauxn6,
   input vauxp7,
   input vauxn7,
   input vauxp15,
   input vauxn15,
   input vauxp14,
   input vauxn14,
   output reg [15:0] LED,
   output [3:0] an,
   output dp,
   output [6:0] seg,
   input r1,
   input r2,
   input r3,
   input rand,
   input [1:0] sell,
   input enab,
   output hsync,
   output vsync,
   output [11:0] rgb
   
 );
   
   wire enable;  
   wire ready;
   wire [15:0] data;   
   reg [6:0] Address_in;     
   reg [32:0] decimal;   
   reg [3:0] dig0;
   reg [3:0] dig1;
   reg [3:0] dig2;
   reg [3:0] dig3;
   reg [3:0] dig4;
   reg [3:0] dig5;
   reg [3:0] dig6;
   reg [3:0] Vrx1; // this can be used in the game logic to get x values (the values are from 01-15)
   reg [3:0] Vry1; // this can be used in the game logic to get y values
   reg [3:0] Vrx2;
   reg [3:0] Vry2;
   reg [1:0] sw;
   reg [32:0] delay;
   
   reg up;
   reg down;
   reg left;
   reg right;
   reg up2;
   reg down2;
   reg left2;
   reg right2;
   


   //xadc instantiation connect the eoc_out .den_in to get continuous conversion
   xadc_wiz_0  XLXI_7 (.daddr_in(Address_in), //addresses can be found in the artix 7 XADC user guide DRP register space
                     .dclk_in(CLK100MHZ), 
                     .den_in(enable), 
                     .di_in(), 
                     .dwe_in(), 
                     .busy_out(),                    
                     .vauxp6(vauxp6),
                     .vauxn6(vauxn6),
                     .vauxp7(vauxp7),
                     .vauxn7(vauxn7),
                     .vauxp14(vauxp14),
                     .vauxn14(vauxn14),
                     .vauxp15(vauxp15),
                     .vauxn15(vauxn15),
                     .vn_in(), 
                     .vp_in(), 
                     .alarm_out(), 
                     .do_out(data), 
                     //.reset_in(),
                     .eoc_out(enable),
                     .channel_out(),
                     .drdy_out(ready));
                     
         
    
      initial
      begin
      sw=2'b00;
      end
      //led visual dmm  (for visulaizing the input voltage in form of an led bar)            
      always @( posedge(CLK100MHZ))
      begin            
        if(ready == 1'b1)
        begin
          case (data[15:12])
            1:  LED <= 16'b11;
            2:  LED <= 16'b111;
            3:  LED <= 16'b1111;
            4:  LED <= 16'b11111;
            5:  LED <= 16'b111111;
            6:  LED <= 16'b1111111; 
            7:  LED <= 16'b11111111;
            8:  LED <= 16'b111111111;
            9:  LED <= 16'b1111111111;
            10: LED <= 16'b11111111111;
            11: LED <= 16'b111111111111;
            12: LED <= 16'b1111111111111;
            13: LED <= 16'b11111111111111;
            14: LED <= 16'b111111111111111;
            15: LED <= 16'b1111111111111111;                        
           default: LED <= 16'b1;
           
           endcase
           
        end

          
      end
//    wire [5:0] curr1;
//    wire [5:0] interim;
////    assign curr1=interim;
////    reg [5:0] curr;
////    curr=interim1
//    reg [5:0] out;
//    reg [5:0] inp;
//    initial
//    begin
//        out = 6'b000000;
//    end
    
    
//    always @(posedge CLK100MHZ)
//    begin
//        out <= inp;
        
//    end
        
    
//    FSM_block tester(out,swt[1:0], CLK100MHZ, inp);

     
     
//     always @(posedge CLK100MHZ)
//     begin
//        LED[9:0]<= 1'b0;
//        LED[15:10] <= inp;
     
//     end

      
     reg [32:0] count; 
     //binary to decimal conversion
      always @ (posedge(CLK100MHZ))
      begin
      
        if(count == 10000000)begin
        
        decimal = data >> 4;
        if(decimal >= 4093)
        begin
            dig0 = 0;
            dig1 = 0;
            dig2 = 0;
            dig3 = 0;
            dig4 = 0;
            dig5 = 0;
            dig6 = 1;
            count = 0;
        end
        else 
        begin
            decimal = decimal * 250000;
            decimal = decimal >> 10;
     
            dig0 = decimal % 10;
            decimal = decimal / 10;
            
            dig1 = decimal % 10;
            decimal = decimal / 10;
                   
            dig2 = decimal % 10;
            decimal = decimal / 10;
            
            dig3 = decimal % 10;
            decimal = decimal / 10;
            
            dig4 = decimal % 10;
            decimal = decimal / 10;
                   
            dig5 = decimal % 10;
            decimal = decimal / 10; 
            
            dig6 = decimal % 10;
            decimal = decimal / 10; 
            
            count = 0;
        end
       end
       
      count = count + 1;
               
      end
      
      always @(posedge(CLK100MHZ))
      begin
        if (delay == 100000) // the huge value of this delay is for testing purposes. for using the joystick in the game, teh value should be reduced to check x and y values more frequently.
            begin
            sw = (sw == 2'b11) ? 0 : sw+1; 
            delay = 0;
            end
        else
            delay = delay+1;
     end
        
        
      
      
    always @(posedge(CLK100MHZ))
      begin
        case(sw)
      0:  begin
        Address_in <= 8'h16;
        Vry1 <= data[15:12];
        if (Vry1 > 9)
      begin
      up<=1;
      down<=0;
//      left<=0;
//      right<=0;
      end
      else if (Vry1<4)
      begin
      down<=1;
      up<=0;
//      left<=0;
//      right<=0;
      end
      
      else if (Vry1<8 && Vry1>5)
      begin
//      left<=0;
//      right<=0;
      down<=0;
      up<=0;
      end
        
//        Vrx1 <= Vrx1;
//        Vrx2 <= 4'b0111;
//        Vry2 <= 4'b0111;
        

        end
        
        1: begin
        Address_in <= 8'h1e;
        Vrx1<=data[15:12];
//        Vry1<=Vry1;
//        Vry2 <= 4'b0111;
//        Vrx2 <= 4'b0111;
        if (Vrx1 > 9)
      begin
//      up<=1;
//      down<=0;
      left<=1;
      right<=0;
      end
      else if (Vrx1<4)
      begin
//      down<=1;
//      up<=0;
      left<=0;
      right<=1;
      end
      
      else if (Vrx1<8 && Vrx1>5)
      begin
      left<=0;
      right<=0;
//      down<=0;
//      up<=0;
      end
        end
        
     
        
        
        2: begin
        Address_in <= 8'h1f;
        Vry2 <= data[15:12];
        if (Vry2 > 9)
      begin
      up2<=1;
      down2<=0;
//      left<=0;
//      right<=0;
      end
      else if (Vry2<4)
      begin
      down2<=1;
      up2<=0;
//      left<=0;
//      right<=0;
      end
      
      else if (Vry2<8 && Vry2>5)
      begin
//      left<=0;
//      right<=0;
      down2<=0;
      up2<=0;
      end
        
//        Vrx1 <= Vrx1;
//        Vrx2 <= 4'b0111;
//        Vry2 <= 4'b0111;
        
        
//        Vrx2 <=data[15:12];
//        Vry2<=4'b0101;
//        Vrx1 <= 4'b0101;
//        Vry1 <= 4'b0101;
        end
        
        3: begin
        Address_in <= 8'h17;
        Vrx2 <=data[15:12];
//        Vry1<=Vry1;
//        Vry2 <= 4'b0111;
//        Vrx2 <= 4'b0111;
        if (Vrx2 > 9)
      begin
//      up<=1;
//      down<=0;
      left2<=1;
      right2<=0;
      end
      else if (Vrx2<4)
      begin
//      down<=1;
//      up<=0;
      left2<=0;
      right2<=1;
      end
      
      else if (Vrx2<8 && Vrx2>5)
      begin
      left2<=0;
      right2<=0;
//      down<=0;
//      up<=0;
      end
//        Vrx2<=4'b0101;
//        Vry1 <= 4'b0101;
//        Vrx1 <= 4'b0101;
        end
        endcase
      
      
      end
      
//      always @(posedge(CLK100MHZ))
//      begin
//      if (Vry1 > 9)
//      begin
//      up<=1;
//      down<=0;

//      end
//      else if (Vry1<4)
//      begin
//      down<=1;
//      up<=0;

//      end
      
//      else if (Vry1<8 && Vry1>5)
//      begin

//      down<=0;
//      up<=0;
//      end
      
////      if (Vrx1 > 9)
////      begin
////      right<=0;
////      left<=1;
////      down<=0;
////      up<=0;
////      end
////      else if (Vrx1<4)
////      begin
////      left<=0;
////      right<=1;
////      down<=0;
////      up<=0;
////      end
      
////      else
////      begin
////      left<=0;
////      right<=0;
////      down<=0;
////      up<=0;
////      end
      
//      end
      
      
//      always @(posedge(CLK100MHZ))
//      begin
//      if (Vry2 > 9)
//      begin
//      up2<=1;
//      down2<=0;
//      left2<=0;
//      right2<=0;
//      end
//      else if (Vry2<4)
//      begin
//      down2<=1;
//      up2<=0;
//      left2<=0;
//      right2<=0;
//      end
      
//      else if (Vrx2 > 9)
//      begin
//      right2<=1;
//      left2<=0;
//      down2<=0;
//      up2<=0;
//      end
//      else if (Vrx2<4)
//      begin
//      left2<=1;
//      right2<=0;
//      down2<=0;
//      up2<=0;
//      end
      
//      else
//      begin
//      left2<=0;
//      right2<=0;
//      down2<=0;
//      up2<=0;
//      end
      
//      end
      
      
      
      
      // The game logic + vga
//      top game(CLK100MHZ, rst, up,down, left, right, hsync, vsync, rgb);
        top_new game(CLK100MHZ, r1, r2, r3 , rand, up, down, right, left,up2, down2,right2,left2, sell, enab, seg, an, hsync, vsync, rgb);
      
      // This is for debugging and testing the values
//      DigitToSeg segment1(.in1(dig3),
//                         .in2(dig4),
//                         .in3(dig5),
//                         .in4(dig6),
//                         .in5(),
//                         .in6(),
//                         .in7(),
//                         .in8(),
//                         .mclk(CLK100MHZ),
//                         .an(an),
//                         .dp(dp),
//                         .seg(seg));
                         
       
endmodule
