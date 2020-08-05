module 3:2compressor ( 
	input A, 
	input B, 
	input C, 
	output S, 
	output Cy ) ; 
	
assign S = A ^ B ^ C ; 
assign Cy = (A & B) | (B & C) | (C & A) ; 

endmodule 

