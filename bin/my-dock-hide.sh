#!/bin/bash

# Hides the dock when external display is connected
# from https://discussions.apple.com/thread/5026935?answerId=21986392022#21986392022
### if [ `system_profiler SPDisplaysDataType | grep 'Cinema\|Thunderbolt' | wc -l` -eq "1" ]; then
###   osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to false"
### else
###   osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
### fi
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
