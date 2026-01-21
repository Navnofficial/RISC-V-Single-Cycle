//================ PROGRAM COUNTER =================
module Program_counter(input clk, input reset,
    input [31:0] PC_in, output reg [31:0] PC_out);
always @(posedge clk or posedge reset)
    if(reset) PC_out <= 32'b0;
    else PC_out <= PC_in;
endmodule

//================ PC + 4 =================
module pc_incr(input [31:0] PC_Form, output [31:0] PC_Next);
assign PC_Next = PC_Form + 4;
endmodule

//================ INSTRUCTION MEMORY =================
module Instruction_memory(input clk, input reset,
    input [31:0] read_addr, output reg [31:0] inst_out);
    reg [31:0] mem [0:63];
    integer i;
    always @(posedge clk or posedge reset) begin
        if(reset) for(i=0;i<64;i=i+1) mem[i]<=0;
        else inst_out <= mem[read_addr[7:2]];
    end
endmodule

//================ REGISTER FILE =================
module Register_file(input clk, input reset,
    input [4:0] rs1, rs2, rd,
    input wr_en, input [31:0] wr_data,
    output [31:0] read_data1, read_data2);
reg [31:0] Reg [0:31];
integer k;
always @(posedge clk or posedge reset) begin
    if(reset) for(k=0;k<32;k=k+1) Reg[k]<=0;
    else if(wr_en && rd!=0) Reg[rd] <= wr_data;
end
assign read_data1 = Reg[rs1];
assign read_data2 = Reg[rs2];
endmodule

//================ IMMEDIATE =================
module Immediate_generation(input [6:0] opcode,
    input [31:0] instruction, output reg [31:0] immediate_ext);
always @(*) begin
    case(opcode)
    7'b0000011: immediate_ext = {{20{instruction[31]}},instruction[31:20]};
    7'b0100011: immediate_ext = {{20{instruction[31]}},instruction[31:25],instruction[11:7]};
    7'b1100011: immediate_ext = {{19{instruction[31]}},instruction[31],instruction[30:25],instruction[11:8],1'b0};
    default: immediate_ext = 0;
    endcase
end
endmodule

//================ CONTROL =================
module Control(input [6:0] instruction,
    output reg branch, mem_rd, mem_to_reg, mem_wr, ALU_src, reg_wr,
    output reg [1:0] ALU_op);
always @(*) begin
    case(instruction)
    7'b0110011: {ALU_src,mem_to_reg,reg_wr,mem_rd,mem_wr,branch,ALU_op} = 8'b00100010;
    7'b0000011: {ALU_src,mem_to_reg,reg_wr,mem_rd,mem_wr,branch,ALU_op} = 8'b11110000;
    7'b0100011: {ALU_src,mem_to_reg,reg_wr,mem_rd,mem_wr,branch,ALU_op} = 8'b10001000;
    7'b1100011: {ALU_src,mem_to_reg,reg_wr,mem_rd,mem_wr,branch,ALU_op} = 8'b00000101;
    default:    {ALU_src,mem_to_reg,reg_wr,mem_rd,mem_wr,branch,ALU_op} = 8'b0;
    endcase
end
endmodule

//================ ALU CONTROL =================
module ALU_control(input [1:0] ALU_op, input [2:0] fun3, input fun7,
    output reg [3:0] Ctrl_out);
always @(*) begin
    case({ALU_op,fun7,fun3})
    6'b10_0_000: Ctrl_out = 4'b0010;
    6'b10_1_000: Ctrl_out = 4'b0110;
    6'b10_0_110: Ctrl_out = 4'b0001;
    6'b00_0_000: Ctrl_out = 4'b0010;
    6'b01_0_000: Ctrl_out = 4'b0110;
    default: Ctrl_out = 4'b0000;
    endcase
end
endmodule

//================ ALU =================
module ALU(input [31:0] A,B, input [3:0] Ctrl,
    output reg [31:0] ALU_result, output reg zero);
always @(*) begin
    case(Ctrl)
    4'b0000: ALU_result = A & B;
    4'b0001: ALU_result = A | B;
    4'b0010: ALU_result = A + B;
    4'b0110: ALU_result = A - B;
    default: ALU_result = 0;
    endcase
    zero = (ALU_result==0);
end
endmodule

//================ DATA MEMORY =================
module Data_memory(input clk, input reset,
    input mem_wr, mem_rd, input [31:0] wr_data, addr,
    output [31:0] rd_data);
reg [31:0] mem [0:63];
integer k;
always @(posedge clk or posedge reset)
    if(reset) for(k=0;k<64;k=k+1) mem[k]<=0;
    else if(mem_wr) mem[addr[7:2]] <= wr_data;
assign rd_data = mem_rd ? mem[addr[7:2]] : 0;
endmodule

//================ MUX =================
module mux(input [31:0] A,B, input sel, output [31:0] Y);
    assign Y = sel ? A : B;
endmodule

//================ AND =================
module and1(input branch, zero, output and_out);
    assign and_out = branch & zero;
endmodule

//================ ADDER =================
module adder(input [31:0] in1,in2, output [31:0] sum);
    assign sum = in1 + in2;
endmodule

//================ TOP =================
module top_module(input clk, input reset);
    wire [31:0] PC, PC4, instr, rd1, rd2, imm, aluB, alu_out, mem_out, wb, br_tgt;
    wire [1:0] ALU_op;
    wire [3:0] ALU_ctrl;
    wire reg_wr, mem_wr, mem_rd, mem2reg, ALUsrc, branch, zero, take_branch;

    Program_counter pc(clk,reset,wb,PC);
    pc_incr pcadd(PC,PC4);
    Instruction_memory im(clk,reset,PC,instr);
    Register_file rf(clk,reset,instr[19:15],instr[24:20],instr[11:7],reg_wr,wb,rd1,rd2);
    Immediate_generation ig(instr[6:0],instr,imm);
    Control cu(instr[6:0],branch,mem_rd,mem2reg,ALU_op,mem_wr,ALUsrc,reg_wr);
    ALU_control ac(ALU_op,instr[14:12],instr[30],ALU_ctrl);
    mux m1(rd2,imm,ALUsrc,aluB);
    ALU alu(rd1,aluB,ALU_ctrl,alu_out,zero);
    Data_memory dm(clk,reset,mem_wr,mem_rd,rd2,alu_out,mem_out);
    mux m2(mem_out,alu_out,mem2reg,wb);
    and1 a1(branch,zero,take_branch);
    adder ad(PC4,imm,br_tgt);
    mux m3(PC4,br_tgt,take_branch,wb);
endmodule
