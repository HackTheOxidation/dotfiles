"""
# -*- coding: utf-8 -*- #
"""

from libqtile.config import Group


def get_groups():
    group_names = [str(n) for n in range(1, 10)]
    group_labels = [
        "</>",
        ">_",
        "\N{Penguin}",
        "\N{Snake}",
        "\N{E-Mail Symbol}",
        "\N{Desktop Computer}",
        "\N{Musical Note}",
        "\N{Video Camera}",
        "\N{Left-Pointing Magnifying Glass}",
    ]

    return [Group(name=name, label=label) for name, label in zip(group_names, group_labels)]
