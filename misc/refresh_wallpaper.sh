#!/usr/bin/env bash

COUNTER=1
EXIT_CODE=1
while [ $EXIT_CODE -ne 0 ]; do
    echo "${COUNTER}: Updating mountain wallpaper using unsplash API..."
    shortcuts run "Desktop Mountain Wallpaper"
    EXIT_CODE=$?
    COUNTER=$(( COUNTER + 1 ))
done