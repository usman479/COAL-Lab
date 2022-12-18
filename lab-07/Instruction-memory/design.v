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
      // addi x10,x10,0
      // lw x6,1(x10)
      // addi x6,x6,3
      mem[0] <= 32'h00050513;
      mem[1] <= 32'h00152303;
      mem[2] <= 32'h00330313;

      // addi x10,x10,0
      // lw x6,1(x10)
      // lw x5,0(x10)
      // add x6,x6,x5
      // mem[0] <= 32'h00050513;
      // mem[1] <= 32'h00152303;
      // mem[2] <= 32'h00052283;
      // mem[3] <= 32'h00530333;

      // mem[1] <= 32'h0002A203;
    end

endmodule