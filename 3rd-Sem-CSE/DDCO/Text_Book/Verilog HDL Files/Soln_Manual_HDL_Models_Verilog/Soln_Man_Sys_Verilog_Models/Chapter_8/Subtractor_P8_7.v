module Subtractor_P8_7 
  (output done, output [7:0] result, input [7: 0] data_A, data_B, input  start, clock, reset_b);
 
  Controller_P8_7 M0 (Load_A_B, Subtract, Convert, done, start, borrow, clock, reset_b);
  Datapath_P8_7 M1 (result, borrow, data_A, data_B, Load_A_B, Subtract, Convert, clock, reset_b);
endmodule

module Controller_P8_7 (output reg Load_A_B, Subtract, output reg Convert, output done,
  input start, borrow, clock, reset_b);
  parameter  S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
  reg [1: 0] state, next_state;
  assign done = (state == S0);

  always @ (posedge clock, negedge reset_b) 
    if (!reset_b) state <= S0; else state <= next_state;

  always @ (state, start, borrow) begin
    Load_A_B = 0;
    Subtract = 0;
    Convert = 0;
    
    case (state)
      S0:		if (start) begin Load_A_B = 1; next_state = S1; end
      S1:		begin 	Subtract = 1; next_state = S2; end
      S2:		 begin next_state = S0; if (borrow) Convert = 1; end
      default:	next_state = S0;
    endcase
  end
endmodule

module Datapath_P8_7 (output [7: 0] result, output borrow, input [7: 0] data_A, data_B, 
  input Load_A_B, Subtract, Convert, clock, reset_b);
  reg		carry;
reg [8:0] diff;
  reg [7: 0]	RA, RB;
  assign 	borrow = carry;
  assign	result = RA;

  always @ (posedge clock, negedge reset_b)
    if (!reset_b) begin carry <= 1'b0; RA <= 8'b0000_0000; RB <= 8'b0000_0000; end
    else begin
      if (Load_A_B) begin RA <= data_A; RB <= data_B; end
      else if (Subtract) {carry, RA} <= RA +  ~RB + 1;

      // In the statement above, the math of the LHS is done to the wordlength of the LHS
      // The statement below is more explicit about how the math for subtraction is done:
      // else if (Subtract) {carry, RA} <= {1'b0, RA} + {1'b1, ~RB } + 9'b0000_0001;
      // If the 9-th bit is not considered, the 2s complement operation will generate a carry bit, 
      //  and borrow must be formed as borrow = ~carry. 

      else if (Convert) RA <= ~RA + 8'b0000_0001;
    end
endmodule 

// Test plan Ð Verify;
// Power-up reset
// Subtraction with data_A > data_B
// Subtraction with data_A < data_B
// Subtraction with data_A = data_B
// Reset on-the-fly: left as an exercise

module t_Subtractor_P8_7;
  wire 			done;
  wire	[7:0] 	result;
  reg 	[7: 0] 	data_A, data_B;
  reg  			start, clock, reset_b;

  Subtractor_P8_7 M0 (done, result, data_A, data_B, start, clock, reset_b);

  initial #200 $finish;
  initial begin clock = 0; forever #5 clock = ~clock; end
  initial fork
     reset_b = 0; 
      #2 reset_b = 1; 
    #90 reset_b = 1;
    #92 reset_b = 1;
  join

  initial fork
    #20 start = 1;
    #30 start = 0;
    #70 start = 1;
    #110 start = 1;
  join

  initial fork
    data_A = 8'd50;
    data_B = 8'd20;

    #50 data_A = 8'd20;
    #50 data_B = 8'd50;

    #100 data_A = 8'd50;
    #100 data_B = 8'd50;
  join
endmodule

