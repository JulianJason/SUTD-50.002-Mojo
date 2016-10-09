/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module avr_detector_6 (
    input clk,
    input rst,
    input [23:0] io_dip,
    output reg [3:0] channel,
    input [9:0] sample,
    input [3:0] sample_channel,
    input new_sample,
    output reg outS,
    output reg outC
  );
  
  
  
  localparam CHANNEL_LIST = 32'h98765410;
  
  reg [3:0] M_ch_d, M_ch_q = 1'h0;
  
  reg a;
  
  reg b;
  
  reg cin;
  
  always @* begin
    M_ch_d = M_ch_q;
    
    a = io_dip[16+0+0-:1];
    b = io_dip[8+0+0-:1];
    cin = io_dip[0+0+0-:1];
    channel = CHANNEL_LIST[(M_ch_q)*4+3-:4];
    if (new_sample) begin
      M_ch_d = M_ch_q + 1'h1;
      if (M_ch_q == 3'h5) begin
        M_ch_d = 1'h0;
      end
    end
    outS = 4'h0;
    outC = 4'h0;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ch_q <= 1'h0;
    end else begin
      M_ch_q <= M_ch_d;
    end
  end
  
endmodule
