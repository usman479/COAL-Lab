module ALU(A,B,Q,control);

    input [31:0]A,B;
    input[2:0]control;
    wire Cout;
    output [31:0]Q;
    wire [31:0]A_or_B,A_and_B,B_not,A_sum_B,Ex;
    wire [31:0]S1;

    assign A_or_B = A | B;
    assign A_and_B = A & B;
    assign B_not = ~B;
    assign S1 = (control[0] == 1'b1) ? B_not : B;
    assign Ex = {31'b0000000000000000000000000000000,S1[31]};
    assign {Cout,A_sum_B} = A+S1+control[0];
    assign Q = (control == 3'b000) ? A_sum_B : (control == 3'b001) ? A_sum_B : (control == 3'b010) ? A_and_B : (control == 3'b011) ? A_or_B : Ex;



endmodule 