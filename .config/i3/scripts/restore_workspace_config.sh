#!/bin/bash

file="/tmp/i3_workspace_mapping.txt"

while IFS=: read -r workspace screen; do
    i3-msg "workspace $workspace; move workspace to output $screen"
done < "$file"
