module data_memory(clk,A,WD,WE,RD,reset);

    input[31:0] A,WD;
    input WE,clk,reset;
    output [31:0] RD;

    reg[31:0] memory [1023:0];

    initial begin
        memory[0] <= 32'h00000005;
        memory[1] <= 32'h00000007;
        memory[2] <= 32'h00000009;
        memory[3] <= 32'h0000000A;
    end

    assign RD = (WE == 1'b0) ? memory[A] : 32'h00000000;

    always@(posedge clk) begin
        if(WE == 1'b1) begin
            memory[A] <=  WD;
        end
    end

endmodule