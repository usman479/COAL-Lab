module sign_extension(Imm,ImmExt);

    input [11:0] Imm;
    output [31:0] ImmExt;

    assign ImmExt = {{20{Imm[11]}},Imm};

endmodule