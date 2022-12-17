module ALU(A,B,result,control,Verflow,Carry,Negative,Zero);

    input [31:0]A,B;
    input [1:0]control;
    
    output [31:0]result;
    output Verflow,Carry,Negative,Zero;

    wire Cout;
    wire [31:0]A_or_B,A_and_B,B_not,A_sum_B;
    wire A_xor_sum,A_xnor_B_xnor_control,control_1_not;
    wire [31:0]S1;

    // Interim Outputs
    assign A_or_B = A | B;
    assign A_and_B = A & B;
    assign B_not = ~B;
    assign S1 = (control[0] == 1'b1) ? B_not : B;
    assign {Cout,A_sum_B} = A+S1+control[0];
    assign A_xor_sum = A[31]^A_sum_B[31];
    assign A_xnor_B_xnor_control = ~(A[31]^B[31]^control[0]);
    assign control_1_not = ~(control[1]);
    // Flags
    assign Verflow = A_xnor_B_xnor_control & A_xor_sum & control_1_not;
    assign Zero = &(~result);
    assign Negative = result[31];
    assign Carry = control_1_not & Cout;
    // Final Output
    assign result = (control == 2'b00) ? A_sum_B : (control == 2'b01) ? A_sum_B : (control == 2'b10) ? A_and_B : A_or_B ;


endmodule 




