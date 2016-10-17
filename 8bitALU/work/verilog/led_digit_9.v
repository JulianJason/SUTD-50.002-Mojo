/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module led_digit_9 (
    input [3:0] char,
    output reg [7:0] segs
  );
  
  
  
  always @* begin
    
    case (char)
      1'h0: begin
        segs = 7'h3f;
      end
      1'h1: begin
        segs = 7'h06;
      end
      2'h2: begin
        segs = 7'h5b;
      end
      2'h3: begin
        segs = 7'h4f;
      end
      3'h4: begin
        segs = 7'h66;
      end
      3'h5: begin
        segs = 7'h6d;
      end
      3'h6: begin
        segs = 7'h7d;
      end
      3'h7: begin
        segs = 7'h07;
      end
      4'h8: begin
        segs = 7'h7f;
      end
      4'h9: begin
        segs = 7'h67;
      end
      4'ha: begin
        segs = 7'h77;
      end
      4'hb: begin
        segs = 7'h7c;
      end
      4'hc: begin
        segs = 7'h5c;
      end
      default: begin
        segs = 8'h80;
      end
    endcase
  end
endmodule
