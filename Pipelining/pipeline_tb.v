module pipeline_tb ; 
parameter N = 10 ; 
wire [N-1:0] F ; //Main module ka output hamesha wire 
reg [N-1:0] A, B, C, D ; //Main module ke inputs hamesha reg
reg clk ; 


//F = ( A + B + C - D ) * D 
pipeline MyPipeDUT ( F, A, B, C, D, clk ) ; 

initial 
	clk = 0 ; 	

always 
	#10 clk = ~clk ; 
	
initial 
	#200 $finish ; 
	
initial 
	begin 
		#10
			A = 0 ; 
			B = 0 ; 
			C = 0 ; 
			D = 0 ; //F = 0
		
		#20
			A = 1 ; 
			B = 2 ; 
			C = 3 ; 
			D = 4 ; // F = 8 
		#20 
			A = 0 ; 
			B = 3 ; 
			C = 5 ; 
			D = 2 ; // F = 12
		#20 
			A = 1 ; 
			B = 0 ; 
			C = 1 ; 
			D = 1 ; // F = 1 
        #20 
			A = 2 ; 
			B = 2 ; 
			C = 2 ; 
			D = 2 ; // F = 8 
		
		
			
	end 

initial 
	begin 
		$dumpfile("pipe1.vcd") ; 
		$dumpvars(0, pipeline_tb ) ; //Dumping all the variables of pipeline_tb 
		$monitor("Time #  %d , F = %d ", $time, F ) ; 
	end 
	

endmodule 
