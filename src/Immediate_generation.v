module Immediate_generation(
    opcode ,
    instruction ,
    immediate_ext 
);

input [6:0] opcode ;
input [31:0] instruction ;
output [31:0] immediate_ext ;

always @(*) begin
    case(opcode)
    7'b0000011 : immediate_ext = {{20{instruction[31]}}, instruction[31:20]}; // I-type (LOAD)
    7'b0100011 : immediate_ext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-type (STORE)
    7'b1100011 : immediate_ext = {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:8],1'b0}; // SB-type (BRANCH)
    endcase
end
endmodule