#!/bin/bash
# xFusionCorp Industries Infrastructure Automation - Day 5 (Part 2)
# Target: App Server 1 (stapp01)
# Objective: Install SELinux dependencies and stage permanent disabled state behavior.

set -e

# 1. Privileged State Enforcement
if [ "$EUID" -ne 0 ]; then
  echo "Execution Error: Administrative access (sudo) required." >&2
  exit 1
fi

# 2. Package Dependency Management
echo "Provisioning core SELinux toolsets..."
yum install -y policycoreutils selinux-policy-targeted

# 3. Target Configuration Alteration
CONFIG_FILE="/etc/selinux/config"
if [ -f "$CONFIG_FILE" ]; then
    echo "Staging permanent 'disabled' state parameter inside $CONFIG_FILE..."
    sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' "$CONFIG_FILE"
else
    echo "Configuration fallback: Targeting secondary sysconfig pathway..."
    sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/sysconfig/selinux
fi

# 4. Post-Change Quality Audit
echo "Verifying staged configuration value:"
grep ^SELINUX= /etc/selinux/config || grep ^SELINUX= /etc/sysconfig/selinux
