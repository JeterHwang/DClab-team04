wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/lab3/src/tb_verilog/Top_tb/Top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/test_Recorder_stop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvSelectGroup -win $_nWave1 {G2}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 193074.760818
wvZoom -win $_nWave1 2748.861001 35604.294876
wvZoom -win $_nWave1 0.000000 7753255.654558
wvZoom -win $_nWave1 0.000000 346127.484578
wvZoom -win $_nWave1 0.000000 18773.016113
wvSelectGroup -win $_nWave1 {G2}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 761480.466073
wvZoom -win $_nWave1 0.000000 415352.981494
wvZoom -win $_nWave1 50123.953021 55474.262613
wvZoom -win $_nWave1 50123.953021 1453735.435230
wvZoom -win $_nWave1 253766.568067 284217.800223
wvZoom -win $_nWave1 0.000000 553803.975326
wvZoom -win $_nWave1 41300.635448 110385.334743
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 41300.635448 64379712.131597
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G2" 10)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 5538039.753256
wvZoom -win $_nWave1 0.000000 3461274.845785
wvZoom -win $_nWave1 0.000000 687561.715129
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 134715.481812
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 12 )} 
wvSelectSignal -win $_nWave1 {( "G2" 12 14 )} 
wvSelectSignal -win $_nWave1 {( "G2" 12 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G2" 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvZoom -win $_nWave1 0.000000 5538039.753256
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 0.000000 13845099.383139
wvSetCursor -win $_nWave1 208321859.002231
wvSetCursor -win $_nWave1 183908671.411541
wvZoom -win $_nWave1 177217272.104181 235366689.513365
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 208085742.498264 210451142.528468
wvZoom -win $_nWave1 191062371.487320 254057573.680603
wvZoom -win $_nWave1 207873992.662098 210265674.914859
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectGroup -win $_nWave1 {G4}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/Top_tb/top0/LCDtop/dataflow/i_start} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_EN} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_RS} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_RW} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/dataflow/o_write_fin} \
{/Top_tb/top0/LCDtop/dataflow/state_r\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/KEY0} \
{/Top_tb/KEY1} \
{/Top_tb/KEY2} \
{/Top_tb/KEY3} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/Top_tb/top0/LCDtop/dataflow/i_start} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_EN} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_RS} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_RW} \
{/Top_tb/top0/LCDtop/dataflow/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/dataflow/o_write_fin} \
{/Top_tb/top0/LCDtop/dataflow/state_r\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvZoom -win $_nWave1 208358815.030526 208407459.415328
wvZoom -win $_nWave1 208379229.182495 208389320.831138
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 199369431.117204 236751199.451679
wvSelectGroup -win $_nWave1 {G4}
wvSelectGroup -win $_nWave1 {G4}
wvSelectGroup -win $_nWave1 {G4}
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 3 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectGroup -win $_nWave1 {G5}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectGroup -win $_nWave1 {G4}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectGroup -win $_nWave1 {G4}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/init0"
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 15)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100K} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSetPosition -win $_nWave1 {("G3" 16)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvZoom -win $_nWave1 248458135.864379 251727456.620411
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvZoom -win $_nWave1 249007825.049043 249136381.390636
wvZoom -win $_nWave1 249047132.784633 249057853.076169
wvSetCursor -win $_nWave1 183908671.411541
wvSetCursor -win $_nWave1 249051522.653134
wvSetPosition -win $_nWave1 {("G2" 11)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 )} 
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 )} 
wvSetPosition -win $_nWave1 {("G2" 12)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSelectSignal -win $_nWave1 {( "G2" 12 )} 
wvSetCursor -win $_nWave1 249050766.781731
wvZoom -win $_nWave1 203522960.932145 289362577.107608
wvZoom -win $_nWave1 248159561.343341 251709538.690258
wvZoom -win $_nWave1 234674434.544208 270671692.940370
wvZoom -win $_nWave1 248705778.617015 249169472.114999
wvZoom -win $_nWave1 249036808.619290 249063844.307986
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 240904729.266621 294900616.860864
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 13 )} 
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 13 )} 
wvSetPosition -win $_nWave1 {("G2" 13)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/LCD_Wfin_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/LCD_Wfin_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 196603889.531500 287285812.200137
wvZoom -win $_nWave1 247717724.991194 256632219.084043
wvZoom -win $_nWave1 249403924.212730 251821414.136215
wvScrollUp -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 229136394.790953 368279643.591501
wvZoom -win $_nWave1 249795629.697558 257719719.798741
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 251622199.619129 251820973.404718
wvZoom -win $_nWave1 242981494.174092 256826593.557231
wvZoom -win $_nWave1 250593952.207712 252405548.262591
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 4 5 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 4 5 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 3 4 5 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 245058259.081563 284516792.323509
wvZoom -win $_nWave1 251478630.592054 253083723.469692
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/LCD_Wfin_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/LCD_Wfin_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/init0/SCL_r} \
{/Top_tb/top0/init0/SDA_r} \
{/Top_tb/top0/init0/counts_r\[5:0\]} \
{/Top_tb/top0/init0/finished_r} \
{/Top_tb/top0/init0/i_clk} \
{/Top_tb/top0/init0/i_rst_n} \
{/Top_tb/top0/init0/i_start} \
{/Top_tb/top0/init0/init_r\[4:0\]} \
{/Top_tb/top0/init0/o_finished} \
{/Top_tb/top0/init0/o_oen} \
{/Top_tb/top0/init0/o_sclk} \
{/Top_tb/top0/init0/o_sdat} \
{/Top_tb/top0/init0/oen_r} \
{/Top_tb/top0/init0/start_r} \
{/Top_tb/top0/init0/state_r\[2:0\]} \
{/Top_tb/top0/init0/start_w} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 251693005.708539 251720210.672567
wvZoom -win $_nWave1 248519533.927347 257518848.526388
wvZoom -win $_nWave1 251606756.427039 252253486.832122
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 5 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 3 5 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 5 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectGroup -win $_nWave1 {G4}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectGroup -win $_nWave1 {G3}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/recorder0"
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/LCD_Wfin_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/i2c_start_r} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/LCD_Wfin_w} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvSetPosition -win $_nWave1 {("G3" 20)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 252016279.273338
wvSetCursor -win $_nWave1 251907979.334317
wvSetCursor -win $_nWave1 251891756.266528
wvScrollUp -win $_nWave1 11
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/recorder0"
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 6
wvScrollDown -win $_nWave1 3
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 9
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 9
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/LCDtop/dataflow"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/recorder0"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/addr_record\[19:0\]} \
{/Top_tb/top0/data_record\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/addr_record\[19:0\]} \
{/Top_tb/top0/data_record\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 2
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/addr_record\[19:0\]} \
{/Top_tb/top0/data_record\[15:0\]} \
{/Top_tb/top0/record_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/addr_record\[19:0\]} \
{/Top_tb/top0/data_record\[15:0\]} \
{/Top_tb/top0/record_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/addr_record\[19:0\]} \
{/Top_tb/top0/data_record\[15:0\]} \
{/Top_tb/top0/record_finish} \
{/Top_tb/top0/LCD_mode_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/top0/LCD_init_finish} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_clk_100k} \
{/Top_tb/top0/i_clk_800k} \
{/Top_tb/top0/i_key_0} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key0_w} \
{/Top_tb/top0/i_key_1} \
{/Top_tb/top0/i_key_2} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/state_r\[2:0\]} \
{/Top_tb/top0/state_w\[2:0\]} \
{/Top_tb/top0/LCD_wr_enable_r} \
{/Top_tb/top0/LCD_Wfin_r} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/addr_record\[19:0\]} \
{/Top_tb/top0/data_record\[15:0\]} \
{/Top_tb/top0/record_finish} \
{/Top_tb/top0/LCD_mode_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/LCDtop/counter_r\[5:0\]} \
{/Top_tb/top0/LCDtop/i_clk} \
{/Top_tb/top0/LCDtop/i_mode\[2:0\]} \
{/Top_tb/top0/LCDtop/i_rst_n} \
{/Top_tb/top0/LCDtop/i_start} \
{/Top_tb/top0/LCDtop/o_LCD_EN} \
{/Top_tb/top0/LCDtop/o_LCD_RS} \
{/Top_tb/top0/LCDtop/o_LCD_data\[7:0\]} \
{/Top_tb/top0/LCDtop/o_init_finish} \
{/Top_tb/top0/LCDtop/state_r\[2:0\]} \
{/Top_tb/top0/LCDtop/inst_start_r} \
{/Top_tb/top0/LCDtop/start_r} \
{/Top_tb/top0/LCDtop/write_fin} \
{/Top_tb/top0/LCDtop/o_render_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/recorder0/Tpause_r} \
{/Top_tb/top0/recorder0/Tpause_w} \
{/Top_tb/top0/recorder0/address_r\[19:0\]} \
{/Top_tb/top0/recorder0/counter_r\[4:0\]} \
{/Top_tb/top0/recorder0/cycle_r} \
{/Top_tb/top0/recorder0/data_r\[15:0\]} \
{/Top_tb/top0/recorder0/finish_r} \
{/Top_tb/top0/recorder0/i_clk} \
{/Top_tb/top0/recorder0/i_data} \
{/Top_tb/top0/recorder0/i_lrc} \
{/Top_tb/top0/recorder0/i_pause} \
{/Top_tb/top0/recorder0/i_rst_n} \
{/Top_tb/top0/recorder0/i_start} \
{/Top_tb/top0/recorder0/i_stop} \
{/Top_tb/top0/recorder0/o_address\[19:0\]} \
{/Top_tb/top0/recorder0/o_data\[15:0\]} \
{/Top_tb/top0/recorder0/o_finish} \
{/Top_tb/top0/recorder0/pause_r} \
{/Top_tb/top0/recorder0/start_r} \
{/Top_tb/top0/recorder0/state_r\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoom -win $_nWave1 252000933.128132 252039079.260500
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 245750514.050720 278286497.601097
wvZoom -win $_nWave1 248171411.809744 255318299.043861
wvZoom -win $_nWave1 252241503.522689 252352946.510068
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoom -win $_nWave1 248519533.927347 267210418.094585
wvZoom -win $_nWave1 252574505.407650 254310540.072675
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 185994442.083619 194784349.554489
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoom -win $_nWave1 252145199.968605 253587340.719758
wvZoom -win $_nWave1 252285992.014814 252339766.754688
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 248930179.575051 252094546.264565
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoom -win $_nWave1 253085731.996120 253208015.997003
wvZoom -win $_nWave1 253098416.370429 253111515.266795
wvZoom -win $_nWave1 250863959.218643 253500931.459904
wvZoom -win $_nWave1 238733886.908842 253497355.904280
wvZoom -win $_nWave1 248171911.704881 254607783.273740
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
