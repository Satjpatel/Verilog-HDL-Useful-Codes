//Verilog ALU 

module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y
);

 
always @ (A or B or Op_code) 
	begin 
		case(Op_code) 
		
		3'b000 : Y = A; 
		
		3'b001 : Y = A + B ; 
	
		3'b010 : Y = A - B ; 
		
		3'b011 : Y = A & B ; 
		
		3'b100 : Y = A | B ; 
		
		3'b101 : Y = (A+1) ; 
		
		3'b110 : Y = (A-1) ; 
		
		3'b111 : Y = B ; 
		
		default : Y = A ; 
		
		endcase 
	end 
	
endmodule 