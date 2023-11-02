"""
HackTheOxidation's Xonsh configuration
"""
from prompt import get_prompt

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
$PATH.extend(["$HOME/.local/bin",         # .local/bin
              "$HOME/go/bin",             # Go
              "$HOME/.cargo/bin",         # Rust Cargo
              "$HOME/.scripts",           # Personal Scripts
              "$HOME/.deno/bin",          # Deno
              "$HOME/.dotnet/tools",      # .NET
    ])

### Set the terminal prompt
$PROMPT = get_prompt()
