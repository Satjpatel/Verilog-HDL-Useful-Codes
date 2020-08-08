module RAM_tb ; 

reg [9:0] address ; 
wire [7:0] data_out ; 
reg [7:0] data_in ; 
reg write, select ; 
integer k ; 

ram DUT ( data_out, data_in, address , write , select ) ; 

initial 
	begin 
		for ( k = 0 ; k < 1024 ; k++ ) 
			begin 
				data_in = (k+k) % 256 ; 
				address = k ; 
				write = 1 ;
				select = 1 ; 
			#2 write = 0 ; 
				select = 0 ; 
			end 
		repeat(20) 
			begin 
			#2 address = $random % 1024 ; 
			write = 0 ; 
			select = 1 ; 
			$display ("Address: %5d, Data: %4d", address, data_out ) ; 
			end 
	end 

endmodule 
			
