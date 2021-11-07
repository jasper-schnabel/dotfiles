# xinit config

# swap capslock and escape
setxkbmap -option caps:escape &

# higher keyboard repeat
xset r rate 200 100 &

# higher touchpad speed
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Accel Speed' 0.6 &

# natural-scrolling
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Natural Scrolling Enabled' 1 &

# tap-to-click
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1 &

# higher trackpoint speed
xinput --set-prop 'TPPS/2 ALPS TrackPoint' 'libinput Accel Speed' 0.6 &

# hide the cursor after two seconds of inactivity
unclutter --timeout 2 &

# disable system beep
xset -b b off &

# lock the screen after 5 minutes and when suspending
xset s 300 && xss-lock slock &

# set wallpaper
xwallpaper --zoom ~/.local/share/wallpaper.png &

# start xob
mkfifo /tmp/xob.fifo &
tail -f /tmp/xob.fifo | xob &

# start mpd-conky
conky &

# start sxhkd
sxhkd &

# start dunst
dunst &

# start clipmenu
clipmenud &

# start mpd
mpd &

# start wm
# not chosen yet
