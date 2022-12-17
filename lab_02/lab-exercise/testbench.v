module tb();

    reg [31:0]A,B;
    reg [1:0]control;
    wire [31:0]result;
    wire Verflow,Carry,Negative,Zero;

    ALU dut (.A(A),.B(B),.result(result),.control(control),.Verflow(Verflow),.Carry(Carry),.Negative(Negative),.Zero(Zero));

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end

    initial begin
        control <= 2'b00;
        A <= 32'b10000000000000000000000000000000;
        B <= 32'b10000000000000000000000000000001;
        #100
        control <= 2'b01;
        A <= 32'd40;
        B <= 32'd40;
        #100
        control <= 2'b10;
        A <= 32'b01010101010101010101010101010101;
        B <= 32'b10101010101010101010101010101010;
        #100
        control <= 2'b11;
        A <= 32'b00001110000000000000000000000001;
        B <= 32'b00000000000000110000000000001111;
        #100
        $finish;
    end


endmodule



