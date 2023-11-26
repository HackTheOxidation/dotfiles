import catppuccin

# Load settings from 'config.py'
config.load_autoconfig(False)

# Load catppuccin theme
catppuccin.setup(c, "mocha", True)

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
c.aliases = {
    "q": "quit",
    "w": "session-save",
    "wq": "quit --save",
}

# Setting dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.images", "smart")
config.set("colors.webpage.darkmode.threshold.text", 150)
config.set("colors.webpage.darkmode.threshold.background", 205)


# Security and Content
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")
c.downloads.location.directory = "~/Downloads"
c.tabs.show = "always"

# Set start page and search engine
c.url.default_page = "https://start.duckduckgo.com/?kae=t&kak=-1&kal=-1&kao=-1&kaq=-1"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "ar": "https://wiki.archlinux.org/?search={}",
    "ha": "https://hoogle.haskell.org/?hoogle={}",
    "ub": "https://www.urbandictionary.com/define.php?term={}",
    "wi": "https://en.wikipedia.org/wiki/{}",
}

# Use ranger as file selector
config.set("fileselect.handler", "external")
config.set(
    "fileselect.single_file.command",
    ["alacritty", "--class", "ranger,ranger", "-e", "ranger", "--choosefile", "{}"],
)
config.set(
    "fileselect.multiple_files.command",
    ["alacritty", "--class", "ranger,ranger", "-e", "ranger", "--choosefile", "{}"],
)

# Fonts
c.fonts.default_family = '"SauceCodePro Nerd Font"'
c.fonts.default_size = "11pt"
c.fonts.completion.entry = '11pt "SauceCodePro Nerd Font"'
c.fonts.debug_console = '11pt "SauceCodePro Nerd Font"'
c.fonts.prompts = "default_size sans-serif"
c.fonts.statusbar = '11pt "SauceCodePro Nerd Font"'


# Bindings for normal mode
config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("Z", "hint links spawn st -e youtube-dl {hint-url}")
config.bind("t", "set-cmd-text -s :open -t")
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)
