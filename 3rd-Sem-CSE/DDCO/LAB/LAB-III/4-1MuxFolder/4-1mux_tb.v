module mux4_tb;
reg [0:3]ii;
reg s0;reg s1;
wire yy;
initial
begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux4_tb);
end
mux4 newMUX(.i(ii), .j0(s0),.j1(s1),.o(yy));
initial
    begin
        $monitor($time, " ii = %b, j0 = %b, j1 = %b, o = %b", ii,s0,s1,yy);
                ii = 4'b1000;s0=1'b0;s1=1'b0;
        #5      ii = 4'b0100;s0=1'b0;s1=1'b1;
        #5      ii = 4'b0010;s0=1'b1;s1=1'b0;
        #5      ii = 4'b0001;s0=1'b1;s1=1'b1;
    end
endmodule