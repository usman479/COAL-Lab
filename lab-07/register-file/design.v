module register_file(A1,A2,A3,clk,reset,RD1,RD2,WD3,WE3);

    input[4:0] A1,A2,A3;
    input clk,reset,WE3;
    input[31:0] WD3;
    output [31:0]RD1,RD2;
    reg[31:0] register[31:0];
    
    initial begin
        register[0] <= 32'h00000000;
        register[1] <= 32'h00000000;
        register[2] <= 32'h00000000;
        register[3] <= 32'h00000000;
        register[4] <= 32'h00000000;
        register[5] <= 32'h00000000;
        register[6] <= 32'h00000000;
        register[7] <= 32'h00000000;
        register[8] <= 32'h00000000;
        register[9] <= 32'h00000000;
        register[10] <= 32'h00000000;
        register[11] <= 32'h00000000;
        register[12] <= 32'h00000000;
        register[13] <= 32'h00000000;
        register[14] <= 32'h00000000;
        register[15] <= 32'h00000000;
    end

    assign RD1 = (reset == 1'b1) ? 32'd0 : register[A1];
    assign RD2 = (reset == 1'b1) ? 32'd0 : register[A2];

    always@ (negedge clk) begin
        if((WE3 == 1'b1) & (A3 != 5'h00)) begin
            register[A3] <= WD3;
            
        end
    end


endmodule