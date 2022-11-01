module combinational_circuit(A,B,C,clk,reset,Q);

    input A,B,C,clk,reset;
    output Q;

    // interim signals
    wire A_xor_B , A_and_B , A_or_B_C;
    reg flop;

    // logic designing
    assign A_xor_B = A ^ B;
    assign A_and_B = A & B;
    assign A_or_B_C = C | A_and_B | A_xor_B;

    always @(posedge clk) begin
        if(reset == 1'b1)
        begin
            flop <= 1'b0;
        end
        else begin
            flop <= A_or_B_C;
        end
    end

    assign Q = flop;

endmodule

// assign = (A ^ B) | (A & B) | C;
 