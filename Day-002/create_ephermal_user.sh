#!/bin/bash
# xFusionCorp Industries Infrastructure Automation - Day 2
# Target: App Server 3 (stapp03)
# Objective: Provision a temporary developer profile bound to strict account expiration bounds.

if [ "$EUID" -ne 0 ]; then
  echo "Operational failure: This automation script requires elevated privileges (sudo)."
  exit 1
fi

echo "Initializing temporary user account: jim..."
useradd -e 2027-01-28 jim

echo "Auditing lifecycle constraints for validation:"
chage -l jim
