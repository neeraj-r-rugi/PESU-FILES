module mux2 (input wire i0, i1, j, output wire o);
    assign o = j == 1'b0? i0 : i1;
endmodule