"""
# -*- coding: utf-8 -*- #
"""

from libqtile import layout
from libqtile.config import Match

from .colors import current as colorscheme
from .settings import *


def get_layouts():
    return [
        layout.MonadTall(
            margin=5,
            border_focus=colorscheme.green,
            border_normal=colorscheme.background,
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


def get_floating_layouts():
    return layout.Floating(
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
