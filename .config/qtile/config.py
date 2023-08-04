"""
# -*- coding: utf-8 -*- #
"""

import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.dgroups import simple_key_binder

from .colors import current as colorscheme

mod = "mod4"
browser = "qutebrowser"
editor = "emacsclient -c -a emacs"
wallpaper = os.path.expanduser("~") + "/Nextcloud/HackTheOxidation/Wallpapers/stairs.jpg"

terminal = "alacritty"
file_manager = "alacritty - e ranger"
run_launcher = "rofi -show run"
drun_launcher = "rofi -show drun"
flatpak_launcher = "flatrun"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control"], "l", lazy.spawn("cinnamon-screensaver-command -l"), desc="Lock Screen"),
    Key([mod], "p", lazy.spawn(run_launcher), desc="Run an Application"),
    Key([mod, "shift"], "p", lazy.spawn(drun_launcher), desc="Run a Desktop Application"),
    Key([mod], "f", lazy.spawn(flatpak_launcher), desc="Launch a flatpak app"),
    Key([mod], "b", lazy.spawn(browser), desc="Spawn default browser"),
    Key([mod], "e", lazy.spawn(editor), desc="Spawn default editor"),
    Key([mod], "n", lazy.spawn(file_manager), desc="Spawn default file_manager"),
]

layouts = [
    layout.MonadTall(
        margin=5, border_focus=colorscheme["mauve"], border_normal=colorscheme["black"]
    ),
    layout.Max(),
    # layout.Columns(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize=12,
    padding=3,
    foreground=colorscheme["black"],
)
extension_defaults = widget_defaults.copy()


def bar_widgets():
    widgets = [
        widget.GroupBox(
            highlight_method="line",
            background=colorscheme["black"],
            foreground=colorscheme["green"],
            highlight_color=[colorscheme["mauve"], colorscheme["mauve"]],
            inactive=colorscheme["black"],
        ),
        widget.WindowName(fontsize=12, foreground=colorscheme["white"]),
        widget.Systray(),
        widget.Volume(
            fmt="Vol: {}", foreground=colorscheme["black"], background=colorscheme["sky"]
        ),
        widget.CPU(
            format=" {load_percent:04}%",
            foreground=colorscheme["black"],
            background=colorscheme["peach"],
        ),
        widget.Clock(
            format="🕓 %A, %B %d - %H:%M ",
            foreground=colorscheme["black"],
            background=colorscheme["maroon"],
        ),
    ]

    return widgets


my_bar = bar.Bar(bar_widgets(), 22, background="#00000000")

screens = [
    Screen(wallpaper=wallpaper, wallpaper_mode="fill", top=my_bar),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

groups = [
    Group("</>"),
    Group(">_"),
    Group("\N{Penguin}"),
    Group("\N{Snake}"),
    Group("\N{E-Mail Symbol}"),
    Group("\N{Desktop Computer}"),
    Group("\N{Musical Note}"),
    Group("\N{Video Camera}"),
    Group("\N{Left-Pointing Magnifying Glass}"),
]
dgroups_key_binder = simple_key_binder("mod4")
dgroups_app_rules = []  # type: list

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None


# Autostart application on init
@hook.subscribe.startup_once
def auto_start():
    """Hook that is called only upon startup."""
    home = os.path.expanduser("~")
    subprocess.call(home + "/.config/qtile/autostart.sh")


wmname = "LG3D"
