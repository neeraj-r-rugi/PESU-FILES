module tff (input wire T, input wire clk, input wire rst, output reg Q);
always @(posedge clk ) begin  
  if (rst) Q <= 1'b0;
  else begin
    if (T)    Q <= ~Q;   // toggle  
    else    Q <= Q;    // hold
  end
end
endmodule
