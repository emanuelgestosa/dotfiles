#!/bin/sh

file=$(pass | sed 's/└── //' | sed 's/├── //' | sed 's/\[00m//' | strings | tail +2 | dmenu -l 50)

if [ -n "$file" ]; then
 	xdotool type $(pass $file | grep 'Username' | sed 's/Username: //')
 	xdotool key $(pass $file | grep 'Separator' | sed 's/Separator: //')
 	sleep $(pass $file | grep 'Sleep' | sed 's/Sleep: //')
 	xdotool type $(pass $file | head -1)
 	xdotool key $(pass $file | grep 'Confirm' | sed 's/Confirm: //')
 fi
