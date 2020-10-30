//Writing a debouncer circuit for the FSM, but not using it, as mentioned in the question

module Debouncer ( 
	input KEY0 , //Clock 
	input [4:0] SW , 
	output [4:0] Debounced_SW ) ; 
	

//Main Code 
//My board had an internal Oscilator of maximum 50 MHz, 
//giving a clock period of 20 nanoseconds 
//Here I am assuming that debouncing can be avoided if we use give a 
// 10 miliseconds window between the transition. That would give me 
//2,00,000 counts on my osccilator, hence a counter of log2(200000) = 17.609
//which means an 18 bit counter would do. 

reg [4:0] Stable_State = 5'b00000 ; //Internal state to compare with the debouncing one
reg [17:0] Counter_for_Debouncing = 18'd0 ; 

always @ (posedge KEY0) 
	begin 
		if(Stable_State != SW && Counter_for_Debouncing < 200000 ) //200000 is the debouncing limit 
			begin 
				Counter_for_Debouncing <= Counter_for_Debouncing + 1 ; 
			end 
		
		else if ( Counter_for_Debouncing == 200000 ) //After this limit, whatever the state the switch is in, is the final stage 
		
			begin 
				Stable_State <= SW ; 
				Counter_for_Debouncing <= 0 ;
			end 
		
		else 
				Counter_for_Debouncing <= 0 ; 

	end 
	
	
assign Debounced_SW = Stable_State ; 

endmodule 
