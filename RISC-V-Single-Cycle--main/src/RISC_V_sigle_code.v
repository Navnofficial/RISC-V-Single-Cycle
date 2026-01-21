module Program_counter(
        clk ,
        reset ,
        PC_in ,
        PC_out
    );
    input clk , reset ;
    input [31:0] PC_in ; 
    output reg [31:0] PC_out ;

    always @(posedge clk or posedge reset)
        begin 
            if(reset)
                PC_out <= 32'b00;
            else
                PC_out <= PC_in;
        end
endmodule

module pc_incr(
        PC_Next,
        PC_Form
    );
    input [31:0] PC_Form ; 
    output [31:0] PC_Next ;

    assign PC_Next = PC_Form + 4;
endmodule 

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

module Register_file(
        clk ,
        reset ,
        rs1 ,
        rs2 ,
        rd ,
        wr_en ,      // write enable
        wr_data ,    // write data -> for write operation
        read_data1 , // read form reg 1 -> for alu operation
        read_data2   // read form reg 2 -> for alu operation
    );

    input clk , reset , wr_en ;
    input [4:0] rd , rs1 , rs2 ;
    input [31:0] wr_data ;
    output reg [31:0] read_data1 , read_data2 ;
    reg [31:0] reg [31:0] ; //register to store data 
    integer k ;

    always @(posedge clk or posedge reset) 
    begin
        if(reset) begin
        for(k = 0 ; k < 32 ; k = k+1 ) 
        begin
            reg[k] <= 32'b00 ;
        end
        end  
        else if(wr_en) 
        begin
            reg[rd] <= wr_data ;
        end  
    end

    assign read_data1 = reg[rs1]; //Data1 for ALU
    assign read_data2 = reg[rs2]; //Data2 for ALU
endmodule

module Immediate_generation(
        opcode ,
        instruction ,
        immediate_ext 
    );

    input [6:0] opcode ;
    input [31:0] instruction ;
    output reg [31:0] immediate_ext ;

    always @(*) begin
        case(opcode)
        7'b0000011 : immediate_ext = {{20{instruction[31]}}, instruction[31:20]}; // I-type (LOAD)
        7'b0100011 : immediate_ext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-type (STORE)
        7'b1100011 : immediate_ext = {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:8],1'b0}; // SB-type (BRANCH)
        endcase
    end
endmodule

module ALU_control(
        ALU_op ,
        fun_7 ,
        fun_3 ,
        Ctrl_out
    );
    input [1:0] ALU_op ;
    input [2:0] fun_3 ;
    input fun_7 ;
    output reg [3:0] Ctrl_out ;

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
    end
endmodule

module Data_memory(
        clk , 
        reset ,
        mem_wr ,
        mem_rd ,
        wr_data ,
        rd_data ,
        addr 
    );
    input reset , mem_wr , mem_rd ;
    input [31:0] wr_data ;
    input [31:0] addr ;
    output reg [31:0] rd_data ;
    integer k;
    reg [31:0] D_memory [63:0] ;

    always @(posedge clk or posedge reset) begin 
        if(reset)
        begin 
            for (k = 0 ; k < 64 ; k=k+1) begin
                D_memory[k] <= 32'b00;
            end
        end
        else if(mem_wr)
        begin 
            D_memory[addr] <= wr_data ;
        end
    end
    assign rd_data = mem_rd ? D_memory[addr] : 32'b00;
endmodule

module mux1(
        input [31:0] A1 , B1 ,
        input sel1 
        output reg [31:0] mux_op1 
    );

    assign mux_op1 = sel1 ? A1 : B1 ;
endmodule

module mux2(
        input [31:0] A2 , B2 ,
        input sel2 
        output reg [31:0] mux_op2 
    );

    assign mux_op2 = sel2 ? A2 : B2 ;
endmodule

module mux3(
        input [31:0] A3 , B3 ,
        input sel3 
        output reg [31:0] mux_op3 
    );

    assign mux_op3 = sel3 ? A3 : B3 ;
endmodule   

module and1(
        input branch , zero ,
        output reg and_out 
    );

    assign and_out = branch & zero ;
endmodule

module adder(
        in1 ,
        in2 ,
        sum_out 
    );

    input [31:0] in1 , in2 ;
    output [31:0] sum_out ;

    assign sum_out = in1 + in2 ;
