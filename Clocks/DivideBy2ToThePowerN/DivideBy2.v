//Divide by 2^N 
module DivideBy2 ( 
	input clk_in, 
 
	output clk_out) ; 

integer c = 31 ; //c = 2^N - 1
	
//Assuming the native clock frequency is 50 MHz 

parameter N = 5 ; //Divide the Frequency by 10; 



reg [N-1:0] counter = 0 ; 

always @ ( posedge clk_in ) 
	begin 
			if(counter <= c ) 
					counter = counter + 1 ; 
			else 
				counter = 0 ;
		
	end 

assign clk_out = counter[N-1] ; 

endmodule 
