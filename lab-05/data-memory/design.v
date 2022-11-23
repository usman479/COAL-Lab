module data_memory(clk,A,WD,WE,RD,reset);

    input[31:0] A,WD;
    input WE,clk,reset;
    output [31:0] RD;

    reg[31:0] memory [1023:0];


    assign RD = (WE == 1'b0) ? memory[A] : 32'd0;

    always@(posedge clk) begin
        if(WE == 1'b1) begin
            memory[A] <=  WD;
        end
    end

endmodule