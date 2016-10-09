/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module fsm_tester_7 (
    input clk,
    input rst,
    input outC,
    input outS,
    input [4:0] io_button,
    output reg [7:0] io_led,
    output reg [7:0] matching_led,
    output reg testingState,
    output reg expectedS,
    output reg expectedC
  );
  
  
  
  localparam NOT_TESTING_state = 4'd0;
  localparam ZERO_state = 4'd1;
  localparam A_state = 4'd2;
  localparam B_state = 4'd3;
  localparam C_state = 4'd4;
  localparam AB_state = 4'd5;
  localparam AC_state = 4'd6;
  localparam BC_state = 4'd7;
  localparam ABC_state = 4'd8;
  localparam END_state = 4'd9;
  
  reg [3:0] M_state_d, M_state_q = NOT_TESTING_state;
  reg [24:0] M_count_d, M_count_q = 1'h0;
  reg [0:0] M_testing_d, M_testing_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_count_d = M_count_q;
    M_testing_d = M_testing_q;
    
    if (M_count_q == 1'h0) begin
      
      case (M_state_q)
        NOT_TESTING_state: begin
          M_state_d = M_state_q;
        end
        default: begin
          M_state_d = M_state_q + 1'h1;
        end
      endcase
    end
    matching_led = 8'h00;
    
    case (M_state_q)
      NOT_TESTING_state: begin
        io_led = 8'h00;
        matching_led = 8'h00;
        expectedS = 1'h0;
        expectedC = 1'h0;
      end
      ZERO_state: begin
        io_led = 8'h80;
        expectedS = 1'h0;
        expectedC = 1'h0;
        if (!outC && !outS) begin
          matching_led = 8'hff;
        end
      end
      C_state: begin
        expectedS = 1'h1;
        expectedC = 1'h0;
        io_led = 8'h40;
        if (outS) begin
          matching_led = 8'hff;
        end
      end
      B_state: begin
        expectedS = 1'h1;
        expectedC = 1'h0;
        io_led = 8'h20;
        if (outS) begin
          matching_led = 8'hff;
        end
      end
      BC_state: begin
        expectedS = 1'h0;
        expectedC = 1'h1;
        io_led = 8'h10;
        if (outC) begin
          matching_led = 8'hff;
        end
      end
      A_state: begin
        expectedS = 1'h1;
        expectedC = 1'h0;
        io_led = 8'h08;
        if (outS) begin
          matching_led = 8'hff;
        end
      end
      AC_state: begin
        expectedS = 1'h0;
        expectedC = 1'h1;
        io_led = 8'h04;
        if (outC) begin
          matching_led = 8'hff;
        end
      end
      AB_state: begin
        expectedS = 1'h0;
        expectedC = 1'h1;
        io_led = 8'h02;
        if (outC) begin
          matching_led = 8'hff;
        end
      end
      ABC_state: begin
        expectedS = 1'h1;
        expectedC = 1'h1;
        io_led = 8'h01;
        if (outS && outC) begin
          matching_led = 8'hff;
        end
      end
      END_state: begin
        expectedS = 1'h0;
        expectedC = 1'h0;
        io_led = 8'h00;
        M_testing_d = 1'h0;
      end
      default: begin
        io_led = 8'h00;
        matching_led = 8'h00;
        expectedS = 1'h0;
        expectedC = 1'h0;
      end
    endcase
    if (io_button[1+0-:1]) begin
      M_state_d = 1'h1;
      M_testing_d = 1'h1;
    end
    M_count_d = M_count_q + 1'h1;
    testingState = M_testing_q;
  end
  
  always @(posedge clk) begin
    M_count_q <= M_count_d;
    M_testing_q <= M_testing_d;
    
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
