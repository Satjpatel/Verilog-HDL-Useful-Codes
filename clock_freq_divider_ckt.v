`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:58:56 06/28/2020 
// Design Name: 
// Module Name:    clock_freq_divider_ckt 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_freq_divider_ckt(
    input clk , //The input clock from FPGAs 
	input reset, //Global Reseter 
	output led ,  //Only output to blink 
	output [26:0] A     //Just to see how the frequency is getting divided 
    );

wire [26:0] din ; 
wire [26:0] clkdiv ; 

dff dff_inst0 (  
			.clk(clk) , 
			.rst(reset), //Because global reset 
			.D(din[0]) , 
			.Q(clkdiv[0]) 
					) ; 
genvar i ; 

generate 

for ( i = 1 ; i < 27 ; i = i + 1) 
	begin: dff_gen_label 
		dff dff_inst( 				//D_FF Instantiation for 27 times 
			.clk(clkdiv[i-1]) , 
			.rst(reset), //Because global reset 
			.D(din[i]) , 
			.Q(clkdiv[i]) 
					) ; 
	end 
	
	
endgenerate ; //Notice kar, idhar semi-colon aayega 
			//Baki kisi end<something> me nahi aata " ; "

assign din = ~clkdiv ; 
assign led = clkdiv[26] ; 
assign A = clkdiv ; 

endmodule

//D flip flop 
module dff ( 
	input D, 
	input clk, 
	input rst, 
	output reg Q         
	
	) ; 

always @(posedge clk or posedge rst) 
	begin 
		if(rst == 1) 
			Q<=1'b0 ; 
		else 
			Q<=D ; 
	end 
	

endmodule