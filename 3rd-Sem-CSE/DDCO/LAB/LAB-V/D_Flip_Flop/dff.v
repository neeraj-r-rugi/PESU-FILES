module dff (input wire D, input wire clk, output reg Q);
  always @(posedge clk) 
    begin  

      Q <= D; // Sample D on rising edge of clock
    end
endmodule
