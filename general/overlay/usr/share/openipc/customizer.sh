#!/bin/sh

cli -s .video0.fps 5
cli -s .video1.enabled true
cli -s .video1.osd false
cli -s .video1.size 640x360
cli -s .video2.codec h264
cli -s .jpeg.enabled false
cli -s .osd.enabled true
cli -s .osd.template "CCTV %d.%m.%Y %H:%M:%S"
cli -s .osd.bgAlpha 10
cli -s .audio.enabled true
cli -s .audio.outputEnabled true
cli -s .nightMode.irCutPin1 4
cli -s .nightMode.backlightPin 52
cli -s .nightMode.lightSensorPin 9

CFG_FILE="/vendor/firmware/hisilicon/wifi_cfg"
if [ -f "$CFG_FILE" ]; then
	if grep -q "^CFG_MAC=00:00:00:00:00:00;" "$CFG_FILE"; then
		NEW_MAC=$(get_mac wlan0 2>/dev/null | tr 'a-f' 'A-F')
		[ -n "$NEW_MAC" ] && sed -i "s/CFG_MAC=00:00:00:00:00:00;/CFG_MAC=${NEW_MAC};/" "$CFG_FILE"
	fi
fi
