#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias conf-hypr='nvim /home/ika1/.config/hypr/'
alias conf-waybar='nvim /home/ika1/.config/waybar/'
alias waybar-reload='pkill waybar && hyprctl dispatch exec waybar'
alias ram='sudo python ~/ram.py'

alias c='clear'
alias n='neofetch'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
