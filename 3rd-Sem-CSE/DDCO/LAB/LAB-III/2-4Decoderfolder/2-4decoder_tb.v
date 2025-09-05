module decoder_tb;
  reg [1:0] A;
  reg EN;
  wire [3:0] Y;
  initial 
    begin
        $dumpfile("2-4decoder.vcd");
        $dumpvars(0, decoder_tb);
        $monitor("Time = %0t EN = %b A = %b Y = %b", $time, EN, A, Y);
    end
  decoder newDEC(.a(A), .en(EN), .y(Y));
  initial 
  begin
        EN = 1'b0; A = 2'b00; #5;
        EN = 1'b1; A = 2'b00; #5;
        EN = 1'b1; A = 2'b01; #5;
        EN = 1'b1; A = 2'b10; #5;
        EN = 1'b1; A = 2'b11; #5;
        EN = 1'b0; A = 2'b10; #5;
  end
endmodule