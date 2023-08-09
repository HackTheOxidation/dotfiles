"""
# -*- coding: utf-8 -*- #
"""
import os

from .colors import current as colorscheme
from .settings import *

from libqtile import widget


# Path to the icons directory.
icon_path = os.path.expanduser('~') + '/.config/qtile/assets/icons/'


def get_bar_widgets():
    widgets = [
        widget.Image(
            filename=icon_path + "python-white.png",
            scale="False",
            ),
        widget.GroupBox(
            highlight_method="line",
            background=colorscheme.background.base,
            foreground=colorscheme.foreground.base,
            highlight_color=[colorscheme.foreground.green, colorscheme.foreground.red],
            inactive=colorscheme.background.base,
        ),
        widget.TextBox(
            text='|',
            font='Ubuntu Mono',
            foreground=colorscheme.foreground.base,
            padding=2,
            fontsize=24,
            ),
        widget.CurrentLayout(
            padding=5,
        ),
        widget.WindowName(fontsize=12, foreground=colorscheme.foreground.base),
        widget.Volume(
            fmt="Vol: {}",
            foreground=colorscheme.foreground.base,
            background=colorscheme.background.base,
        ),
        widget.CPU(
            format=" {load_percent:04}%",
            foreground=colorscheme.foreground.base,
            background=colorscheme.background.base,
        ),
        widget.KeyboardLayout(
            fmt=' Kbd: {}',
        ),
        widget.Clock(
            format="🕓 %A, %B %d - %H:%M ",
            foreground=colorscheme.foreground.base,
            background=colorscheme.background.base,
        ),
        widget.Systray(
            padding=4,
        ),
        widget.Spacer(
            length=8,
        ),
    ]

    return widgets
