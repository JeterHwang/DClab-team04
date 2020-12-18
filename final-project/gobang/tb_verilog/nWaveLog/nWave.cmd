wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/PointGenerator.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x7b7ddf31"
wvGetSignalSetScope -win $_nWave1 "/PG_tb/PG"
wvGetSignalSetScope -win $_nWave1 "/PG_tb/Unnamed_\$PG_tb_sv_47"
wvGetSignalSetScope -win $_nWave1 "/PG_tb/PG"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/PG_tb/PG/finish_r} \
{/PG_tb/PG/finish_w} \
{/PG_tb/PG/i_clk} \
{/PG_tb/PG/i_rst_n} \
{/PG_tb/PG/i_start} \
{/PG_tb/PG/o_finish} \
{/PG_tb/PG/o_posX\[399:0\]} \
{/PG_tb/PG/o_posY\[399:0\]} \
{/PG_tb/PG/o_size\[8:0\]} \
{/PG_tb/PG/output_X\[399:0\]} \
{/PG_tb/PG/output_Y\[399:0\]} \
{/PG_tb/PG/state_r} \
{/PG_tb/PG/state_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/PG_tb/PG/finish_r} \
{/PG_tb/PG/finish_w} \
{/PG_tb/PG/i_clk} \
{/PG_tb/PG/i_rst_n} \
{/PG_tb/PG/i_start} \
{/PG_tb/PG/o_finish} \
{/PG_tb/PG/o_posX\[399:0\]} \
{/PG_tb/PG/o_posY\[399:0\]} \
{/PG_tb/PG/o_size\[8:0\]} \
{/PG_tb/PG/output_X\[399:0\]} \
{/PG_tb/PG/output_Y\[399:0\]} \
{/PG_tb/PG/state_r} \
{/PG_tb/PG/state_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x7b7ddf31"
wvGetSignalSetScope -win $_nWave1 "/PG_tb"
wvGetSignalSetScope -win $_nWave1 "/PG_tb/PG"
wvGetSignalSetScope -win $_nWave1 "/PG_tb"
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/PG_tb/PG/finish_r} \
{/PG_tb/PG/finish_w} \
{/PG_tb/PG/i_clk} \
{/PG_tb/PG/i_rst_n} \
{/PG_tb/PG/i_start} \
{/PG_tb/PG/o_finish} \
{/PG_tb/PG/o_posX\[399:0\]} \
{/PG_tb/PG/o_posY\[399:0\]} \
{/PG_tb/PG/o_size\[8:0\]} \
{/PG_tb/PG/output_X\[399:0\]} \
{/PG_tb/PG/output_Y\[399:0\]} \
{/PG_tb/PG/state_r} \
{/PG_tb/PG/state_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/PG_tb/PG_finish} \
{/PG_tb/X\[4:0\]} \
{/PG_tb/X_output\[399:0\]} \
{/PG_tb/Y\[4:0\]} \
{/PG_tb/Y_output\[399:0\]} \
{/PG_tb/buffer_size\[8:0\]} \
{/PG_tb/clk} \
{/PG_tb/fp_i\[31:0\]} \
{/PG_tb/fp_o\[31:0\]} \
{/PG_tb/rst_n} \
{/PG_tb/start} \
{/PG_tb/status\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/PG_tb/PG/finish_r} \
{/PG_tb/PG/finish_w} \
{/PG_tb/PG/i_clk} \
{/PG_tb/PG/i_rst_n} \
{/PG_tb/PG/i_start} \
{/PG_tb/PG/o_finish} \
{/PG_tb/PG/o_posX\[399:0\]} \
{/PG_tb/PG/o_posY\[399:0\]} \
{/PG_tb/PG/o_size\[8:0\]} \
{/PG_tb/PG/output_X\[399:0\]} \
{/PG_tb/PG/output_Y\[399:0\]} \
{/PG_tb/PG/state_r} \
{/PG_tb/PG/state_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/PG_tb/PG_finish} \
{/PG_tb/X\[4:0\]} \
{/PG_tb/X_output\[399:0\]} \
{/PG_tb/Y\[4:0\]} \
{/PG_tb/Y_output\[399:0\]} \
{/PG_tb/buffer_size\[8:0\]} \
{/PG_tb/clk} \
{/PG_tb/fp_i\[31:0\]} \
{/PG_tb/fp_o\[31:0\]} \
{/PG_tb/rst_n} \
{/PG_tb/start} \
{/PG_tb/status\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G2" 12)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 243.016802
