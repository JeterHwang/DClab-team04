wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/Suansha/Threats.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x46f3d8ec"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/TH"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/TH/cnt_r\[3:0\]} \
{/TH_tb/TH/defense_four_X_r\[499:0\]} \
{/TH_tb/TH/defense_four_Y_r\[499:0\]} \
{/TH_tb/TH/defense_three_X_r\[499:0\]} \
{/TH_tb/TH/defense_three_Y_r\[499:0\]} \
{/TH_tb/TH/final_X_r\[499:0\]} \
{/TH_tb/TH/final_Y_r\[499:0\]} \
{/TH_tb/TH/final_pointer_r\[8:0\]} \
{/TH_tb/TH/final_win_r} \
{/TH_tb/TH/finish_r} \
{/TH_tb/TH/i_clk} \
{/TH_tb/TH/i_rst_n} \
{/TH_tb/TH/i_start} \
{/TH_tb/TH/i_turn} \
{/TH_tb/TH/normal_X_r\[499:0\]} \
{/TH_tb/TH/normal_Y_r\[499:0\]} \
{/TH_tb/TH/pointer_four_r\[8:0\]} \
{/TH_tb/TH/pointer_normal_r\[8:0\]} \
{/TH_tb/TH/pointer_three_r\[8:0\]} \
{/TH_tb/TH/state_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/TH/cnt_r\[3:0\]} \
{/TH_tb/TH/defense_four_X_r\[499:0\]} \
{/TH_tb/TH/defense_four_Y_r\[499:0\]} \
{/TH_tb/TH/defense_three_X_r\[499:0\]} \
{/TH_tb/TH/defense_three_Y_r\[499:0\]} \
{/TH_tb/TH/final_X_r\[499:0\]} \
{/TH_tb/TH/final_Y_r\[499:0\]} \
{/TH_tb/TH/final_pointer_r\[8:0\]} \
{/TH_tb/TH/final_win_r} \
{/TH_tb/TH/finish_r} \
{/TH_tb/TH/i_clk} \
{/TH_tb/TH/i_rst_n} \
{/TH_tb/TH/i_start} \
{/TH_tb/TH/i_turn} \
{/TH_tb/TH/normal_X_r\[499:0\]} \
{/TH_tb/TH/normal_Y_r\[499:0\]} \
{/TH_tb/TH/pointer_four_r\[8:0\]} \
{/TH_tb/TH/pointer_normal_r\[8:0\]} \
{/TH_tb/TH/pointer_three_r\[8:0\]} \
{/TH_tb/TH/state_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 38.835211 1104.029577
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 19 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomAll -win $_nWave1
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
