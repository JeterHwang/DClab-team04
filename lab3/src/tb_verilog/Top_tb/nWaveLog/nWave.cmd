wvResizeWindow -win $_nWave1 79 26 1840 1016
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/team04/jeter/DClab-team04/lab3/src/tb_verilog/Top_tb/Top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvResizeWindow -win $_nWave1 79 26 1840 1016
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G2}
wvZoom -win $_nWave1 0.000000 2945742.587601
wvZoom -win $_nWave1 0.000000 47131.881402
wvSelectGroup -win $_nWave1 {G1}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/i_AUD_ADCDAT} \
{/Top_tb/top0/i_AUD_ADCLRCK} \
{/Top_tb/top0/i_AUD_BCLK} \
{/Top_tb/top0/i_AUD_DACLRCK} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key1_r} \
{/Top_tb/top0/key2_r} \
{/Top_tb/top0/o_AUD_DACDAT} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/player_en_r} \
{/Top_tb/top0/player_fin_r} \
{/Top_tb/top0/player_finish} \
{/Top_tb/top0/slow0_r} \
{/Top_tb/top0/slow1_r} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 )} 
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/i_AUD_ADCDAT} \
{/Top_tb/top0/i_AUD_ADCLRCK} \
{/Top_tb/top0/i_AUD_BCLK} \
{/Top_tb/top0/i_AUD_DACLRCK} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key1_r} \
{/Top_tb/top0/key2_r} \
{/Top_tb/top0/o_AUD_DACDAT} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/player_en_r} \
{/Top_tb/top0/player_fin_r} \
{/Top_tb/top0/player_finish} \
{/Top_tb/top0/slow0_r} \
{/Top_tb/top0/slow1_r} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 )} 
wvSetPosition -win $_nWave1 {("G2" 19)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 0.000000 29284146.900270
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 248165528.283887 257106954.470770
wvZoom -win $_nWave1 252797187.048605 254424526.614618
wvZoom -win $_nWave1 211400350.404313 224396273.584906
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
{/Top_tb/playing} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/i_AUD_ADCDAT} \
{/Top_tb/top0/i_AUD_ADCLRCK} \
{/Top_tb/top0/i_AUD_BCLK} \
{/Top_tb/top0/i_AUD_DACLRCK} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key1_r} \
{/Top_tb/top0/key2_r} \
{/Top_tb/top0/o_AUD_DACDAT} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/player_en_r} \
{/Top_tb/top0/player_fin_r} \
{/Top_tb/top0/player_finish} \
{/Top_tb/top0/slow0_r} \
{/Top_tb/top0/slow1_r} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
{/Top_tb/playing} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/i_AUD_ADCDAT} \
{/Top_tb/top0/i_AUD_ADCLRCK} \
{/Top_tb/top0/i_AUD_BCLK} \
{/Top_tb/top0/i_AUD_DACLRCK} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key1_r} \
{/Top_tb/top0/key2_r} \
{/Top_tb/top0/o_AUD_DACDAT} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/player_en_r} \
{/Top_tb/top0/player_fin_r} \
{/Top_tb/top0/player_finish} \
{/Top_tb/top0/slow0_r} \
{/Top_tb/top0/slow1_r} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb"
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectGroup -win $_nWave1 {G3}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Top_tb/top0/dsp0"
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
{/Top_tb/playing} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/i_AUD_ADCDAT} \
{/Top_tb/top0/i_AUD_ADCLRCK} \
{/Top_tb/top0/i_AUD_BCLK} \
{/Top_tb/top0/i_AUD_DACLRCK} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key1_r} \
{/Top_tb/top0/key2_r} \
{/Top_tb/top0/o_AUD_DACDAT} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/player_en_r} \
{/Top_tb/top0/player_fin_r} \
{/Top_tb/top0/player_finish} \
{/Top_tb/top0/slow0_r} \
{/Top_tb/top0/slow1_r} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/dsp0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Top_tb/switch\[3:0\]} \
{/Top_tb/DAC_DATA\[15:0\]} \
{/Top_tb/SRAM_ADDR\[19:0\]} \
{/Top_tb/SRAM_DQ\[15:0\]} \
{/Top_tb/play_data\[15:0\]} \
{/Top_tb/record_data\[15:0\]} \
{/Top_tb/playing} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Top_tb/top0/i_AUD_ADCDAT} \
{/Top_tb/top0/i_AUD_ADCLRCK} \
{/Top_tb/top0/i_AUD_BCLK} \
{/Top_tb/top0/i_AUD_DACLRCK} \
{/Top_tb/top0/i_clk} \
{/Top_tb/top0/i_rst_n} \
{/Top_tb/top0/i_speed\[3:0\]} \
{/Top_tb/top0/io_SRAM_DQ\[15:0\]} \
{/Top_tb/top0/key0_r} \
{/Top_tb/top0/key1_r} \
{/Top_tb/top0/key2_r} \
{/Top_tb/top0/o_AUD_DACDAT} \
{/Top_tb/top0/o_SRAM_ADDR\[19:0\]} \
{/Top_tb/top0/player_en_r} \
{/Top_tb/top0/player_fin_r} \
{/Top_tb/top0/player_finish} \
{/Top_tb/top0/slow0_r} \
{/Top_tb/top0/slow1_r} \
{/Top_tb/top0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/Top_tb/top0/dsp0/state_r\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvGetSignalClose -win $_nWave1
