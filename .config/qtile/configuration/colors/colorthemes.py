"""
Color schemes for use with qtile.
"""

from dataclasses import dataclass


@dataclass
class ColorPalette:
    """
    Class that defines a color palette.
    """

    base: str
    red: str
    orange: str
    yellow: str
    green: str
    aqua: str
    blue: str
    purple: str


@dataclass
class ColorScheme:
    """
    Dataclass for holding colorschemes.
    """

    background: ColorPalette
    foreground: ColorPalette


# Distrotube color theme
distrotube = [
    "#282c34",
    "#1c1f24",
    "#dfdfdf",
    "#ff6c6b",
    "#98be65",
    "#da8548",
    "#51afef",
    "#c678dd",
    "#46d9ff",
    "#a9a1e1",
]

# Everforest color theme
everforest = {
    "bg": {
        "bg0": "#2f383e",
        "bg1": "#374247",
        "bg2": "#404c51",
        "bg3": "#4a555b",
        "bg4": "#525c62",
        "bg5": "#596763",
        "bg_visual": "#573e4c",
        "bg_red": "#544247",
        "bg_green": "#445349",
        "bg_blue": "#3b5360",
        "bg_yellow": "#504f45",
    },
    "fg": {
        "fg": "#d3c6aa",
        "red": "#e67e80",
        "orange": "#e69875",
        "yellow": "#dbbc7f",
        "green": "#a7c080",
        "aqua": "#83c092",
        "blue": "#7fbbb3",
        "purple": "#d699b6",
        "grey0": "#7a8478",
        "grey1": "#859289",
        "grey2": "#9da9a0",
        "statusline1": "#a7c080",
        "statusline2": "#d3c6aa",
        "statusline3": "#e67e80",
    },
}

everforest = ColorScheme(
    background=ColorPalette(
        base="#d3c6aaee",
        red="#544247",
        orange="#e69875",
        yellow="#504f45",
        green="#445349",
        aqua="#83c092",
        blue="#3b5360",
        purple="#d699b6",
    ),
    foreground=ColorPalette(
        base="#d3c6aaee",
        red="#e67e80",
        orange="#e69875",
        yellow="#dbbc7f",
        green="#a7c080",
        aqua="#83c092",
        blue="#7fbbb3",
        purple="#d699b6",
    ),
)

# Catppuccin color theme
catppuccin = {
    "flamingo": "#F3CDCD",
    "mauve": "#DDB6F2",
    "pink": "#f5c2e7",
    "maroon": "#e8a2af",
    "red": "#f28fad",
    "peach": "#f8bd96",
    "yellow": "#fae3b0",
    "green": "#abe9b3",
    "teal": "#b4e8e0",
    "blue": "#96cdfb",
    "sky": "#89dceb",
    "white": "#d9e0ee",
    "gray": "#6e6c7e",
    "black": "#1a1826",
}
