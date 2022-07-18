#!/bin/sh

is_eww_opened() {
  window="$(eww windows | grep "\*$1" | tr --delete '*')"
  [ "$window" = "$1" ] && echo 1 || echo 0
}

while sleep 1; do
  pgrep -x picom >/dev/null || continue
  opened="$(is_eww_opened ocular)"
  if bspc query --nodes --node focused.\!hidden; then
    [ "$opened" -eq 1 ] && eww close ocular
  else
    [ "$opened" -eq 0 ] && {
      eww open ocular
      xdo lower -N eww-ocular
    }
  fi
done

# vim:ft=sh
