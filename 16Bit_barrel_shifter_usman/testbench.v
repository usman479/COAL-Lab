module tb();

    reg[15:0] A;
    reg[3:0] C;
    wire[15:0] O;

    barrel dut(.A(A), .C(C), .O(O));

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end

    initial begin
        A <= 16'b1010101010101010;
        C <= 4'b0000;
        #100;

        A <= 16'b1010101010101010;
        C <= 4'b0001;
        #100;

        A <= 16'b1000000000000001;
        C <= 4'b0100;
        #100;



        $finish;
    end


endmodule