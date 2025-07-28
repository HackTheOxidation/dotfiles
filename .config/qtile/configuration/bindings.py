"""
# -*- coding: utf-8 -*- #
"""

from .settings import *

from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy


def get_key_bindings():
    return [
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
        Key(
            [mod, "control"], "l", lazy.spawn("cinnamon-screensaver-command -l"), desc="Lock Screen"
        ),
        Key([mod], "p", lazy.spawn(run_launcher), desc="Run an Application"),
        Key([mod, "shift"], "p", lazy.spawn(drun_launcher), desc="Run a Desktop Application"),
        Key([mod], "f", lazy.spawn(flatpak_launcher), desc="Launch a flatpak app"),
        Key([mod], "b", lazy.spawn(browser), desc="Spawn default browser"),
        Key([mod], "e", lazy.spawn(editor), desc="Spawn default editor"),
        Key([mod], "n", lazy.spawn(file_manager), desc="Spawn default file_manager"),
        Key([mod, "control"], "1", lazy.to_screen(0), desc="Switch to first screen"),
        Key([mod, "control"], "2", lazy.to_screen(1), desc="Switch to second screen"),
    ]


def get_mouse_bindings():
    return [
        Drag(
            [mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()
        ),
        Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
    ]
