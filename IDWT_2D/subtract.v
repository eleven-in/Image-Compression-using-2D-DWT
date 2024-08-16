module subtract(input clk, input [7:0]p1, input [7:0]p2, output reg [7:0]pout);


//Declaration of intermediate wires
wire [8:0] outp;
wire [7:0]p1_intermediate;

assign p1_intermediate = ~p1[7:0]+1'b1;

assign outp = p2[7:0] + p1_intermediate;

always@(posedge clk)
	begin
		pout = outp[7:0];
	end
endmodule