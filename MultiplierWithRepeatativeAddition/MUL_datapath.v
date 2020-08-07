module MUL_datapath ( 
	input ldA, ldB, ldP, clrP, decB, clk , 
	input [15:0] data_in , 
	output eqz ) ; 
	
wire [15:0] X, Y, Z, Bout, Bus ; 

	PIPO1 A (X, Bus, ldA, clk) ; 
	PIPO2 P (Y, Z, ldP, clrP, clk) ; 
	Counter B ( Bout, Bus, ldB, decB, clk) ; 
	ADD AD ( Z, X, Y) ; 
	EQZ COMP (eqz, Bout) ; 

endmodule 

//Parallel In Parallel Out 
module PIPO1 ( 
output reg [15:0] dout, 
input [15:0] din, 
input ld, clk ) ; 

always @ ( posedge clk) 
	if(ld) 
		dout <= din ; 

endmodule 

module PIPO2 ( 
output reg [15:0] dout, 
input [15:0] din, 
input ld, clr, clk ) ; 

always @ ( posedge clk ) 
	if(clr) 
		dout <= 16'b0 ; 
	else if (ld) 
		dout <= din ; 
endmodule 

//Adder 
module ADD ( 
output reg [15:0] out , 
input [15:0] in1, in2 ) ; 

always @ (*) 
	out = in1 + in2 ; 

endmodule 

//Comparator 
module EQZ ( 
	output eqz , 
	input [15:0] data ) ; 

assign eqz = ( data == 0 ) ; 

endmodule 


//Counter 

module Counter ( dout, din, ld, dec, clk ) ; 
	input [15:0] din ; 
	input ld, dec, clk ; 
	output reg [15:0] dout ; 
	
	always @ ( posedge clk ) 
		if(ld) 
			dout <= din ; 
		else if(dec) 
			dout <= dout - 1 ; 
endmodule 

