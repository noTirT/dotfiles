#!/bin/sh

case "${SRANDRD_OUTPUT} ${SRANDRD_EVENT}" in
    "HDMI-A-0 connected") xrandr --output HDMI-A-0 --auto --above eDP;;
    "HDMI-A-0 disconnected") xrandr --output HDMI-A-0 --off;;
    "DisplayPort-0 connected") xrandr --output DisplayPort-0 --auto --above eDP;;
    "DisplayPort-0 disconnected") xrandr --output DisplayPort-0 --off;;
    "DisplayPort-1 connected") xrandr --output DisplayPort-1 --auto --above eDP;;
    "DisplayPort-1 disconnected") xrandr --output DisplayPort-1 --off;;
    "DisplayPort-2 connected") xrandr --output DisplayPort-2 --auto --right-of DisplayPort-1;;
    "DisplayPort-2 disconnected") xrandr --output DisplayPort-2 --off;;
    "DisplayPort-3 connected") xrandr --output DisplayPort-3 --auto --left-of DisplayPort-4;;
    "DisplayPort-3 disconnected") xrandr --output DisplayPort-3 --off;;
    "DisplayPort-4 connected") xrandr --output DisplayPort-4 --auto --above eDP;;
    "DisplayPort-4 disconnected") xrandr --output DisplayPort-4 --off;;
esac
