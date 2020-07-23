// Testing 4:2 compressor 

	module compres_4to2 ( 
		input A, B, C, D , 
		input C_IN , 
		output SUM, 
		output C_OUT_ext , 
		output C_OUT_int ) ; 

	wire internal_sum ; 
	
	FullAdder fa_upper ( .a(A) , .b(B) , .c(C) , .cout(C_OUT_ext) , .sum(internal_sum) ) ; 
	FullAdder fa_lower ( .a(C_IN) , .b(internal_sum) , .c(D) , .cout(C_OUT_int) , .sum(SUM) ) ; 
	
	


	endmodule 
	
	
	
	module FullAdder ( 
		input a, b, cin , 
		output cout , sum ) ; 
	
	assign { cout , sum } = a + b + cin ; 
	
	endmodule 