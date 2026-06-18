#!/bin/bash
# xFusionCorp Industries Infrastructure Automation - Day 3
# Target: Distributed App Clusters (stapp01, stapp02, stapp03)
# Objective: Programmatic execution of SSH root access mitigation protocols.

set -e # Exit immediately on error

echo "Executing SSH configuration hardening protocols..."

# Inline stream editing pattern to enforce non-root ingress boundaries
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

echo "Recycling OpenSSH service daemon..."
sudo systemctl restart sshd

echo "System state successfully hardened."
