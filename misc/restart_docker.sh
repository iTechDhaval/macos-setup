#!/usr/bin/env bash

echo -n "Restarting Docker..."
killall Docker \
    && open /Applications/Docker.app \
    && while ! docker system info > /dev/null 2>&1; do sleep 1; done
echo "[Done]"