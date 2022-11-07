//Dataflow model
module Behavioral_Model(A,B,C,clock,reset,X);

    input A,B,C,clock,reset;

    output X;

    // wire B_or_C ;
    // wire A_and_B_or_C;

    reg flop;

    // assign B_or_C = B | C;
    // assign A_and_B_or_C = A & (B_or_C) ;

    always @(posedge clock) begin
        if (reset ==1'b1) begin
            flop <= 1'b0;
        end
        else begin
            flop <= (A|B)&C;
        end
    end

    assign X = flop;

endmodule