module tb();

    reg Zero, func7;
    reg [6:0] op;
    reg [2:0] func3;

    output PCSrc, RegWrite, ALUSrc, MemWrite, ResultSrc;
    output [1:0] ImmSrc;
    output [2:0] ALUControl;

    control_unit dut (.Zero(Zero),
                        .op(op),
                        .func3(func3),
                        .func7(func7),
                        .PCSrc(PCSrc),
                        .ResultSrc(ResultSrc),
                        .MemWrite(MemWrite),
                        .ALUSrc(ALUSrc),
                        .ImmSrc(ImmSrc),
                        .RegWrite(RegWrite),
                        .ALUControl(ALUControl)
                        );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end

    initial begin
      Zero <= 1'b1;
      op <= 7'b0000011;
      func3 <= 3'b000;
      func7 <= 1'b1;
      #100;

      Zero <= 1'b1;
      op <= 7'b0100011;
      func3 <= 3'b000;
      func7 <= 1'b1;
      #100;

      Zero <= 1'b1;
      op <= 7'b0110011;
      func3 <= 3'b000;
      func7 <= 1'b1;
      #100;

      Zero <= 1'b1;
      op <= 7'b1100011;
      func3 <= 3'b000;
      func7 <= 1'b1;
      #100;
    end


endmodule