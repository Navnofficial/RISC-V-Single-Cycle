// ================= Program Counter =================
module Program_counter(input clk, reset, input [31:0] PC_in, output reg [31:0] PC_out);
    always @(posedge clk or posedge reset)
        if(reset) PC_out <= 0;
        else PC_out <= PC_in;
endmodule

module pc_incr(input [31:0] PC_Form, output [31:0] PC_Next);
    assign PC_Next = PC_Form + 4;
endmodule

// ================= Instruction Memory =================
module Instruction_memory(input clk, input [31:0] read_addr, output reg [31:0] inst_out);
    reg [31:0] inst_memory [0:63];
    initial begin
        // Initialize all to 0
        inst_memory[0] = 32'b00000000000000000000000000000000; // NOP
        // R-type instructions
        inst_memory[1] = 32'b0000000_11001_10000_000_01101_0110011; // add x13,x16,x25 (at PC=4)
        inst_memory[2] = 32'b0100000_00011_01000_000_00101_0110011; // sub x5,x8,x3 (at PC=8)
        inst_memory[3] = 32'b0000000_00011_00010_111_00001_0110011; // and x1,x2,x3 (at PC=12)
        inst_memory[4] = 32'b0000000_00101_00011_110_00100_0110011; // or x4,x3,x5 (at PC=16)
        // I-type instructions
        inst_memory[5] = 32'b000000000011_10101_000_10110_0010011; // addi x22,x21,3 (at PC=20)
        inst_memory[6] = 32'b000000000001_01000_110_01001_0010011; // ori x9,x8,1 (at PC=24)
        // L-type instructions
        inst_memory[7] = 32'b000000001111_00101_010_01000_0000011; // lw x8,15(x5) (at PC=28)
        inst_memory[8] = 32'b000000000011_00011_010_01001_0000011; // lw x9,3(x3) (at PC=32)
        // S-type instructions
        inst_memory[9] = 32'b0000000_01111_00101_010_01100_0100011; // sw x15,12(x5) (at PC=36)
        inst_memory[10] = 32'b0000000_01110_00110_010_01010_0100011; // sw x14,10(x6) (at PC=40)
        // Branch instruction
        inst_memory[11] = 32'h00948663; // beq (at PC=44)
    end
    always @(posedge clk)
        inst_out <= inst_memory[read_addr[7:2]];
endmodule

// ================= Register File =================
module Register_file(input clk, reset, input [4:0] rs1,rs2,rd,
                     input wr_en, input [31:0] wr_data,
                     output [31:0] read_data1, read_data2);
    reg [31:0] RegFile[31:0]; 
    integer k;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            // Initialize registers with test values
            RegFile[0] = 0;   RegFile[1] = 4;   RegFile[2] = 2;   RegFile[3] = 24;
            RegFile[4] = 4;   RegFile[5] = 1;   RegFile[6] = 44;  RegFile[7] = 4;
            RegFile[8] = 2;   RegFile[9] = 1;   RegFile[10] = 23; RegFile[11] = 4;
            RegFile[12] = 90; RegFile[13] = 10; RegFile[14] = 20; RegFile[15] = 30;
            RegFile[16] = 40; RegFile[17] = 50; RegFile[18] = 60; RegFile[19] = 70;
            RegFile[20] = 80; RegFile[21] = 80; RegFile[22] = 90; RegFile[23] = 70;
            RegFile[24] = 60; RegFile[25] = 65; RegFile[26] = 4;  RegFile[27] = 32;
            RegFile[28] = 12; RegFile[29] = 34; RegFile[30] = 5;  RegFile[31] = 10;
        end
        else if(wr_en && rd!=0) 
            RegFile[rd] <= wr_data;
    end
    
    assign read_data1 = (rs1==0) ? 0 : RegFile[rs1];
    assign read_data2 = (rs2==0) ? 0 : RegFile[rs2];
endmodule

// ================= Immediate Generator =================
module Immediate_generation(input [6:0] opcode, input [31:0] instruction, output reg [31:0] immediate_ext);
    always @(*) case(opcode)
        7'b0000011, 7'b0010011: immediate_ext = {{20{instruction[31]}}, instruction[31:20]}; // I-type
        7'b0100011: immediate_ext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-type
        7'b1100011: immediate_ext = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type
        default: immediate_ext = 0;
    endcase
endmodule

// ================= Control =================
module Control(input [6:0] instruction,
               output reg branch, mem_rd, mem_to_reg, mem_wr, ALU_src, reg_wr,
               output reg [1:0] ALU_op);
    always @(*) begin
        {ALU_src, mem_to_reg, reg_wr, mem_rd, mem_wr, branch, ALU_op[1], ALU_op[0]} = 8'b0;
        case(instruction)
            7'b0110011: {ALU_src, mem_to_reg, reg_wr, mem_rd, mem_wr, branch, ALU_op[1], ALU_op[0]} = 8'b00100010; // R-type
            7'b0010011: {ALU_src, mem_to_reg, reg_wr, mem_rd, mem_wr, branch, ALU_op[1], ALU_op[0]} = 8'b10100011; // I-type (ADDI, ORI, etc.)
            7'b0000011: {ALU_src, mem_to_reg, reg_wr, mem_rd, mem_wr, branch, ALU_op[1], ALU_op[0]} = 8'b11110000; // LW
            7'b0100011: {ALU_src, mem_to_reg, reg_wr, mem_rd, mem_wr, branch, ALU_op[1], ALU_op[0]} = 8'b10001000; // SW
            7'b1100011: {ALU_src, mem_to_reg, reg_wr, mem_rd, mem_wr, branch, ALU_op[1], ALU_op[0]} = 8'b00000101; // BEQ
        endcase
    end
