#!/bin/sh

if [ -e /usr/share/openipc/gpio.conf ]; then
	. /usr/share/openipc/gpio.conf
fi

# GPIO pad mux — registers reset on power cycle, re-applied every boot
devmem 0x112C0048 32 0x1D54  # GPIO8_7: 上拉，IO4档位3，SDIO1_CCLK_OUT
devmem 0x112C004C 32 0x1174  # GPIO8_5: 上拉，SDIO1_CCMD
devmem 0x112C0058 32 0x1174  # GPIO7_0: 上拉，SDIO1_CDATA3
devmem 0x112C005C 32 0x1174  # GPIO7_1: 上拉，SDIO1_CDATA2
devmem 0x112C0060 32 0x1174  # GPIO7_2: 上拉，SDIO1_CDATA1
devmem 0x112C0064 32 0x1174  # GPIO7_3: 上拉，SDIO1_CDATA0
devmem 0x112C0050 32 0x1200  # GPIO8_6: GPIO 模式，下拉（hi3881 上电前保持低）

# LEDs off at boot — adjust set/clear if polarity is inverted
# gpio clear $led1  # GPIO6_6  绿色 LED
# gpio clear $led2  # GPIO6_7  红色 LED
# gpio clear $led3  # GPIO6_5  蓝色 LED
