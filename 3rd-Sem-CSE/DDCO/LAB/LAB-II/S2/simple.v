module   or2(c, a, b);
    input a;
    input b;
    output c;
    assign c = a | b;
    
endmodule
module  and2(c, a, b);
    input a;
    input b;
    output c;
    assign c = a&b;
    
endmodule

module simple_circuit2(A, B, C, Y);

    input A, B, C;
    output Y;
    wire w1;

    and2 and2_1(w1, B, C);
    or2 or2_2(Y, A, w1);
endmodule