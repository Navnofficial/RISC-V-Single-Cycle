//Instruction Memory block : to store the instructions
module Instruction_memory(
    clk,
    reset,
    read_addr,
    inst_out
);
input clk , reset ;
input [31:0]read_addr ;
output reg [31:0] inst_out ;
integer i ;
reg [31:0] inst_memory [63:0];

always @(posedge clk or posedge reset)
    begin 
        if(reset)
            begin 
                for(i = 0 ; i< 64 ; i = i +1) begin
                    inst_memory[i] <= 32'b00 ;
                    end
            end
        else
        inst_out <= inst_memory[read_addr] ;
    end
endmodule
