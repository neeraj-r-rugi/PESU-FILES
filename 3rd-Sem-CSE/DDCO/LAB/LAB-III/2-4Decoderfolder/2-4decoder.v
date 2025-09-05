module decoder (input wire [1:0] a, input wire en, output wire [3:0] y);
    assign y[3] = en & ~a[0] & ~a[1]; // * MSB
    assign y[2] = en & a[0] & ~a[1];
    assign y[1] = en & ~a[0] & a[1];
    assign y[0] = en & a[0] & a[1]; // * LSB
endmodule