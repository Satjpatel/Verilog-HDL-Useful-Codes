//A complex pipeline function of ALU 
//The intermediate latches required are declared 
//just before they are used, for better code readability. 
module complex_pipeline ( Zout , rs1, rs2, rd, func, addr, clk1, clk2) ; 
	output [15:0] Zout ; 
	input [3:0] rs1, rs2, rd; 
	//rs1 and rs2 are the source registers, and rd is the destination 
	//register. 
	input [3:0] func ; 
	//func is the opcode for the ALU operations 
	input [7:0] addr ; //8 bit address lines for 256 locations of memory 
	input write ; 
	input clk1, clk2 ; //Two phase clock
	
	
	
	reg [15:0] regbank [15:0] ; //Register Bank 
	reg [15:0] mem [255:0] ; //Memory block - 256 x 16 memory 
	
	//Stage 1 - clk1 is connected here 
	reg [15:0] L12_A, L12_B ; 
	reg [3:0] L12_rd ; 
	reg [3:0] L12_func ; 
	reg [7:0] L12_addr ;
	 
	always @ ( posedge clk1 ) 
		begin 
			L12_A <= regbank[rs1] ; 
			L12_B <= regbank[rs2] ; 
			L12_rd <= rd ; 
			L12_func <= func ; 
			L12_addr <= addr ; 
		end 
	
	//Stage 2 - clk 2 is connected here
	reg [15:0] L23_Z  ; 
	reg [3:0] L23_rd ; 
	reg [7:0] L23_addr ; 
	
	always @ ( negedge clk2 ) 
		begin 
			case(L12_func) 
			0: L23_Z <= L12_A + L12_B ; 
			1: L23_Z <= L12_A - L12_B ; 
			2: L23_Z <= L12_A * L12_B ; 
			3: L23_Z <= L12_A ; 
			4: L23_Z <= L12_B ; 
			5: L23_Z <= L12_A & L12_B ; 
			6: L23_Z <= L12_A | L12_B ; 
			7: L23_Z <= L12_A ^ L12_B ; 
			8: L23_Z <= - L12_A ; 
			9: L23_Z <= - L12_B ; 
			10: L23_Z <= L12_A >> 1 ; 
			11: L23_Z <= L12_A << 1 ; 
			default : L23_Z <= 16'hxxxx ; 
			endcase 
		L23_rd <= L12_rd ; 
		L23_addr <= L12_addr ; 
		end 
		
	
	//Stage 3 - clk 1 is connected here 
	reg [15:0] L34_Z ; 
	reg [7:0] L34_addr ; 
	
	always @ ( posedge clk1) 
		begin 
			regbank[L23_rd] <= L23_Z ; 
			L34_Z <= L23_Z ; 
			L34_addr <= L23_addr ; 
		end 
	
	//Stage 4 - clk 2 is used here 
	always @ ( negedge clk2) 
		begin 
			mem[L34_addr] <= L34_Z ; 
		end 
	
	assign Zout = L34_Z ; 
endmodule 
