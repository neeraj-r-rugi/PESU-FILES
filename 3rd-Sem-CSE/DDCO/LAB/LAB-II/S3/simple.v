/*
 T(Temperature) = 1
 P(Present) = 1

 --> Run Fan
*/
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

module fan(D, T, P, O);
input T, P, O;
output D;
wire and_out;
and2 G1(and_out, T, P);
or2 G2(D, O, and_out);

endmodule