module tb_DivideBy2 ; 

reg clk_in = 0 ; 
wire clk_out ; 

DivideBy2 dut (clk_in, clk_out) ; 


always 
	begin 
		#10 clk_in = ~clk_in ; 
	end 

initial
begin 
	
	$dumpfile("By2.vcd") ; 
	$dumpvars(0, tb_DivideBy2) ;
	#2000 $finish ;  
end 

endmodule 
	
