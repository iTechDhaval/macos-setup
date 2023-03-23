#!/usr/bin/env bash

COUNTER=1
EXIT_CODE=1
while [ $EXIT_CODE -ne 0 ]; do
    echo "${COUNTER}: Updating mountain wallpaper using unsplash API..."
    shortcuts run "Desktop Mountain Wallpaper"
    EXIT_CODE=$?
    COUNTER=$(( COUNTER + 1 ))
done

# Cleanup some old wallpapers occupying the space
EXIT_CODE_CLEANUP=1
while [ $EXIT_CODE_CLEANUP -ne 0 ]; do
    echo "Info: Cleaning wallpaper folder..."
    shortcuts run "Cleanup Wallpapers"
    EXIT_CODE_CLEANUP=$?
done