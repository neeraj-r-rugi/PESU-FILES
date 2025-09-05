module simple_circuit2_tb;
    reg A, B, C;
    wire Y;
    simple_circuit2 M1 (A, B, C, Y);
    initial begin
        #0 A = 1'b0;B = 1'b0;C = 1'b0;
        #20 A = 1'b0;B = 1'b0;C = 1'b1;
        #20 A = 1'b0;B = 1'b1;C = 1'b0;
        #20 A = 1'b0;B = 1'b1;C = 1'b1;
        #20 A = 1'b1;B = 1'b0;C = 1'b0;
        #20 A = 1'b1;B = 1'b0;C = 1'b1;
        #20 A = 1'b1;B = 1'b1;C = 1'b0;
        #20 A = 1'b1;B = 1'b1;C = 1'b1;
    end
    initial begin
        $monitor($time, "A = %b, B = %b, C = %b, Y = %b", A, B, C, Y);
    end
    initial begin
        $dumpfile("s2.vcd");
        $dumpvars(0, simple_circuit2_tb);
    end
endmodule