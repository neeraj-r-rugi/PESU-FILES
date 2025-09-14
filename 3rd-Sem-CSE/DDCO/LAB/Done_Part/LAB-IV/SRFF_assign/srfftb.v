`timescale 1ns/1ps
module tb_sr_ff;   
reg s, r, clk;    
wire q;   
 // Instantiate JK flip-flop 
srff sr1 (.s(s),.r(r),.clk(clk),.q(q));  
// Generate clock
initial begin   
    clk = 0;      
forever #5 clk = ~clk;   // Clock period = 10 ns   
end
initial
begin
// waveform dump 
$dumpfile("srff.vcd");   
$dumpvars(0, tb_sr_ff);  
end
// Test sequence    
initial begin        // Monitor outputs   
    $monitor("Time=%0t | S=%b R=%b | Q=%b", $time, s, r, q);   
    // Apply inputs on different clock edges  
    #0 s = 0; r = 0;
    #10 s = 0; r = 0;   // Hold  
    #10 s = 0; r = 1;   // Reset  
    #10 s = 1; r = 0;   // Set       
    #10 s = 1; r = 1;   // Don't Care   
    #10 s = 1; r = 1;   // Don't Care      
    #10 s = 0; r = 1;   // Reset        
    #10 s = 1; r = 0;   // Set      
    #20 $finish;    
end
endmodule
