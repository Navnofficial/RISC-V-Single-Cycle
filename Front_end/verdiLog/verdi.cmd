verdiSetActWin -dock widgetDock_<Decl._Tree>
wvCreateWindow
wvOpenFile -win $_nWave2 \
           {/home/vlsi/VLSI_Projects/RISC-V_Single_cycle/Front_end/ripple_wave.fsdb}
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "510" "169" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvCloseWindow -win $_nWave2
verdiOneSearch -tab "GUI Content"
verdiSetActWin -win $_OneSearch
verdiOneSearch -tab "DB/Log/Doc"
wvCreateWindow
verdiSetActWin -win $_nWave3
debLoadSimResult \
           /home/vlsi/VLSI_Projects/RISC-V_Single_cycle/Front_end/riscv.fsdb
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC_Adder"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvSetPosition -win $_nWave3 {("G1" 4)}
wvSetPosition -win $_nWave3 {("G1" 4)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/reset} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave3 {("G1" 4)}
wvGetSignalClose -win $_nWave3
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G2}
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave3 {("G1" 3)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSetCursor -win $_nWave3 3969.016064 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 3402.013769 -snap {("G2" 0)}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSetPosition -win $_nWave3 {("G1" 1)}
wvSetPosition -win $_nWave3 {("G1" 2)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 2)}
wvSelectGroup -win $_nWave3 {G2}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetCursor -win $_nWave3 4595.702811 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 6416.078600 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 17666.597820 -snap {("G1" 3)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 4 )} 
wvSelectSignal -win $_nWave3 {( "G1" 3 4 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSetCursor -win $_nWave3 7132.292025 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 18621.549053 -snap {("G1" 3)}
wvSetCursor -win $_nWave3 27305.636833 -snap {("G1" 3)}
wvSelectGroup -win $_nWave3 {G1}
wvSelectGroup -win $_nWave3 {G1}
wvRenameGroup -win $_nWave3 {G1} {Program Conter}
wvSelectGroup -win $_nWave3 {Program Conter}
wvSelectSignal -win $_nWave3 {( "Program Conter" 4 )} 
wvSelectSignal -win $_nWave3 {( "Program Conter" 4 )} 
wvSetPosition -win $_nWave3 {("Program Conter" 4)}
wvExpandBus -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
wvScrollUp -win $_nWave3 5
wvSelectGroup -win $_nWave3 {Program Conter}
wvSelectSignal -win $_nWave3 {( "Program Conter" 3 )} 
wvSetPosition -win $_nWave3 {("Program Conter" 3)}
wvExpandBus -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
wvScrollUp -win $_nWave3 4
wvSelectSignal -win $_nWave3 {( "Program Conter" 3 )} 
wvSelectSignal -win $_nWave3 {( "Program Conter" 3 )} 
wvSelectSignal -win $_nWave3 {( "Program Conter" 3 )} 
wvSetPosition -win $_nWave3 {("Program Conter" 3)}
wvCollapseBus -win $_nWave3
wvSetPosition -win $_nWave3 {("Program Conter" 3)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSelectSignal -win $_nWave3 {( "Program Conter" 4 )} 
wvSetPosition -win $_nWave3 {("Program Conter" 4)}
wvCollapseBus -win $_nWave3
wvSetPosition -win $_nWave3 {("Program Conter" 4)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSelectGroup -win $_nWave3 {G2}
wvRenameGroup -win $_nWave3 {G2} {Instrution Memory}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G3" \
}
wvSelectSignal -win $_nWave3 {( "Instrution Memory" 1 2 )} 
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvGetSignalClose -win $_nWave3
wvSetCursor -win $_nWave3 2118.922546 -snap {("G3" 0)}
wvSelectSignal -win $_nWave3 {( "Instrution Memory" 1 2 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSetCursor -win $_nWave3 9221.789673 -snap {("G3" 0)}
wvSelectSignal -win $_nWave3 {( "Instrution Memory" 1 )} 
wvSetCursor -win $_nWave3 19667.182507 -snap {("Instrution Memory" 2)}
wvSetCursor -win $_nWave3 27904.120855 -snap {("Instrution Memory" 2)}
wvSetCursor -win $_nWave3 17219.976186 -snap {("G3" 0)}
wvSelectGroup -win $_nWave3 {G3}
wvSelectSignal -win $_nWave3 {( "Instrution Memory" 2 )} 
wvSelectSignal -win $_nWave3 {( "Instrution Memory" 2 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSetPosition -win $_nWave3 {("Instrution Memory" 1)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Instrution Memory" 1)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 1)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Instrution Memory" 0)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 1)}
wvSetCursor -win $_nWave3 6655.207434 -snap {("G3" 0)}
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G3}
wvSelectGroup -win $_nWave3 {G3}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvSetPosition -win $_nWave3 {("G3" 7)}
wvSetPosition -win $_nWave3 {("G3" 7)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G3" \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "G3" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave3 {("G3" 7)}
wvSetPosition -win $_nWave3 {("G3" 7)}
wvSetPosition -win $_nWave3 {("G3" 7)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G3" \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "G3" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave3 {("G3" 7)}
wvGetSignalClose -win $_nWave3
wvSelectGroup -win $_nWave3 {G3}
wvRenameGroup -win $_nWave3 {G3} {Reg Flie}
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectSignal -win $_nWave3 {( "Reg Flie" 1 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 1 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSelectSignal -win $_nWave3 {( "Reg Flie" 2 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 3 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 4 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 5 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 4 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 5 )} 
wvSetCursor -win $_nWave3 28769.415028 -snap {("Reg Flie" 4)}
wvSelectSignal -win $_nWave3 {( "Reg Flie" 4 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 4 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSelectSignal -win $_nWave3 {( "Reg Flie" 5 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 5 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSelectSignal -win $_nWave3 {( "Reg Flie" 4 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 1 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 1 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSelectSignal -win $_nWave3 {( "Reg Flie" 1 )} 
wvSetPosition -win $_nWave3 {("Reg Flie" 1)}
wvSetPosition -win $_nWave3 {("Reg Flie" 2)}
wvSetPosition -win $_nWave3 {("Reg Flie" 3)}
wvSetPosition -win $_nWave3 {("Reg Flie" 4)}
wvSetPosition -win $_nWave3 {("Reg Flie" 5)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Reg Flie" 5)}
wvSelectSignal -win $_nWave3 {( "Reg Flie" 6 )} 
wvSetPosition -win $_nWave3 {("Reg Flie" 6)}
wvSetPosition -win $_nWave3 {("Reg Flie" 7)}
wvSetPosition -win $_nWave3 {("Reg Flie" 6)}
wvSetPosition -win $_nWave3 {("Reg Flie" 5)}
wvSetPosition -win $_nWave3 {("Reg Flie" 4)}
wvSetPosition -win $_nWave3 {("Reg Flie" 3)}
wvSetPosition -win $_nWave3 {("Reg Flie" 2)}
wvSetPosition -win $_nWave3 {("Reg Flie" 1)}
wvSetPosition -win $_nWave3 {("Reg Flie" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Reg Flie" 0)}
wvSetPosition -win $_nWave3 {("Reg Flie" 1)}
wvSelectGroup -win $_nWave3 {Reg Flie}
wvSetPosition -win $_nWave3 {("Reg Flie" 2)}
wvSetPosition -win $_nWave3 {("Reg Flie" 3)}
wvSetPosition -win $_nWave3 {("Reg Flie" 4)}
wvSetPosition -win $_nWave3 {("Reg Flie" 5)}
wvSetPosition -win $_nWave3 {("Reg Flie" 6)}
wvSetPosition -win $_nWave3 {("Reg Flie" 7)}
wvMoveSelected -win $_nWave3
wvSelectSignal -win $_nWave3 {( "Reg Flie" 1 )} 
wvSetPosition -win $_nWave3 {("Reg Flie" 1)}
wvSetPosition -win $_nWave3 {("Reg Flie" 2)}
wvSetPosition -win $_nWave3 {("Reg Flie" 3)}
wvSetPosition -win $_nWave3 {("Reg Flie" 4)}
wvSetPosition -win $_nWave3 {("Reg Flie" 5)}
wvSetPosition -win $_nWave3 {("Reg Flie" 6)}
wvSetPosition -win $_nWave3 {("Reg Flie" 7)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Reg Flie" 7)}
wvSelectGroup -win $_nWave3 {G4}
wvSelectSignal -win $_nWave3 {( "Reg Flie" 6 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 7 )} 
wvSelectSignal -win $_nWave3 {( "Reg Flie" 7 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSetCursor -win $_nWave3 29157.386761 -snap {("G4" 0)}
wvSetCursor -win $_nWave3 29097.698802 -snap {("Reg Flie" 7)}
wvSetCursor -win $_nWave3 29425.982577 -snap {("Reg Flie" 7)}
wvSelectGroup -win $_nWave3 {G4}
wvSelectGroup -win $_nWave3 {Reg Flie}
wvRenameGroup -win $_nWave3 {Reg Flie} {Reg File}
wvSelectGroup -win $_nWave3 {G4}
wvSelectSignal -win $_nWave3 {( "Instrution Memory" 2 )} 
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvSetPosition -win $_nWave3 {("Instrution Memory" 2)}
wvSetPosition -win $_nWave3 {("G5" 0)}
wvAddGroup -win $_nWave3 {G5}
wvRenameGroup -win $_nWave3 {G5} {Data memory}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Data memory" \
{/top_tb/cpu/Data_Mem/addr\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/mem_rd} -height 16 \
{/top_tb/cpu/Data_Mem/mem_wr} -height 16 \
{/top_tb/cpu/Data_Mem/rd_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/wr_data\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Reg File" \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G4" \
}
wvSelectSignal -win $_nWave3 {( "Data memory" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvGetSignalClose -win $_nWave3
wvSelectGroup -win $_nWave3 {G4}
wvSelectSignal -win $_nWave3 {( "Data memory" 5 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 1 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 1 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSelectSignal -win $_nWave3 {( "Data memory" 2 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 3 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 4 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 5 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 5 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSetCursor -win $_nWave3 29485.670536 -snap {("G4" 0)}
wvSelectSignal -win $_nWave3 {( "Reg File" 7 )} 
wvSetPosition -win $_nWave3 {("Reg File" 7)}
wvSetPosition -win $_nWave3 {("Reg File" 6)}
wvSetPosition -win $_nWave3 {("Reg File" 5)}
wvSetPosition -win $_nWave3 {("Reg File" 4)}
wvSetPosition -win $_nWave3 {("Reg File" 3)}
wvSetPosition -win $_nWave3 {("Reg File" 2)}
wvSetPosition -win $_nWave3 {("Reg File" 1)}
wvSetPosition -win $_nWave3 {("Reg File" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Reg File" 0)}
wvSetPosition -win $_nWave3 {("Reg File" 1)}
wvSelectSignal -win $_nWave3 {( "Reg File" 7 )} 
wvSetPosition -win $_nWave3 {("Reg File" 7)}
wvSetPosition -win $_nWave3 {("Reg File" 6)}
wvSetPosition -win $_nWave3 {("Reg File" 5)}
wvSetPosition -win $_nWave3 {("Reg File" 4)}
wvSetPosition -win $_nWave3 {("Reg File" 3)}
wvSetPosition -win $_nWave3 {("Reg File" 2)}
wvSetPosition -win $_nWave3 {("Reg File" 1)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Reg File" 1)}
wvSetPosition -win $_nWave3 {("Reg File" 2)}
wvSetCursor -win $_nWave3 28650.039110 -snap {("G4" 0)}
wvSelectSignal -win $_nWave3 {( "Data memory" 1 )} 
wvSetPosition -win $_nWave3 {("Data memory" 1)}
wvSetPosition -win $_nWave3 {("Data memory" 2)}
wvSetPosition -win $_nWave3 {("Data memory" 3)}
wvSetPosition -win $_nWave3 {("Data memory" 4)}
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvSelectSignal -win $_nWave3 {( "Data memory" 4 )} 
wvSetCursor -win $_nWave3 29873.642270 -snap {("Data memory" 5)}
wvSelectSignal -win $_nWave3 {( "Data memory" 4 )} 
wvSelectSignal -win $_nWave3 {( "Data memory" 5 )} 
wvSelectSignal -win $_nWave3 {( "Reg File" 7 )} 
wvSelectGroup -win $_nWave3 {G4}
wvSetPosition -win $_nWave3 {("G4" 0)}
wvSelectGroup -win $_nWave3 {G4}
wvRenameGroup -win $_nWave3 {G4} {ALU}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_top"
wvSetPosition -win $_nWave3 {("ALU" 5)}
wvSetPosition -win $_nWave3 {("ALU" 5)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Data memory" \
{/top_tb/cpu/Data_Mem/mem_rd} -height 16 \
{/top_tb/cpu/Data_Mem/mem_wr} -height 16 \
{/top_tb/cpu/Data_Mem/rd_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/addr\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Reg File" \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"ALU" \
{/top_tb/cpu/ALU_top/ALU_result\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/A\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/B\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/Crtl_in\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_top/zero} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G6" \
}
wvSelectSignal -win $_nWave3 {( "ALU" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave3 {("ALU" 5)}
wvGetSignalClose -win $_nWave3
wvSetCursor -win $_nWave3 29754.266352 -snap {("G6" 0)}
wvSelectGroup -win $_nWave3 {G6}
wvSelectSignal -win $_nWave3 {( "Reg File" 3 )} 
wvSetCursor -win $_nWave3 29008.166864 -snap {("Reg File" 3)}
wvSetCursor -win $_nWave3 28560.507171 -snap {("ALU" 2)}
wvSetCursor -win $_nWave3 27993.471560 -snap {("Reg File" 4)}
wvSelectSignal -win $_nWave3 {( "Reg File" 4 )} 
wvSetCursor -win $_nWave3 29097.698802 -snap {("ALU" 3)}
wvSelectSignal -win $_nWave3 {( "ALU" 4 )} 
wvSelectSignal -win $_nWave3 {( "ALU" 4 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSetCursor -win $_nWave3 28530.663191 -snap {("G6" 0)}
wvSetCursor -win $_nWave3 30858.493594 -snap {("ALU" 1)}
wvSelectSignal -win $_nWave3 {( "ALU" 1 )} 
wvSetCursor -win $_nWave3 27515.967888 -snap {("ALU" 1)}
wvSetCursor -win $_nWave3 30172.082065 -snap {("ALU" 1)}
wvSelectSignal -win $_nWave3 {( "ALU" 1 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSelectSignal -win $_nWave3 {( "Data memory" 4 )} 
wvSelectGroup -win $_nWave3 {Data memory}
wvSetPosition -win $_nWave3 {("Data memory" 0)}
wvSetPosition -win $_nWave3 {("Data memory" 1)}
wvSetPosition -win $_nWave3 {("Data memory" 2)}
wvSetPosition -win $_nWave3 {("Data memory" 3)}
wvSetPosition -win $_nWave3 {("Data memory" 4)}
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvSetPosition -win $_nWave3 {("Reg File" 0)}
wvSetPosition -win $_nWave3 {("Reg File" 1)}
wvSetPosition -win $_nWave3 {("Reg File" 2)}
wvSetPosition -win $_nWave3 {("Reg File" 3)}
wvSetPosition -win $_nWave3 {("Reg File" 4)}
wvSetPosition -win $_nWave3 {("Reg File" 5)}
wvSetPosition -win $_nWave3 {("Reg File" 6)}
wvSetPosition -win $_nWave3 {("Reg File" 7)}
wvSetPosition -win $_nWave3 {("ALU" 0)}
wvSetPosition -win $_nWave3 {("ALU" 1)}
wvSetPosition -win $_nWave3 {("ALU" 2)}
wvSetPosition -win $_nWave3 {("ALU" 3)}
wvSetPosition -win $_nWave3 {("ALU" 4)}
wvSetPosition -win $_nWave3 {("ALU" 5)}
wvSetPosition -win $_nWave3 {("G6" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvSetPosition -win $_nWave3 {("Data memory" 5)}
wvSelectGroup -win $_nWave3 {G6}
wvSelectGroup -win $_nWave3 {G6} {Data memory}
wvSelectGroup -win $_nWave3 {Data memory}
wvSetPosition -win $_nWave3 {("G6" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("ALU" 5)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("ALU" 5)}
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G6}
wvRenameGroup -win $_nWave3 {G6} {Control}
wvSetPosition -win $_nWave3 {("Control" 0)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ctrl_unit"
wvSetPosition -win $_nWave3 {("Control" 8)}
wvSetPosition -win $_nWave3 {("Control" 8)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Reg File" \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"ALU" \
{/top_tb/cpu/ALU_top/ALU_result\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/A\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/B\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/Crtl_in\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_top/zero} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Data memory" \
{/top_tb/cpu/Data_Mem/mem_rd} -height 16 \
{/top_tb/cpu/Data_Mem/mem_wr} -height 16 \
{/top_tb/cpu/Data_Mem/rd_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/addr\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Control" \
{/top_tb/cpu/ctrl_unit/ALU_op\[1:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/ALU_src} -height 16 \
{/top_tb/cpu/ctrl_unit/branch} -height 16 \
{/top_tb/cpu/ctrl_unit/instruction\[6:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_rd} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_to_reg} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_wr} -height 16 \
{/top_tb/cpu/ctrl_unit/reg_wr} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G7" \
}
wvSelectSignal -win $_nWave3 {( "Control" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave3 {("Control" 8)}
wvGetSignalClose -win $_nWave3
wvSelectSignal -win $_nWave3 {( "Control" 1 2 3 4 5 6 7 8 )} 
wvSetRadix -win $_nWave3 -format Bin
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G7}
wvSelectGroup -win $_nWave3 {G7}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ctrl_unit"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/immediate_gen"
wvSetPosition -win $_nWave3 {("Control" 11)}
wvSetPosition -win $_nWave3 {("Control" 11)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Reg File" \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"ALU" \
{/top_tb/cpu/ALU_top/ALU_result\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/A\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/B\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/Crtl_in\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_top/zero} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Data memory" \
{/top_tb/cpu/Data_Mem/mem_rd} -height 16 \
{/top_tb/cpu/Data_Mem/mem_wr} -height 16 \
{/top_tb/cpu/Data_Mem/rd_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/addr\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Control" \
{/top_tb/cpu/ctrl_unit/ALU_op\[1:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/ALU_src} -height 16 \
{/top_tb/cpu/ctrl_unit/branch} -height 16 \
{/top_tb/cpu/ctrl_unit/instruction\[6:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_rd} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_to_reg} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_wr} -height 16 \
{/top_tb/cpu/ctrl_unit/reg_wr} -height 16 \
{/top_tb/cpu/immediate_gen/immediate_ext\[31:0\]} -height 16 \
{/top_tb/cpu/immediate_gen/instruction\[31:0\]} -height 16 \
{/top_tb/cpu/immediate_gen/opcode\[6:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G7" \
}
wvSelectSignal -win $_nWave3 {( "Control" 9 10 11 )} 
wvSetPosition -win $_nWave3 {("Control" 11)}
wvGetSignalClose -win $_nWave3
wvSetPosition -win $_nWave3 {("Control" 9)}
wvSetPosition -win $_nWave3 {("Control" 10)}
wvSetPosition -win $_nWave3 {("Control" 11)}
wvSetPosition -win $_nWave3 {("G7" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G7" 3)}
wvSetPosition -win $_nWave3 {("G7" 3)}
wvSelectGroup -win $_nWave3 {G7}
wvRenameGroup -win $_nWave3 {G7} {Immediate Gen}
wvSelectSignal -win $_nWave3 {( "Immediate Gen" 3 )} 
wvSetPosition -win $_nWave3 {("Immediate Gen" 3)}
wvSetPosition -win $_nWave3 {("Immediate Gen" 3)}
wvSetPosition -win $_nWave3 {("G9" 0)}
wvAddGroup -win $_nWave3 {G9}
wvSelectGroup -win $_nWave3 {G9}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G9" 0)}
wvSelectGroup -win $_nWave3 {G8}
wvScrollDown -win $_nWave3 0
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ctrl_unit"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/immediate_gen"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux1_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux3_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux2_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux1_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux2_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux3_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/immediate_gen"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux2_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux1_top"
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_ctrl"
wvSetPosition -win $_nWave3 {("G9" 4)}
wvSetPosition -win $_nWave3 {("G9" 4)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Reg File" \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"ALU" \
{/top_tb/cpu/ALU_top/ALU_result\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/A\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/B\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/Crtl_in\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_top/zero} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Data memory" \
{/top_tb/cpu/Data_Mem/mem_rd} -height 16 \
{/top_tb/cpu/Data_Mem/mem_wr} -height 16 \
{/top_tb/cpu/Data_Mem/rd_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/addr\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Control" \
{/top_tb/cpu/ctrl_unit/ALU_op\[1:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/ALU_src} -height 16 \
{/top_tb/cpu/ctrl_unit/branch} -height 16 \
{/top_tb/cpu/ctrl_unit/instruction\[6:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_rd} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_to_reg} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_wr} -height 16 \
{/top_tb/cpu/ctrl_unit/reg_wr} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Immediate Gen" \
{/top_tb/cpu/immediate_gen/immediate_ext\[31:0\]} -height 16 \
{/top_tb/cpu/immediate_gen/instruction\[31:0\]} -height 16 \
{/top_tb/cpu/immediate_gen/opcode\[6:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G8" \
}
wvAddSignal -win $_nWave3 -group {"G9" \
{/top_tb/cpu/ALU_ctrl/ALU_op\[1:0\]} -height 16 \
{/top_tb/cpu/ALU_ctrl/Ctrl_out\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_ctrl/fun_3\[2:0\]} -height 16 \
{/top_tb/cpu/ALU_ctrl/fun_7} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G10" \
}
wvSelectSignal -win $_nWave3 {( "G9" 1 2 3 4 )} 
wvSetPosition -win $_nWave3 {("G9" 4)}
wvGetSignalClose -win $_nWave3
wvSelectGroup -win $_nWave3 {G9}
wvRenameGroup -win $_nWave3 {G9} {ALU Control}
wvSetPosition -win $_nWave3 {("ALU Control" 0)}
wvSetPosition -win $_nWave3 {("G8" 0)}
wvSetPosition -win $_nWave3 {("Immediate Gen" 3)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("Immediate Gen" 3)}
wvScrollUp -win $_nWave3 16
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 16
wvSelectGroup -win $_nWave3 {G8}
wvRenameGroup -win $_nWave3 {G8} {MUX}
wvSetPosition -win $_nWave3 {("MUX" 0)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ctrl_unit"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/immediate_gen"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_ctrl"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux1_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux2_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux3_top"
wvSetPosition -win $_nWave3 {("MUX" 12)}
wvSetPosition -win $_nWave3 {("MUX" 12)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"Program Conter" \
{/top_tb/cpu/PC/reset} -height 16 \
{/top_tb/cpu/PC/clk} -height 16 \
{/top_tb/cpu/PC/PC_in\[31:0\]} -height 16 \
{/top_tb/cpu/PC/PC_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Instrution Memory" \
{/top_tb/cpu/Inst_Mem/read_addr\[31:0\]} -height 16 \
{/top_tb/cpu/Inst_Mem/inst_out\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Reg File" \
{/top_tb/cpu/Reg_file/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/wr_en} -height 16 \
{/top_tb/cpu/Reg_file/read_data1\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/read_data2\[31:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs1\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rs2\[4:0\]} -height 16 \
{/top_tb/cpu/Reg_file/rd\[4:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"ALU" \
{/top_tb/cpu/ALU_top/ALU_result\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/A\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/B\[31:0\]} -height 16 \
{/top_tb/cpu/ALU_top/Crtl_in\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_top/zero} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Data memory" \
{/top_tb/cpu/Data_Mem/mem_rd} -height 16 \
{/top_tb/cpu/Data_Mem/mem_wr} -height 16 \
{/top_tb/cpu/Data_Mem/rd_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/wr_data\[31:0\]} -height 16 \
{/top_tb/cpu/Data_Mem/addr\[31:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Control" \
{/top_tb/cpu/ctrl_unit/ALU_op\[1:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/ALU_src} -height 16 \
{/top_tb/cpu/ctrl_unit/branch} -height 16 \
{/top_tb/cpu/ctrl_unit/instruction\[6:0\]} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_rd} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_to_reg} -height 16 \
{/top_tb/cpu/ctrl_unit/mem_wr} -height 16 \
{/top_tb/cpu/ctrl_unit/reg_wr} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"Immediate Gen" \
{/top_tb/cpu/immediate_gen/immediate_ext\[31:0\]} -height 16 \
{/top_tb/cpu/immediate_gen/instruction\[31:0\]} -height 16 \
{/top_tb/cpu/immediate_gen/opcode\[6:0\]} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"ALU Control" \
{/top_tb/cpu/ALU_ctrl/ALU_op\[1:0\]} -height 16 \
{/top_tb/cpu/ALU_ctrl/Ctrl_out\[3:0\]} -height 16 \
{/top_tb/cpu/ALU_ctrl/fun_3\[2:0\]} -height 16 \
{/top_tb/cpu/ALU_ctrl/fun_7} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"MUX" \
{/top_tb/cpu/mux1_top/A1\[31:0\]} -height 16 \
{/top_tb/cpu/mux1_top/B1\[31:0\]} -height 16 \
{/top_tb/cpu/mux1_top/mux_op1\[31:0\]} -height 16 \
{/top_tb/cpu/mux1_top/sel1} -height 16 \
{/top_tb/cpu/mux2_top/A2\[31:0\]} -height 16 \
{/top_tb/cpu/mux2_top/B2\[31:0\]} -height 16 \
{/top_tb/cpu/mux2_top/mux_op2\[31:0\]} -height 16 \
{/top_tb/cpu/mux2_top/sel2} -height 16 \
{/top_tb/cpu/mux3_top/A3\[31:0\]} -height 16 \
{/top_tb/cpu/mux3_top/B3\[31:0\]} -height 16 \
{/top_tb/cpu/mux3_top/mux_op3\[31:0\]} -height 16 \
{/top_tb/cpu/mux3_top/sel3} -height 16 \
}
wvAddSignal -win $_nWave3 -group {"G10" \
}
wvSelectSignal -win $_nWave3 {( "MUX" 9 10 11 12 )} 
wvSetPosition -win $_nWave3 {("MUX" 12)}
wvGetSignalClose -win $_nWave3
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSelectGroup -win $_nWave3 {G10}
wvSetPosition -win $_nWave3 {("G10" 0)}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/top_tb"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_ctrl"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ALU_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Data_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Inst_Mem"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/Reg_file"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/ctrl_unit"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/immediate_gen"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/mux3_top"
wvGetSignalSetScope -win $_nWave3 "/top_tb/cpu/PC_Adder"
wvGetSignalClose -win $_nWave3
wvSelectGroup -win $_nWave3 {G10}
wvSelectGroup -win $_nWave3 {G10}
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("MUX" 12)}
wvSetPosition -win $_nWave3 {("MUX" 12)}
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetOptions -win $_nWave3 -hierName on
wvSetOptions -win $_nWave3 -hierName off
wvSetOptions -win $_nWave3 -leadingZeros on
wvSetOptions -win $_nWave3 -cursorMarkerValue on
wvSetOptions -win $_nWave3 -displayGridLine on
wvZoomAll -win $_nWave3
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 14
wvCapture -win $_nWave3 -file \
          "/home/vlsi/VLSI_Projects/RISC-V_Single_cycle/Front_end/Wave_form.png"
verdiCloseDialog -win $_nWave3 -widget capturePreview
wvScrollDown -win $_nWave3 14
wvSelectSignal -win $_nWave3 {( "MUX" 1 )} 
wvSelectSignal -win $_nWave3 {( "MUX" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave3 {( "MUX" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetRadix -win $_nWave3 -format Bin
wvSelectSignal -win $_nWave3 {( "MUX" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetRadix -win $_nWave3 -format UDec
wvSetCursor -win $_nWave3 18638.990268 -snap {("MUX" 12)}
wvSelectGroup -win $_nWave3 {G10}
wvSelectSignal -win $_nWave3 {( "MUX" 12 )} 
wvSetCursor -win $_nWave3 15193.126521 -snap {("G10" 0)}
wvScrollUp -win $_nWave3 16
verdiDockWidgetHide -dock widgetDock_<Inst._Tree>
verdiDockWidgetHide -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetMaximize -dock windowDock_nWave_3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvResizeWindow -win $_nWave3 0 11 1920 801
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 0 32 1920 802
wvResizeWindow -win $_nWave3 0 32 1920 810
wvResizeWindow -win $_nWave3 0 32 1920 813
wvResizeWindow -win $_nWave3 0 32 1920 823
wvResizeWindow -win $_nWave3 0 32 1920 836
wvResizeWindow -win $_nWave3 0 32 1920 843
wvResizeWindow -win $_nWave3 0 32 1920 855
wvResizeWindow -win $_nWave3 0 32 1920 865
wvResizeWindow -win $_nWave3 0 32 1920 872
wvResizeWindow -win $_nWave3 0 32 1920 885
wvResizeWindow -win $_nWave3 0 32 1920 896
wvResizeWindow -win $_nWave3 0 32 1920 908
wvResizeWindow -win $_nWave3 0 32 1920 917
wvResizeWindow -win $_nWave3 0 32 1920 932
wvResizeWindow -win $_nWave3 0 32 1920 951
wvResizeWindow -win $_nWave3 0 32 1920 970
wvResizeWindow -win $_nWave3 0 32 1920 981
wvResizeWindow -win $_nWave3 0 32 1920 998
wvResizeWindow -win $_nWave3 0 32 1920 1005
wvResizeWindow -win $_nWave3 0 32 1920 1010
wvResizeWindow -win $_nWave3 0 32 1920 1017
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvScrollDown -win $_nWave3 0
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvScrollDown -win $_nWave3 3
wvScrollDown -win $_nWave3 5
wvScrollDown -win $_nWave3 4
wvScrollUp -win $_nWave3 4
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvSetMarker -win $_nWave3 -keepViewRange -name "M1" 10184.230
wvSetMarker -win $_nWave3 -keepViewRange -name "M1" 10184.23
wvSelectUserMarker -win $_nWave3 -name "M1"
wvSetMarker -win $_nWave3 -keepViewRange -name "M1" 13944.561
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G10" 0)}
wvSetPosition -win $_nWave3 {("MUX" 11)}
wvSelectGroup -win $_nWave3 {Program Conter}
wvDeleteMarker -win $_nWave3 -all
wvScrollDown -win $_nWave3 0
wvCapture -win $_nWave3
verdiCloseDialog -win $_nWave3 -widget capturePreview
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 11
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
verdiCloseDialog -win $_nWave3 -widget capturePreview
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvScrollDown -win $_nWave3 0
wvCapture -win $_nWave3
verdiCloseDialog -win $_nWave3 -widget capturePreview
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 17
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvCloseGetStreamsDialog -win $_nWave3
wvAttrOrderConfigDlg -win $_nWave3 -close
wvCloseDetailsViewDlg -win $_nWave3
wvCloseDetailsViewDlg -win $_nWave3 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave3
wvGetSignalClose -win $_nWave3
wvResizeWindow -win $_nWave3 0 32 1920 1021
wvCloseWindow -win $_nWave3
verdiSetActWin -win $_OneSearch
debExit
