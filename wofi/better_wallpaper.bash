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

change_colors() {
  WALLPAPER=$(cat ~/.cache/current_wallpaper)
  WALLPAPER_NAME=$(basename "$WALLPAPER" | sed 's/\.[^.]*$//')

  wal -i ~/.config/backgrounds/gifs/"$WALLPAPER_NAME.png"

  SCHEME_FILE="$HOME/.cache/wal/schemes/_home_ika1__config_backgrounds_gifs_${WALLPAPER_NAME}_png_dark_None_None_1.1.0.json"

  if [[ -f "$SCHEME_FILE" ]]; then
    BACKGROUND=$(jq -r '.special.background' "$SCHEME_FILE")
    FOREGROUND=$(jq -r '.special.foreground' "$SCHEME_FILE")

    COLORS=()
    for i in {0..15}; do
      COLORS[i]=$(jq -r ".colors.color$i" "$SCHEME_FILE")
    done

    {
      echo "@define-color main-dark $BACKGROUND;"
      echo "@define-color main-bright $FOREGROUND;"
      for i in {0..15}; do
        echo "@define-color color$i ${COLORS[i]};"
      done

      #Apariently waybar uses gtk3 css. this is not working
      #echo ":root {"
      #echo "  --main-dark: $BACKGROUND;"
      #echo "  --main-bright: $FOREGROUND;"
      #for i in {0..15}; do
      #  echo "  --color$i: ${COLORS[i]};"
      #done
      #echo "}"

    } >~/.config/waybar/colors_pywal.css
  else
    echo "Error: Color scheme file not found!" >&2
  fi
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
  echo "$original_path" >"$HOME/.cache/current_wallpaper"

  change_colors

  swww img "$original_path" --transition-type grow --transition-fps 160 --transition-duration 1 --transition-bezier 0.65,0,0.35,1 --transition-step 1

  notify-send "Wallpaper" "Wallpaper has been updated" -i "$original_path"
fi
