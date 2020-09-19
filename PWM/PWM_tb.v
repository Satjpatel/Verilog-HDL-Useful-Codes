module PWM_tb ; 

reg clk = 0 ; 
wire signal ; 

PWM DUT ( clk, signal ) ; 



always
		begin 
		#5 clk = ~ clk ; 
	end 

initial 
	begin 
   
   	$dumpfile("PWM_waveform.vcd") ; 
	$dumpvars(0, PWM_tb) ; 
	#5000 $finish ; 
	
	end 

endmodule 
