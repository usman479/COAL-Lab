module tb;
    reg A,B,C,clock,reset;
    wire X;

    Behavioral_Model dut (.A(A),
                            .B(B),
                            .clock(clock),
                            .reset(reset),
                            .C(C),
                            .X(X)
                            );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
    //Clock generation

    always begin
        clock = 1'b1;
        #50;
        clock = 1'b0;
        #50;
    end

    initial begin
        reset = 1'b1;
        #100;
        reset = 1'b0;
        A= 1'b1;
        B= 1'b1;
        C = 1'b1;
        #100;
        $finish;
    end
endmodule