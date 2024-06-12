#!/bin/sh

MOVE_WORKSPACE="$1"

case "${SRANDRD_OUTPUT} ${SRANDRD_EVENT}" in
    "HDMI-A-0 connected") xrandr --output HDMI-A-0 --auto --above eDP;;
    "HDMI-A-0 disconnected") xrandr --output HDMI-A-0 --off;;
esac
