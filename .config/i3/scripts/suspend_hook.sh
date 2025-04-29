#!/bin/bash

case $1 in
    pre) ~/.config/i3/scripts/save_workspace_config.sh ;;
    post) ~/.config/i3/scripts/restore_workspace_config.sh ;;
esac
