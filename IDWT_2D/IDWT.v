module IDWT(clk, inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8, outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8,idwt_valid);
input clk;
input [63:0]inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8;
output [63:0] outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8;
output idwt_valid;
wire [63:0] inp_1d [7:0];
wire [63:0] out_1d [7:0];
wire idwt_valid1, idwt_valid2, idwt_valid3, idwt_valid4, idwt_valid5, idwt_valid6, idwt_valid7, idwt_valid8;

assign inp_1d [0] = inp1;
assign inp_1d [1] = inp2;
assign inp_1d [2] = inp3;
assign inp_1d [3] = inp4;
assign inp_1d [4] = inp5;
assign inp_1d [5] = inp6;
assign inp_1d [6] = inp7;
assign inp_1d [7] = inp8;
genvar j;

//Inverse Colomn processing 2D
wavelet_2d x1 (clk, inp_1d[0], inp_1d[4], out_1d[0], out_1d[1]);
wavelet_2d x2 (clk, inp_1d[1], inp_1d[5], out_1d[2], out_1d[3]);
wavelet_2d x3 (clk, inp_1d[2], inp_1d[6], out_1d[4], out_1d[5]);
wavelet_2d x4 (clk, inp_1d[3], inp_1d[7], out_1d[6], out_1d[7]);

// Inverse Row Processing 1D
wavelet_1d u0(clk,out_1d[0],outp1,idwt_valid1);
wavelet_1d u1(clk,out_1d[1],outp2,idwt_valid2);
wavelet_1d u2(clk,out_1d[2],outp3,idwt_valid3);
wavelet_1d u3(clk,out_1d[3],outp4,idwt_valid4);
wavelet_1d u4(clk,out_1d[4],outp5,idwt_valid5);
wavelet_1d u5(clk,out_1d[5],outp6,idwt_valid6);
wavelet_1d u6(clk,out_1d[6],outp7,idwt_valid7);
wavelet_1d u7(clk,out_1d[7],outp8,idwt_valid8);


assign idwt_valid = idwt_valid1 && idwt_valid2 && idwt_valid3 && idwt_valid4 && idwt_valid5 && idwt_valid6 && idwt_valid7 && idwt_valid8;

endmodule
