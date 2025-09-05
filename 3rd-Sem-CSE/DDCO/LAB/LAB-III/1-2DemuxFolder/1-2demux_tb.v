module tb;
    reg sel,in;
    wire y0,y1;
    demux uut(.sel(sel), .in(in), .y0(y0), .y1(y1));
    initial
    begin
        #0 sel=0;in=0;
        #5 sel=0;in=1;
        #10 sel=1;in=0;
        #15 sel=1;in=1;
    end
    initial
    begin
        $monitor($time, "sel=%b, in=%b, y0=%b, y1=%b", sel,in,y0,y1);
    end
    initial
    begin
        $dumpfile("1-2demux.vcd");
        $dumpvars(0,tb);    
    end
endmodule