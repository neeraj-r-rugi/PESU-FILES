module Bi_Dir_Shift_Reg_74194 (
  output reg 	QA, QB, QC, QD,
  input 		A, B, C, D, SIR, SIL, s1, s0, CK, CLR
);
  always @ (posedge CK, negedge CLR)
    if (!CLR) {QA, QB, QC, QD} <= 4'b0;
    else case ({s1, s0})
      2'b00:	{QA, QB, QC, QD} <= {QA, QB, QC, QD};
      2'b01:	{QA, QB, QC, QD} <= {SIR, QA, QB, QC};
      2'b10:	{QA, QB, QC, QD} <= {QB, QC, QD, SIL};
      2'b11:	{QA, QB, QC, QD} <= {A, B, C, D};
    endcase
endmodule

module t_Bi_Dir_Shift_Reg_74194 ();
  wire QA, QB, QC, QD;
  reg A, B, C, D, SIR, SIL, s1, s0, clock, CLR;

  Bi_Dir_Shift_Reg_74194 M0 (QA, QB, QC, QD, A, B, C, D, SIR, SIL, s1, s0, clock, CLR);

  initial #250 $finish;
  initial begin clock = 0; forever #5 clock = ~clock; end
  initial fork
    CLR = 0;
    {A, B, C, D} = 4'hf; 
    s1 = 0;
    s0 = 0;
    SIL = 0;
    SIR = 0;
    #10 CLR = 1;
    #30 begin s1 = 1; s0 = 1; end	// load
    #40   s1 = 0;	// shift right
    #100   s1 = 1;	// load
    #110 begin s1 = 0; s0 = 0; end
    #140 s1 = 1;	// shift left
    #160 s1 = 0;     // pause
    #180 s1 = 1;	// resume
   join
endmodule

always @ (posedge Ready) begin    # 1 Error <= (Exp_Value ^ Product) ;  end  initial begin    #5 Multiplicand = 0;    Multiplier = 0;    repeat (32) #10 begin        Start = 1;        #10 Start = 0;        repeat (32) begin          Start = 1;          #10 Start = 0;                    #100 Multiplicand = Multiplicand + 1;        end      Multiplier = Multiplier + 1;    end  endendmodulemodule Flip_flop_7474 (output reg Q, input D, CLK, preset, clear); always @ (posedge CLK, negedge preset , negedge clear)if (!preset)     	Q <= 1'b1;else if (!clear) 	Q <= 1'b0;else 	Q <= D;endmodulemodule Adder_7483 (  output S4, S3, S2, S1, C4,  input A4, A3, A2, A1, B4, B3, B2, B1, C0, VCC, GND);// Note: connect VCC and GND to supply1 and supply0 in the test bench  wire [4: 1] sum;  wire [4: 1] A = {A4, A3, A2, A1};  wire [4: 1] B = {B4, B3, B2, B1};  assign S4 = sum[4];  assign S3 = sum[3];  assign S2 = sum[2];  assign S1 = sum[1];  assign {C4, sum} = A + B + C0;endmodulemodule Counter_74161 (  output  	QD, QC, QB, QA,		// Data output  output 		COUT,			// Output carry  input	 	D, C, B, A,		// Data input   input 		P, T, 			// Active high to count		L, 			// Active low to load		CK, 			// Positive edge sensitive		CLR			// Active low to clear);reg [3: 0] A_count;assign QD = A_count[3];assign QC = A_count[2];assign QB = A_count[1];assign QA = A_count[0];assign COUT = ((P == 1) && (T == 1) && (L == 1) && (A_count == 4'b1111));always @ (posedge CK, negedge CLR)if (CLR == 0) 			A_count <= 4'b0000;else if (L == 0)			A_count <= {D, C, B, A};else if ((P == 1) && (T == 1)) 	A_count <= A_count + 1'b1;else 				A_count <= A_count;	// redundant statementendmodulemodule Reg_74194 (  output reg QA, QB, QC, QD,  input A, B, C, D, SIR, SIL, s1, s0, CK, CLR);  always @ (posedge CK, negedge CLR)    if (!CLR) {QA, QB, QC, QD} <= 4'b0;    else case ({s1, s0})      2'b00:	{QA, QB, QC, QD} <= {QA, QB, QC, QD};      2'b01:	{QA, QB, QC, QD} <= {SIR, QA, QB, QC};      2'b10:	{QA, QB, QC, QD} <= {QB, QC, QD, SIL};      2'b11:	{QA, QB, QC, QD} <= {A, B, C, D};    endcaseendmodule