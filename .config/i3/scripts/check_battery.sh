#!/bin/sh

PREV_STATE_FILE="/tmp/battery_status_prev"
CAP=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$STATUS" = "Discharging" ]; then
    if [ "$CAP" -lt 5 ]; then
        CURRENT_STATE="HibernatingSoon"
    elif [ "$CAP" -lt 10 ]; then
        CURRENT_STATE="CriticallyLow"
    elif [ "$CAP" -lt 20 ]; then
        CURRENT_STATE="LowBattery"
    else
        CURRENT_STATE="Discharging"
    fi
elif [ "$STATUS" = "Charging" -a "$CAP" -gt 97 ]; then
    CURRENT_STATE="BatteryFull"
else
    CURRENT_STATE="Normal"
fi

if [ -f "$PREV_STATE_FILE" ]; then
    PREV_STATE=$(cat "$PREV_STATE_FILE")
else
    PREV_STATE=""
fi

if [ "$CURRENT_STATE" != "$PREV_STATE" ]; then
    if [ "$CURRENT_STATE" = "HibernatingSoon" ]; then
        notify-send -u critical "Hibernating soon" "Battery nearly empty ($CAP%).\nHibernating soon unless charger is plugged in."
    elif [ "$CURRENT_STATE" = "CriticallyLow" ]; then
        notify-send -u critical "Critically low Battery" "Battery status critically low ($CAP%).\nPlug in the charger."
    elif [ "$CURRENT_STATE" = "LowBatery" ]; then
        notify-send -u normal "Low Battery" "Battery status low ($CAP%).\nPlease plug in the charger."
    elif [ "$CURRENT_STATE" = "BatteryFull" ]; then
        notify-send -u normal "Battery full" "Battery fully charged ($CAP%).\nPlease unplug charger."
    fi
    echo "$CURRENT_STATE" > "$PREV_STATE_FILE"
fi




