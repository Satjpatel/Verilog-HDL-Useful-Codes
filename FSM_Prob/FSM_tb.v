module FSM_tb ; 


	reg KEY0 = 0;  //Clock 
	reg SW0, SW1, SW2, SW3, SW4 ;  // Switches to control state transitions 
	wire [2:0] State ; //State of the FSM 
	wire [1:0] Z ;  //Z is the output of that particular state of FSM 
	
FSM DUT ( KEY0, SW0, SW1, SW2, SW3, SW4, State, Z ) ; 

		
always 
	begin 
		#5 KEY0 = ~ KEY0 ; 
	 end 
	 

initial 
	#100 $finish ; 
	

initial 
	begin 
		#15 
		  SW0 = 1 ;  
		#10 
		   SW0 = 0 ; 
			SW2 = 1 ; 
		#10 
			SW2 = 0 ; 
			SW1 = 1 ; 
		#10 
		   SW1 = 1 ; 
		#10 
		   SW1 = 1 ; 
		#10 
			SW1 = 0 ; 
			SW4 = 1 ; 
		#10 
			SW4 = 0 ; 
		    SW3 = 1 ; 
		#10 
			SW3 = 0 ; 
		    SW1 = 1 ; 
		    
	end 
	
initial 
	begin 
		$dumpfile ("FSM_Dump.vcd") ; 
		$dumpvars (0, FSM_tb) ; 
		$monitor ("Time = %d, State = %3d ", $time, State) ; 
	end 
	
endmodule 


		
