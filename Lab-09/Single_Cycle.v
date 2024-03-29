`include "./PC/design.v"
`include "./Instruction-memory/design.v"
`include "./register-file/design.v"
`include "./ControlUnit/control_unit.v"
`include "./sign-extension/design.v"
`include "./ALU/design.v"
`include "./data-memory/design.v"
`include "./adder/design.v"
`include "./ControlUnit/DecoderModules/main_decoder.v"
`include "./ControlUnit/DecoderModules/alu_decoder.v"
`include "./mux-2x1/design.v"


module Single_Cycle(clk,reset);
    input clk,reset;

    // Interim Wire Declaration
        wire [31:0] PC_w;
        wire [31:0] Instruction;
        wire [31:0] RD1;
        wire [31:0] Extended;
        wire [31:0]ALUResult;
        wire RegWrite;
        wire MemWrite;
        wire ALUSrc;
        wire ResultSrc;
        wire [31:0] RD;
        wire [31:0] RD2;
        wire [31:0] NextIns;
        wire [1:0] ImmSrc;
        wire [2:0]ALUControl;
        wire [31:0] muxOut,Data_mem_out;


    // Module Initialization
    program_counter program_counter (                                   // fetch cycle ==>
                                        .clk(clk),
                                        .reset(reset),
                                        .PC(PC_w),
                                        .PCNext(NextIns)
                                        );

    instruction_memory instruction_memory (
                                            .reset(reset),
                                            .A(PC_w),
                                            .RD(Instruction)
                                            );                          // <==

    control_unit control_unit (                                         // Decoding ==>
                                .zero(),
                                .op(Instruction[6:0]),
                                .func3(Instruction[14:12]),
                                .func7(Instruction[29]),
                                .PCSrc(),
                                .RegWrite(RegWrite),
                                .ALUSrc(ALUSrc),
                                .MemWrite(MemWrite),
                                .ResultSrc(ResultSrc),
                                .ImmSrc(ImmSrc),
                                .ALUControl(ALUControl)
                                );

    register_file register_file (
                                    .A1(Instruction[19:15]),
                                    .A2(Instruction[24:20]),
                                    .A3(Instruction[11:7]),
                                    .clk(clk),
                                    .reset(reset),
                                    .RD1(RD1),
                                    .RD2(RD2),
                                    .WD3(Data_mem_out),
                                    .WE3(RegWrite)
                                    );

    sign_extension sign_extension (
                                    .Imm(Instruction),
                                    .ImmExt(Extended),
                                    .ImmSrc(ImmSrc)
                                    );                                  // <==

    Flags_ALU Flags_ALU (
                        .A(RD1),
                        .B(muxOut),
                        .ctrl(ALUControl),
                        .Result(ALUResult),
                        .Z(),
                        .N(),
                        .C(),
                        .V()
                        );

    data_memory data_memory (
                                .clk(clk),
                                .A(ALUResult),
                                .WD(RD2),
                                .WE(MemWrite),
                                .RD(RD),
                                .reset(reset)
                            );

    Adder Adder(
                .Inp1(PC_w),
                .Inp2(32'd4),
                .Sum(NextIns)
                );

    mux mux1(.inp1(RD2),
            .inp2(Extended),
            .sig(ALUSrc),
            .ot(muxOut)
            );

    mux mux2(.inp1(ALUResult),
                .inp2(RD),
                .sig(ResultSrc),
                .ot(Data_mem_out)
                );
    
endmodule