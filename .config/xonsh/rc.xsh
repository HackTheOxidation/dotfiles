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

# Sets the editor
EDITOR = "emacsclient -c -a emacs"

# Aliases
aliases['v'] = 'nvim'
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
    # 'xlsd',
    # 'broot'
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
              "/opt/RustRover-2024.2.3/bin",  # RustRover IDE
    ])

# Source bash profile
source-bash ~/.bash_profile

### Set the terminal prompt
$PROMPT = get_prompt()

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
$SDKMAN_DIR = "$HOME/.sdkman"
source-bash "$HOME/.sdkman/bin/sdkman-init.sh"
