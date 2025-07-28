"""
# -*- coding: utf-8 -*- #
"""

import os
import subprocess

from libqtile import bar, hook
from libqtile.config import Screen
from libqtile.dgroups import simple_key_binder

from configuration.bindings import get_key_bindings, get_mouse_bindings
from configuration.colors import current as colorscheme
from configuration.groups import get_groups
from configuration.layouts import get_layouts, get_floating_layouts
from configuration.settings import mod, wallpaper
from configuration.widgets import get_bar_widgets


keys = get_key_bindings()

layouts = get_layouts()

widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize=12,
    padding=3,
    foreground=colorscheme.foreground,
)
extension_defaults = widget_defaults.copy()

my_bar = bar.Bar(get_bar_widgets(), 24, background=colorscheme.background)

screens = [
    Screen(wallpaper=wallpaper, wallpaper_mode="fill", top=my_bar),
    Screen(wallpaper=wallpaper, wallpaper_mode="fill"),
]

mouse = get_mouse_bindings()
groups = get_groups()

dgroups_key_binder = simple_key_binder(mod)
dgroups_app_rules = []  # type: list

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = get_floating_layouts()
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None


@hook.subscribe.startup_once
def auto_start():
    """Hook that is called only upon startup."""
    home = os.path.expanduser("~")
    subprocess.call(home + "/.config/qtile/autostart.sh")


wmname = "LG3D"
