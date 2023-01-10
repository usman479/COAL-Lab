module mux(A0, A1, C, O);

    input A0,A1,C;  //1001  // 1 0 // 0 1
    output O;

    assign O = (C == 1'b0) ? A0 : A1;

endmodule