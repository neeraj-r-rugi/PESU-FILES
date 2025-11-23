module Prob_5_55 (input x_in, clk, reset_b, output reg y);
	parameter s0 = 2'd0;
	parameter s1 = 2'd1;
	parameter s2 = 2'd2;
	parameter s3 = 2'd3;
	reg [1: 0] state, next_state;
	
	always @ (posedge clk, negedge reset_b) 
		if (reset_b == 1'b0) state <= s0;
		else state <= next_state;

	always @ (state, x_in) begin
		y = 1'b0;
		next_state = s0;

		case (state)		
		s0:		if (x_in) begin y = 1'b0; next_state = s1; end
				else begin y = 1'b0; next_state = s0; end 			
		s1:		if (x_in) begin y = 1'b0; next_state = s2; end
				else begin y = 1'b0; next_state = s0; end 			
		s2:		if (x_in) begin y = 1'b0; next_state = s3; end
				else begin y = 1'b0; next_state = s0; end 			
		s3:		if (x_in) begin y = 1'b1; next_state = s3; end 
				else begin y = 1'b0; next_state = s0; end 			
		default:	begin y = 1'b0; next_state = s0; end
	endcase
	end
endmodule
