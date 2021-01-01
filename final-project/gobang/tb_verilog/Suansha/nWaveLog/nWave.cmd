wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/final-project/gobang/tb_verilog/Suansha/KillWrapper.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS"
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x0d7eb20c"
wvGetSignalSetScope -win $_nWave1 "/TH_tb/SS/node0"
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[8:0\]} \
{/TH_tb/SS/node0/Xpos_r\[3:0\]} \
{/TH_tb/SS/node0/Ypos_r\[3:0\]} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[8:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TH_tb/SS/node0/SZ_buffer\[8:0\]} \
{/TH_tb/SS/node0/Xpos_r\[3:0\]} \
{/TH_tb/SS/node0/Ypos_r\[3:0\]} \
{/TH_tb/SS/node0/i_clk} \
{/TH_tb/SS/node0/i_depth\[4:0\]} \
{/TH_tb/SS/node0/i_next} \
{/TH_tb/SS/node0/i_rst_n} \
{/TH_tb/SS/node0/i_sha} \
{/TH_tb/SS/node0/i_start} \
{/TH_tb/SS/node0/next_start_r} \
{/TH_tb/SS/node0/o_Xpos\[3:0\]} \
{/TH_tb/SS/node0/o_Ypos\[3:0\]} \
{/TH_tb/SS/node0/o_finish} \
{/TH_tb/SS/node0/o_start} \
{/TH_tb/SS/node0/pointer_r\[8:0\]} \
{/TH_tb/SS/node0/result_r} \
{/TH_tb/SS/node0/state_r\[1:0\]} \
{/TH_tb/SS/node0/threat_finish} \
{/TH_tb/SS/node0/you_win} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
