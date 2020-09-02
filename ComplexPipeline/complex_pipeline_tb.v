module complex_pipeline_tb ; 

wire [15:0] Z ; 
reg [3:0] rs1, rs2, rd, func ; 
reg [7:0] addr ; 
reg clk1, clk2 ; 
integer k ; 

complex_pipeline DUT (Z, rs1, rs2, rd, func, addr, clk1, clk2 ) ; 

initial 
	begin 
		clk1 = 0 ; 
		clk2 = 0 ; 
		
		repeat(20) //Generating two-phase clock 
			begin 
				#5 clk1 = 1 ; 
				#5 clk1 = 0 ; 
				#5 clk2 = 1 ; 
				#5 clk2 = 0 ; 
			end 
	end 
	
initial 
	for(k = 0 ; k < 16 ; k = k + 1) 
		DUT.regbank[k] = k ;  //Initializine registers 

initial 
	begin 
		#5 rs1 = 3 ; 
		rs2 = 5 ; 
		rd = 10 ; 
		func = 0 ;  //Addition 
		addr = 125 ; 

		#20 rs1 = 3 ; 
		rs2 = 8 ; 
		rd = 12 ; 
		func = 2 ; //Multiplication 
		addr = 126 ; 
		
		#20 rs1 = 10; 
		rs2 = 5 ; 
		rd = 14 ; 
		func = 1 ; //Subtraction 
		addr = 128 ; 
		
		#20 rs1 = 7 ; 
		rs2 = 3 ; 
		rd = 13 ; 
		func = 11 ; 
		addr = 127 ; 
		
		#60 for ( k = 125 ; k < 131 ; k = k + 1 ) 
			begin 
			$display ("Mem[%3d] = %3d", k, DUT.mem[k] ) ; 
			end 
			
	end
	
initial 
	begin 
	$dumpfile("WaveformFile.vcd") ; 
	$dumpvars(0, complex_pipeline_tb) ; 
	$monitor("Time # %d, F = %d", $time, Z ) ; 
	end 
	
endmodule 

 
