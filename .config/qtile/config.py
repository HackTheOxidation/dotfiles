"""
# -*- coding: utf-8 -*- #
"""

import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.dgroups import simple_key_binder

from colors import current as colorscheme
from configuration.settings import mod, wallpaper
from configuration.keys import keys as my_keys

keys = my_keys

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
