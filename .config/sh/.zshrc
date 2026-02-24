##
## ZSHRC
## Created by : @GeodeArc
##

# EXPORTS (you will wanna add stuff here later)
export EDITOR=nvim

# BASH/ZSH HISTORY
# i decided to combine with bash history, but you can change this if you like
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000

# ALIASES (see separate file)
if [ -f "$HOME/.config/sh/aliases.sh" ]; then
    . "$HOME/.config/sh/aliases.sh"
fi

# PROMPT
eval "$(starship init zsh)"
if [[ $(tty) == *"pts"* ]]; then
   fastfetch --logo-type small
else
    echo
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command start-hyprland"
    fi
fi
