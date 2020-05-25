// 4 Bit adder      		

module FullAdd4( A,B,Cin,Sum,Cout);                	
    input [3:0] A, B;
    input Cin; 			
    output [3:0] Sum;
    output Cout;

                   	          	
// Apna Code idhar hai 
	wire c0 , c1 , c2 ; // Intermediate Carry 
	
	FA fa1 ( A[0] , B[0] , Cin , Sum[0] , c0 ) ; 
	FA fa2 ( A[1] , B[1] , c0 , Sum[1] , c1 ) ; 
	FA fa3 ( A[2] , B[2] , c1 , Sum[2] , c2 ) ; 
	FA fa4 ( A[3] , B[3] , c2 , Sum[3] , Cout ) ; 


endmodule // Majority  


//One bit adder defined here, which is to be used bitwise on the 4 bit Adder Application 
module FA ( A, B, Cin , Sum , Cout ) ; 
	input  A , B , Cin ; 
	output Sum, Cout ; 
	assign Sum = A^B^Cin  ; 
	assign Cout =  ( Cin&(A^B) | (A&B) ) ; 
endmodule 


    
