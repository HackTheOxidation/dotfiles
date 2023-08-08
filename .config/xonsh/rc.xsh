# Completions for xonsh
COMPLETIONS_CONFIRM=True

## Suppress skip
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True

### Set bat as man-pager
MANPAGER = "sh -c 'col -bx | bat -l man -p'"

### Aliases
aliases['v'] = 'vim'
aliases['r'] = 'ranger'
aliases['ll'] = 'ls -l'

# Remove front dot in multiline input to make the code copy-pastable.
$MULTILINE_PROMPT=' '
$VI_MODE = True

### Xontribs
_xontribs = [
    'xlsd',
    #'broot'
]

if _xontribs:
  xontrib load @(_xontribs)


extra_paths = [
    "$HOME/.local/bin",         # .local/bin
    "$HOME/go/bin",             # Go
    "$HOME/.cargo/bin",         # Rust Cargo
    "$HOME/.scripts",           # Personal Scripts
]

for p in extra_paths:
    $PATH.append(p)


extra_envs = [
    "$HOME/.cargo/env",     # Cargo env
]

for e in extra_envs:
    #source-bash e
    pass


### Set the terminal prompt
$PROMPT = '{env_name}{PURPLE}{user}{RESET}@{BLUE}{hostname} {CYAN}{cwd} {gitstatus} \n{BOLD_GREEN}❯❯❯{RESET} '
