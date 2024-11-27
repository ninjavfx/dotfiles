#!/bin/bash

# Script to use with crontab for automatic locking

export DISPLAY=:1
export XAUTHORITY=/run/user/1001/gdm/Xauthority

# Time threshold in milliseconds (1 minute = 60000 ms)
IDLE_THRESHOLD=(60000 * 15)
#IDLE_THRESHOLD=50000

# Get the idle time in milliseconds
IDLE_TIME=$(xssstate -i)

# Check if the idle time is greater than the threshold
if (( IDLE_TIME > IDLE_THRESHOLD )); then
    # Check if i3lock is running
    if ! pgrep -x "i3lock-color" > 0; then
        # Run the lock script
        /home/ale/dotfiles/betterlockscreen-main/betterlockscreen --lock dim
    fi
fi

