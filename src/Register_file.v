/*
DATAPATH MAPPING 
    Instruction[6:0]     → Control Unit (opcode) 7 bits
    Instruction[11:7]    → rd (write register - destination) 5 bits
    Instruction[19:15]   → rs1 (source register 1) 5 bits
    Instruction[24:20]   → rs2 (source register 2) 5 bits
    Instruction[14:12]   → funct3 (function) 3 bits
    Instruction[30]      → funct7 bit (function) 1 bit
    Instruction[31:0]    → ImmGen (builds immediate) 32 bits
*/

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
       begin
           Reg[k] <= 32'b00 ;
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