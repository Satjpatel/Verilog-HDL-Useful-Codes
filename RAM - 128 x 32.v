module RAM128x32 
#(
  parameter Data_width = 32,  //# of bits in word
            Addr_width = 7  // # of address bits
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address, 
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );


reg[Data_width-1:0]FullMemorySpace[2**Addr_width - 1:0] ; 
//Making a memory chip which is 128 Words down, each word having 32 bits 

reg[Data_width-1:0]ConcernedWord ; 

always @ (posedge clk) 
begin 
	if(we) 
		FullMemorySpace[address] <= d ; 
		
		
		ConcernedWord <= FullMemorySpace[address] ; 
end 

assign q = ConcernedWord ; 

endmodule 