module register_file(A1,A2,A3,clk,reset,RD1,RD2,WD3,WE3);

    input[4:0] A1,A2,A3;
    input clk,reset,WE3;
    input[31:0] WD3;
    output [31:0]RD1,RD2;
    reg[31:0] register[31:0];

    assign RD1 = (reset == 1'b1) ? 32'd0 : register[A1];
    assign RD2 = (reset == 1'b1) ? 32'd0 : register[A2];

    always@ (negedge clk) begin
        if((WE3 == 1'b1) & (A3 != 5'h00)) begin
            register[A3] <= WD3;
        end
    end


endmodule