### My fish shell config

### Commands for interactive sessions
if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Settings
set fish_greeting # Remove the greeting
set EDITOR "vim"
set TERM "xterm-256color"

### Vim Keybindings
set -U fish_key_bindings fish_vi_key_bindings

### Set bat as man-pager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### Aliases
alias v='vim'
alias cat='bat'
alias ls='lsd -h'
alias ll='lsd -lh'

### Path Extensions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

### Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
