`timescale 1ns/1ps
module tb_jk_ff;   
reg j, k, clk;    
wire q;   
 // Instantiate JK flip-flop 
jkff jk1 (.j(j),.k(k),.clk(clk),.q(q));  
// Generate clock
initial begin   
    clk = 0;      
forever #5 clk = ~clk;   // Clock period = 10 ns   
end
initial
begin
// waveform dump 
$dumpfile("jkff.vcd");   
$dumpvars(0, tb_jk_ff);  
end
// Test sequence    
initial begin        // Monitor outputs   
    $monitor("Time=%0t | J=%b K=%b | Q=%b", $time, j, k, q);      
    // Initialize        j = 0; k = 0;       
    // Apply inputs on different clock edges      
    #10 j = 0; k = 0;   // Hold  
    #10 j = 0; k = 1;   // Reset  
    #10 j = 1; k = 0;   // Set       
    #10 j = 1; k = 1;   // Toggle   
    #10 j = 1; k = 1;   // Toggle again       
    #10 j = 0; k = 1;   // Reset        
    #10 j = 1; k = 0;   // Set      
    #20 $finish;    
end
endmodule
