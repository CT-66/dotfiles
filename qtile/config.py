from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile import hook

import os
import subprocess

MOD = "mod4"
TERMINAL = "st"
HOME = os.path.expanduser("~")
ctrl = "control"
alt = "mod1"
shift = "shift"

# Startup
@hook.subscribe.startup
def autostart():
    subprocess.Popen(HOME + "/Dotfiles/startup.sh")

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([MOD], "h", lazy.layout.left()),
    Key([MOD], "l", lazy.layout.right()),
    Key([MOD], "j", lazy.layout.down()),
    Key([MOD], "k", lazy.layout.up()),
    Key([MOD], "space", lazy.layout.next()),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([MOD, shift], "h", lazy.layout.shuffle_left()),
    Key([MOD, shift], "l", lazy.layout.shuffle_right()),
    Key([MOD, shift], "j", lazy.layout.shuffle_down()),
    Key([MOD, shift], "k", lazy.layout.shuffle_up()),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([MOD, ctrl], "h", lazy.layout.grow_left()),
    Key([MOD, ctrl], "l", lazy.layout.grow_right()),
    Key([MOD, ctrl], "j", lazy.layout.grow_down()),
    Key([MOD, ctrl], "k", lazy.layout.grow_up()),
    Key([MOD], "n", lazy.layout.normalize()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([MOD, shift], "Return", lazy.layout.toggle_split()),
    Key([MOD, shift, alt, ctrl], "Return", lazy.spawn("xterm")),
    Key([MOD], "f", lazy.window.toggle_fullscreen()),
    # Toggle between different layouts as defined below
    Key([MOD, shift], "Tab", lazy.next_layout()),
    Key([MOD, shift], "q", lazy.window.kill()),
    Key([MOD, shift], "c", lazy.reload_config()),
    Key([MOD, shift, alt, ctrl], "r", lazy.restart()),
    # Key([MOD, ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]

# Workspaces
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # MOD1 + letter of group = switch to group
            Key(
                [MOD],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # MOD1 + shift + letter of group = switch to & move focused window to group
            Key(
                [MOD, shift],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # MOD1 + shift + letter of group = move focused window to group
            # Key([MOD, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus = "#ffffff",
        border_width = 2,
        margin = 15,
        border_on_single = True,
        margin_on_single = True
    ),
    layout.Max(),
    # layout.MonadTall(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# Drag floating layouts.
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
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
auto_minimize = False

wmname = "LG3D"
