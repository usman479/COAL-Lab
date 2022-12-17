`include "./modules/main_decoder.v"
`include "./modules/alu_decoder.v"

module control_unit(Zero,op,func3,func7,PCSrc,ResultSrc,MemWrite,ALUSrc,ImmSrc,RegWrite,ALUControl);

    input Zero, func7;
    input [6:0] op;
    input [2:0] func3;

    output PCSrc, RegWrite, ALUSrc, MemWrite, ResultSrc;
    output [1:0] ImmSrc;
    output [2:0] ALUControl;

    wire Branch,op_5;
    wire [1:0]ALUReg;

    assign op_5 = op[5];

    main_decoder main_decoder(.op(op),
                                .RegWrite(RegWrite),
                                .MemWrite(MemWrite),
                                .Branch(Branch),
                                .ResultSrc(ResultSrc),
                                .ALUSrc(ALUSrc),
                                .ImmSrc(ImmSrc),
                                .ALUOp(ALUReg)
                                );

    alu_decoder alu_decoder(.ALUOp(ALUReg),
                            .func3(func3),
                            .op_5(op_5),
                            .func7_5(func7),
                            .ALUControl(ALUControl)
                            );

    assign PCSrc = Zero & Branch;

endmodule