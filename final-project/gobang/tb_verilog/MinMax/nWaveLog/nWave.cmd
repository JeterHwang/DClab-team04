wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/MinMax/MinmaxNode.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x59f5ad1c"
wvGetSignalSetScope -win $_nWave1 "/minmaxnode_tb/minmax"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmaxnode_tb/minmax/SC_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmaxnode_tb/minmax/SC_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x59f5ad1c"
wvGetSignalSetScope -win $_nWave1 "/minmaxnode_tb"
wvGetSignalSetScope -win $_nWave1 "/minmaxnode_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmaxnode_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmaxnode_tb/minmax/score"
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmaxnode_tb/minmax/SC_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmaxnode_tb/minmax/score/black_score_r\[31:0\]} \
{/minmaxnode_tb/minmax/score/black_score_w\[31:0\]} \
{/minmaxnode_tb/minmax/score/finished_r} \
{/minmaxnode_tb/minmax/score/finished_w} \
{/minmaxnode_tb/minmax/score/i_clk} \
{/minmaxnode_tb/minmax/score/i_rst_n} \
{/minmaxnode_tb/minmax/score/i_start} \
{/minmaxnode_tb/minmax/score/i_turn} \
{/minmaxnode_tb/minmax/score/o_finish} \
{/minmaxnode_tb/minmax/score/o_score\[31:0\]} \
{/minmaxnode_tb/minmax/score/score_r\[31:0\]} \
{/minmaxnode_tb/minmax/score/score_w\[31:0\]} \
{/minmaxnode_tb/minmax/score/state_r\[7:0\]} \
{/minmaxnode_tb/minmax/score/state_w\[7:0\]} \
{/minmaxnode_tb/minmax/score/white_score_r\[31:0\]} \
{/minmaxnode_tb/minmax/score/white_score_w\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )} \
           
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmaxnode_tb/minmax/SC_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmaxnode_tb/minmax/score/black_score_r\[31:0\]} \
{/minmaxnode_tb/minmax/score/black_score_w\[31:0\]} \
{/minmaxnode_tb/minmax/score/finished_r} \
{/minmaxnode_tb/minmax/score/finished_w} \
{/minmaxnode_tb/minmax/score/i_clk} \
{/minmaxnode_tb/minmax/score/i_rst_n} \
{/minmaxnode_tb/minmax/score/i_start} \
{/minmaxnode_tb/minmax/score/i_turn} \
{/minmaxnode_tb/minmax/score/o_finish} \
{/minmaxnode_tb/minmax/score/o_score\[31:0\]} \
{/minmaxnode_tb/minmax/score/score_r\[31:0\]} \
{/minmaxnode_tb/minmax/score/score_w\[31:0\]} \
{/minmaxnode_tb/minmax/score/state_r\[7:0\]} \
{/minmaxnode_tb/minmax/score/state_w\[7:0\]} \
{/minmaxnode_tb/minmax/score/white_score_r\[31:0\]} \
{/minmaxnode_tb/minmax/score/white_score_w\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )} \
           
