module wavelet_1d (clk ,pixel ,pix_out,idwt_valid);
input clk ;
input [63:0] pixel ;
output reg [63:0] pix_out;
output reg idwt_valid;
wire [63:0]pix_out_inter;
wire [63:0] out_illusion ;
genvar i;
	generate 
		for(i=0;i<4;i=i+1) 
		begin : name
			sum u0 (clk,pixel[8*i+7:8*i], pixel[8*i+39:8*i+32],out_illusion[16*i+7:16*i]);
			subtract u1 (clk,pixel[8*i+7:8*i], pixel[8*i+39:8*i+32],out_illusion[16*i+15:16*i+8]);
		end
	endgenerate 
	assign pix_out_inter = {out_illusion[31:0],out_illusion[63:32]};
	
always@(posedge clk)
	begin
		pix_out = pix_out_inter;
		idwt_valid = 1'b1;
	end
	
endmodule
