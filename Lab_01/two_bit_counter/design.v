module two_bit_adder(input clk,reset,output [1:0]Q);


    reg [1:0] flop;

    always @(negedge clk) begin
        if(reset == 1'b1)
        begin
            flop <= 2'b00;
        end
        else begin
            flop <= flop + 2'b01;
        end
    end

    assign Q = flop;

endmodule

 