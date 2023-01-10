module instruction_memory(reset,A,RD);

    input[31:0] A;
    input reset;
    output [31:0] RD;

    reg[31:0] mem [1023:0]; // 8 byte // 16 half word // 32 word

    assign RD = (reset == 1'b1) ? 32'h00000000 : mem[A[31:2]];

    initial begin
      // mem[0] <= 32'h00000013;
      // mem[1] <= 32'h0002A203;
      // mem[2] <= 32'h8142A203;

      mem[0] <= 32'h00528293;
      mem[1] <= 32'h00430313;
      mem[2] <= 32'h00628533;
      // mem[3] <= 32'h00252283;
      // mem[0] <= 32'h00050513;
      // mem[1] <= 32'h00052303;
      // mem[2] <= 32'h00152283;
      // mem[3] <= 32'h00252283;
    end

endmodule