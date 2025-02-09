#!/bin/bash

if [[ -z "$1" ]]; then
  echo "File not spesified!"
  exit
fi

if [[ -z "$2" ]]; then
  echo "File Name not spesified!"
  exit
fi

ffmpeg -i $1 -vf "fps=15,scale=1920:1080:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif

mkdir frames
ffmpeg -i output.gif frames/frame_%d.png

mv frames/frame_10.png output.png
rm -r frames/

mv output.gif ~/.config/backgrounds/$2.gif
mv output.png ~/.config/backgrounds/gifs/$2.png
