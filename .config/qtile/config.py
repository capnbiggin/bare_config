import os
import subprocess

import libqtile.resources
from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from keybindings import *


# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors=[
        ['#FFFFFF', '#FFFFFF'], #colors[0]
        ['#000000', '#000000'], #colors[1]
        ['#FF9900', '#FF9900'], #colors[2]
        ['#648c11', '#648c11'], #colors[3]
        ['#4169e1', '#4169e1'], #colors[4]
        ['#009698', '#009698'], #colors[5]
        ['#800080', '#800080'], #colors[6]
        ['#b768a2', '#b768a2'], #colors[7]
        ['#8b0000', '#8b0000'], #colors[8]
        ['#696969', '#696969']  #colors[9]
        ]

layout_theme = {
    "border_width": 1,
    "margin": 2,
    "border_focus": colors[2],
    "border_normal": colors[8],
    "border_on_single": True
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Propo",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

logo = os.path.join(os.path.dirname(libqtile.resources.__file__), "logo.png")
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(
                    length = 10
                    ),
                widget.GroupBox(
                    this_current_screen_border=colors[2],
                    other_current_screen_border=colors[2],
                    borderwidth=2
                    ),
                widget.TextBox(
                    text="|", 
                    padding=2, 
                    fontsize=14, 
                    foreground=colors[2]
                    ),
                widget.CurrentLayout(mode="icon"),
                widget.TextBox(
                    text="|", 
                    padding=2, 
                    fontsize=14, 
                    foreground=colors[2]
                    ),
                # widget.Prompt(),
                widget.WindowName(max_chars=20),
                #widget.Chord(
                #        chords_colors={
                #        "launch": ("#ff0000", "#ffffff"),
                #    },
                #    name_transform=lambda name: name.upper(),
                #),
                widget.CheckUpdates(
                    distro="Arch_yay",
                    no_update_string="No Updates",
                    colour_have_updates=colors[8],
                    padding=5
                    ),
                widget.Spacer(length = 2),
                widget.WlanIw(
                    format='{essid} {percent:2.0%}'
                    ),
                widget.Spacer(length = 2),
                widget.Volume(
                    padding=5, 
                    background="#648c11", 
                    fmt='VOL:{}'
                    ),
                widget.Spacer(length = 2),
                widget.ThermalSensor(
                    tag_sensor="CPU", 
                    format='{tag}:{temp:.0f}{unit}', 
                    background="#4169e1", 
                    padding=5
                    ),
                widget.Spacer(length = 2),
                widget.Memory(
                        background="#009698", 
                        measure_mem="G", 
                        format='MEM:{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}', 
                        padding=5
                        ),
                widget.Spacer(length = 2),
                widget.Clock(
                        format="%a, %b %d", 
                        background="#b768a2", 
                        padding=5
                        ),
                widget.Spacer(length = 2),
                widget.Clock(
                        format="%I:%M%p", 
                        background="#800080", 
                        padding=5
                        ),
                widget.Spacer(length = 2),
                widget.TextBox(
                        text=" ⏻ ", 
                        padding=5, 
                        background="#8b0000", 
                        mouse_callbacks={"Button1": lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/capn-menu.sh power"))}
                        ),
                widget.Spacer(length = 2),
                widget.SwayNC(
                        padding=5, 
                        fmt=' {}'
                        ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                # widget.Systray(),
                # widget.QuickExit(),
                widget.Spacer(length = 10),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center",
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(
                    length = 10
                    ),
                widget.GroupBox(
                    this_current_screen_border=colors[2],
                    other_current_screen_border=colors[2],
                    borderwidth=2
                    ),
                widget.TextBox(
                    text="|", 
                    padding=2, 
                    fontsize=14, 
                    foreground=colors[2]
                    ),
                widget.CurrentLayout(mode="icon"),
                widget.TextBox(
                    text="|", 
                    padding=2, 
                    fontsize=14, 
                    foreground=colors[2]
                    ),
                # widget.Prompt(),
                widget.WindowName(max_chars=20),
                #widget.Chord(
                #        chords_colors={
                #        "launch": ("#ff0000", "#ffffff"),
                #    },
                #    name_transform=lambda name: name.upper(),
                #),
                widget.CheckUpdates(
                    distro="Arch_yay",
                    no_update_string="No Updates",
                    colour_have_updates=colors[8],
                    padding=5
                    ),
                widget.Spacer(length = 2),
                widget.WlanIw(
                    format='{essid} {percent:2.0%}'
                    ),
                widget.Spacer(length = 2),
                widget.Volume(
                    padding=5, 
                    background=colors[3], 
                    fmt='VOL:{}'
                    ),
                widget.Spacer(length = 2),
                widget.ThermalSensor(
                    tag_sensor="CPU", 
                    format='{tag}:{temp:.0f}{unit}', 
                    background=colors[4], 
                    padding=5
                    ),
                widget.Spacer(length = 2),
                widget.Memory(
                        background=colors[5], 
                        measure_mem="G", 
                        format='MEM:{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}', 
                        padding=5
                        ),
                widget.Spacer(length = 2),
                widget.Clock(
                        format="%a, %b %d", 
                        background=colors[6], 
                        padding=5
                        ),
                widget.Spacer(length = 2),
                widget.Clock(
                        format="%I:%M%p", 
                        background=colors[7], 
                        padding=5
                        ),
                widget.Spacer(length = 2),
                widget.TextBox(
                        text=" ⏻ ", 
                        padding=5, 
                        background=colors[8], 
                        mouse_callbacks={"Button1": lazy.spawn(os.path.expanduser("~/.config/rofi/scripts/capn-menu.sh power"))}
                        ),
                widget.Spacer(length = 2),
                widget.SwayNC(
                        padding=5, 
                        fmt=' {}'
                        ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                # widget.Systray(),
                # widget.QuickExit(),
                widget.Spacer(length = 10),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center",
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
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
auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

idle_timers = []  # type: list
idle_inhibitors = []  # type: list

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart_x11.sh"])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
