### Set up the prompt
autoload -U colors && colors
PS1="%B%n@%M %~%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments


### History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

### ZSH Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### Set Manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

### Keybindings
#bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey -s '^f' 'cd "$(fd -t d . $HOME | peco)"\nclear\n'
bindkey -s '^n' 'nnn\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

### Sources and Exports

# PATH and ENV
source "$HOME/.cargo/env"
export PATH=$PATH:"~/.cargo/bin"
export PATH=$PATH:"~/.local/bin"

# Variables
export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"
export GOPATH=$HOME

### Aliases
alias ls="exa -h -g --icons --color=auto"
alias la="exa -Ah -g --icons --color=auto"
alias ll="exa -l -g --icons --color=auto"
alias lr="exa -R -g --icons --color=auto"
alias vim=nvim
alias v=nvim
alias cat='bat' 
alias emacs="emacs -nw" 

eval "$(atuin init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