wvSetPosition -win $_nWave1 {("G2" 16)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 10 )} 
wvSelectSignal -win $_nWave1 {( "G2" 10 )} 
wvSetRadix -win $_nWave1 -format UDec
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/MinMax/MinmaxWrapper.fsdb}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 \
           14 15 16 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 735.404249
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 21 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 28 )} 
wvSelectSignal -win $_nWave1 {( "G1" 28 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 19 20 21 22 23 24 25 26 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 28 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 25 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 25 27 )} 
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 29 )} 
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 28)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 0.000000 159473.684211
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvZoom -win $_nWave1 0.000000 33944.197844
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax0/turn} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 32 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 2 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 46998.909688 49321.519585
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 84540.266328
wvZoom -win $_nWave1 0.000000 16651.870640
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvZoom -win $_nWave1 58281.547242 215193.405200
wvSetCursor -win $_nWave1 35225.110970
wvZoom -win $_nWave1 19213.696893 37146.480659
wvZoom -win $_nWave1 19844.102349 22838.528263
wvSetCursor -win $_nWave1 20642.897887 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 22360.980301
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/SC_start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
{/minmax_tb/minmax/minmax2/SC_start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 20293.266236 834440.768865
wvZoom -win $_nWave1 0.000000 323959.357324
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 0.000000 87853.385037
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 4136.223401
wvSetPosition -win $_nWave1 {("G4" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 9540.888645
wvSetCursor -win $_nWave1 9540.888645
wvZoom -win $_nWave1 6728.256732 30828.651749
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 2 )} 
wvSetPosition -win $_nWave1 {("G4" 2)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 19 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 7
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 29 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 168099.213795 1468411.492391
wvScrollDown -win $_nWave1 9
wvScrollDown -win $_nWave1 0
wvSetPosition -win $_nWave1 {("G4" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 18429.617945 498194.188332
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSetPosition -win $_nWave1 {("G4" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 809836.217612
wvSetCursor -win $_nWave1 823991.230046
wvSetCursor -win $_nWave1 831520.491980
wvSetCursor -win $_nWave1 576127.927204
wvSetPosition -win $_nWave1 {("G2" 4)}
wvScrollUp -win $_nWave1 5
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvZoom -win $_nWave1 0.000000 122576.384273
wvZoom -win $_nWave1 118209.707073 134984.127520
wvScrollUp -win $_nWave1 5
wvScrollUp -win $_nWave1 2
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 19 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 19 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 12 19 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 12 19 20 30 )} 
wvScrollUp -win $_nWave1 4
wvScrollDown -win $_nWave1 7
wvSetPosition -win $_nWave1 {("G2" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1/score"
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1/score"
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/score/i_turn} \
{/minmax_tb/minmax/minmax1/score/black_score_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/score/black_score_w\[31:0\]} \
{/minmax_tb/minmax/minmax1/score/finished_r} \
{/minmax_tb/minmax/minmax1/score/finished_w} \
{/minmax_tb/minmax/minmax1/score/i_clk} \
{/minmax_tb/minmax/minmax1/score/i_rst_n} \
{/minmax_tb/minmax/minmax1/score/i_start} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 13 14 15 16 17 18 )} 
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/score/i_turn} \
{/minmax_tb/minmax/minmax1/score/black_score_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/score/black_score_w\[31:0\]} \
{/minmax_tb/minmax/minmax1/score/finished_r} \
{/minmax_tb/minmax/minmax1/score/finished_w} \
{/minmax_tb/minmax/minmax1/score/i_clk} \
{/minmax_tb/minmax/minmax1/score/i_rst_n} \
{/minmax_tb/minmax/minmax1/score/i_start} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 13 14 15 16 17 18 )} 
wvSetPosition -win $_nWave1 {("G2" 18)}
wvGetSignalClose -win $_nWave1
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x08857817"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax0"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax2/score"
wvGetSignalSetScope -win $_nWave1 "/minmax_tb/minmax/minmax1"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/minmax_tb/minmax/minmax0/PG_finish} \
{/minmax_tb/minmax/minmax0/PG_start_r} \
{/minmax_tb/minmax/minmax0/SC_finish} \
{/minmax_tb/minmax/minmax0/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax0/SC_start_r} \
{/minmax_tb/minmax/minmax0/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax0/X_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/Y_buffer\[399:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_x_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_w\[3:0\]} \
{/minmax_tb/minmax/minmax0/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/cand_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax0/finish_r} \
{/minmax_tb/minmax/minmax0/finish_w} \
{/minmax_tb/minmax/minmax0/i_clk} \
{/minmax_tb/minmax/minmax0/i_depth\[4:0\]} \
{/minmax_tb/minmax/minmax0/i_next} \
{/minmax_tb/minmax/minmax0/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_prev_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/i_rst_n} \
{/minmax_tb/minmax/minmax0/i_start} \
{/minmax_tb/minmax/minmax0/next_start_r} \
{/minmax_tb/minmax/minmax0/o_Xpos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_Ypos\[3:0\]} \
{/minmax_tb/minmax/minmax0/o_finish} \
{/minmax_tb/minmax/minmax0/o_point\[31:0\]} \
{/minmax_tb/minmax/minmax0/o_start} \
{/minmax_tb/minmax/minmax0/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax0/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax0/pruning} \
{/minmax_tb/minmax/minmax0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/minmax_tb/minmax/minmax1/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax1/i_next} \
{/minmax_tb/minmax/minmax1/i_point\[31:0\]} \
{/minmax_tb/minmax/minmax1/SZ_buffer\[8:0\]} \
{/minmax_tb/minmax/minmax1/pointer_r\[8:0\]} \
{/minmax_tb/minmax/minmax1/point_r\[31:0\]} \
{/minmax_tb/minmax/minmax1/finish_r} \
{/minmax_tb/minmax/minmax1/ans_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/ans_y_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_x_r\[3:0\]} \
{/minmax_tb/minmax/minmax1/cand_y_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/minmax_tb/minmax/minmax2/state_r\[2:0\]} \
{/minmax_tb/minmax/minmax2/SC_finish} \
{/minmax_tb/minmax/minmax2/SC_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/SC_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/minmax_tb/minmax/minmax2/score/o_score\[31:0\]} \
{/minmax_tb/minmax/minmax2/score/state_r\[7:0\]} \
{/minmax_tb/minmax/minmax2/score/i_turn} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 0
wvZoom -win $_nWave1 12577385.833228 17951863.480025
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvExit
