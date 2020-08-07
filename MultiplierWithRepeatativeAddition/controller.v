module controller ( 
output reg ldA, ldB , ldP , clrP , decB, done, 
input clk, eqz, start ) ; 

reg [2:0] state ; 

parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100  ; 

always @ ( posedge clk ) 
	begin 
		case(state) 
		S0 : if(start) 
				state <= S1 ;  // Start 
		S1 : state <= S2 ;  // Data in in A 
		S2 : state <= S3 ;  // Data in in B, and initialize P 
		S3 : #2 if(eqz)     // P = Z and B = B - 1 
				state <= S4 ; 
		S4 : state <= S4 ;  
		default : state <= S0 ; 
		endcase 
	end 
	
	
always @ (state ) 
	begin 
		case(state) 
			S0 : begin 
				#1  ldA = 0 ; 
					ldB = 0 ; 
					ldP = 0 ; 
					clrP = 0 ; 
					decB = 0 ; 
				end 
			S1 : begin 
				#1 ldA = 1; 
				end 
			S2 : begin 
				#1 ldA = 0 ; 
					ldB = 1 ;
					clrP = 1; 
				end 
			S3 : begin 
				#1 ldB = 0 ; 
					ldP = 1 ; 
					clrP = 0 ; 
					decB = 1 ; 
				end 
			S4 : begin 
				#1 done = 1 ; 
					ldB = 0 ; 
					ldP = 0 ; 
					decB = 0 ; 
				end
				
			default: begin 
				#1 ldA = 0 ; 
					ldB = 0 ; 
					ldP = 0 ; 
					clrP = 0 ; 
					decB = 0 ; 
				end 
		endcase 
	end 
endmodule 
					
