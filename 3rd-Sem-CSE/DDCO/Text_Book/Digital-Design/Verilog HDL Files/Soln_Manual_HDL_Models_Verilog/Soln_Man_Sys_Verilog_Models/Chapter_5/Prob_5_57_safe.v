module Prob_5_57_safe (y_out, Run, clk, reset_b);
	output reg [2:0] y_out; 
	input Run, clk, reset_b;
	reg [2:0] next_y_out;
	   always @ (posedge clk) begin    if (reset_b == 1'b0) y_out <= 3'b000; else if (Run) y_out <= next_y_out;	end;
	
	always @ (y_out, Run) begin
		next_y_out = 3'd0;	// assign by exception
		case (y_out)    
			3'd0:	if (Run) next_y_out = 3'd2;
			3'd1:	next_y_out = 3'd0;
			3'd2:	if (Run) next_y_out = 3'd4;
			3'd3:	next_y_out = 3'd0;
			3'd4:	if(Run) next_y_out = 3'd6;
			3'd5: next_y_out = 3'd0;
			3'd6: if(Run) next_y_out = 3'd0;
			3'd7:	next_y_out = 3'd0;  // Can be omitted � covered by default
			default: next_y_out = 3'd0;
		endcase;
	end;	endmodule