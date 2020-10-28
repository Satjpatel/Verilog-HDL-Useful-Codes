//FSM Prob
//Start time - 11:10 

//Module declaration and defination 
module FSM ( 
	input KEY0, //Clock 
	input SW0, SW1, SW2, SW3, SW4, // Switches to control state transitions 
	output reg [2:0] State, //State of the FSM 
	output reg [1:0] Z  //Z is the output of that particular state of FSM 
		) ; 
		
//State Encoding 
localparam State_0 = 3'd0 , 
			State_1 = 3'd1 , 
			State_2 = 3'd2 , 
			State_3 = 3'd3 , 
			State_4 = 3'd4 ; 
			

//State registers 
//reg [2:0] PS ; //Contains present state 
reg [2:0] NS ; //Contains next state 

//State Transtition Block 
always @ (posedge KEY0) 
	begin 
		if (SW0) 
			State <= State_0 ; 
		else 
			State <= NS ; 
	end 
	

//State Relation Block 
always @ (*) 
	begin 
		NS = State ; 
		case(State)
		State_0: begin 
					if(SW2) 
						NS = State_1 ; 
					else if(SW1) 
						NS = State_3; 
					else 
						NS = State ; 
				end 
		
		State_1: begin 
					if(SW1) 
						NS = State_2 ; 
					else 
						NS = State ; 
				end 
		
		State_2: begin 
					if(SW1) 
						NS = State_1 ; 
					else if(SW4) 
						NS = State_3 ; 
					else 
						NS = State ; 
				 end 
		State_3 : begin 
					if(SW1) 
						NS = State_1 ; 
					else if(SW3) 
						NS = State_4 ; 
					else 
						NS = State ; 
				 end 
		State_4:  begin 
					if(SW0) 
						NS = State_0 ; 
					else if(SW1) 
						NS = State_1 ; 
					else 
					    NS = State ; 
				end 
		default: begin 
					NS = State ; 
				 end 
				 
		endcase 
		
	end 
	
//Outputs -- 2 bit 'Z' 
always @ (*) 
begin 
	case(State) 
	3'd0 : Z = 2'b01 ; 
	3'd1 : Z = 2'b10 ; 
	3'd2 : Z = 2'b00 ; 
	3'd3 : Z = 2'b00 ; 
	3'd4 : Z = 2'b11 ; 
	default: Z = 2'b00 ; //Default Value 
	endcase 
end  

endmodule 




		 
					
