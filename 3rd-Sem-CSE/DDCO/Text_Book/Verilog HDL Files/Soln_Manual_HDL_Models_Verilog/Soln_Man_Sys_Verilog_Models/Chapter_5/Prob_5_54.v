module Prob_5_54 (input xin1, xin2, clk, reset_b, output reg y_out);
	parameter s0 = 1'd0;
	parameter s1 = 1'b1;
	reg [1: 0] state, next_state;
	
	always @ (posedge clk, negedge reset_b) 	// state transitions
		if (reset_b == 1'b0) state <= s0;
		else state <= next_state;
			
	always @ (state, xin1, xin2) begin	// next state
		next_state = s0; ;
		case (state)
			s0:	if (xin1 == xin2) next_state = s1; else next_state = s0; 
			s1:	next_state = s0; 
			default:	next_state = s0; 
		endcase
	end
	
always @ (state, xin1, xin2) begin	//output 
		y_out = 1'b0;
		case (state)
			s0:	y_out = 1'b0; 
			s1:	y_out = 1'b1; 
			default:	y_out = 1'b0; 
		endcase
	end			
endmodule

