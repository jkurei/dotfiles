#!/bin/bash

echo this doesnt work 

osascript <<'END'

tell application "System Preferences" to reveal pane id "com.apple.preference.general"

    tell application "System Events" to tell process "System Preferences" to tell window "General"
        click checkbox "Automatically hide and show the menu bar"
    end tell

quit application "System Preferences"

END
