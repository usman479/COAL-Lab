module post_lab(A,B,C,D,Q);

    input A,B,C,D;
    output Q;
    assign Q = (A|(!(C|D)))^((B^D)|(B&C));

endmodule