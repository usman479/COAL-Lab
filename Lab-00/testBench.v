module tb();

    // declaring variables
    reg A,B;
    wire Y;

    // declaring design // dut (Design Under Test)
    gate dut (.A(A),.B(B),.Y(Y));

    initial begin
      // value change dump // variable change dump
      $dumpfile("Dump.vcd");
      $dumpvars(0);
    end

    // All input values for AND gate
    initial begin;
      A <= 1'b0;
      B <= 1'b0;
      #100
      A <= 1'b0;
      B <= 1'b1;
      #100
      A <= 1'b1;
      B <= 1'b0;
      #100
      A <= 1'b1;
      B <= 1'b1;
      #100;
      $finish;
    end;

endmodule;