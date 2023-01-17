module program_counter(PCNext,clk,reset,PC);

    input[31:0] PCNext;
    output reg[31:0] PC;
    input clk,reset;


    always @(posedge clk) begin
      if(reset == 1'b1) begin
        PC <=32'h00000000;
      end
      else begin
        PC <= PCNext;
      end
    end

endmodule