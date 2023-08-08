"""
# -*- coding: utf-8 -*- #
"""

from .colors import current as colorscheme
from .settings import *

from libqtile import widget


def get_bar_widgets():
    widgets = [
        widget.GroupBox(
            highlight_method="line",
            background=colorscheme.background.base,
            foreground=colorscheme.foreground.base,
            highlight_color=[colorscheme.foreground.green, colorscheme.foreground.red],
            inactive=colorscheme.background.base,
        ),
        widget.WindowName(fontsize=12, foreground=colorscheme.foreground.base),
        widget.Systray(),
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
        widget.Clock(
            format="🕓 %A, %B %d - %H:%M ",
            foreground=colorscheme.foreground.base,
            background=colorscheme.background.base,
        ),
    ]

    return widgets
