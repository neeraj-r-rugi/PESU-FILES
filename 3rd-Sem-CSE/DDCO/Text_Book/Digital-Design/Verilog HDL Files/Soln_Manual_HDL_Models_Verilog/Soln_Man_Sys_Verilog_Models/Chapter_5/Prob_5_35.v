module Prob_5_35 (output out_z, input in_x, in_y, clk, reset_b);
  reg [1:0] state, next_state;
  
  assign out_z = ((state == 2'b10) || (state == 2'b11));
  
  always @ (posedge clk) if (reset_b == 1'b0) state <= 2'b00; else state <= next_state;

  always @ (state, in_x, in_y) begin
	 next_state = 2'b00;
    case (state)
      2'b00:	if (({in_x, in_y} == 2'b00) || ({in_x, in_y} == 2'b01)) 					next_state = 2'b00;
			else if ({in_x, in_y} == 2'b10) next_state = 2'b11;
			else if ({in_x, in_y} == 2'b11) next_state = 2'b01;

      2'b01:	if (({in_x, in_y} == 2'b00) || ({in_x, in_y} == 2'b01)) next_state = 2'b00;
			else if (({in_x, in_y} == 2'b10) || ({in_x, in_y} == 2'b11)) next_state = 2'b10;

      2'b10:	if (({in_x, in_y} == 2'b00) || ({in_x, in_y} == 2'b01)) next_state = 2'b00;
			else if (({in_x, in_y} == 2'b10) || ({in_x, in_y} == 2'b11)) next_state = 2'b11;

      2'b11:	if (({in_x, in_y} == 2'b00) || ({in_x, in_y} == 2'b01)) next_state = 2'b00;
			else if (({in_x, in_y} == 2'b10) || ({in_x, in_y} == 2'b11)) next_state = 2'b11;
	  default:	next_state = 2'b00;
    endcase
	end 
endmodule
/*
module t_Prob_5_35 ();
  wire out_z;
  reg in_x, in_y, clk, reset_b;

  Prob_5_35 M0 (out_z, in_x, in_y, clk, reset_b);

  initial #250 $finish;
  initial begin clk = 0; forever #5 clk = ~clk; end
  initial fork
    reset_b = 0;
    #20 reset_b = 1;

    #50 {in_x, in_y} = 2'b00;			// Remain in 2'b00
    #60 {in_x, in_y} = 2'b01;			// Remain in 2'b00
    #70 {in_x, in_y} = 2'b11;			// Transition to 2'b01
    #90 {in_x, in_y} = 2'b00;			// Transition to 2'b00
    #110 {in_x, in_y} = 2'b11;			// Transition to 2'b01
    #120 {in_x, in_y} = 2'b01;			// Transition to 2'b00

    #130 {in_x, in_y} = 2'b11;			// Transition to 2'b01
    #140 {in_x, in_y} = 2'b10;			// Transition to 2'b10
    #150 {in_x, in_y} = 2'b00;			// Transition to 2'b00
    #160 {in_x, in_y} = 2'b11;			// Transition to 2'b01

    #170 {in_x, in_y} = 2'b11;			// Transition to 2'b10
    #180 {in_x, in_y} = 2'b01;			// Transition to 2'b00

    #190 {in_x, in_y} = 2'b11;			// Transition to 2'b01
    #200 {in_x, in_y} = 2'b11;			// Transition to 2'b10
    #210 {in_x, in_y} = 2'b11;			// Transition to 2'b11

    #220 {in_x, in_y} = 2'b10;			// Remain in 2'b11
    #230 {in_x, in_y} = 2'b11;			// Remain in 2'b11
  join
endmodule
*/
