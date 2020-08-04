//Benefits of a parameter 

module main() ; 


//If parameter is not given, the default (8) is assumed
	mux2 i_mux (d0, d1, s, out) ; 
//The same module with 12-bit bus width 
	mux2 #(12) i_mux_b (d0, d1, s, out) ; 
//A more verbose version 
	mux2 #(.width(12)) i_mux_c (.d0(d0),.d1(d1),.s(s),.y(out)) ; 


endmodule 


module mux2 
#(parameter width = 8) //name and default value 
( 
	input [width-1:0] d0 , d1 , 
	input s, 
	output [width-1:0] y 
) ; 

assign y = s ? d1 : d0 ; 

endmodule 	
