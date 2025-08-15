#!/bin/bash

if [ ${1:-2} != "1" ];
then
xmodmap -e "keycode 133 = masculine backslash backslash backslash" 
xmodmap -e "keycode 49 = Super_L"
fi

/usr/bin/setxkbmap -option 'ctrl: nocaps'
