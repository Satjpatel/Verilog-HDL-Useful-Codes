module GCD_datapath ( 
input ldA, ldB, sel1, sel2, sel_in , 
input [3:0] data_in , 
input clk, 
output lt, gt, eq ) ; 

wire [3:0] Aout, Bout, X, Y, Bus, SubOut ; 

mux_2IsTo1 mux_loader ( Bus, sel_in, data_in, SubOut ) ; 
PIPO A ( Aout, Bus, ldA, clk ) ; 
PIPO B ( Bout, Bus, ldA, clk ) ;
mux_2IsTo1 mux1 ( X, sel1, Aout, Bout ) ; 
mux_2IsTo1 mux2 ( Y, sel2, Aout, Bout ) ;
comparator campu ( Aout, Bout , lt, gt, eq ) ; 
subtractor sabu ( X, Y, SubOut ) ; 

endmodule 

//2:1 Mux 
module mux_2IsTo1 ( 
	output [3:0] out , 
	input sel, 
	input [3:0] Data1, 
	input [3:0] Data2 ) ; 
	
	assign out = sel ? Data2 : Data1 ; 
endmodule 
	
// Comparator 
module comparator ( 
	input [3:0] Data1, 
	input [3:0] Data2, 
	output lt, gt, eq ) ; 
	
	assign lt = (Data1 < Data2) ; 
	assign gt = (Data1 > Data2) ; 
	assign eq = (Data1 == Data2) ; 
			
endmodule 

//Subtractor 
module subtractor ( 
input [3:0] Data1 , 
input [3:0] Data2 ,
output reg [3:0] SubOut ) ; 

always @ (*) 
	SubOut <= (Data1 - Data2) ; 

endmodule 
  
	
	
//Parallel In Parallel Out 
module PIPO ( 
output reg [3:0] dout, 
input [3:0] din, 
input ld, clk ) ; 

always @ ( posedge clk) 
	if(ld) 
		dout <= din ; 

endmodule 
