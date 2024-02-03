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
set additional_paths ".local/bin" ".cargo/bin" ".dotnet/tools" "go/bin" ".scripts" ".nimble/bin" ".raku/bin" ".elan/bin"

for extra_path in $additional_paths
    set -ga fish_user_paths "$HOME/$extra_path"
end

# Activate rbenv
status --is-interactive; and rbenv init - fish | source

# opam configuration
source /home/hacker/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
