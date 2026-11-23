#!/bin/bash
mkdir -p output
shopt -s nullglob

for f in *.webp; do
  read -r width height < <(identify -format '%w %h' "$f")
  width=$((width / 3))
  height=$((height / 3))
  (( width < 1 )) && width=1
  (( height < 1 )) && height=1

  cwebp "$f" -resize "$width" "$height" -q 80 -o "output/$f"
done