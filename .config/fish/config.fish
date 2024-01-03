### My fish shell config

### Commands for interactive sessions
if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Settings
set fish_greeting # Remove the greeting
set EDITOR "nvim"
set TERM "xterm-256color"

### Vim Keybindings
set -U fish_key_bindings fish_vi_key_bindings

### Set bat as man-pager
set -x MANPAGER "nvim +Man!"

### Aliases
alias v='nvim'
alias cat='bat'
alias ls='lsd -h'
alias ll='lsd -lh'

### Path Extensions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

set -ga fish_user_paths /home/hacker/.nimble/bin
set -ga fish_user_paths /home/hacker/.raku/bin
