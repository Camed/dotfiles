#!/bin/bash

WALLPAPERS_DIR="$HOME/.config/hypr/wallpapers"
DEFAULT_INTERVAL=3600
INTERVAL=$1

if ! [[ $INTERVAL =~ ^[0-9]+$ ]] || [[ "$INTERVAL" -le 0 ]]; then
	echo "Invalid interval: $INTERVAL. Provide positive number smaller then INT_MAX"
	echo "Starting with default interval, $DEFAULT_INTERVAL"
	INTERVAL=$DEFAULT_INTERVAL
fi

while true; do
	RANDOM_WALL=$(find "$WALLPAPERS_DIR" -type f -name '*.png' | shuf -n 1)
	swaybg -m fill -i "$RANDOM_WALL" &
	sleep "$INTERVAL"
done

