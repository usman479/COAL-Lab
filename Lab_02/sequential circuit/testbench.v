module tb();

    reg A,B,C,clk,reset;
    wire Q;
    // module declare
    combinational_circuit dut (.A(A),.B(B),.C(C),.clk(clk),.reset(reset),.Q(Q));

    always begin 
      clk <= 1'b0;
      #50;
      clk <= 1'b1;
    end

    initial begin
      reset <= 1'b1;
      #100;
      reset <= 1'b0;
      A <= 1'b0;
      B <= 1'b0;
      C <= 1'b0;
      #100;

      A <= 1'b0;
      B <= 1'b0;
      C <= 1'b1;
      #100;

      A <= 1'b0;
      B <= 1'b1;
      C <= 1'b0;
      #100;

      A <= 1'b0;
      B <= 1'b1;
      C <= 1'b1;
      #100;

      A <= 1'b1;
      B <= 1'b0;
      C <= 1'b0;
      #100;

      A <= 1'b1;
      B <= 1'b0;
      C <= 1'b1;
      #100;

      A <= 1'b1;
      B <= 1'b1;
      C <= 1'b0;
      #100;

      A <= 1'b1;
      B <= 1'b1;
      C <= 1'b1;
      #100;
      $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

endmodule