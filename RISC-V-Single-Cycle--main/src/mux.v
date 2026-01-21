module mux1(
    input [31:0] A1 , B1 ;
    input sel1 ;
    output reg [31:0] mux_op1 ;
);

assign mux_op1 = sel1 ? A1 : B1 ;
endmodule

module mux2(
    input [31:0] A2 , B2 ;
    input sel2 ;
    output reg [31:0] mux_op2 ;
);

assign mux_op2 = sel2 ? A2 : B2 ;
endmodule

module mux3(
    input [31:0] A3 , B3 ;
    input sel3 ;
    output reg [31:0] mux_op3 ;
);

assign mux_op3 = sel3 ? A3 : B3 ;
endmodule