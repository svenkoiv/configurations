# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#
# This config file uses keycodes (bindsym) and was written for the QWERTY
# layout.
#
# To get a config file with the same key positions, but for your current
# layout, use the i3-config-wizard
#

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
# font pango:Deja Vu Sans Mono

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 10

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
set $up k
set $down j
set $left h
set $right l

# use Mouse+Mod4 to drag floating windows to their wanted position
floating_modifier Mod4

# start a terminal
bindsym Mod4+Return exec urxvt

# kill focused window
bindsym Mod4+Shift+q kill

# start dmenu (a program launcher)
bindsym Mod4+d exec dmenu_run -sb \#303030 -nb \#121212
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym Mod4+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym Mod4+$left focus left
bindsym Mod4+$down focus down
bindsym Mod4+$up focus up
bindsym Mod4+$right focus right

# alternatively, you can use the cursor keys:
bindsym Mod4+Left focus left
bindsym Mod4+Down focus down
bindsym Mod4+Up focus up
bindsym Mod4+Right focus right

# move focused window
bindsym Mod4+Shift+$left move left
bindsym Mod4+Shift+$down move down
bindsym Mod4+Shift+$up move up
bindsym Mod4+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Up move up
bindsym Mod4+Shift+Right move right

# split in horizontal orientation
bindsym Mod4+b split h

# split in vertical orientation
bindsym Mod4+v split v

# enter fullscreen gode for the focused container
bindsym Mod4+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym Mod4+s layout stacking
bindsym Mod4+w layout tabbed
bindsym Mod4+e layout toggle split

# toggle tiling / floating
bindsym Mod4+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod4+space focus mode_toggle

# focus the parent container
bindsym Mod4+a focus parent

# focus the child container
#bindsym Mod4+d focus child

# move the currently focused window to the scratchpad
bindsym Mod4+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod4+minus scratchpad show

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym Mod4+1 workspace number $ws1
bindsym Mod4+2 workspace number $ws2
bindsym Mod4+3 workspace number $ws3
bindsym Mod4+4 workspace number $ws4
bindsym Mod4+5 workspace number $ws5
bindsym Mod4+6 workspace number $ws6
bindsym Mod4+7 workspace number $ws7
bindsym Mod4+8 workspace number $ws8
bindsym Mod4+9 workspace number $ws9
bindsym Mod4+0 workspace number $ws10

# move focused container to workspace
bindsym Mod4+Shift+1 move container to workspace number $ws1
bindsym Mod4+Shift+2 move container to workspace number $ws2
bindsym Mod4+Shift+3 move container to workspace number $ws3
bindsym Mod4+Shift+4 move container to workspace number $ws4
bindsym Mod4+Shift+5 move container to workspace number $ws5
bindsym Mod4+Shift+6 move container to workspace number $ws6
bindsym Mod4+Shift+7 move container to workspace number $ws7
bindsym Mod4+Shift+8 move container to workspace number $ws8
bindsym Mod4+Shift+9 move container to workspace number $ws9
bindsym Mod4+Shift+0 move container to workspace number $ws10

# assign [class="Spotify"] $ws9
for_window [class="Spotify"] move to workspace $ws9
for_window [class="Element"] move to workspace $ws8
for_window [class="Postman"] move to workspace $ws2

# reload the configuration file
bindsym Mod4+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod4+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym Mod4+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or Mod4+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym Mod4+r mode "default"
}

bindsym Mod4+r mode "resize"
#
# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
	position top
        status_command i3blocks -c ~/.config/i3blocks/config
  # Remove next line if you would like to see some of the system tray icons
	tray_output none
	workspace_min_width 30
	colors {
		background #1d2021
		# border, background, text
		active_workspace	#1d2021 	#1d2021		#ebdbb2
		focused_workspace 	#a89984 #a89984 #1d2021
		inactive_workspace	#1d2021 	#1d2021		#ebdbb2
    urgent_workspace   	#1d2021 	#1d2021 	#ffaf00

	}
}

# Hide title bar
default_border pixel 0
default_floating_border pixel 0

#gaps inner 15
#gaps outer 15
