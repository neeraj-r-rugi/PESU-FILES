module tff (input wire T, input wire clk, output reg Q);
initial Q = 0;
always @(posedge clk )
	begin  
    if (T)    Q <= ~Q;   // toggle  
    else    Q <= Q;    // hold
  end
endmodule
