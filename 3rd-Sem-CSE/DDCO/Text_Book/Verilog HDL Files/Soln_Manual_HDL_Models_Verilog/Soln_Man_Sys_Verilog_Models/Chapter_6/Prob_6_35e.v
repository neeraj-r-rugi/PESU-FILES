   module Shift_Register_6_35e
     (output [3: 0] A_par, input [3: 0] I_par, input MSB_in, LSB_in, s1, s0, CLK, Clear);
     wire y3, y2, y1, y0;
     D_FF D3 (A_par[3],  y3, CLK, Clear);
     D_FF D2 (A_par[2],  y2, CLK, Clear);
     D_FF D1 (A_par[1],  y1, CLK, Clear);
     D_FF D0 (A_par[0],  y0, CLK, Clear);
   
     MUX_4x1 M3 (y3, I_par[3], A_par[2], MSB_in, A_par[3], s1, s0);
     MUX_4x1 M2 (y2, I_par[2], A_par[1], A_par[3], A_par[2], s1, s0); 
     MUX_4x1 M1 (y1, I_par[1], A_par[0], A_par[2], A_par[1], s1, s0); 
     MUX_4x1 M0 (y0, I_par[0], LSB_in, A_par[1], A_par[0], s1, s0);
   endmodule
   
   module MUX_4x1 (output reg y, input I3, I2, I1, I0, s1, s0);
     always @ (I3, I2, I1, I0, s1, s0)
       case ({s1, s0})
         2'b11:	y = I3;
         2'b10:	y = I2;
         2'b01:	y = I1;
         2'b00:	y = I0;
       endcase
   endmodule
   
   module D_FF (output reg Q,  input D, clk, reset_b);
     always @ (posedge clk, negedge reset_b) if (reset_b == 0) Q <= 0; else Q <= D;
   endmodule

