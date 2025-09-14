module TB_T; 
reg T;  
reg CLK;  
wire Q; 
 // Instantiate T flip-flop 
 tff newT (.T(T), .clk(CLK), .Q(Q));
// Clock generation: 10 time units period  
initial 
begin
    CLK = 1'b0;    
forever #5 CLK = ~CLK;  
end
// Waveform dump 
 initial 
begin   
 $dumpfile("tff.vcd");   
 $dumpvars(0, TB_T);  
end  
initial 
begin   
$monitor("Time=%0t T=%b | Q=%b", $time,T, Q);
  end
initial
begin 
   T = 1'b0;
   #7 T = 1'b1;
   #50 T = 1'b0;
   #20 $finish; 
end

initial
begin 
   #200 $finish; 
end
endmodule
