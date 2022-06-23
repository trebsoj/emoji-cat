#!/usr/bin/env bash

file="/tmp/emoji-cat.list"

# Descarreguem llista d'emojis si no la tenim en el sistema
if [ ! -f "$file" ]; then
  curl -sSL 'https://gist.githubusercontent.com/trebsoj/afbccf5bbe1f98a16712f14ad3c5d50e/raw/emoji-cat' >| "$file"
fi

# Seleccionar emoji
emoji=$(cat $file | rofi -dmenu -show-icons -i | awk {'print $1'})
sleep 0.2

# Escriure emoji on hi havia el focus
xdotool type $emoji
