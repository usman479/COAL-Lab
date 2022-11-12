module tb();

    reg [31:0]A,B;
    reg [2:0]control;
    wire [31:0]result;
    wire Verflow,Carry,Negative,Zero;

    ALU dut (.A(A),.B(B),.result(result),.control(control),.Verflow(Verflow),.Carry(Carry),.Negative(Negative),.Zero(Zero));

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end

    initial begin
        control <= 3'b000;
        A <= 32'd50;
        B <= 32'd60; // result 110
        #100
        control <= 3'b001;
        A <= 32'b00000000000000000000000000111100;
        B <= 32'b00000000000000000000000000111100; // zero 1
        #100
        control <= 3'b000;
        A <= 32'b10000000000000000000000000000000;
        B <= 32'b10000000000000000000000000000001; // carry 1 // verflow 1
        #100

        $finish;
    end


endmodule