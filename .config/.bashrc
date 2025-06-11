##
## BASHRC
## Created by : @GeodeArc
##

# Will add more later

export EDITOR=nvim

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
alias m="micro"
alias e="yazi"

# GIT
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gchk="git checkout"
alias gcred="git config credential.helper store"

# UTILS
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# OTHER
alias update="paru && flatpak upgrade"
alias settings="$HOME/Dots/Scripts/Hyprland/settings.sh"
alias x="exit"
alias yeet="paru -Rcns"
alias remove="paru -Rns"

eval "$(starship init bash)"
if [[ $(tty) == *"pts"* ]]; then
   fastfetch --logo-type small
else
    echo
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command Hyprland"
    fi
fi
