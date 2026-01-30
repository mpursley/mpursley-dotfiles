#!/bin/bash

while true; do
    echo "=== System Temperatures ($(date '+%Y-%m-%d %H:%M:%S')) ==="
    # Get standard sensor data
    sensors | grep -E 'Composite|Tctl|edge|temp1' | sed 's/^+//'

    # Get NVIDIA GPU temp if available
    if command -v nvidia-smi &> /dev/null; then
        NVIDIA_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null)
        if [ -n "$NVIDIA_TEMP" ]; then
            echo "NVIDIA GPU:   ${NVIDIA_TEMP}.0°C"
        else
            echo "NVIDIA GPU:   (Offline/Sleeping)"
        fi
    else
        echo "NVIDIA GPU:   (Driver not found)"
    fi

    echo ""
    echo -n "Press [Ctrl+C] to stop. Next update, 10sec "
    for i in {1..10}; do
        sleep 1
        echo -n "."
    done
    echo
done
