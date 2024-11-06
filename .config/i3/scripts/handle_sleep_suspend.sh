#!/bin/bash

DIM_TIME=240
SUSPEND_TIME=510

xset s $DIM_TIME $DIM_TIME

is_music_playing() {
    if playerctl status 2>/dev/null | grep -q "Playing"; then
        return 0
    elif pactl list sinks | grep -q "State: RUNNING"; then
        return 0
    fi

    return 1
}

is_user_active() {
    local idle_time_ms=$(xprintidle)

    local compare_time_ms=$(($1 * 1000))

    # Check if user was idle longer than DIM_TIME
    if [ "$idle_time_ms" -lt "$compare_time_ms" ]; then
        return 0
    fi

    # User inactive
    return 1
}

while true; do
    sleep $((DIM_TIME - 10))

    if is_music_playing; then
        xset s reset
        continue
    fi

    sleep $((SUSPEND_TIME - DIM_TIME + 11))

    if is_music_playing || is_user_active "$SUSPEND_TIME"; then
        xset s reset
        continue
    fi

    sh ~/.config/i3/scripts/lock.sh suspend
done
