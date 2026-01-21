/*

---------------------------------------------------------------------
Signal     | Purpose
-----------+---------------------------------------------------------
RegWrite   | Write result into register file
ALUSrc     | Select ALU input: register or immediate
ALUOp      | Select ALU operation (add, sub, compare, etc.)
MemRead    | Read from data memory
MemWrite   | Write to data memory
MemtoReg   | Select value written to rd (ALU or memory)
Branch     | Enable branch decision logic
---------------------------------------------------------------------

*/

module Control (
    instruction ,
    branch,       
    mem_rd,       
    mem_to_reg ,  
    ALU_op ,      
    mem_wr ,     
    ALU_src ,     
    reg_wr        
);

input [6:0] instruction ;
output branch , mem_to_reg , mem_wr , mem_rd , ALU_src , reg_wr ;
output [1:0] ALU_op ;

always @(*) begin
    case (instruction)
    7'b0110011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b001000_10 ;
    7'b0000011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b111100_00 ;
    7'b0100011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b100010_00 ;
    7'b1100011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b000001_01 ;
    endcase
endmodule