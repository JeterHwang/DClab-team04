wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/Suansha/Threats.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x46f3d8ec"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/TH_finish} \
{/TH_tb/X\[3:0\]} \
{/TH_tb/X_output\[49:0\]} \
{/TH_tb/Y\[3:0\]} \
{/TH_tb/Y_output\[49:0\]} \
{/TH_tb/buffer_pointer\[5:0\]} \
{/TH_tb/clk} \
{/TH_tb/fp_i\[31:0\]} \
{/TH_tb/fp_o\[31:0\]} \
{/TH_tb/rst_n} \
{/TH_tb/start} \
{/TH_tb/status\[31:0\]} \
{/TH_tb/win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/TH_finish} \
{/TH_tb/X\[3:0\]} \
{/TH_tb/X_output\[49:0\]} \
{/TH_tb/Y\[3:0\]} \
{/TH_tb/Y_output\[49:0\]} \
{/TH_tb/buffer_pointer\[5:0\]} \
{/TH_tb/clk} \
{/TH_tb/fp_i\[31:0\]} \
{/TH_tb/fp_o\[31:0\]} \
{/TH_tb/rst_n} \
{/TH_tb/start} \
{/TH_tb/status\[31:0\]} \
{/TH_tb/win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x46f3d8ec"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/TH"
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/TH_finish} \
{/TH_tb/X\[3:0\]} \
{/TH_tb/X_output\[49:0\]} \
{/TH_tb/Y\[3:0\]} \
{/TH_tb/Y_output\[49:0\]} \
{/TH_tb/buffer_pointer\[5:0\]} \
{/TH_tb/clk} \
{/TH_tb/fp_i\[31:0\]} \
{/TH_tb/fp_o\[31:0\]} \
{/TH_tb/rst_n} \
{/TH_tb/start} \
{/TH_tb/status\[31:0\]} \
{/TH_tb/win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/TH/finish_r} \
{/TH_tb/TH/finish_w} \
{/TH_tb/TH/i_clk} \
{/TH_tb/TH/i_rst_n} \
{/TH_tb/TH/i_start} \
{/TH_tb/TH/i_turn} \
{/TH_tb/TH/o_finish} \
{/TH_tb/TH/o_posX\[49:0\]} \
{/TH_tb/TH/o_posY\[49:0\]} \
{/TH_tb/TH/o_size\[5:0\]} \
{/TH_tb/TH/o_win\[1:0\]} \
{/TH_tb/TH/output_X\[49:0\]} \
{/TH_tb/TH/output_Y\[49:0\]} \
{/TH_tb/TH/state_r} \
{/TH_tb/TH/state_w} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/TH_finish} \
{/TH_tb/X\[3:0\]} \
{/TH_tb/X_output\[49:0\]} \
{/TH_tb/Y\[3:0\]} \
{/TH_tb/Y_output\[49:0\]} \
{/TH_tb/buffer_pointer\[5:0\]} \
{/TH_tb/clk} \
{/TH_tb/fp_i\[31:0\]} \
{/TH_tb/fp_o\[31:0\]} \
{/TH_tb/rst_n} \
{/TH_tb/start} \
{/TH_tb/status\[31:0\]} \
{/TH_tb/win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/TH_tb/TH/finish_r} \
{/TH_tb/TH/finish_w} \
{/TH_tb/TH/i_clk} \
{/TH_tb/TH/i_rst_n} \
{/TH_tb/TH/i_start} \
{/TH_tb/TH/i_turn} \
{/TH_tb/TH/o_finish} \
{/TH_tb/TH/o_posX\[49:0\]} \
{/TH_tb/TH/o_posY\[49:0\]} \
{/TH_tb/TH/o_size\[5:0\]} \
{/TH_tb/TH/o_win\[1:0\]} \
{/TH_tb/TH/output_X\[49:0\]} \
{/TH_tb/TH/output_Y\[49:0\]} \
{/TH_tb/TH/state_r} \
{/TH_tb/TH/state_w} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSelectGroup -win $_nWave1 {G3}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x46f3d8ec"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/TH"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 10 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 451.969578
