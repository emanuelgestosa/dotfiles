#!/bin/sh

bookmark="$(xclip -o)"
bookmark_file="$HOME/.local/share/bookmarks"

if grep -q "^$bookmark$" "$bookmark_file"; then
	notify-send "Already bookmarked!"
else
	notify-send "Bookmark $bookmark saved!"
	echo "$bookmark" >> $bookmark_file
fi
