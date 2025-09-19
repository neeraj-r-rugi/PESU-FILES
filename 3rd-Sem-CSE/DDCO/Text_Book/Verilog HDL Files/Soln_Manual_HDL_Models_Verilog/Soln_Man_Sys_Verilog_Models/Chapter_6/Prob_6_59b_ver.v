module Prob_6_59b_ver (output reg [3:0] STRC, input [3:0] I_par, input Count, Load, CLK, Clear_b);
  wire E_bar = !STRC[0]; 
  always @ (posedge CLK) if (Clear_b == 1'b0) STRC <= 4'b0; else
    if (Load) STRC <= I_par;
    else if (Count) STRC <= {E_bar, STRC[3:1]};
   
endmodule

module t_Prob_6_59b_ver ();
wire [3:0] t_STRC;
reg t_Load, t_Count, t_CLK, t_Clear_b;
reg [3:0] t_I_par;

  Prob_6_59b_ver M0 (t_STRC, t_I_par, t_Count, t_Load, t_CLK, t_Clear_b);

  initial #400 $finish;
  initial begin t_CLK = 0; forever #5 t_CLK = ~t_CLK; end
  initial fork
    t_I_par = 4'b0101;	// Data for parallel load
    t_Clear_b = 0;
    #20 t_Clear_b = 1;

    t_Count = 0;
    #50 t_Count = 1;		// Counting
    #150 t_Count = 0;		// Pause
    #200 t_Count = 1;		// Resume counting
    t_Load = 0;
    #250 t_Load = 1;		// Parallel load
    #260 t_Load = 0;
  join
endmodule

