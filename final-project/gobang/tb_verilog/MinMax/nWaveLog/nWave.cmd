wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/MinMax/Minmax.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvZoom -win $_nWave1 1798.856209 2950.784314
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_clk} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_clk} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_clk} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 10 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_clk} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 10 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x168237bd"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0/score"
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_clk} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
{/minmax_tb/minmax/minmax0/score/o_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/i_clk} \
{/minmax_tb/minmax/i_depth\[4:0\]} \
{/minmax_tb/minmax/i_rst_n} \
{/minmax_tb/minmax/i_start} \
{/minmax_tb/minmax/o_Xpos\[4:0\]} \
{/minmax_tb/minmax/o_Ypos\[4:0\]} \
{/minmax_tb/minmax/o_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax0/score/finished_r} \
{/minmax_tb/minmax/minmax0/score/score_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/score/state_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/state_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/score/i_clk} \
{/minmax_tb/minmax/minmax0/score/i_rst_n} \
{/minmax_tb/minmax/minmax0/score/i_start} \
{/minmax_tb/minmax/minmax0/score/i_turn} \
{/minmax_tb/minmax/minmax0/score/o_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
