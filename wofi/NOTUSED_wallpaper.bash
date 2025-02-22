#!/usr/bin/env bash

backgrounds_dir="$HOME/.config/backgrounds"
gifs_dir="$HOME/.config/backgrounds/gifs"

backgrounds=$(find "$backgrounds_dir" -maxdepth 1 -type f -printf "%f\n")

choice=$(echo -e "$backgrounds" | wofi -d -p "Select a wallpaper:" --show-images)

if [[ -n "$choice" ]]; then
  file="$backgrounds_dir/$choice"

  if [[ "$choice" == *.gif ]]; then
    static_frame="${gifs_dir}/${choice%.*}.png"

    if [[ -f "$static_frame" ]]; then
      swww img "$static_frame" --transition-type any
    fi
  fi

  swww img "$file" --transition-type any
fi
