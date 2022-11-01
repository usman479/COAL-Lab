module combinational_circuit(A,B,C,Q);

    input A,B,C;
    output Q;

    // interim signals
    wire A_xor_B,A_and_B;

    // logic designing
    assign A_xor_B = A ^ B;
    assign A_and_B = A & B;
    assign Q = C | A_and_B | A_xor_B;

endmodule

// assign = (A ^ B) | (A & B) | C;
 