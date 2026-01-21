module ALU_control (
    ALU_op ,
    fun_7 ,
    fun_3 ,
    Ctrl_out
);
input [1:0] ALU_op ;
input [2:0] fun_3 ;
input [6:0] fun_7 ;
output[3:0] Ctrl_out ;

always @(*) begin 
    case({ALU_op , fun_7 , fun_3})
        6'b00_0_000 : Ctrl_out <= 4'b0010 ;   // ADD
        6'b01_0_000 : Ctrl_out <= 4'b0110 ;   // SUB
        6'b10_0_000 : Ctrl_out <= 4'b0010 ;   // ADD
        6'b10_1_000 : Ctrl_out <= 4'b0110 ;   // SUB
        6'b10_0_110 : Ctrl_out <= 4'b0001 ;   // OR
    endcase
end
endmodule

module ALU (
    A , B , Crtl_in , ALU_result , zero 
);

input [31:0] A , B ;
input [3:0] Crtl_in ;
output reg [31:0] ALU_result ;
output reg zero ;

always @(Crtl_in , A , B) begin
    case(Crtl_in)
        4'b0000 : begin zero <= 0 ; ALU_result <= A & B ; end
        4'b0001 : begin zero <= 0 ; ALU_result <= A | B ; end
        4'b0010 : begin zero <= 0 ; ALU_result <= A + B ; end
        4'b0110 : begin if(A==B) zero <= 1 ; else zero <= 0 ; ALU_result <= A - B ; end
    endcase
end
endmodule
