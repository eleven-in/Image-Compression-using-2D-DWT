`define NUM_BLOCKS 1024
module IDWT_test();

//Declaration ofinputs as reg
reg clk;
reg [63:0]inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8;

//Declaration of outputs as wire
wire [63:0] outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8;
wire idwt_valid;

//Declaration of other signals
integer i ; 
integer fp1 ;  
reg [63:0] mem [8191:0] ;  
//reg [12:0] mem_addr ;

//Module instantiation
IDWT d1(.clk(clk),
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
		 .outp8(outp8),
		 .idwt_valid(idwt_valid));
		 
//initial block
initial 
	begin 
		$readmemh("dwtq.hex", mem);  
		clk = 1'b0;
		i = 0 ;
		#46 fp1 = $fopen ("idwtq.hex","w");
		#1000000 
		$fclose(fp1) ; 
		$stop ;
	end
	
always #5 clk = ~clk;

always@(posedge clk)
	begin
		if (i<1024)
			begin
				inp1 = mem[8*i];
				inp2 = mem[8*i+1];
				inp3 = mem[8*i+2];
				inp4 = mem[8*i+3];
				inp5 = mem[8*i+4];
				inp6 = mem[8*i+5];
				inp7 = mem[8*i+6];
				inp8 = mem[8*i+7];
			end
		 i = i+1;
	end
	
always@(posedge clk)
	begin
		if(i==`NUM_BLOCKS+6)
			begin
					$fclose(fp1);
					#100;
					$stop;
			end
	end

always@(posedge clk)
	begin
		if (idwt_valid==1'b1)
			begin
			 $fdisplayh(fp1,outp1);
			 $fdisplayh(fp1,outp2);
			 $fdisplayh(fp1,outp3);
			 $fdisplayh(fp1,outp4);
			 $fdisplayh(fp1,outp5);
			 $fdisplayh(fp1,outp6);
			 $fdisplayh(fp1,outp7);
			 $fdisplayh(fp1,outp8);
			end
	end
	
endmodule
		
	