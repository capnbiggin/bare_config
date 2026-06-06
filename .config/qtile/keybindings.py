import os
import subprocess

import libqtile.resources
from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "ghostty"
browser = "zen-browser"
browser2 = "vivaldi"
browser3 = "google-chrome"

keys = [
    # Basics
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    Key([mod], "D", lazy.spawn(os.path.expanduser("~/.config/rofi/launchers/launcher-1.sh")), desc="Spawn rofi launcher"),
    Key([mod, "control"], "D", lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/capn-menu.sh")), desc="Spawn menu launcher"),
    Key([mod, "shift"], "D", lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/projects_menu.sh")), desc="Spawn projects launcher"),
    Key([mod, "shift", "control"], "D", lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/tmux_sessions.sh")), desc="Spawn tmux session launcher"),
    Key([mod, "mod1", "shift"], "D", lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/kill_tmux_sessions.sh")), desc="Spawn kill tmux session launcher"),
    Key([mod], "v", lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/clipboard-history.sh")), desc="Spawn clipboard history"),
    Key([mod, "mod1"], "W", lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/wallpapers.sh")), desc="Spawn clipboard history"),

    Key([mod], "w", lazy.spawn(browser), desc="Launch browser"),
    Key([mod, "shift"], "w", lazy.spawn(browser2), desc="Launch browser"),
    Key([mod, "control"], "w", lazy.spawn(browser3), desc="Launch browser"),

    Key([mod], "O", lazy.spawn("obsidian"), desc="Launch Obsidian"),

    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "s",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]
