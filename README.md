# Verilog-HDL-Useful-Codes
Useful Verilog HDL Codes which can be used in multiple design systems.

For Icarus Verilog, these are some useful commands. 

For creating file : geany file1.v  ( I use the Geany Editor) 
Close the file after the work is done 

For compiling :
                          iverilog file1.v -o outputfile1

                        vpp outputfile1 
                        
For simulation : 
                         iverilog -o mysim file1.v file1_tb.v 

                          vvp mysim 
                          
For Waveform generation : In the testbench, write this 
                     
                     
                     module test1_tb.v 
                       .
                       .
                       .
                        $dumpfile("file1waveform.vcd") ; 
                        $dumpvars(0, test1_tb.v) ; //0 means we are dumping all variables 
                        
                      endmodule 
                      
                      
      then go this : gtkwave file1waveform.vcd 
