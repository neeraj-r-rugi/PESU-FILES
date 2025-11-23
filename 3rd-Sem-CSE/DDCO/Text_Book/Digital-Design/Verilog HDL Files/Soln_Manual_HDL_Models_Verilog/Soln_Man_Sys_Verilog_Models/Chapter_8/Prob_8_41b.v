module Datapath_unit 
(
  output reg [15: 0] 	R0, input [7: 0] Data, input Clr_P1_P0, Ld_P1_P0, Ld_R0, clock, rst);
   reg [7: 0] 	P1, P0;
  
  always @ (posedge clock) begin
    if (Clr_P1_P0) begin P1 <= 0; P0 <= 0; end
    if (Ld_P1_P0) begin P1 <= Data; P0 <= P1; end
    if (Ld_R0) R0 <= {P1, P0};
  end
endmodule

// Test bench for datapath
module t_Datapath_unit ();
  wire [15: 0] 	R0;
  reg [7: 0] 	Data;
  reg 			Clr_P1_P0,   Ld_P1_P0,   Ld_R0,   clock,   rst;

   Datapath_unit M0 (R0, Data, Clr_P1_P0, Ld_P1_P0, Ld_R0, clock, rst);

  initial #100 $finish;
  initial begin clock = 0; forever #5 clock = ~clock; end
  initial begin rst = 0; #2 rst = 1; end
  initial fork
    #20 Clr_P1_P0 = 0;
    #20 Ld_P1_P0 = 0;
    #20 Ld_R0 = 0;
    #20 Data = 8'ha5;
    #40 Ld_P1_P0 = 1;
    #50 Data = 8'hff;
    #60 Ld_P1_P0 = 0;
    #70 Ld_R0 = 1;
    #80 Ld_R0 = 0;
  join
endmodule