endmodule

module top_module(
        input clk , reset 
    );
        
        wire reg_wire_top ;
        wire mem_wr_top , mem_rd_top ;
        wire ALUsrc_top;
        wire mem_to_reg_top;
        wire branch_top;
        wire zero_top;
        wire and_out_top;
        wire adder_op_top;
        wire [1:0] ALU_op_top;
        wire [3:0] ALU_ctrl_out;
        wire [31:0] Inst_out ;
        wire [31:0] read_data1_top ;
        wire [31:0] read_data2_top ;
        wire [31:0] Ext_imm_top ;
        wire [31:0] ALU_result_top;
        wire [31:0] PC_Add_op_top;
        wire [31:0] PC_Add_in_top ;
        wire [31:0] mux1_op_top ;
        wire [31:0] mux2_op_top;
        wire [31:0] mux3_op_top;
        wire [31:0] Data_Mem_out_top;
        

        Program_counter PC (  
            .clk(clk) , 
            .reset(reset) , 
            .PC_in(mux2_op_top) , 
            .PC_out(PC_Add_in_top)
        );
        
        PC_incr PC_Adder (  
        .PC_Form(PC_Add_in_top) , 
        .PC_Next(PC_Add_op_top)
        );
        
        Instruction_memory Inst_Mem(  
            .clk(clk), 
            .reset(reset), 
            .read_addr(PC_Add_in_top), 
            .inst_out(Inst_out)
        );
        
        Register_file Reg_file(         
            .clk(clk), 
            .reset(reset), 
            .rs1(Inst_out[19:15]), 
            .rs2(Inst_out[24:20]), 
            .rd(Inst_out[11:7]), 
            .wr_en(reg_wire_top), 
            .wr_data(mux3_op_top), 
            .read_data1(read_data1_top), 
            .read_data2(read_data2_top)
        );

        Immediate_generation immediate_gen(
            .opcode(Inst_out[6:0]) ,
            .instruction(Inst_out) ,
            .immediate_ext(Ext_imm_top) 
        );

        Control ctrl_unit(
            .instruction(Inst_out[6:0]) ,
            .branch(branch_top) ,       
            .mem_rd(mem_rd_top) ,       
            .mem_to_reg(mem_to_reg_top) ,  
            .ALU_op(ALU_op_top) ,      
            .mem_wr(mem_wr_top) ,     
            .ALU_src(ALUsrc_top) ,     
            .reg_wr(reg_wire_top)        
        );

        ALU_control ALU_ctrl(
            .ALU_op(ALU_op_top) ,
            .fun_7(Inst_out[30]) ,
            .fun_3(Inst_out[14:12]) ,
            .Ctrl_out(ALU_ctrl_out)
        );

        ALU ALU_top(
            .A(read_data1_top) , 
            .B(mux1_op_top) , 
            .Crtl_in(ALU_ctrl_out) , 
            .ALU_result(ALU_result_top) , 
            .zero(zero_top) 
        );

        mux1 mux1_top(
            .A1(read_data2_top) , 
            .B1(Ext_imm_top) , 
            .sel1(ALUsrc_top) , 
            .mux_op1(mux1_op_top)
        );

        mux2 mux2_top(
            .A2(PC_Add_op_top) , 
            .B2(adder_op_top) , 
            .sel2(and_out_top) , 
            .mux_op2(mux2_op_top)
        );

        mux3 mux3_top(
            .A3(Data_Mem_out_top) , 
            .B3(ALU_result_top) , 
            .sel3(mem_to_reg_top) , 
            .mux_op3(mux3_op_top)
        );

        Data_memory Data_Mem(
            .clk(clk), 
            .reset(reset), 
            .mem_wr(mem_wr_top) , 
            .mem_rd(mem_rd_top) , 
            .wr_data(read_data2_top) , 
            .rd_data(Data_Mem_out_top) , 
            .addr(ALU_result_top)
        );

        And1 and1_top(
            .branch(branch_top) , 
            .zero(zero_top) , 
            .and_out(and_out_top)
        );

        adder adder_top(
            .in1(PC_Add_op_top) , 
            .in2(Ext_imm_top) , 
            .sum_out(adder_op_top)
        );





        
endmodule     

    
