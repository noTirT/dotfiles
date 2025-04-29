#!/bin/sh

workspaces=$(i3-msg -t get_workspaces)

echo "$workspaces" | jq -r '.[] | "\(.name):\(.output)"' > /tmp/i3_workspace_mapping.txt


