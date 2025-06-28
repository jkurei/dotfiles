#!/bin/bash

# doesnt work osascript -e "tell application \"System Events\" to set the autohide of the menu preferences to false"
# defaults write NSGlobalDomain _HIHideMenuBar -bool false
# killall Finder

osascript <<'END'

tell application "System Events"
    tell dock preferences to set autohide menu bar to not autohide menu bar
end tell

END
