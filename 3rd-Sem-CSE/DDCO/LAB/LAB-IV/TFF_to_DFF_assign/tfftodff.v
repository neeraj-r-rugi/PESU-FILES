module tff (input wire T, input wire clk, input wire rst, output reg Q);
always @(posedge clk )
	 begin  if (rst) 
                   Q <= 1'b0;  
                 else if (T)    Q <= ~Q;   // toggle  
	else    Q <= Q;    // hold
end
endmodule

module xorgate (y,a,b);
    input a,b;
    output y;
    assign y = a ^ b;
endmodule

module tfftodff (input wire D, input wire clk, input wire rst, output wire Q);
  wire T;
  xorgate x(T, D, Q);
  tff t1(T,clk,rst, Q);
endmodule