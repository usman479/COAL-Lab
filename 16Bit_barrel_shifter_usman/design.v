`include "mux.v"

module barrel(A,C,O);

    input[15:0] A;
    input[3:0] C;
    output[15:0] O;
    wire [15:0] x,y,z;

    //8bit shift right
    mux mux_15(A[15], A[7], C[3], x[15]);
    mux mux_14(A[14], A[6], C[3], x[14]);
    mux mux_13(A[13], A[5], C[3], x[13]);
    mux mux_12(A[12], A[4], C[3], x[12]);
    mux mux_11(A[11], A[3], C[3], x[11]);
    mux mux_10(A[10], A[2], C[3], x[10]);
    mux mux_9(A[9], A[1], C[3], x[9]);
    mux mux_8(A[8], A[0], C[3], x[8]);
    mux mux_7(A[7], A[15], C[3], x[7]);
    mux mux_6(A[6], A[14], C[3], x[6]);
    mux mux_5(A[5], A[13], C[3], x[5]);
    mux mux_4(A[4] ,A[12], C[3], x[4]);
    mux mux_3(A[3], A[11], C[3], x[3]);
    mux mux_2(A[2], A[10], C[3], x[2]);
    mux mux_1(A[1], A[9], C[3], x[1]);
    mux mux_0(A[0], A[8], C[3], x[0]);

    //4bit shift right
    mux mux_31(x[15],A[3],C[2],y[15]);
    mux mux_30(x[14],A[2],C[2],y[14]);
    mux mux_29(x[13],A[1],C[2],y[13]);
    mux mux_28(x[12],A[0],C[2],y[12]);
    mux mux_27(x[11],x[15],C[2],y[11]);
    mux mux_26(x[10],x[14],C[2],y[10]);
    mux mux_25(x[9],x[13],C[2],y[9]);
    mux mux_24(x[8],x[12],C[2],y[8]);
    mux mux_23(x[7],x[11],C[2],y[7]);
    mux mux_22(x[6],x[10],C[2],y[6]);
    mux mux_21(x[5],x[9],C[2],y[5]);
    mux mux_20(x[4],x[8],C[2],y[4]);
    mux mux_19(x[3],x[7],C[2],y[3]);
    mux mux_18(x[2],x[6],C[2],y[2]);
    mux mux_17(x[1],x[5],C[2],y[1]);
    mux mux_16(x[0],x[4],C[2],y[0]);

    //2bit shift right
    mux mux_47(y[15],A[1],C[1],z[15]);
    mux mux_46(y[14],A[0],C[1],z[14]);
    mux mux_45(y[13],y[15],C[1],z[13]);
    mux mux_44(y[12],y[14],C[1],z[12]);
    mux mux_43(y[11],y[13],C[1],z[11]);
    mux mux_42(y[10],y[12],C[1],z[10]);
    mux mux_41(y[9],y[11],C[1],z[9]);
    mux mux_40(y[8],y[10],C[1],z[8]);
    mux mux_39(y[7],y[9],C[1],z[7]);
    mux mux_38(y[6],y[8],C[1],z[6]);
    mux mux_37(y[5],y[7],C[1],z[5]);
    mux mux_36(y[4],y[6],C[1],z[4]);
    mux mux_35(y[3],y[5],C[1],z[3]);
    mux mux_34(y[2],y[4],C[1],z[2]);
    mux mux_33(y[1],y[3],C[1],z[1]);
    mux mux_32(y[0],y[2],C[1],z[0]);

    //1bit shift right
    mux mux_63(z[15],A[0],C[0],O[15]);
    mux mux_62(z[14],z[15],C[0],O[14]);
    mux mux_61(z[13],z[14],C[0],O[13]);
    mux mux_60(z[12],z[13],C[0],O[12]);
    mux mux_59(z[11],z[12],C[0],O[11]);
    mux mux_58(z[10],z[11],C[0],O[10]);
    mux mux_57(z[9],z[10],C[0],O[9]);
    mux mux_56(z[8],z[9],C[0],O[8]);
    mux mux_55(z[7],z[8],C[0],O[7]);
    mux mux_54(z[6],z[7],C[0],O[6]);
    mux mux_53(z[5],z[6],C[0],O[5]);
    mux mux_52(z[4],z[5],C[0],O[4]);
    mux mux_51(z[3],z[4],C[0],O[3]);
    mux mux_50(z[2],z[3],C[0],O[2]);
    mux mux_49(z[1],z[2],C[0],O[1]);
    mux mux_48(z[0],z[1],C[0],O[0]);

endmodule