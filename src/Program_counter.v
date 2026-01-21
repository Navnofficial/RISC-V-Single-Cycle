//Program Counter block : to store the address of the next instruction to be fetched
module Program_counter(
    clk ,
    reset ,
    PC_in ,
    PC_out
);
input clk , reset ;
input [31:0] PC_in ; 
output [31:0] PC_out ;

always @(posedge clk or posedge reset)
    begin 
        if(reset)
            PC_out <= 32'b00;
        else
            PC_out <= PC_in;
    end
endmodule

//Adder block : to increment the PC_out by 4
module pc_incr(
    PC_out_inc,
    PC_incr;
);
input [31:0] PC_out_inc ; 
output [31:0] PC_incr ;

assign PC_incr = PC_out_inc + 4;

endmodule 

/*
Doc :
    -Program Counter : 
        -It's a special register that keeps track of which instruction the processor should execute next.
        -What it does:
            -Stores the memory address of the next instruction to be fetched and executed
            -Automatically increments after each instruction fetch (typically by 4 bytes in RISC-V for 32-bit instructions)
            -Updates during branches/jumps when the program flow changes (like if-statements, loops, function calls)
        -Resets to a known address (usually 0x00000000) when the system is reset
    Flow : 
        -1. PC_out → Instruction Memory (fetch instruction at this address)
        -2. Execute instruction
        -3. PC_in ← PC_out + 4 (sequential execution)
                            OR
        -4. PC_in ← Branch/Jump target address (control flow change)
        -5. On next clock cycle, PC_out updates to PC_in
        -6. Repeat...
*/