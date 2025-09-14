module TB_D; 
reg D;  
reg CLK;   
wire Q; 
dff newD (.D(D), .clk(CLK),.Q(Q)); 
 // clock  
initial begin   
  CLK = 1'b0;  
  forever #5 CLK = ~CLK;  
end  
initial
begin
// waveform dump 
$dumpfile("dff.vcd");   
$dumpvars(0, TB_D);  
end
initial 
begin  
    $monitor($time, " CLK=%b, D=%b, Q=%b", CLK, D, Q);   
    D = 1'b1; #7;    
    D = 1'b0; #9;    
    D = 1'b1; #11;  
    D = 1'b0; #6;
    D = 1'b1; #12;  
    D = 1'b0; #8;         
    $finish;
end
initial
begin  
    #200 $finish; 
end
endmodule
