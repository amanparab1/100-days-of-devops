#!/bin/bash
# xFusionCorp Industries Task Automation - Day 6
# Target: All App Servers (stapp01, stapp02, stapp03)
# Objective: Provision cronie subsystem and schedule sample health check task.

set -e

# Enforce root execution safety check
if [ "$EUID" -ne 0 ]; then
  echo "Execution Error: Run this script with administrative privileges (sudo)." >&2
  exit 1
fi

echo "Installing cronie automation engine..."
yum install -y cronie

echo "Activating and enabling crond system lifecycle daemon..."
systemctl start crond
systemctl enable crond

echo "Injecting task execution configuration into root spool..."
CRON_JOB="*/5 * * * * echo hello > /tmp/cron_text"
echo "$CRON_JOB" | crontab -

echo "Verifying root crontab active automation jobs:"
crontab -l
echo "Automation environment verified and stable."
