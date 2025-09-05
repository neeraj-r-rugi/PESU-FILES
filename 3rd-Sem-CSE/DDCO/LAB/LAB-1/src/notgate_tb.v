module notgate_tb;
    reg a;
    reg b;
    wire c;
    not notgate_tb(c, a);
    initial begin
        #000 a = 0;
        #100 a = 1;
    end
    initial begin
        $monitor($time, "a = %b,c = %b", a, c);
    end
    initial begin
        $dumpfile("notgate.vcd");
        $dumpvars(0, notgate_tb);
    end
    
endmodule