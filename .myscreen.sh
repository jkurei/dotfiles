#!/bin/bash

gtf 1280 1024 60.00
xrandr --newmode "1280x1024_60.00" 108.88  1280 1360 1496 1712  1024 1025 1028 1060  -HSync +Vsync
xrandr --addmode DVI-1 1280x1024_60.00
xrandr --output DVI-1 --mode 1280x1024_60.00 --left-of HDMI-0
