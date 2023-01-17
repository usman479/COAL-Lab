module mux(inp1,inp2,sig,ot);

    input [31:0] inp1,inp2;
    input sig;
    output [31:0] ot;

    assign ot = (sig == 1'b0) ? inp1 : inp2;

endmodule