`timescale 1 ps/ 1 ps
module wavelet_2d_vlg_tst();
reg clk;
reg [63:0] pixel_out1;
reg [63:0] pixel_out2;                                               
wire [0:63]  pixelcol_out1;
wire [0:63]  pixelcol_out2;
                         
wavelet_2d i1 ( 
	.clk(clk),
	.pixel_out1(pixel_out1),
	.pixel_out2(pixel_out2),
	.pixelcol_out1(pixelcol_out1),
	.pixelcol_out2(pixelcol_out2)
);
initial                                                
	begin   
		clk = 1'b0;
		pixel_out1 = 64'h 403E3D454749494A;
		pixel_out2 = 64'h 3C373A3B3E404A4C;
		$display("Running testbench");                       
	end                                                    
always                 
	begin                                                                                                      
		 #5 clk = ~clk;                                           
	end                                                    
endmodule

