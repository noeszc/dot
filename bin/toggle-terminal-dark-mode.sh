#!/bin/bash

set -e

cd $DOTFILES

kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

DARK_COUNT="$(ag --files-with-matches --ignore=lazy-lock.json --ignore-dir=./bin --nobreak "modus.*vivendi"  | wc -l | xargs)"
LIGHT_COUNT="$(ag --files-with-matches --ignore=lazy-lock.json --ignore-dir=./bin --nobreak "modus.*operandi" | wc -l | xargs)"

if [ $DARK_COUNT -eq 2 ]; then
  # go light
  ag --files-with-matches --ignore-dir=./bin --nobreak "modus.*vivendi" | while read file; do
    gsed -i 's/vivendi/operandi/' "$file"
  done
  kitty @ set-colors --all --configured "~/.config/kitty/modus-operandi.conf"
elif [ $LIGHT_COUNT -eq 2 ]; then
  # go dark
  ag --files-with-matches --ignore-dir=./bin --nobreak "modus.*operandi" | while read file; do
    gsed -i 's/operandi/vivendi/' "$file"
  done
  kitty @ set-colors --all --configured "~/.config/kitty/modus-vivendi.conf"
else
  echo "expected 2 dark or 2 light lines, but found $DARK_COUNT dark and $LIGHT_COUNT light lines"
  exit 1
fi
