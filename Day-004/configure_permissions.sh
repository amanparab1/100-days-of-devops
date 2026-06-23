#!/bin/bash
# Objective: Grant multi-user read and executable permissions to the xFusionCorp backup script on App Server 1.
# Target File: /tmp/xfusioncorp.sh

set -e

TARGET_SCRIPT="/tmp/xfusioncorp.sh"

echo "Verifying the existence of the target automation script..."
if [ ! -f "$TARGET_SCRIPT" ]; then
    echo "Error: Target script $TARGET_SCRIPT does not exist on this system." >&2
    exit 1
fi

echo "Current file permissions state:"
ls -l "$TARGET_SCRIPT"

echo "Enforcing read and execution permissions for all system users (a+rx)..."
# Using a+rx because bash scripts require read permissions to be parsed and executed by non-root users.
sudo chmod a+rx "$TARGET_SCRIPT"

echo "Verification checklist:"
ls -l "$TARGET_SCRIPT"
echo "Permissions successfully updated. The backup script is now globally executable."
