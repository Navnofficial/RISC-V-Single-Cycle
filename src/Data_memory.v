module Data_memory (
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
output reg [31:0] rd_data_op ;
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

assign rd_data_op = mem_rd ? D_memory[addr] : 32'b00;

end
endmodule