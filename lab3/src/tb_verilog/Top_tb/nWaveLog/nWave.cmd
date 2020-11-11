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
