module Adder(Inp1,Inp2,Sum);

    input [31:0] Inp1,Inp2;
    output [31:0]Sum;

    assign Sum = Inp1+Inp2;

endmodule