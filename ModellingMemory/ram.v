module ram ( data_out , data_in, addr, wr, cs ) ; 

parameter ADDR_SIZE = 10, WORD_SIZE = 8 , MEMORY_SIZE = 1024 ; 

input [ADDR_SIZE - 1:0] addr ; 
input [WORD_SIZE - 1:0] data_in ; 
input wr ; 
input cs ;  
output [WORD_SIZE - 1:0] data_out ; 

reg [WORD_SIZE-1:0] mem [MEMORY_SIZE -1 :0] ; 

assign data_out = mem[addr] ; 

always @ (wr or cs) 
	if(wr) 
		mem[addr] = data_in ; 

tri [WORD_SIZE -1 :0] Bus ; 
assign Bus = !wr ? data_out : 8'hzz ; 
assign data_in = wr ? Bus : 8'hzz ; 

endmodule 
