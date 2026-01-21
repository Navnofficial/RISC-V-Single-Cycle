//==================== RISC-V Testbench ====================
// File: top_tb.v
// This file should be compiled WITH top_final.v
// Command: vcs top_final.v top_tb.v
//          or: iverilog -o sim top_final.v top_tb.v

module top_tb;
    reg clk;
    reg reset;
    
    // DUT instantiation
    top_final cpu (
        .clk(clk),
        .reset(reset)
    );
    
    // Clock generation - 10 time unit period (5ns high, 5ns low)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Waveform dumping for Verdi
        $fsdbDumpfile("riscv.fsdb");
        $fsdbDumpvars(0, top_tb);
        
        // For other simulators, use VCD
        $dumpfile("riscv.vcd");
        $dumpvars(0, top_tb);
        
        $display("\n========================================");
        $display("    RV32I Single-Cycle Processor Test    ");
        $display("========================================\n");
        
        // Apply reset
        reset = 1;
        $display("Time=%0t: Applying reset", $time);
        #15;  // Hold reset for 1.5 clock cycles
        reset = 0;
        $display("Time=%0t: Reset released\n", $time);
        
        // Monitor PC and instruction execution
        $display("Starting instruction execution...\n");
        $monitor("Time=%0t | PC=%0d | Inst=0x%h | ALU_result=%0d | rd=%0d | wr_en=%b", 
                 $time, cpu.PC_Add_in_top, cpu.Inst_out, cpu.ALU_result_top, 
                 cpu.Inst_out[11:7], cpu.reg_wire_top);
        
        // Run for enough cycles to execute all instructions
        #500;
        
        // Disable monitoring before final display
        $monitoroff;
        
        // Final results
        $display("\n========================================");
        $display("       Simulation Finished              ");
        $display("========================================");
        $display("Final PC        = %0d", cpu.PC_Add_in_top);
        $display("Last Instruction = 0x%h", cpu.Inst_out);
        $display("ALU Result      = %0d", cpu.ALU_result_top);
        $display("Zero Flag       = %b", cpu.zero_top);
        $display("Branch Signal   = %b", cpu.branch_top);
        
        // Register file contents
        $display("\n========================================");
        $display("       Register File Contents           ");
        $display("========================================");
        $display("x0  (zero) = %0d", cpu.Reg_file.RegFile[0]);
        $display("x1  (ra)   = %0d", cpu.Reg_file.RegFile[1]);
        $display("x2  (sp)   = %0d", cpu.Reg_file.RegFile[2]);
        $display("x3  (gp)   = %0d", cpu.Reg_file.RegFile[3]);
        $display("x4  (tp)   = %0d", cpu.Reg_file.RegFile[4]);
        $display("x5  (t0)   = %0d (signed: %0d)", cpu.Reg_file.RegFile[5], $signed(cpu.Reg_file.RegFile[5]));
        $display("x6  (t1)   = %0d", cpu.Reg_file.RegFile[6]);
        $display("x7  (t2)   = %0d", cpu.Reg_file.RegFile[7]);
        $display("x8  (s0)   = %0d", cpu.Reg_file.RegFile[8]);
        $display("x9  (s1)   = %0d", cpu.Reg_file.RegFile[9]);
        $display("x10 (a0)   = %0d", cpu.Reg_file.RegFile[10]);
        $display("x13 (a3)   = %0d (Expected: 105)", cpu.Reg_file.RegFile[13]);
        $display("x14 (a4)   = %0d", cpu.Reg_file.RegFile[14]);
        $display("x15 (a5)   = %0d", cpu.Reg_file.RegFile[15]);
        $display("x16 (a6)   = %0d", cpu.Reg_file.RegFile[16]);
        $display("x21 (s5)   = %0d", cpu.Reg_file.RegFile[21]);
        $display("x22 (s6)   = %0d (Expected: 83)", cpu.Reg_file.RegFile[22]);
        $display("x25 (s9)   = %0d", cpu.Reg_file.RegFile[25]);
        
        // Data memory contents (showing relevant locations)
        $display("\n========================================");
        $display("       Data Memory Contents             ");
        $display("========================================");
        $display("Note: Memory addresses are word-aligned");
        $display("Mem[0]  = %0d", cpu.Data_Mem.D_memory[0]);
        $display("Mem[1]  = %0d", cpu.Data_Mem.D_memory[1]);
        $display("Mem[2]  = %0d", cpu.Data_Mem.D_memory[2]);
        $display("Mem[3]  = %0d", cpu.Data_Mem.D_memory[3]);
        $display("Mem[6]  = %0d", cpu.Data_Mem.D_memory[6]);
        $display("Mem[13] = %0d", cpu.Data_Mem.D_memory[13]);
        
        // Test results verification
        $display("\n========================================");
        $display("       Test Results                     ");
        $display("========================================");
        
        if (cpu.Reg_file.RegFile[13] == 105)
            $display("✓ PASS: x13 = 105 (ADD x13,x16,x25 => 40+65)");
        else
            $display("✗ FAIL: x13 = %0d, expected 105", cpu.Reg_file.RegFile[13]);
            
        if (cpu.Reg_file.RegFile[5] == 32'hFFFFFFEA)  // -22 in 2's complement
            $display("✓ PASS: x5 = -22 (SUB x5,x8,x3 => 2-24)");
        else
            $display("✗ FAIL: x5 = %0d, expected -22", $signed(cpu.Reg_file.RegFile[5]));
            
        if (cpu.Reg_file.RegFile[1] == 0)
            $display("✓ PASS: x1 = 0 (AND x1,x2,x3 => 2&24)");
        else
            $display("✗ FAIL: x1 = %0d, expected 0", cpu.Reg_file.RegFile[1]);
            
        if (cpu.Reg_file.RegFile[4] == 32'hFFFFFFFE)  // -2
            $display("✓ PASS: x4 = -2 (OR x4,x3,x5 => 24|-22)");
        else
            $display("✗ FAIL: x4 = %0d, expected -2", $signed(cpu.Reg_file.RegFile[4]));
            
        if (cpu.Reg_file.RegFile[22] == 83)
            $display("✓ PASS: x22 = 83 (ADDI x22,x21,3 => 80+3)");
        else
            $display("✗ FAIL: x22 = %0d, expected 83", cpu.Reg_file.RegFile[22]);
            
        if (cpu.Reg_file.RegFile[9] == 3)
            $display("✓ PASS: x9 = 3 (ORI x9,x8,1 => 2|1)");
        else
            $display("✗ FAIL: x9 = %0d, expected 3", cpu.Reg_file.RegFile[9]);
        
        $display("\n========================================\n");
        
        $finish;
    end
    
    // Timeout watchdog
    initial begin
        #1000;
        $display("\n⚠ WARNING: Simulation timeout at %0t", $time);
        $finish;
    end
    
endmodule
