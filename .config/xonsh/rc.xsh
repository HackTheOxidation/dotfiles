"""
HackTheOxidation's Xonsh configuration
"""

# Completions for xonsh
COMPLETIONS_CONFIRM=True

# Suppress skip
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True

# Set bat as the default man-pager.
MANPAGER = "sh -c 'col -bx | bat -l man -p'"

# Aliases
aliases['v'] = 'vim'
aliases['r'] = 'ranger'
aliases['ll'] = 'ls -l'
aliases['cat'] = 'bat'

# Remove front dot in multiline input to make the code copy-pastable.
$MULTILINE_PROMPT=' '
# Use Vim-like key-bindings.
$VI_MODE = True
# Use sqlite instead of json for the history backend.
$XONSH_HISTORY_BACKEND = 'sqlite'

# Xontribs
_xontribs = [
    'xlsd',
    #'broot'
]

if _xontribs:
  xontrib load @(_xontribs)

# Extra locations for PATH-variable
extra_paths = [
    "$HOME/.local/bin",         # .local/bin
    "$HOME/go/bin",             # Go
    "$HOME/.cargo/bin",         # Rust Cargo
    "$HOME/.scripts",           # Personal Scripts
]

for p in extra_paths:
    $PATH.append(p)

### Set the terminal prompt
$PROMPT = '{env_name}{PURPLE}{user}{RESET}@{BLUE}{hostname} {CYAN}{cwd} {gitstatus} \n{BOLD_GREEN}❯❯❯{RESET} '
