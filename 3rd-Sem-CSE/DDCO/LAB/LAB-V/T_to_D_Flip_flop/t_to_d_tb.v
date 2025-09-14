module TB_D; 
reg D;  
reg CLK;    
wire Q; 
tfftodff newD (.D(D), .clk(CLK), .Q(Q)); 
 // clock  
initial begin   
  CLK = 1'b0;  
  forever #5 CLK = ~CLK;  
end  
initial
begin
// waveform dump 
$dumpfile("tfftodff.vcd");   
$dumpvars(0, TB_D);  
end
initial 
begin  
    $monitor($time, " CLK=%b, D=%b, Q=%b", CLK, D, Q);
    D = 0;
  @(negedge CLK); D = 1;
  @(negedge CLK); D = 0;
  @(negedge CLK); D = 1;
  @(negedge CLK); D = 0;
  #20 $finish;
    $finish;
end
initial
begin  
    #200 $finish; 
end
endmodule
