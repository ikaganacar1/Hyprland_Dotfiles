#!/usr/bin/env bash

# The original app belongs to this repo: https://github.com/highonskooma/Wofi-Wallpaper-Picker
# I Modified it for my use case.

WALLPAPER_DIR="$HOME/.config/backgrounds"
CACHE_DIR="$HOME/.cache/wallpaper-selector"
THUMBNAIL_WIDTH="250" # Size of thumbnails in pixels (16:9)
THUMBNAIL_HEIGHT="141"

mkdir -p "$CACHE_DIR"

generate_thumbnail() {
  local input="$1"
  local output="$2"
  magick "$input" -thumbnail "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}^" -gravity center -extent "${THUMBNAIL_WIDTH}x${THUMBNAIL_SIZE}" "$output"
}

generate_menu() {
  for img in "$WALLPAPER_DIR"/*.{gif,png,jpg,jpeg}; do
    [[ -f "$img" ]] || continue

    thumbnail="$CACHE_DIR/$(basename "${img%.*}").png"

    if [[ ! -f "$thumbnail" ]] || [[ "$img" -nt "$thumbnail" ]]; then
      # generate_thumbnail "$img" "$thumbnail"
      cp "$HOME/.config/backgrounds/gifs/$(basename "${img%.*}").png" "$CACHE_DIR/$(basename "${img%.*}").png"

    fi

    echo -en "img:$thumbnail\x00info:$(basename "$img")\x1f$img\n"
  done
}

selected=$(
  generate_menu | wofi --show dmenu \
    --cache-file /dev/null \
    --define "image-size=$THUMBNAIL_SIZE" \
    --columns 2 \
    --allow-images \
    --insensitive \
    --prompt "Select Wallpaper" \
    --conf ~/.config/wofi/wallpaper.conf
)

if [ -n "$selected" ]; then
  thumbnail_path="${selected#img:}"

  original_filename=$(basename "${thumbnail_path%.*}")

  original_path=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f -name "${original_filename}.*" | head -n1)

  echo "$original_path"
  if [[ "$original_path" == *.gif ]]; then
    static_frame="$WALLPAPER_DIR/gifs/${original_filename}.png"

    swww img "$static_frame" --transition-type grow --transition-fps 160 --transition-duration 1 --transition-bezier 0.65,0,0.35,1 --transition-step 1

  fi

  swww img "$original_path" --transition-type grow --transition-fps 160 --transition-duration 1 --transition-bezier 0.65,0,0.35,1 --transition-step 1

  echo "$original_path" >"$HOME/.cache/current_wallpaper"

  notify-send "Wallpaper" "Wallpaper has been updated" -i "$original_path"
fi
