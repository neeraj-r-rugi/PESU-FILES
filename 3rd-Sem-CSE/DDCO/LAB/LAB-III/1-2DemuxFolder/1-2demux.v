module andgate(y,a,b);
    input a,b;
    output y;
    assign y = a & b;
endmodule

module notgate (y,a);
    input a;
    output y;
    assign y = !a;
endmodule

module demux (input wire sel, in, output wire y0,y1);
    wire n1;
    andgate a(y1, sel, in);
    notgate n(n1, sel);
    andgate b(y0, n1, in);
endmodule