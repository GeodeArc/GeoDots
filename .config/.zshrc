##
## ZSHRC
## Created by : @GeodeArc
##

# Will add more later

export EDITOR=nvim

# zsh history 
# i decided to combine with bash history, but you can change this if you like
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# GENERAL
alias c="clear"
alias nf="fastfetch"
alias pf="pfetch"
alias ff="fastfetch"
alias ls="eza -a --icons"
alias ll="eza -al --icons"
alias lt="eza -a --tree --level=1 --icons"
alias shutdown="systemctl poweroff"
alias v="nvim"
alias vim="nvim"
alias n="nvim"
alias wifi="nmtui"
alias h="htop"
alias b="btop"
alias e="yazi"

# UTILS
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# OTHER
alias update="$HOME/Dots/Scripts/Hyprland/update.sh"
alias settings="$HOME/Dots/Scripts/Hyprland/settings.sh"
alias q="exit"

eval "$(starship init zsh)"
if [[ $(tty) == *"pts"* ]]; then
   fastfetch --logo-type small
else
    echo
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command Hyprland"
    fi
fi
