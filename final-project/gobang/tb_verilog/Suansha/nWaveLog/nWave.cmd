wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/Suansha/KillWrapper.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvZoom -win $_nWave1 0.000000 521.501408
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node1"
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 54)}
wvSetPosition -win $_nWave1 {("G1" 54)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 28 29 30 31 32 33 34 35 36 37 38 39 40 41 \
           42 43 44 45 46 47 48 49 50 51 52 53 54 )} 
wvSetPosition -win $_nWave1 {("G1" 54)}
wvSetPosition -win $_nWave1 {("G1" 54)}
wvSetPosition -win $_nWave1 {("G1" 54)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 28 29 30 31 32 33 34 35 36 37 38 39 40 41 \
           42 43 44 45 46 47 48 49 50 51 52 53 54 )} 
wvSetPosition -win $_nWave1 {("G1" 54)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvScrollUp -win $_nWave1 13
wvScrollDown -win $_nWave1 0
wvSetPosition -win $_nWave1 {("G1" 28)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 28)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 34)}
wvSetPosition -win $_nWave1 {("G1" 36)}
wvSetPosition -win $_nWave1 {("G1" 37)}
wvSetPosition -win $_nWave1 {("G1" 38)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 41)}
wvSetPosition -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSetPosition -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 51)}
wvSetPosition -win $_nWave1 {("G1" 53)}
wvSetPosition -win $_nWave1 {("G1" 54)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSetPosition -win $_nWave1 {("G2" 27)}
wvSelectSignal -win $_nWave1 {( "G2" 17 )} 
wvSelectSignal -win $_nWave1 {( "G2" 22 )} 
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvScrollDown -win $_nWave1 0
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node1"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node2"
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 27)}
wvSetPosition -win $_nWave1 {("G3" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TH_tb/SS/node2/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node2/X_buffer\[999:0\]} \
{/TH_tb/SS/node2/Y_buffer\[999:0\]} \
{/TH_tb/SS/node2/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node2/finish_r} \
{/TH_tb/SS/node2/finish_w} \
{/TH_tb/SS/node2/i_clk} \
{/TH_tb/SS/node2/i_depth\[4:0\]} \
{/TH_tb/SS/node2/i_next} \
{/TH_tb/SS/node2/i_rst_n} \
{/TH_tb/SS/node2/i_sha} \
{/TH_tb/SS/node2/i_start} \
{/TH_tb/SS/node2/next_start_r} \
{/TH_tb/SS/node2/next_start_w} \
{/TH_tb/SS/node2/o_finish} \
{/TH_tb/SS/node2/o_sha} \
{/TH_tb/SS/node2/o_start} \
{/TH_tb/SS/node2/pointer_r\[9:0\]} \
{/TH_tb/SS/node2/pointer_w\[9:0\]} \
{/TH_tb/SS/node2/result_r} \
{/TH_tb/SS/node2/result_w} \
{/TH_tb/SS/node2/state_r\[1:0\]} \
{/TH_tb/SS/node2/state_w\[1:0\]} \
{/TH_tb/SS/node2/threat_finish} \
{/TH_tb/SS/node2/turn} \
{/TH_tb/SS/node2/win_start} \
{/TH_tb/SS/node2/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 )} 
wvSetPosition -win $_nWave1 {("G3" 27)}
wvSetPosition -win $_nWave1 {("G3" 27)}
wvSetPosition -win $_nWave1 {("G3" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TH_tb/SS/node2/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node2/X_buffer\[999:0\]} \
{/TH_tb/SS/node2/Y_buffer\[999:0\]} \
{/TH_tb/SS/node2/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node2/finish_r} \
{/TH_tb/SS/node2/finish_w} \
{/TH_tb/SS/node2/i_clk} \
{/TH_tb/SS/node2/i_depth\[4:0\]} \
{/TH_tb/SS/node2/i_next} \
{/TH_tb/SS/node2/i_rst_n} \
{/TH_tb/SS/node2/i_sha} \
{/TH_tb/SS/node2/i_start} \
{/TH_tb/SS/node2/next_start_r} \
{/TH_tb/SS/node2/next_start_w} \
{/TH_tb/SS/node2/o_finish} \
{/TH_tb/SS/node2/o_sha} \
{/TH_tb/SS/node2/o_start} \
{/TH_tb/SS/node2/pointer_r\[9:0\]} \
{/TH_tb/SS/node2/pointer_w\[9:0\]} \
{/TH_tb/SS/node2/result_r} \
{/TH_tb/SS/node2/result_w} \
{/TH_tb/SS/node2/state_r\[1:0\]} \
{/TH_tb/SS/node2/state_w\[1:0\]} \
{/TH_tb/SS/node2/threat_finish} \
{/TH_tb/SS/node2/turn} \
{/TH_tb/SS/node2/win_start} \
{/TH_tb/SS/node2/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 )} 
wvSetPosition -win $_nWave1 {("G3" 27)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 20 )} 
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSelectSignal -win $_nWave1 {( "G3" 20 )} 
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 26)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 25)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 23)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 21)}
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node1"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node2"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node2/threat"
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TH_tb/SS/node2/finish_r} \
{/TH_tb/SS/node2/finish_w} \
{/TH_tb/SS/node2/i_next} \
{/TH_tb/SS/node2/i_rst_n} \
{/TH_tb/SS/node2/i_sha} \
{/TH_tb/SS/node2/i_start} \
{/TH_tb/SS/node2/next_start_r} \
{/TH_tb/SS/node2/next_start_w} \
{/TH_tb/SS/node2/o_finish} \
{/TH_tb/SS/node2/o_sha} \
{/TH_tb/SS/node2/o_start} \
{/TH_tb/SS/node2/result_r} \
{/TH_tb/SS/node2/result_w} \
{/TH_tb/SS/node2/state_r\[1:0\]} \
{/TH_tb/SS/node2/state_w\[1:0\]} \
{/TH_tb/SS/node2/threat_finish} \
{/TH_tb/SS/node2/turn} \
{/TH_tb/SS/node2/win_start} \
{/TH_tb/SS/node2/you_win} \
{/TH_tb/SS/node2/threat/i_clk} \
{/TH_tb/SS/node2/threat/o_win} \
{/TH_tb/SS/node2/threat/state_r} \
{/TH_tb/SS/node2/threat/state_w} \
{/TH_tb/SS/node2/threat/win_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 20 21 22 23 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node0/X_buffer\[999:0\]} \
{/TH_tb/SS/node0/Y_buffer\[999:0\]} \
{/TH_tb/SS/node0/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node0/finish_r} \
{/TH_tb/SS/node0/finish_w} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/next_start_w} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_sha} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[9:0\]} \
{/TH_tb/SS/node0/pointer_w\[9:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/result_w} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/state_w\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/turn} \
{/TH_tb/SS/node0/win_start} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/SS/node1/SZ_buffer\[9:0\]} \
{/TH_tb/SS/node1/X_buffer\[999:0\]} \
{/TH_tb/SS/node1/Y_buffer\[999:0\]} \
{/TH_tb/SS/node1/coor_1D_w\[9:0\]} \
{/TH_tb/SS/node1/finish_r} \
{/TH_tb/SS/node1/finish_w} \
{/TH_tb/SS/node1/i_clk} \
{/TH_tb/SS/node1/i_depth\[4:0\]} \
{/TH_tb/SS/node1/i_next} \
{/TH_tb/SS/node1/i_rst_n} \
{/TH_tb/SS/node1/i_sha} \
{/TH_tb/SS/node1/i_start} \
{/TH_tb/SS/node1/next_start_r} \
{/TH_tb/SS/node1/next_start_w} \
{/TH_tb/SS/node1/o_finish} \
{/TH_tb/SS/node1/o_sha} \
{/TH_tb/SS/node1/o_start} \
{/TH_tb/SS/node1/pointer_r\[9:0\]} \
{/TH_tb/SS/node1/pointer_w\[9:0\]} \
{/TH_tb/SS/node1/result_r} \
{/TH_tb/SS/node1/result_w} \
{/TH_tb/SS/node1/state_r\[1:0\]} \
{/TH_tb/SS/node1/state_w\[1:0\]} \
{/TH_tb/SS/node1/threat_finish} \
{/TH_tb/SS/node1/turn} \
{/TH_tb/SS/node1/win_start} \
{/TH_tb/SS/node1/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/TH_tb/SS/node2/finish_r} \
{/TH_tb/SS/node2/finish_w} \
{/TH_tb/SS/node2/i_next} \
{/TH_tb/SS/node2/i_rst_n} \
{/TH_tb/SS/node2/i_sha} \
{/TH_tb/SS/node2/i_start} \
{/TH_tb/SS/node2/next_start_r} \
{/TH_tb/SS/node2/next_start_w} \
{/TH_tb/SS/node2/o_finish} \
{/TH_tb/SS/node2/o_sha} \
{/TH_tb/SS/node2/o_start} \
{/TH_tb/SS/node2/result_r} \
{/TH_tb/SS/node2/result_w} \
{/TH_tb/SS/node2/state_r\[1:0\]} \
{/TH_tb/SS/node2/state_w\[1:0\]} \
{/TH_tb/SS/node2/threat_finish} \
{/TH_tb/SS/node2/turn} \
{/TH_tb/SS/node2/win_start} \
{/TH_tb/SS/node2/you_win} \
{/TH_tb/SS/node2/threat/i_clk} \
{/TH_tb/SS/node2/threat/o_win} \
{/TH_tb/SS/node2/threat/state_r} \
{/TH_tb/SS/node2/threat/state_w} \
{/TH_tb/SS/node2/threat/win_r} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 20 21 22 23 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 4
wvScrollDown -win $_nWave1 4
wvSelectSignal -win $_nWave1 {( "G3" 19 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 2
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 20 )} 
wvSetCursor -win $_nWave1 0.000000
wvSetCursor -win $_nWave1 1443.980922
wvSelectSignal -win $_nWave1 {( "G2" 15 )} 
wvSelectSignal -win $_nWave1 {( "G2" 18 )} 
wvSelectSignal -win $_nWave1 {( "G2" 18 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G2" 26 )} 
wvSelectSignal -win $_nWave1 {( "G2" 25 )} 
wvSelectSignal -win $_nWave1 {( "G2" 23 )} 
wvSelectSignal -win $_nWave1 {( "G2" 21 )} 
wvSelectSignal -win $_nWave1 {( "G2" 20 )} 
wvScrollUp -win $_nWave1 34
wvScrollDown -win $_nWave1 38
