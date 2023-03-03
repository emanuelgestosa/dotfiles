#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export PS1="\[\033[38;5;14m\]\w\[$(tput sgr0)\] > \[$(tput sgr0)\]"

# Custom aliases
alias \
    sudo="doas" \
    lf="lf_image_preview.sh" \

# Enable vi-mode
set -o vi

# Set keyboard layout
setxkbmap pt

# Bind </> keys
xmodmap -e "keycode 97 = less greater less greater bar brokenbar"

# Make CLion work
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# Set default editor to vim
export EDITOR="vim"

# lf struff
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bind '"\C-o":"\C-ulf\C-m"'

# Clear
bind '"\C-l":"\C-uclear\C-m"'

# More PATHS
export PATH=$PATH:$HOME/scripts/
