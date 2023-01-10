module sign_extension(Imm,ImmSrc,ImmExt);

    input [31:0] Imm;
    input[1:0] ImmSrc;
    output [31:0] ImmExt;

    assign ImmExt = (ImmSrc == 2'b00) ? {{20{Imm[31]}},Imm[31:20]} : {{20{Imm[31]}},Imm[31:25],Imm[11:7]};

endmodule