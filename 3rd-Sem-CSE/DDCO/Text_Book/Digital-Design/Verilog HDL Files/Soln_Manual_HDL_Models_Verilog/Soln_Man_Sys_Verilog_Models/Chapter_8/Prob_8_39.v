module Prob_8_39 (
  output 	[15: 0] 	PR, output done, 
  input 		[7: 0] 	data_AR, data_BR, input  start, clock, reset_b
);
 
  Controller_P8_39 M0 (done, Ld_regs, Add_decr, start, zero, clock, reset_b);

 Datapath_P8_39 M1 (PR, zero, data_AR, data_BR, Ld_regs, Add_decr, clock, reset_b);
endmodule

module Controller_P8_16 (output done, output reg Ld_regs, Add_decr, input start, zero, clock, reset_b);
  parameter  	s0 = 1'b0, s1 = 1'b1;
  reg 		state, next_state;
  assign done = (state == s0); 
always @ (posedge clock, negedge reset_b) 
    if (!reset_b) state <= s0; else state <= next_state;

  always @ (state, start, zero) begin
    Ld_regs = 0;
    Add_decr = 0;
    case (state)
      s0:		if (start) begin Ld_regs = 1; next_state = s1; end

      default:	next_state = s0;
    endcase
  end
endmodule

module  Datapath_P8_16 (
  output reg 	[15: 0] 	PR, output zero, 
  input 		[7: 0] 	data_AR, data_BR, input Ld_regs, Add_decr, clock, reset_b
);

  reg 		[7: 0]	AR, BR;
  assign 	zero = ~( | AR);

  always @ (posedge clock, negedge reset_b)
    if (!reset_b) begin AR <= 8'b0; BR <= 8'b0; PR <= 16'b0; end
    else begin
      if (Ld_regs) begin AR <= data_AR; BR <= data_BR; PR <= 0; end
      else if (Add_decr) begin PR <= PR + BR; AR <= AR -1; end
    end 
 endmodule 

// Test plan Ð Verify;
// Power-up reset
// Data is loaded correctly
// Control signals assert correctly
// Status signals assert correctly
// start is ignored while multiplying
// Multiplication is correct
// Recovery from reset on-the-fly
 
module t_Prob_P8_16;
  wire 		done;
  wire 	[15: 0] 	PR;
  reg 	[7: 0] 	data_AR, data_BR;
  reg  		start, clock, reset_b;
  
  Prob_8_16 M0 (PR, done, data_AR, data_BR, start, clock, reset_b);

  initial #500 $finish;
  initial begin clock = 0; forever #5 clock = ~clock; end
  initial fork
     reset_b = 0; 
      #12 reset_b = 1; 
    #40 reset_b = 0;
    #42 reset_b = 1;
    #90 reset_b = 1;
    #92 reset_b = 1;
  join

  

  initial fork
    #20 start = 1;
    #30 start = 0;
    #40 start = 1;
    #50 start = 0;
    #120 start = 1;
    #120 start = 0;
  join

  initial fork
    data_AR = 8'd5;		// AR > 0
    data_BR = 8'd20;

    #80 data_AR = 8'd3;
    #80 data_BR = 8'd9;

    #100 data_AR = 8'd4;
    #100 data_BR = 8'd9;
  join
endmodule

