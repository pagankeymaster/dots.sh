#!/bin/sh

USERNAME="$1"
LOCKSCREEN_WALL="/home/$USERNAME/Pictures/wallpapers/mountain/beach.jpg"
DEFAULT_DPMS=$(xset q | awk '/^[[:blank:]]*DPMS is/ {print $(NF)}')
LOCK_TIMEOUT=5 ### In Seconds
DUNST_INSTALLED=false && [ -e "$(command -v dunstctl)" ] && DUNST_INSTALLED=true
DUNST_IS_PAUSED=false && [ "$DUNST_INSTALLED" = true ] && DUNST_IS_PAUSED=$(dunstctl is-paused)

prelock() {
  [ "$DEFAULT_DPMS" = Enabled ] && xset dpms "$LOCK_TIMEOUT"
  [ "$DUNST_INSTALLED" = true ]         \
    && [ "$DUNST_IS_PAUSED" = false ]   \
    && dunstctl set-paused true
}

lock() {
  i3lock                        \
    --beep                      \
    --image="$LOCKSCREEN_WALL"  \
    --max                       \
    --pointer=default           \
    --ignore-empty-password     \
    --show-failed-attempts      \
    --radius 40                 \
    --wrong-text=              \
    --wrong-font=Dosis          \
    --wrong-pos 955:200         \
    --wrong-size=100            \
    --greeter-text=            \
    --greeter-font=Dosis        \
    --greeter-size=80           \
    --greeter-pos 955:950       \
    --no-modkey-text            \
    --bar-indicator             \
    --bar-direction=2           \
    --bar-base-width 40         \
    --bar-pos 0:1085            \
    --bar-count 10              \
    --pass-media-keys           \
    --pass-screen-keys          \
    --pass-volume-keys          \
    --pass-power-keys
}

postlock() {
  [ "$DEFAULT_DPMS" = Enabled ] && xset dpms 0
}

prelock
lock
postlock

# vim:ft=bash:nowrap
