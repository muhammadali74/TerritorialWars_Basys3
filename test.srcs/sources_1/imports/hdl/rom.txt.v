//    module romv(clk, video_on, x, y, color);
//    parameter ROM_WIDTH = 12;
//    parameter ROM_ADDR_BITS = 17;
//    (* rom_style="block" *)
//    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
//    input wire clk;
//    input wire video_on;
//    input wire [8:0] x;
//    input wire [7:0] y;
//    reg [ROM_ADDR_BITS-1:0] address;
//    output reg [ROM_WIDTH-1:0] color;
//    initial
//      $readmemh("romv.hex", rom);
//    always @(posedge clk)
//      if (video_on) begin
//         address <= {y, x};
//         color <= rom[address];
//      end
//    endmodule
    
    
module romv2(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 16;
    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [7:0] x;
    input wire [7:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;
    initial
      $readmemh("romv.hex", rom);
    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    
    
    
        module winrom(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 16;
    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [7:0] x;
    input wire [7:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;
    initial
      $readmemh("win1.hex", rom);
    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    
    
    
    
    
    module win2rom(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 16;
    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [7:0] x;
    input wire [7:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;
    initial
      $readmemh("win2.hex", rom);
    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    
    
    
    
    
    module tortrom(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 16;
    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [7:0] x;
    input wire [7:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;
    initial
      $readmemh("tort.hex", rom);
    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    
    
    
    
    module easyrom(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 16;
    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [7:0] x;
    input wire [7:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;
    initial
      $readmemh("easy.hex", rom);
    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    
    
    
    
    module drawrom(clk, video_on, x, y, color);
    parameter ROM_WIDTH = 12;
    parameter ROM_ADDR_BITS = 16;
    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
    input wire clk;
    input wire video_on;
    input wire [7:0] x;
    input wire [7:0] y;
    reg [ROM_ADDR_BITS-1:0] address;
    output reg [ROM_WIDTH-1:0] color;
    initial
      $readmemh("draw.hex", rom);
    always @(posedge clk)
      if (video_on) begin
         address <= {y, x};
         color <= rom[address];
      end
    endmodule
    
//module testrom(clk, video_on, x, y, color);
//    parameter ROM_WIDTH = 12;
//    parameter ROM_ADDR_BITS = 17;
//    (* rom_style="block" *)
//    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];
//    input wire clk;
//    input wire video_on;
//    input wire [8:0] x;
//    input wire [7:0] y;
//    reg [ROM_ADDR_BITS-1:0] address;
//    output reg [ROM_WIDTH-1:0] color;
//    initial
//      $readmemh("new.hex", rom);
//    always @(posedge clk)
//      if (video_on) begin
//         address <= {y, x};
//         color <= rom[address];
//      end
//    endmodule
    
    