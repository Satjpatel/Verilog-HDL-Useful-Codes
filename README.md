# Verilog-HDL-Useful-Codes
Useful Verilog HDL Codes which can be used in multiple design systems.

For Icarus Verilog, these are some useful commands. 

For creating file : geany file1.v  ( I use the Geany Editor) 
Close the file after the work is done 

## For compiling :
                          iverilog file1.v -o outputfile1
                          vvp outputfile1 
                        
## For simulation : 
                         iverilog -o mysim file1.v file1_tb.v 
                         vvp mysim 
                          
## For Waveform generation : In the testbench, write this 
                     module test1_tb.v 
                       .
                       .
                       .
                        $dumpfile("file1waveform.vcd") ; 
                        $dumpvars(0, test1_tb.v) ; //0 means we are dumping all variables 
                        
                      endmodule 
                      
                      
   then do this : gtkwave file1waveform.vcd 
   
 ## Cool Tip: 
                                Whenever you are writing a code in Verilog, to avoid confusion where to assign wires and registers, always prefix your code with "r_" or "w_". This way, you will always assign the register values inside the always block, and wire values always outside the always block. 
                                
                                Eg:                              
                                          reg  r_LED_1    = 1'b0;
                                          reg  r_Switch_1 = 1'b0;
                                          wire w_Switch_1;
