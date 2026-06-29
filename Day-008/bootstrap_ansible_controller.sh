#!/bin/bash
# xFusionCorp Industries Configuration Management - Day 8
# Target: Jump Host (Ansible Controller Bootstrap)
# Objective: Global deployment of Ansible v4.8.0 via Python3 package manager.

set -e

# Enforce root/sudo execution boundaries
if [ "$EUID" -ne 0 ]; then
  echo "Execution Error: Administrative access (sudo) required for global binary placement." >&2
  exit 1
fi

echo "Verifying Python3 package manager dependencies..."
if ! command -v pip3 &> /dev/null; then
    echo "Installing python3-pip sub-system..."
    yum install -y python3-pip
fi

echo "Deploying Ansible v4.8.0 to global environment (/usr/local/bin)..."
pip3 install ansible==4.8.0

echo "Auditing global binary path mapping:"
BINARY_PATH=$(which ansible)
echo "Ansible binary located at: $BINARY_PATH"

echo "Verifying deployment package release version:"
pip3 show ansible | grep Version
echo "Ansible Controller initialization complete."
