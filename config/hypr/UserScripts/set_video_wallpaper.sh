#!/bin/bash

# Set the directory where your video wallpapers are located
WALLPAPER_DIR="$HOME/Videos/wallpapers"

# Use Rofi to select a wallpaper from the available video files in the directory
SELECTED_WALLPAPER=$(ls "$WALLPAPER_DIR"/*.mp4 | rofi -dmenu -p "Select Video Wallpaper" -i)

# Check if a wallpaper was selected
if [[ -n "$SELECTED_WALLPAPER" ]]; then
    # Play the selected wallpaper using mpvpaper
    mpvpaper -o "loop" eDP-1 "$SELECTED_WALLPAPER"
else
    echo "No wallpaper selected."
fi
