`timescale 1 ps/ 1 ps
module DWT_vlg_tst();
reg clk;
reg [63:0] inp1;
reg [63:0] inp2;
reg [63:0] inp3;
reg [63:0] inp4;
reg [63:0] inp5;
reg [63:0] inp6;
reg [63:0] inp7;
reg [63:0] inp8;                                              
wire [63:0]  outp1;
wire [63:0]  outp2;
wire [63:0]  outp3;
wire [63:0]  outp4;
wire [63:0]  outp5;
wire [63:0]  outp6;
wire [63:0]  outp7;
wire [63:0]  outp8;
                        
DWT i1 (
	.clk(clk),
	.inp1(inp1),
	.inp2(inp2),
	.inp3(inp3),
	.inp4(inp4),
	.inp5(inp5),
	.inp6(inp6),
	.inp7(inp7),
	.inp8(inp8),
	.outp1(outp1),
	.outp2(outp2),
	.outp3(outp3),
	.outp4(outp4),
	.outp5(outp5),
	.outp6(outp6),
	.outp7(outp7),
	.outp8(outp8)
);
initial                                                
	begin                                                  
      clk = 1'b0;
		inp1 = 64'h20302C620262C616;
		inp2 = 64'h20302C620262C616;
		inp3 = 64'h1602026202020202;
		inp4 = 64'h202620262026201A;
		inp5 = 64'h812026201A201A20;
		inp6 = 64'h1922026201A7A201;
		inp7 = 64'h192201A201A201A2;
		inp8 = 64'h192201E201A201A1;
		$display("Running testbench");                       
	end                                                    
always                                                                 
	begin                                                  
		#5 clk = ~clk;
	end                                                    
endmodule

