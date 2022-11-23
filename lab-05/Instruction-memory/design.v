module instruction_memory(reset,A,RD);

    input[31:0] A;
    input reset;
    output [31:0] RD;

    reg[31:0] mem [1023:0]; // 8 byte // 16 half word // 32 word

    assign RD = (reset == 1'b1) ? 32'h00000000 : mem[A[31:2]];

    initial begin
      mem[0] <= 32'h006248B3;
      mem[1] <= 32'h006248B3;
    end

endmodule