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
        input clk,
        input reset,
        input [31:0] read_addr,
        output reg [31:0] inst_out
    );
        integer i;
        reg [31:0] inst_memory [0:63];

        // -------- Instruction Initialization (from your photo) --------
        initial begin
            // R-type
            inst_memory[0]  = 32'b00000000000000000000000000000000; // no operation
            inst_memory[4]  = 32'b0000000_11001_10000_000_01101_0110011; // add x13,x16,x25
            inst_memory[8]  = 32'b0100000_00011_01000_000_00101_0110011; // sub x5,x8,x3
            inst_memory[12] = 32'b0000000_00011_00010_111_00001_0110011; // and x1,x2,x3
            inst_memory[16] = 32'b0000000_00101_00011_110_00100_0110011; // or x4,x3,x5

            // I-type
            inst_memory[20] = 32'b000000000011_10101_000_10110_0010011; // addi x22,x21,3
            inst_memory[24] = 32'b000000000001_01000_110_01001_0010011; // ori x9,x8,1

            // L-type
            inst_memory[28] = 32'b000000001111_00101_010_01000_0000011; // lw x8,15(x5)
            inst_memory[32] = 32'b000000000011_00011_010_01001_0000011; // lw x9,3(x3)

            // S-type
            inst_memory[36] = 32'b0000000_01111_00101_010_01100_0100011; // sw x15,12(x5)
            inst_memory[40] = 32'b0000000_01110_00110_010_01010_0100011; // sw x14,10(x6)

            // SB-type
            inst_memory[44] = 32'h00948663; // beq x9,x9,12
        end
        // -------------------------------------------------------------

        always @(posedge clk or posedge reset) begin
            if(reset) begin
                for(i = 0; i < 64; i = i + 1)
                    inst_memory[i] <= 32'b0;
            end
            else begin
                inst_out <= inst_memory[read_addr[7:2]];
            end
        end
endmodule

module Register_file(
        clk ,
        reset ,
        rs1 ,
        rs2 ,
        rd ,
        wr_en ,
        wr_data ,
        read_data1 ,
        read_data2
    );

    input clk , reset , wr_en ;
    input [4:0] rd , rs1 , rs2 ;
    input [31:0] wr_data ;
    output [31:0] read_data1 , read_data2 ;
    reg [31:0] RegFile [31:0] ; 

    initial begin
        RegFile[0]=0; RegFile[1]=4; RegFile[2]=2; RegFile[3]=24;
        RegFile[4]=4; RegFile[5]=1; RegFile[6]=44; RegFile[7]=4;
        RegFile[8]=2; RegFile[9]=1; RegFile[10]=23; RegFile[11]=4;
        RegFile[12]=90; RegFile[13]=10; RegFile[14]=20; RegFile[15]=30;
        RegFile[16]=40; RegFile[17]=50; RegFile[18]=60; RegFile[19]=70;
        RegFile[20]=80; RegFile[21]=80; RegFile[22]=90; RegFile[23]=70;
        RegFile[24]=60; RegFile[25]=65; RegFile[26]=4; RegFile[27]=32;
        RegFile[28]=12; RegFile[29]=34; RegFile[30]=5; RegFile[31]=10;
    end

    integer k ;

    always @(posedge clk or posedge reset) 
    begin
        if(reset) begin
        for(k = 0 ; k < 32 ; k = k+1 ) 
            RegFile[k] <= 32'b00 ;
        end  
        else if(wr_en) 
            RegFile[rd] <= wr_data ;
    end

    assign read_data1 = RegFile[rs1];
    assign read_data2 = RegFile[rs2];
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
        7'b0000011 : immediate_ext = {{20{instruction[31]}}, instruction[31:20]};
        7'b0100011 : immediate_ext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
        7'b1100011 : immediate_ext = {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:8],1'b0};
        default    : immediate_ext = 32'b0;
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
            6'b00_0_000 : Ctrl_out = 4'b0010 ;
            6'b01_0_000 : Ctrl_out = 4'b0110 ;
            6'b10_0_000 : Ctrl_out = 4'b0010 ;
            6'b10_1_000 : Ctrl_out = 4'b0110 ;
            6'b10_0_110 : Ctrl_out = 4'b0001 ;
            default     : Ctrl_out = 4'b0000 ;
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

    always @(*) begin
        case(Crtl_in)
            4'b0000 : ALU_result = A & B ;
            4'b0001 : ALU_result = A | B ;
            4'b0010 : ALU_result = A + B ;
            4'b0110 : ALU_result = A - B ;
            default : ALU_result = 32'b0 ;
        endcase
        zero = (ALU_result == 0);
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
    output reg branch , mem_to_reg , mem_wr , mem_rd , ALU_src , reg_wr ;
    output reg [1:0] ALU_op ;

    always @(*) begin
        case (instruction)
        7'b0110011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b00100010 ;
        7'b0000011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b11110000 ;
        7'b0100011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b10001000 ;
        7'b1100011 : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b00000101 ;
        default    : { ALU_src , mem_to_reg , reg_wr , mem_rd , mem_wr , branch , ALU_op } = 8'b0 ;
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
    input clk , reset , mem_wr , mem_rd ;
    input [31:0] wr_data ;
    input [31:0] addr ;
    output [31:0] rd_data ;
    integer k;
    reg [31:0] D_memory [63:0] ;

    always @(posedge clk or posedge reset) begin 
        if(reset)
            for (k = 0 ; k < 64 ; k=k+1)
                D_memory[k] <= 32'b00;
        else if(mem_wr)
            D_memory[addr[7:2]] <= wr_data ;
    end

    assign rd_data = mem_rd ? D_memory[addr[7:2]] : 32'b00;
endmodule

module mux1(
        input [31:0] A1 , B1 ,
        input sel1 ,
        output [31:0] mux_op1 
    );
    assign mux_op1 = sel1 ? A1 : B1 ;
endmodule

module mux2(
        input [31:0] A2 , B2 ,
        input sel2 ,
        output [31:0] mux_op2 
    );
    assign mux_op2 = sel2 ? A2 : B2 ;
endmodule

module mux3(
        input [31:0] A3 , B3 ,
        input sel3 ,
        output [31:0] mux_op3 
    );
    assign mux_op3 = sel3 ? A3 : B3 ;
endmodule   

module and1(
        input branch , zero ,
        output and_out 
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
        wire [31:0] adder_op_top;
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
        
        pc_incr PC_Adder (  
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

        and1 and1_top(
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
