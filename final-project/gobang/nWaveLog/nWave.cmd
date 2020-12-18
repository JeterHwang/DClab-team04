wvResizeWindow -win $_nWave1 79 236 1840 1016
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/PointGenerator.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x7b7ddf31"
wvGetSignalSetScope -win $_nWave1 "/PG_tb"
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
wvResizeWindow -win $_nWave1 79 236 1840 1016
wvSelectGroup -win $_nWave1 {G2}
