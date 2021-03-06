#!/usr/bin/env python

import os
import pathlib
from configparser import RawConfigParser
from json import dumps, loads
from random import choice
import sys

from reload import *

THEME = f"{sys.argv[1]}"

with open(f"./themes/{THEME}.json", encoding="utf8") as theme:
    colors = loads(theme.read())


def gendunst() -> None:
    changed = pathlib.PosixPath("./template/dunst.ini").read_text()
    changed = changed % (colors["common"] | colors["shades"])
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/dunst/config.ini"),
    ).write_text(changed)


def gencava() -> None:
    changed = pathlib.PosixPath("./template/cava.ini").read_text()
    changed = changed % (colors["common"] | colors["shades"])
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/cava/config"),
    ).write_text(changed)


def genrofi() -> None:
    changed = pathlib.PosixPath("./template/rofi.rasi").read_text()
    changed = changed % (colors["common"] | colors["shades"])
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/rofi/theme.rasi")).write_text(
        changed
    )


def genqute() -> None:
    changed = {
        "common": colors["common"],
        "shades": colors["shades"],
        "comment": "This file has been generated by regen.py. Changes may be overwritten the next time configs are re-generated.",
        "alpha": 100,
    }
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/qutebrowser/theme.json")
    ).write_text(dumps(changed))


def genkitty() -> None:
    changed = pathlib.PosixPath("./template/kitty.conf").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/kitty/theme.conf")).write_text(
        changed
    )

    changed = pathlib.PosixPath("./template/tabs.conf").read_text()
    changed = changed % (colors["common"] | colors["shades"])
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/kitty/tabs.conf")).write_text(
        changed
    )


def genzathura() -> None:
    changed = pathlib.PosixPath("./template/zathura.rc").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/zathura/zathurarc")).write_text(
        changed
    )


def geneww() -> None:
    changed = pathlib.PosixPath("./template/eww.scss").read_text()
    changed = changed % (colors["common"] | colors["shades"])
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/eww/themes/auto.scss")
    ).write_text(changed)


def genxresource() -> None:
    changed = pathlib.PosixPath("./template/Xresource.x").read_text()
    changed = changed % (colors["common"] | colors["shades"])
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/Xresources/variables.x")
    ).write_text(changed)


def genpoly() -> None:
    changed = pathlib.PosixPath("./template/polybar.ini").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/polybar/theme.ini")).write_text(
        changed
    )


def gentym() -> None:
    changed = pathlib.PosixPath("./template/tym.lua").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/tym/theme.lua")).write_text(
        changed
    )


def gennvim() -> None:
    changed = pathlib.PosixPath("./template/nvim.lua").read_text()
    changed = changed % (
        colors["common"] | colors["syntax"] | colors["shades"] | colors["rainbow"]
    )
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/nvim/lua/theming/themes/auto.lua")
    ).write_text(changed)


def genbtop() -> None:
    changed = pathlib.PosixPath("./template/btop.theme").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(
        os.path.expandvars("$XDG_CONFIG_HOME/btop/themes/auto.theme")
    ).write_text(changed)


def genjgmenu() -> None:
    changed = pathlib.PosixPath("./template/jgmenu.rc").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/jgmenu/jgmenurc")).write_text(
        changed
    )


def genfirefox() -> None:
    changed = pathlib.PosixPath("./template/firefox.css").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(
        os.path.expandvars("$HOME/.mozilla/profiles/Minimal/chrome/theme.css")
    ).write_text(changed)


def genscreenkey() -> None:
    changed: dict = loads(
        pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/screenkey.json")).read_text()
    )
    changed[
        "comment"
    ] = "This file has been generated by regen.py. Changes may be overwritten the next time configs are re-generated"
    changed["font_color"] = colors["common"]["base14"]
    changed["bg_color"] = colors["shades"]["shade05"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/screenkey.json")).write_text(
        dumps(changed)
    )


def _hex_to_rgb(hexcode):
    hexcode = hexcode.lstrip("#")
    length = len(hexcode)
    return tuple(
        int(hexcode[index : index + length // 3], 16)
        for index in range(0, length, length // 3)
    )


def genplank() -> None:
    parsed = RawConfigParser()
    parsed.optionxform = lambda option: option
    parsed.read(pathlib.PosixPath("./template/dock.theme"))
    modified = [
        f"{';;'.join(map(str, _hex_to_rgb(item)))};;210"
        for item in [
            colors["shades"]["shade02"],
            colors["common"]["base01"],
            colors["shades"]["shade03"],
            colors["shades"]["shade03"],
            colors["common"]["base14"],
        ]
    ]
    parsed["PlankTheme"]["OuterStrokeColor"] = modified[0]
    parsed["PlankTheme"]["FillStartColor"] = modified[1]
    parsed["PlankTheme"]["FillEndColor"] = modified[2]
    parsed["PlankTheme"]["InnerStrokeColor"] = modified[3]
    parsed["PlankDockTheme"]["BadgeColor"] = modified[4]
    with open(
        os.path.expandvars("$XDG_DATA_HOME/plank/themes/AutoDock/dock.theme"), "w"
    ) as configfile:
        parsed.write(configfile)


def genspices() -> None:
    changed = pathlib.PosixPath("./template/spice.ini").read_text()
    changed = changed % {key: value.lstrip("#") for key, value in (colors["common"] | colors["shades"]).items()}
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/spicetify/Themes/Sleek/color.ini")).write_text(changed)


def genzsh() -> None:
    changed = pathlib.PosixPath("./template/zshell.zsh").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/zsh/theme.zsh")).write_text(changed)


def genbash() -> None:
    changed = pathlib.PosixPath("./template/boune_shell.bash").read_text()
    changed = changed % colors["common"]
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/bash/theme.bash")).write_text(changed)


def genkvantum() -> None:
    changed = pathlib.PosixPath("./template/kvantum.kvconfig").read_text()
    changed = changed % (colors["common"] | colors["shades"] | colors["syntax"])
    pathlib.PosixPath(os.path.expandvars("$XDG_CONFIG_HOME/Kvantum/KvAuto/KvAuto.kvconfig")).write_text(changed)


def setwallpaper() -> None:
    wall_choice = os.path.expandvars(choice(colors["wallpapers"]))
    os.system(f"feh --bg-fill '{wall_choice}'")


# genspices()
gendunst()
# geneww()
# gennvim()
# genplank()
# genscreenkey()
# genkitty()
# genxresource()
# genjgmenu()
# genfirefox()
# genbtop()
# gentym()
# genzathura()
# genqute()
# genpoly()
# genkitty()
# genrofi()
# gencava()
# genzsh()
# genbash()
# genkvantum()

# # order matters here
# relxresource()
# relpoly()
# reldunst()
# relspices()
# releww()
# relst()
# relkitty()
# reltym()
# relnvim()
# relbspwm()

# setwallpaper()

# vim:filetype=python
