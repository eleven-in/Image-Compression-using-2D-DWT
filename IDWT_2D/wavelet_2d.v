module wavelet_2d (clk ,pixel_out1, pixel_out2 ,pixelcol_out1,pixelcol_out2);
input clk ;
input [63:0] pixel_out1, pixel_out2 ;
output reg [63:0] pixelcol_out1,pixelcol_out2;
wire [63:0]pixelcol1_inter,pixelcol2_inter;
wire [63:0] out_illusion20;
wire [63:0] out_illusion21;
genvar j;
	generate 
		for(j=0;j<8;j=j+1) 
		begin : name
			sum u0 (clk,pixel_out1[8*j+7:8*j], pixel_out2[8*j+7:8*j],out_illusion20[8*j+7:8*j]);
			subtract u1 (clk,pixel_out2[8*j+7:8*j],pixel_out1[8*j+7:8*j],out_illusion21[8*j+7:8*j]);
		end
	endgenerate 
	assign pixelcol1_inter = out_illusion20;
	assign pixelcol2_inter = out_illusion21;
	
always@(posedge clk)
	begin
		pixelcol_out1 = pixelcol1_inter;
		pixelcol_out2 = pixelcol2_inter;
	end
endmodule
