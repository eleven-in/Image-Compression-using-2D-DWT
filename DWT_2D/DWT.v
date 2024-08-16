module DWT(clk, inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8, outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8,dwt_valid);
input clk;
input [63:0]inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8;
output [63:0] outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8;
output dwt_valid;
wire [63:0] inp_1d [7:0];
wire [63:0] out_1d [7:0];
wire dwt_valid1, dwt_valid2, dwt_valid3, dwt_valid4;

assign inp_1d [0] = inp1;
assign inp_1d [1] = inp2;
assign inp_1d [2] = inp3;
assign inp_1d [3] = inp4;
assign inp_1d [4] = inp5;
assign inp_1d [5] = inp6;
assign inp_1d [6] = inp7;
assign inp_1d [7] = inp8;
genvar j;
	generate 
		for(j=0;j<8;j=j+1) 
		begin : name
			wavelet_1d u0(clk,inp_1d[j],out_1d[j]);
		end
	endgenerate 

// Colomn processing 2D

wavelet_2d x1 (clk, out_1d[0],out_1d[1],outp1,outp5);
wavelet_2d x2 (clk, out_1d[2],out_1d[3],outp2,outp6);
wavelet_2d x3 (clk, out_1d[4],out_1d[5],outp3,outp7);
wavelet_2d x4 (clk, out_1d[6],out_1d[7],outp4,outp8);

assign dwt_valid = dwt_valid1 && dwt_valid2 && dwt_valid3 && dwt_valid4;

endmodule
