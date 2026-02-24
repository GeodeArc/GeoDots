##
## BASHRC
## Created by : @GeodeArc
##

# EXPORTS (you will wanna add stuff here later)
export EDITOR=nvim

# BASH/ZSH HISTORY
# i decided to combine with zsh history, but you can change this if you like
HISTSIZE=10000
SAVEHIST=10000

# ALIASES (see separate file)
if [ -f "$HOME/.config/sh/aliases.sh" ]; then
    . "$HOME/.config/sh/aliases.sh"
fi

# KITTY THEME
if grep -q "light" "$HOME/Dots/Options/theme"; then
    kitty @ set-colors --all ~/.cache/wal/colors-kitty-light.conf
fi

# PROMPT
eval "$(starship init bash)"
if [[ $(tty) == *"pts"* ]]; then
   fastfetch --logo-type small
else
    echo
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command start-hyprland"
    fi
fi
