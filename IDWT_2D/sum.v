module sum(input clk, input [7:0]p1, input [7:0]p2, output reg [7:0]pout);


//Declaration of intermediate wires
wire [7:0] outp;
wire carry;

assign {carry,outp} = p1[7:0] + p2[7:0];

always@(posedge clk)
	begin
		pout = outp[7:0];
	end
	
endmodule