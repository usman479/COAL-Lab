module instruction_memory(reset,A,RD);

    input[31:0] A;
    input reset;
    output [31:0] RD;

    reg[31:0] mem [1023:0]; // 8 byte // 16 half word // 32 word

    assign RD = (reset == 1'b1) ? 32'h00000000 : mem[A[31:2]];

    initial begin
      mem[0] <= 32'h0062E233; // or x4,x5,x6
      mem[1] <= 32'h00520533; // add x10,x4,x5
      mem[2] <= 32'h00A02023; // sw x10,0(x0)
      mem[3] <= 32'h00002783; // lw x15, 0(x0)
      mem[4] <= 32'h00578A33; // add x20,x15,x5
    end

endmodule