//Datapath for Booth Multiplier - 8x8 

module BoothMultiplier_datapath ( 
	output reg qZero , 
	output reg qm1 , 
	output eqz , 
	input ldA, shiftA, 
	input ldM, shiftQ,
	input clrff, 
	input add_or_sub_bar, 
	input clk,
	input Data_In ) ; 
	
wire [7:0] A = 8'h00 ; 
reg [7:0] Q = 8'h00 ; 
reg [7:0] M = 8'h00 ; 
wire [7:0] Z = 8'b00 ; 

PIPO M ( M, Data_In, ldM, clk ) ; 
PIPO Q ( Q, Data_In, ldQ, clk ) ; 
dff Q_minus1 ( qm1, , clk, clrff ) ; //Still remaining 
shifter ForA (   //Pending 
shifter ForQ // Pending 
ALU AluPart ( Z, A, M, add_or_sub_bar ) ; //Done 



assign qZero = Q[0] ; 

endmodule 



//Counter - 6 bit 
module counter ( 
output reg [3:0] data_out , 
input dcr, 
input ldcount, 
input clk ) ; 

always @ ( posedge clk ) 
	begin 
		if(ldcount) 
			begin 
				data_out <= 3'b110 ; 
			end 
		else if(dcr) 
			begin 
				data_out <= data_out - 3'b001 ; 
			end 
	end 
endmodule 
				


//Parallel In Parallel Out 
module PIPO ( 
output reg [7:0] dout, 
input [7:0] din, 
input ld, clk ) ; 

always @ ( posedge clk) 
begin 
	if(ld) 
		dout <= din ; 
end 
endmodule 



//ALU 
module ALU ( 
	output reg [7:0] data_out , 
	input [7:0] Data1, 
	input [7:0] Data2, 
	input add_or_sub_bar ,
	input clk ) ; 
	
always @ (posedge clk ) 
begin 
 data_out <= add_or_sub_bar ? ( Data1 + Data2 ) : ( Data1 - Data2) ; 
end 
endmodule 

//1 bit shifter 
module shifter ( 
	output reg [7:0] data_out , 
	input [7:0] data_in, 
	input s_in,
	input ld,
	input clk ) ; 

always @ ( posedge clk ) 
begin 
	if(ld) 
		data_out <= data_in ; 
	else 
		data_out = { s_in, data_in[7:1] } ; 
end 
endmodule 

//D flipflop 

module dff ( 
output reg q, 
input d, clk, clr ) ; 

always @ ( posedge clk ) 
begin 
	if(clr) 
		q <= 0 ; 
	else 
		q <= d ; 

end 
endmodule 
