module tff (input wire T, input wire clk, output reg Q);
initial Q = 0;
always @(posedge clk )
	 begin
     if (T)    Q <= ~Q;   // toggle  
	else    Q <= Q;    // hold
end
endmodule

module xorgate (y,a,b);
    input a,b;
    output y;
    assign y = a ^ b;
endmodule

module tfftodff (input wire D, input wire clk, output wire Q);
  wire T;
  xorgate x(T, D, Q);
  tff t1(T,clk, Q);
endmodule