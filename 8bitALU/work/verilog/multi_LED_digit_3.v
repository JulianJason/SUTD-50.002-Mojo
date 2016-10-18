/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 4
     DIV = 16
*/
module multi_LED_digit_3 (
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    input [7:0] value,
    input [4:0] button,
    output reg [7:0] seg,
    output reg [3:0] sel
  );
  
  localparam DIGITS = 3'h4;
  localparam DIV = 5'h10;
  
  
  reg [3:0] symbol;
  
  localparam DIGIT_BITS = 2'h2;
  
  wire [2-1:0] M_ctr_value;
  counter_8 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  reg [1:0] M_sym_d, M_sym_q = 1'h0;
  
  wire [8-1:0] M_led_dec_segs;
  reg [4-1:0] M_led_dec_char;
  led_digit_9 led_dec (
    .char(M_led_dec_char),
    .segs(M_led_dec_segs)
  );
  
  wire [4-1:0] M_digit_dec_out;
  reg [2-1:0] M_digit_dec_in;
  decoder_10 digit_dec (
    .in(M_digit_dec_in),
    .out(M_digit_dec_out)
  );
  
  wire [4-1:0] M_converter_digit0;
  wire [4-1:0] M_converter_digit1;
  wire [4-1:0] M_converter_digit2;
  reg [8-1:0] M_converter_binary;
  binaryToBCD_11 converter (
    .binary(M_converter_binary),
    .digit0(M_converter_digit0),
    .digit1(M_converter_digit1),
    .digit2(M_converter_digit2)
  );
  
  wire [4-1:0] M_bin_out2;
  wire [4-1:0] M_bin_out1;
  wire [4-1:0] M_bin_out0;
  reg [8-1:0] M_bin_a;
  binaryComponent_12 bin (
    .a(M_bin_a),
    .out2(M_bin_out2),
    .out1(M_bin_out1),
    .out0(M_bin_out0)
  );
  
  always @* begin
    M_sym_d = M_sym_q;
    
    
    case (M_sym_q)
      1'h0: begin
        M_converter_binary = a;
        M_bin_a = a;
        symbol = 4'ha;
      end
      1'h1: begin
        M_converter_binary = b;
        M_bin_a = b;
        symbol = 4'hb;
      end
      2'h2: begin
        M_converter_binary = value;
        M_bin_a = value;
        symbol = 4'hc;
      end
      default: begin
        M_converter_binary = 1'h0;
        M_bin_a = 1'h0;
        symbol = 4'hf;
      end
    endcase
    
    case (M_ctr_value)
      1'h0: begin
        M_led_dec_char = M_converter_digit0;
      end
      1'h1: begin
        M_led_dec_char = M_converter_digit1;
      end
      2'h2: begin
        M_led_dec_char = M_converter_digit2;
      end
      2'h3: begin
        M_led_dec_char = symbol;
      end
      default: begin
        M_led_dec_char = $signed(2'h3);
        seg = 8'h80;
      end
    endcase
    seg = M_led_dec_segs;
    M_digit_dec_in = M_ctr_value;
    sel = M_digit_dec_out;
    if (button[3+0-:1]) begin
      M_sym_d = 1'h0;
    end
    if (button[0+0-:1]) begin
      M_sym_d = 1'h1;
    end
    if (button[4+0-:1]) begin
      M_sym_d = 2'h2;
    end
  end
  
  always @(posedge clk) begin
    M_sym_q <= M_sym_d;
  end
  
endmodule
