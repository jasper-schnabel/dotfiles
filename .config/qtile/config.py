# qtile config
# TODO: applications spawend with Group.Match should be focused on spawn

# imports
from libqtile.lazy import lazy
from libqtile.config import Key, Drag, Group, ScratchPad, DropDown
from libqtile import layout
from bar import screens

# toggle floating, set a defined size and center the window
@lazy.window.function
def better_toggle_floating(win):
  win.cmd_toggle_floating()
  if win.floating:
    win.cmd_set_size_floating(800, 600)
    win.cmd_center()

# this feature: https://i3wm.org/docs/userguide.html#workspace_auto_back_and_forth
def better_toscreen(qtile, group_name):
  if group_name  == qtile.current_screen.group.name:
    return qtile.current_screen.set_group(qtile.current_screen.previous_group)
  for i, group in enumerate(qtile.groups):
    if group_name == group.name:
      return qtile.current_screen.set_group(qtile.groups[i])

# key mappings
mod = "mod4"
keys = [
  # kill focused window
  Key([mod, "shift"], "q", lazy.window.kill()),
  
  # focus windows
  Key([mod], "h", lazy.layout.left()),
  Key([mod], "j", lazy.layout.down()),
  Key([mod], "k", lazy.layout.up()),
  Key([mod], "l", lazy.layout.right()),
  
  # move active window
  Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
  Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
  Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
  Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
  
  # resize active window
  Key([mod, "control"], "k", lazy.layout.grow()),
  Key([mod, "control"], "j", lazy.layout.shrink()),

  # restart qtile
  Key([mod, "shift"], "r", lazy.restart()),
  
  # quit qtile
  Key([mod, "shift"], "x", lazy.shutdown()),
  
  # toggle fullscreen on the focused window
  Key([mod], "f", lazy.window.toggle_fullscreen()),
  
  # toggle floating on the focused window
  Key([mod], "o", better_toggle_floating),
  
  # reset all window sizes
  Key([mod], "r", lazy.layout.reset()),
  
   # cycle through layouts
  Key([mod], "Tab", lazy.next_layout()),
  
  # flip layout
  Key([mod, "shift"], "space", lazy.layout.flip()),
  
  # toggle the scratchpad
  Key([mod, "shift"], "p", lazy.group["scratchpad"].dropdown_toggle("terminal")),
]

# floating key mappings
for key, x, y in [ ("Left", -10, 0), ("Right", 10, 0), ("Up", 0, -10), ("Down", 0, 10) ]:
  keys.append(Key([mod, "control"], key, lazy.window.move_floating(x, y)))
  keys.append(Key([mod, "shift"], key, lazy.window.resize_floating(x, y)))

# mouse mappings
mouse = [
  # move focused floating window
  Drag([mod], "Button3", lazy.window.set_position_floating(),
    start = lazy.window.get_position()),
  # resize focused floating window
  Drag([mod], "Button1", lazy.window.set_size_floating(),
    start = lazy.window.get_size()),
]

# define groups
groups = [
  Group("1", layout = "monadtall"),
  Group("2", layout = "monadtall"),
  Group("3", layout = "monadtall"),
  Group("4", layout = "monadtall"),
  Group("5", layout = "monadtall"),
  Group("6", layout = "monadtall"),
  Group("7", layout = "monadtall"),
  Group("8", layout = "monadtall"),
  Group("9", layout = "monadtall"),
]

# groups key mappings
for i in groups:
  # move to group
  keys.append(Key([mod], i.name, lazy.function(better_toscreen, i.name)))

  # send focused window to group
  keys.append(Key([mod, "control"], i.name, lazy.window.togroup(i.name)))

  # send focused window to group and switch to it
  keys.append(Key([mod, "shift"], i.name, lazy.window.togroup(i.name), lazy.group[i.name].toscreen()))

# define scratchpad
groups.append(
  ScratchPad("scratchpad", [
    DropDown("terminal", "/usr/bin/alacritty", height = 0.55, width = 0.60, x = 0.2),
  ])
)

# border and gaps
layout_settings = {
  "border_normal": "#2C323C",
  "border_focus": "#EFF0EB",
  "border_width": 2,
  "margin": 14,
}

# layouts
layouts = [
  layout.MonadTall(**layout_settings),
  layout.MonadWide(**layout_settings),
  layout.Stack(**layout_settings, num_stacks = 1),
  layout.Floating(**layout_settings),
  layout.RatioTile(**layout_settings),
]

floating_layout = layout.Floating(**layout_settings)

# cursor warp and no click to focus
cursor_warp = True
follow_mouse_focus = True

# wm name (default: LG3D)
wmname = "qtile"
