////////////////////////////////////////////////////////////////////////////////
//					2 Bit Comparator                                          //

//  Designed by:  @Sat_J_Patel
//
//////////////////////////////////////////////////////////////////////////////
// 
  	                                            		
module Comparator2( A , B , Equals ) ; 
   input[1:0] A, B ; 
   output reg Equals ; 

                             	
// student code here
always @ ( A , B ) 

begin 

Equals = (~( A[1]^B[1]))&(~(A[0]^B[0])); 

end 

endmodule // Comparator2 




    
