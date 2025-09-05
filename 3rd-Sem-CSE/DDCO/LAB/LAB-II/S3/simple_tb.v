module simple_circuit3_tb;
    reg T, P, O;
    fan M1(D, T, P, O);
    initial begin
        #0  O = 1'b0;T = 1'b0;P = 1'b0;
        #20 O = 1'b0;T = 1'b0;P = 1'b1;
        #20 O = 1'b0;T = 1'b1;P = 1'b0;
        #20 O = 1'b0;T = 1'b1;P = 1'b1;
        #20 O = 1'b1;T = 1'b0;P = 1'b0;
        #20 O = 1'b1;T = 1'b0;P = 1'b1;
        #20 O = 1'b1;T = 1'b1;P = 1'b0;
        #20 O = 1'b1;T = 1'b1;P = 1'b1;
    end
    initial begin
        $monitor($time, " O = %b, T = %b, P = %b, D = %b", O, T, P, D);
    end
    initial begin
        $dumpfile("s3.vcd");
        $dumpvars(0, simple_circuit3_tb);
    end
endmodule