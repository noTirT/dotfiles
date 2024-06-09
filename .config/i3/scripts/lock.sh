#!/bin/bash
set -e
case "$1" in
    suspend)
        i3lock --ignore-empty-password --tiling -i ~/Pictures/coding_wallpaper_3_blurred_3.png && systemctl suspend
        ;;
    *)
        i3lock --nofork --ignore-empty-password --tiling -i ~/Pictures/coding_wallpaper_3_blurred_3.png
        ;;
esac
xset dpms