endmodule

// ================= ALU Control =================
module ALU_control(input [1:0] ALU_op, input fun_7, input [2:0] fun_3, output reg [3:0] Ctrl_out);
    always @(*) case({ALU_op, fun_7, fun_3})
        6'b00_0_000: Ctrl_out = 4'b0010; // add (for load/store)
        6'b01_0_000: Ctrl_out = 4'b0110; // sub (for branch)
        6'b10_0_000: Ctrl_out = 4'b0010; // add (R-type)
        6'b10_1_000: Ctrl_out = 4'b0110; // sub (R-type)
        6'b10_0_111: Ctrl_out = 4'b0000; // and (R-type)
        6'b10_0_110: Ctrl_out = 4'b0001; // or (R-type)
        6'b10_0_100: Ctrl_out = 4'b0011; // xor (R-type)
        6'b11_0_000: Ctrl_out = 4'b0010; // addi (I-type)
        6'b11_0_110: Ctrl_out = 4'b0001; // ori (I-type)
        default: Ctrl_out = 4'b0000;     // and
    endcase
endmodule

// ================= ALU =================
module ALU(input [31:0] A, B, input [3:0] Crtl_in, output reg [31:0] ALU_result, output zero);
    always @(*) case(Crtl_in)
        4'b0000: ALU_result = A & B;
        4'b0001: ALU_result = A | B;
        4'b0010: ALU_result = A + B;
        4'b0011: ALU_result = A ^ B;
        4'b0110: ALU_result = A - B;
        default: ALU_result = 0;
    endcase
    assign zero = (ALU_result == 0);
endmodule

// ================= Data Memory =================
module Data_memory(input clk, reset, mem_wr, mem_rd, input [31:0] wr_data, addr, output [31:0] rd_data);
    reg [31:0] D_memory[63:0]; 
    integer k;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(k=0; k<64; k=k+1) 
                D_memory[k] <= 0;
        end
        else if(mem_wr) 
            D_memory[addr[7:2]] <= wr_data;
    end
    
    assign rd_data = mem_rd ? D_memory[addr[7:2]] : 0;
endmodule

// ================= MUX, AND, ADDER =================
// FIXED: Corrected MUX logic - when sel=1, output A; when sel=0, output B
module mux1(input [31:0] A1, B1, input sel1, output [31:0] mux_op1); 
    assign mux_op1 = sel1 ? A1 : B1; 
endmodule

module mux2(input [31:0] A2, B2, input sel2, output [31:0] mux_op2); 
    assign mux_op2 = sel2 ? A2 : B2; 
endmodule

module mux3(input [31:0] A3, B3, input sel3, output [31:0] mux_op3); 
    assign mux_op3 = sel3 ? A3 : B3; 
endmodule

module and1(input branch, zero, output and_out); 
    assign and_out = branch & zero; 
endmodule

module adder(input [31:0] in1, in2, output [31:0] sum_out); 
    assign sum_out = in1 + in2; 
endmodule

// ================= TOP =================
module top_final(input clk, reset);
    wire reg_wire_top, mem_wr_top, mem_rd_top, ALUsrc_top, mem_to_reg_top, branch_top;
    wire zero_top, and_out_top;
    wire [1:0] ALU_op_top;
    wire [3:0] ALU_ctrl_out;
    wire [31:0] Inst_out, read_data1_top, read_data2_top, Ext_imm_top;
    wire [31:0] ALU_result_top, PC_Add_op_top, PC_Add_in_top, adder_op_top;
    wire [31:0] mux1_op_top, mux2_op_top, mux3_op_top, Data_Mem_out_top;

    Program_counter PC(clk, reset, mux2_op_top, PC_Add_in_top);
    pc_incr PC_Adder(PC_Add_in_top, PC_Add_op_top);
    Instruction_memory Inst_Mem(clk, PC_Add_in_top, Inst_out);
    Register_file Reg_file(clk, reset, Inst_out[19:15], Inst_out[24:20], Inst_out[11:7],
                           reg_wire_top, mux3_op_top, read_data1_top, read_data2_top);
    Immediate_generation immediate_gen(Inst_out[6:0], Inst_out, Ext_imm_top);
    Control ctrl_unit(Inst_out[6:0], branch_top, mem_rd_top, mem_to_reg_top,
                      mem_wr_top, ALUsrc_top, reg_wire_top, ALU_op_top);
    ALU_control ALU_ctrl(ALU_op_top, Inst_out[30], Inst_out[14:12], ALU_ctrl_out);
    ALU ALU_top(read_data1_top, mux1_op_top, ALU_ctrl_out, ALU_result_top, zero_top);
    mux1 mux1_top(Ext_imm_top, read_data2_top, ALUsrc_top, mux1_op_top);
    and1 and1_top(branch_top, zero_top, and_out_top);
    adder adder_top(PC_Add_in_top, Ext_imm_top, adder_op_top);
    mux2 mux2_top(adder_op_top, PC_Add_op_top, and_out_top, mux2_op_top);
    Data_memory Data_Mem(clk, reset, mem_wr_top, mem_rd_top, read_data2_top, ALU_result_top, Data_Mem_out_top);
    mux3 mux3_top(Data_Mem_out_top, ALU_result_top, mem_to_reg_top, mux3_op_top);
endmodule
