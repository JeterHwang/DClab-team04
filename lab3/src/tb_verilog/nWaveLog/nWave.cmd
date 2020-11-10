wvResizeWindow -win $_nWave1 79 236 1840 1016
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/lab3/src/tb_verilog/LCD.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/LCD_tb"
wvGetSignalSetScope -win $_nWave1 "/LCD_tb/LCD"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/LCD_tb/LCD/i_clk_800k} \
{/LCD_tb/LCD/i_rst_n} \
{/LCD_tb/LCD/i_start} \
{/LCD_tb/LCD/inst_start_r} \
{/LCD_tb/LCD/o_init_finish} \
{/LCD_tb/LCD/state_r\[2:0\]} \
{/LCD_tb/LCD/write_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/LCD_tb/LCD/i_clk_800k} \
{/LCD_tb/LCD/i_rst_n} \
{/LCD_tb/LCD/i_start} \
{/LCD_tb/LCD/inst_start_r} \
{/LCD_tb/LCD/o_init_finish} \
{/LCD_tb/LCD/state_r\[2:0\]} \
{/LCD_tb/LCD/write_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 275229.638702
wvZoom -win $_nWave1 0.000000 18554.807103
wvResizeWindow -win $_nWave1 79 236 1840 1016
wvResizeWindow -win $_nWave1 79 236 1840 1016
wvSelectGroup -win $_nWave1 {G2}
