module TB;
reg A,B,S;
wire X;
initial
    begin
        $dumpfile("2-1mux.vcd");
        $dumpvars(0,TB);
    end
mux2 newMUX(.i0(A), .i1(B), .j(S), .o(X));
initial
    begin
        $monitor($time, " S=%b, A=%b, B=%b, Output=%b", S, A, B, X);
           S = 1'b0;A = 1'b0;B = 1'b0;
        #5 S = 1'b0;A = 1'b0;B = 1'b1;
        #5 S = 1'b0;A = 1'b1;B = 1'b0;
        #5 S = 1'b0;A = 1'b1;B = 1'b1;
        #5 S = 1'b1;A = 1'b0;B = 1'b0;
        #5 S = 1'b1;A = 1'b0;B = 1'b1;
        #5 S = 1'b1;A = 1'b1;B = 1'b0;
        #5 S = 1'b1;A = 1'b1;B = 1'b1;
    end
endmodule