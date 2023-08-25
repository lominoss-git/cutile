import os
import socket
import subprocess
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget

mod = "mod4"
terminal = "xfce4-terminal"

margin = 10
border_width = 3

colors = { # Nord
    "background": "#2E3440",
    "foreground": "#ECEFF4",
    "symbol": "#BE8EAD", # at symbol between user and hostname
    "prompt": "#BE8EAD",
    "volume": "#88C0D0",
    "memory": "#EBCb8B",
    "time": "#B48EAD",
    "active_desktop": "#A3BE8C",
    "unimportant": "#5E6779", # For empty workspaces and separators
    "active_border": "#ECEFF4",
    "inactive_border": "#3B4252",
}

keys = [
    # Switch between windows
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to next window"),
    Key([mod, "shift"], "Tab", lazy.layout.previous(), desc="Move window focus to previous window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.shrink(), desc="Shrink window"),
    Key([mod, "control"], "l", lazy.layout.grow(), desc="Grow window"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.flip(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "semicolon", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "b", lazy.hide_show_bar("top"), desc="Toggle top bar"),
]

groups = [
    Group(**i)
    for i in [
        {"name": "DEV"},
        {"name": "WEB"},
        {"name": "SYS"},
        {"name": "DOC"},
        {"name": "VRT"},
        {"name": "CHT"},
        {"name": "MUS"},
        {"name": "VID"},
        {"name": "GFX"},
    ]
]

for i, group in enumerate(groups):
    keys.extend(
        [
            # mod1 + number of group = switch to group
            Key(
                [mod],
                str(i + 1),
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # mod1 + shift + number of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(i + 1),
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        ratio=0.52,
        change_ratio=0.015,
        change_size=50,
        border_focus=colors["active_border"],
        border_normal=colors["inactive_border"],
        border_width=border_width,
        margin=margin,
    ),
    layout.Max(
        border_focus=colors["active_border"],
        border_normal=colors["inactive_border"],
        border_width=border_width,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.Columns(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Iosevka Nerd Font",
    foreground=colors["foreground"],
    background=colors["background"],
    fontsize=20,
    padding=0,
)
extension_defaults = widget_defaults.copy()

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
user = os.environ["USER"]
hostname = socket.gethostname()


def separator(character="·", padding=8):
    return widget.TextBox(
        character,
        padding=padding,
        foreground=colors["unimportant"],
    )


rect_decoration = decoration_group = {
    "decorations": [
        widget.decorations.RectDecoration(
            use_widget_background=True,
            radius=0,
            filled=True,
            padding_x=0,
            padding_y=3,
            clip=True,
        )
    ],
}

screens = [
    Screen(
        top=bar.Bar(
            [
                separator(character=" ", padding=1),
                widget.TextBox(
                    user,
                ),
                widget.TextBox(
                    "@",
                    foreground=colors["symbol"]
                ),
                widget.TextBox(
                    hostname,
                ),
                widget.Prompt(prompt="", fmt=": <span color='{0}'>{1}</span>".format(colors["prompt"], "{}"), cursor_color=colors["prompt"]),
                separator(),
                widget.TextBox(
                    "Volume: ",
                ),
                widget.Volume(
                    foreground=colors["volume"],
                ),
                separator(),
                widget.TextBox(
                    "Memory: ",
                ),
                widget.Memory(
                    format="{MemUsed:.0f}M",
                    foreground=colors["memory"],
                ),
                widget.Spacer(bar.STRETCH),
                widget.GroupBox(
                    active=colors["foreground"],
                    inactive=colors["unimportant"],
                    block_highlight_text_color=colors["background"],
                    this_current_screen_border=colors["active_desktop"],
                    highlight_method="block",
                    rounded=False,
                    invert_mouse_wheel=True,
                    disable_drag=True,
                    border_width=0,
                    padding=15,
                    **rect_decoration,
                ),
                widget.Spacer(bar.STRETCH),
                widget.Clock(
                    format="%a, %b %d "
                ),
                widget.Clock(
                    format="%H:%M:%S",
                    foreground=colors["time"]
                ),
                separator(character=" ", padding=1),
            ],
            45,  # Bar height
            background="#2E3440",
        ),
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
follow_mouse_focus = False
bring_front_click = False
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
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
