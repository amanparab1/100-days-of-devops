#!/bin/bash
# xFusionCorp Industries Infrastructure Automation
# Target: App Server 1 (stapp01)
# Objective: Provision a secure, non-interactive service account for the backup agent tool.

if [ "$EUID" -ne 0 ]; then
  echo "Please execute this script with administrative privileges (sudo)."
  exit 1
fi

echo "Instantiating non-interactive account: john..."
useradd -s /sbin/nologin john

echo "Auditing user access configuration:"
grep john /etc/passwd
