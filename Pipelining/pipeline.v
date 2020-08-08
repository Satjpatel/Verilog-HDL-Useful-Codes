//Pipeline experimentation 
//Implementing a simple function 

//Step 1 : x1 = A + B , x2 = C - D 
//Step 2 : x3 = x1 + x2 
//Step 3 : F = x3*D 

module pipeline ( F, A, B, C, D, clk ) ; 

parameter N = 10 ; //Keep this habbit of always using parameters 

output [N-1:0] F ; 
input [N-1:0] A, B, C, D ; 
input clk ; 

//Stage 1 
reg [N-1:0] L12_x1, L12_x2, L12_D ; 

always @ (posedge clk ) 
	begin 
		L12_x1 <= A + B ; 
		L12_x2 <= C - D ; 
		L12_D <= D ; 
	end 
	
//Stage 2
reg [N-1:0] L23_x3 , L23_D ; 

always @ ( posedge clk ) 
	begin 
		L23_x3 <= L12_x1 + L12_x2 ; 
		L23_D <=  L12_D ; 
	end 
	
//Stage 3 
reg [N-1:0] F_Out ; 
always @ ( posedge clk ) 
	F_Out <= L23_x3 * L23_D ; 
	
assign F = F_Out ; 

endmodule 
