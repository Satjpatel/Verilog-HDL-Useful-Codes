
module PWM ( 
	input clk , 
	output signal ) ; 
	
reg [7:0] counter ; 


initial 
	begin 
		counter <= 0 ; 
	end 
	
always @ ( posedge clk ) 
	begin 
		
		if(counter < 100 ) 
			counter <= counter + 1'b1 ; 
		else 
			counter <= 1'b0 ; 
	
	end 
	
//Assuming we need a 40 percent duty cycle 

assign signal = ( counter < 20 ) ? 1'b1 : 1'b0 ; 

endmodule 
