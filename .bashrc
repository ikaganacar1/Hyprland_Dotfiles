#
# ~/.bashrc
# ____    _    ____  _   _ ____   ____
#| __ )  / \  / ___|| | | |  _ \ / ___|
#|  _ \ / _ \ \___ \| |_| | |_) | |
#| |_) / ___ \ ___) |  _  |  _ <| |___
#|____/_/   \_\____/|_| |_|_| \_\\____|

[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
eval "$(fzf --bash)"

bind 'TAB:menu-complete'

PATH=/home/ika1/yzlm/Hyprland_Dotfiles/scripts/:$PATH

(cat ~/.cache/wal/sequences &)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
#if [ $? -eq 0 ]; then
#  eval "$__conda_setup"
#else
#  if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#    . "/opt/miniconda3/etc/profile.d/conda.sh"
#  else
#    export PATH="/opt/miniconda3/bin:$PATH"
#  fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

#    _    _     ___    _    ____
#   / \  | |   |_ _|  / \  / ___|
#  / _ \ | |    | |  / _ \ \___ \
# / ___ \| |___ | | / ___ \ ___) |
#/_/   \_\_____|___/_/   \_\____/

alias grep='grep --color=auto'

alias conf-hypr='nvim /home/ika1/.config/hypr/'
alias conf-waybar='nvim /home/ika1/.config/waybar/'
alias waybar-reload='pkill waybar && hyprctl dispatch exec waybar'

alias hash='f(){ echo -n "$1" | sha256sum | cut -d " " -f 1 | wl-copy && echo "SHA-256 hash copied to clipboard."; unset -f f; }; f'
alias ram='sudo python ~/ram.py'
#alias kill_='kill -9 **'
alias dotfiles_to_repo='source ~/yzlm/dotfiles_to_repo.bash'

alias nvim-find='nvim $(fzf --preview="bat --color=always {}")'
alias bashrc='nvim ~/.bashrc'
alias nv='nvim'

alias c='clear'
alias n='fastfetch'
alias q='exit'

alias ls='eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions'
alias lst='eza --tree --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions'
alias ll='eza --long --all --icons=always'

alias fzf='fzf | wl-copy'
