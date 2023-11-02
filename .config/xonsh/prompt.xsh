import os
from pathlib import Path

__all__ = [
    'get_prompt',
]


BASE_PROMPT = ('{env_name}{PURPLE}{user}{RESET}@{BLUE}{hostname}'
               ' {CYAN}{cwd} {gitstatus} \n{BOLD_GREEN}❯❯❯{RESET} ')


def is_in_container() -> bool:
    return Path('/run/.containerenv').exists()


def is_in_toolbox() -> bool:
    return Path('/run/.toolboxenv').exists()


def get_prompt() -> str:
    if is_in_toolbox():
        return f'\N{WRENCH} {BASE_PROMPT}'
    elif is_in_container():
        return f'\N{PACKAGE} {BASE_PROMPT}'
    else:
        return BASE_PROMPT
