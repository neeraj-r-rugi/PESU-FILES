module Prob_6_58b (output reg[3:0] A_count, output C_out, input [3:0] Data_in, input Count, Load, CLK, Clear_b);	wire A3 = A_count [3];	wire A2 = A_count [2];	wire A1 = A_count [1];	wire A0 = A_count [0];	wire Load_bar = !Load;	assign C_out = A3 && A2 && A1 && A0 && (Count && Load_bar);
		always @ (posedge CLK, negedge Clear_b)	if (Clear_b == 1'b0) A_count <= 4'b0000;	else if (Load == 1'b1) A_count  <= Data_in; 	else if (Count == 1'b1) A_count <= A_count + 1'b1;
	endmodule
// Also see HDL Example 6.3)