#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi

echo "Searching for core audio process..."
PID=$(ps -A | grep 'coreaudiod' | grep -v 'grep' | awk '{print $1}')

[[ ! -z "${PID}" ]] \
    && ( echo "Killing process with ${PID}..."; \
          kill -9 $PID; \
          echo 'Done') \
    || ( echo "Process not found." )