module gate(A,B,Y);

    // Declaring inputs
    input A,B;

    // Declaring output
    output Y;

    // Using gate level modeling
    and(Y,A,B);

endmodule