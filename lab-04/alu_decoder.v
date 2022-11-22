module alu_decoder(AlUOp, func3, op_5, func7_5, ALUControl,cont);

    input[1:0] ALUOp;
    input[2:0] func3;
    input op_5,func7_5;
    wire[1:0] cont;
    output[2:0] ALUControl

    assign cont = {op_5,func7_5};

    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                        (AlUOp == 2'b01) ? 3'b001 :
                        ((AlUOp == 2'b10) & (func3 == 3'b000) & (cont == 2'b11))? 3'b001 :
                        ((AlUOp == 2'b10) & (func3 == 3'b000) & (cont != 2'b11))? 3'b000 :
                        ((AlUOp == 2'b10) & (func3 == 3'b010)) ? 3'b101 :
                        ((AlUOp == 2'b10) & (func3 == 3'b110)) ? 3'b011 :
                        ((AlUOp == 2'b10) & (func3 == 3'b111)) ? 3'b010 : 3'b000;





    



endmodule