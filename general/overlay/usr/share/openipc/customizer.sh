#!/bin/sh
. /usr/share/openipc/gpio.conf

cli -s .nightMode.irCutPin1         "$ircut1"
cli -s .nightMode.irCutSingleInvert false
cli -s .nightMode.colorToGray       true
cli -s .nightMode.backlightPin      "$light_ir"
cli -s .nightMode.lightMonitor      false
cli -s .nightMode.lightSensorPin    "$light_sensor"
cli -s .nightMode.lightSensorInvert false
cli -s .nightMode.monitorDelay      0

cli -s .video0.fps     5
cli -s .video0.gopSize 2

cli -s .video1.enabled true
cli -s .video1.size    640x360

cli -s .audio.enabled       true
cli -s .audio.outputEnabled true
