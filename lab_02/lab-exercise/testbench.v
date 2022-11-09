module tb();

    reg [31:0]A,B;
    reg [2:0]control;
    wire [31:0]Q;

    ALU dut (.A(A),.B(B),.Q(Q),.control(control));

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end

    initial begin
        control <= 3'b101;
        A <= 32'b01000000000000000000000000000000;
        B <= 32'b01000000000000000000000000000000;
        #100
        control <= 3'b000;
        A <= 32'd7;
        B <= 32'd5;
        #100
        control <= 3'b001;
        A <= 32'd7;
        B <= 32'd5;
        #100

        $finish;
    end


endmodule