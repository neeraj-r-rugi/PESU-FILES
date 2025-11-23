	module Prob_6_59a (output [3:0] STRC, input [3:0] I_par, input count, Load, clk, clr_bar);
	 
	wire D_A, D_B, D_C, D_E;
	wire E_bar = !STRC[0];
	mux_2x1 mux_A (D_A, STRC[3], E_bar, count);
	D_FF D_FF_A (STRC[3], D_A, I_par[3], clk, Load, clr_bar);
	mux_2x1 mux_B (D_B, STRC[2], STRC[3], count);
	D_FF D_FF_B (STRC[2], D_B, I_par[2], clk, Load, clr_bar);
	mux_2x1 mux_C (D_C, STRC[1], STRC[2], count);
	D_FF D_FF_C (STRC[1], D_C, I_par[1], clk, Load, clr_bar);
	mux_2x1 mux_E (D_E, STRC[0], STRC[1], count);
	D_FF D_FF_E (STRC[0], D_E, I_par[0], clk, Load, clr_bar);
	endmodule

		

	module D_FF (output reg Q, input D, I_par, clk, Load, clr_bar);
		always @ (posedge clk, negedge clr_bar) 
			if (clr_bar == 1'b0) Q <= 1'b0;
			else if (Load == 1'b1) Q <= I_par;
			else Q <= D;
	endmodule

	module mux_2x1 (output reg y, input xin1, xin2, sel);
		always @ (xin1, xin2, sel)
			if (sel == 1'b0) y = xin1;
			else if (sel == 1'b1) y = xin2;
	endmodule

