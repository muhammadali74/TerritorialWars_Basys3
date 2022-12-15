`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2022 09:44:27 AM
// Design Name: 
// Module Name: score_count
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



//module MUX(
//    input [3:0] A,B,C,D, 
//    input [1:0] S, 
//   output [3:0] Y);    
    
//    assign Y = S[1] ? (S[0] ? D : C) : (S[0] ? B : A); 
    
    
//endmodule

//module seven_segment_display(
//    input [3:0]D,
//    output [6:0]S
//    );
    
//    assign S[0]=(~D[3]&~D[2]&~D[1]&D[0])|(~D[3]&D[2]&~D[1]&~D[0])|(D[3]&~D[2]&D[1]&D[0])|(D[3]&D[2]&~D[1]&D[0]);
//    assign S[1]=(D[2]&D[1]&~D[0])|(D[3]&D[1]&D[0])|(D[3]&D[2]&~D[0])|(~D[3]&D[2]&~D[1]&D[0]);
//    assign S[2]=(D[3]&D[2]&~D[0])|(D[3]&D[2]&D[1])|(~D[3]&~D[2]&D[1]&~D[0]);
//    assign S[3]=(D[2]&D[1]&D[0])|(D[3]&~D[2]&D[1]&~D[0])|(~D[3]&~D[2]&~D[1]&D[0])|(~D[3]&D[2]&~D[1]&~D[0]);
//    assign S[4]=(~D[3]&D[0])|(~D[2]&~D[1]&D[0])|(~D[3]&D[2]&~D[1]);
//    assign S[5]=(~D[3]&~D[2]&D[0])|(~D[3]&~D[2]&D[1])|(~D[3]&D[1]&D[0])|(D[3]&D[2]&~D[1]&D[0]);
//    assign S[6]=(~D[3]&~D[2]&~D[1])|(~D[3]&D[2]&D[1]&D[0])|(D[3]&D[2]&~D[1]&~D[0]);
//endmodule

//module DEMUX(
//    input [1:0] S,
//    input En,
//    output Ena,
//    output Enb,
//    output Enc,
//    output End
//    );
    
    
//    assign Ena = S[1] ? (1) : (S[0] ? 1 : En); 
//    assign Enb = S[1] ? (1) : (S[0] ? En : 1);
//    assign Enc = S[1] ? (S[0] ? 1 : En) : (1); 
//    assign End = S[1] ? (S[0] ? En : 1) : (1);  

//endmodule

//module score_count(
//    input [3:0]A,
//    input [3:0]B,
//    input [3:0]C,
//    input [3:0]D,
//    input [1:0]S,
//    input en,
//    output [6:0]Y,
//    output EnA,
//    output EnB,
//    output EnC,
//    output EnD
//    );
//    wire [3:0] mux_out;
//    MUX mu(A,B,C,D,S,mux_out);
//    seven_segment_display ssd(mux_out,Y);
//    DEMUX dem(S,en,EnA,EnB,EnC,EnD);
    
    
    
//endmodule

//module seg7_control(
module score_count(
    input clk_100MHz,
    input reset,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output reg [0:6] seg,       // segment pattern 0-9
    output reg [3:0] digit      // digit select signals
    );
    
    // Parameters for segment patterns
    parameter ZERO  = 7'b1000000;  // 0
    parameter ONE   = 7'b1111001;  // 1
    parameter TWO   = 7'b0100100;  // 2 
    parameter THREE = 7'b0110000;  // 3
    parameter FOUR  = 7'b0011001;  // 4
    parameter FIVE  = 7'b0010010;  // 5
    parameter SIX   = 7'b0000010;  // 6
    parameter SEVEN = 7'b1111000;  // 7
    parameter EIGHT = 7'b0000000;  // 8
    parameter NINE  = 7'b0010000;  // 9
    
    // To select each digit in turn
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk_100MHz or posedge reset) begin
        if(reset) begin
            digit_select <= 0;
            digit_timer <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 99_999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
        case(digit_select) 
            2'b00 : digit = 4'b1110;   // Turn on ones digit
            2'b01 : digit = 4'b1101;   // Turn on tens digit
            2'b10 : digit = 4'b1011;   // Turn on hundreds digit
            2'b11 : digit = 4'b0111;   // Turn on thousands digit
        endcase
    end
    
    // Logic for driving segments based on which digit is selected and the value of each digit
    always @*
        case(digit_select)
            2'b00 : begin       // ONES DIGIT
                        case(ones)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(tens)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
                        case(hundreds)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
                    
            2'b11 : begin       // MINUTES ONES DIGIT
                        case(thousands)
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                        endcase
                    end
        endcase

endmodule
