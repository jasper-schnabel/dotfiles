# statusbar config
from libqtile.config import Screen
from libqtile import bar, widget, qtile
import os, subprocess

# colors
colors = [
  "#1C1C1C",
  "#EFF0EB",
  "#2C323C",
  "#FF0000",
  "#00FF5F",
  "#FDFD00",
  "#005FD7",
  "#FF0085",
  "#00D7FF"
]

# defaults
widget_defaults = dict(
  font = "Inconsolata Nerd Font",
  fontsize = 16,
  padding = 6
)

screens = [Screen(
  top = bar.Bar([
    widget.GroupBox(
      highlight_method = "line",
      background = colors[0],
      highlight_color = colors[0],
      block_highlight_text_color = colors[5],
      active = colors[1],
      borderwidth = 0,
      padding_x = 18,
      disable_drag = True,
      hide_unused = True,
      **widget_defaults
    ),
    widget.CurrentLayout(
      **widget_defaults
    ),
    widget.Spacer(
      length = bar.STRETCH
    ),
    widget.TextBox(
      text = "寧",
      foreground = colors[5],
      mouse_callbacks = { "Button1": lambda: qtile.cmd_spawn("mpc prev") },
      **widget_defaults
    ),
    widget.Mpd2(
      foreground = colors[5],
      play_states = { "play": "", "pause": "▶", "stop": "■" },
      status_format = "{play_status}",
      no_connection = "懶",
      **widget_defaults
    ),
    widget.TextBox(
      text = "嶺",
      foreground = colors[5],
      mouse_callbacks = { "Button1": lambda: qtile.cmd_spawn("mpc next") },
      **widget_defaults
    ),
    widget.Mpd2(
      status_format = "{artist} - {title}",
      no_connection = "",
      **widget_defaults
    ),
    widget.Spacer(
      length = bar.STRETCH
    ),
    widget.GenPollText(
      foreground = colors[6],
      update_interval = 5,
      func = lambda: subprocess.check_output(os.path.expanduser("~/.config/qtile/scripts/battery.qtile")).decode("utf-8"),
      **widget_defaults
    ),
    widget.Wlan(
      foreground = colors[7],
      interface = "wlp4s0",
      format = "{essid}",
      **widget_defaults
    ),
    widget.GenPollText(
      foreground = colors[5],
      update_interval = 5,
      func = lambda: subprocess.check_output(os.path.expanduser("~/.config/qtile/scripts/bluetooth.qtile")).decode("utf-8"),
      **widget_defaults
    ),
    widget.Clock(
      foreground = colors[4],
      format = "  %a %d. %b %H:%M",
      **widget_defaults
    ),
  ],
    size = 40,
    background = colors[0]
  )
)]
