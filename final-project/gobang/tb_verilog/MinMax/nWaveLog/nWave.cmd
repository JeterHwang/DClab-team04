wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/MinMax/MinmaxWrapper.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x3fc05dde"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 8 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 8 9 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 8 9 13 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x3fc05dde"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 8 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 8 9 12 )} 
wvSelectSignal -win $_nWave1 {( "G2" 8 9 12 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x3fc05dde"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 14 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x3fc05dde"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 14 17 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 17)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x3fc05dde"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 14 )} 
wvSetCursor -win $_nWave1 203783.751179
wvSetCursor -win $_nWave1 203095.835297
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 3
wvScrollDown -win $_nWave1 0
wvSetPosition -win $_nWave1 {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 2
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 3
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 0
wvZoom -win $_nWave1 120.341788 23948.015853
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 9 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 3 9 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 3 9 10 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 3 9 10 14 )} {( "G3" 9 )} \
           
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 3 9 10 14 )} {( "G3" 8 9 )} \
           
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 3 9 10 14 )} {( "G3" 8 9 12 \
           )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 9 )} {( "G2" 3 9 10 14 )} {( "G3" 8 9 12 \
           )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSetCursor -win $_nWave1 5339.911890
wvScrollDown -win $_nWave1 3
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 3
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/Ilose} \
{/minmax_tb/minmax/minmax2/Iwin} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/Ilose} \
{/minmax_tb/minmax/minmax2/Iwin} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x1b0524c1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/checkIlose"
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/Ilose} \
{/minmax_tb/minmax/minmax2/Iwin} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/checkIlose/i_turn} \
{/minmax_tb/minmax/minmax2/checkIlose/o_win} \
{/minmax_tb/minmax/minmax2/checkIlose/score_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_up} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_right} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/Ilose} \
{/minmax_tb/minmax/minmax2/Iwin} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/checkIlose/i_turn} \
{/minmax_tb/minmax/minmax2/checkIlose/o_win} \
{/minmax_tb/minmax/minmax2/checkIlose/score_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_up} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_right} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x1b0524c1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/checkIlose"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 )} 
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 2
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 7 )} 
wvScrollDown -win $_nWave1 2
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 11
wvScrollDown -win $_nWave1 4
wvScrollUp -win $_nWave1 4
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/Ilose} \
{/minmax_tb/minmax/minmax1/Iwin} \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/Ilose} \
{/minmax_tb/minmax/minmax2/Iwin} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/checkIlose/i_turn} \
{/minmax_tb/minmax/minmax2/checkIlose/o_win} \
{/minmax_tb/minmax/minmax2/checkIlose/score_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_up} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_right} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/Ilose} \
{/minmax_tb/minmax/minmax1/Iwin} \
{/minmax_tb/minmax/minmax1/i_clk} \
{/minmax_tb/minmax/minmax1/SC_finish} \
{/minmax_tb/minmax/minmax1/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/i_rst_n} \
{/minmax_tb/minmax/minmax1/i_start} \
{/minmax_tb/minmax/minmax1/next_start_r} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/turn} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/Ilose} \
{/minmax_tb/minmax/minmax2/Iwin} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax2/finish_r} \
{/minmax_tb/minmax/minmax2/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax2/i_rst_n} \
{/minmax_tb/minmax/minmax2/i_start} \
{/minmax_tb/minmax/minmax2/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax2/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/turn} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/checkIlose/i_turn} \
{/minmax_tb/minmax/minmax2/checkIlose/o_win} \
{/minmax_tb/minmax/minmax2/checkIlose/score_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_up} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_left} \
{/minmax_tb/minmax/minmax2/checkIlose/score_upper_right} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/Suansha/KillWrapper.fsdb}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 )} {( "G4" 1 2 3 4 5 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/state_r\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/state_r\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 2741154090.044388
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 44469.236842 45784.894737
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 9589.684211 43884.500000
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 44293.815789 45697.184211
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/Xpos_w} \
{/TH_tb/SS/node0/Ypos_w} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/Xpos_r} \
{/TH_tb/SS/node0/Ypos_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetCursor -win $_nWave1 45023.800823 -snap {("G5" 0)}
