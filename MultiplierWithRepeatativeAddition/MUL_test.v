module MUL_test ; 

	reg [15:0] data_in ; 
	reg clk, start ; 
	wire done ; 
	
	//Initializing Device Under Test 
	
	MUL_datapath DP ( ldA, ldB, ldP, clrP, decB, clk, data_in, eqz) ; 
	controller CON ( ldA, ldB, ldP, clrP, decB, done, clk, eqz, start ) ; 
	
	initial 
		begin 
			clk = 1'b0 ; 
			#3 start = 1'b1 ; 
			#500 $finish ; 
		end 
		
	always @ (*) 
		#5 clk = ~clk ; 
		
	initial 
		begin 
			#17 data_in = 17 ; 
			data_in = 5 ; 
		end 
		
	initial 
		begin 
			$monitor ($time, " %d %b ", DP.Y, done ) ; 
			$dumpfile ("mul.vcd") ; 
			$dumpvars ( 0, MUL_test ) ; 
		end 

endmodule 

 
			
