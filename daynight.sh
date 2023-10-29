#!/usr/bin/env bash

DIR="$(dirname "$(readlink -f "$0")")"

echo "| image=$(cat $DIR/icon.png | base64 -w 0)"
echo "---"
echo "Day | image=$(cat $DIR/icon-day.png | base64 -w 0) bash='gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4700' terminal=false"
echo "Night | image=$(cat $DIR/icon-night.png | base64 -w 0) bash='gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2000' terminal=false"
echo "---"

TEMPS=( 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 )
COLORS=( '#FF0000' '#FF5555' '#FFAAAA' '#FFCCCC' '#FFFFFF' '#CCCCFF' '#AAAAFF' '#7777FF' '#3333FF' '#0000FF' )
for i in ${!TEMPS[@]}; do
  echo "-> <span color='${COLORS[$i]}'><tt>${TEMPS[$i]}</tt></span> °K | bash='gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature ${TEMPS[$i]}' terminal=false"
done