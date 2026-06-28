#!/bin/bash
# xFusionCorp Industries Automation Security - Day 7
# Target: Jump Host (thor) -> All App Servers
# Objective: Generate asymmetric keys and bootstrap automated cryptographic trust relationships.

set -e

KEY_FILE="$HOME/.ssh/id_rsa"

# 1. Idempotent Key Generation
if [ ! -f "$KEY_FILE" ]; then
    echo "Generating high-entropy 4096-bit RSA identity key pair..."
    ssh-keygen -t rsa -b 4096 -N "" -f "$KEY_FILE"
else
    echo "Identity key already exists at $KEY_FILE. Proceeding to distribution phase..."
fi

# 2. Key Distribution Matrix
# Note: Initial distribution requires interactive authentication or sshpass utility.
echo "Distributing public key credentials across the cluster architecture..."
for target in "tony@stapp01" "steve@stapp02" "banner@stapp03"; do
    echo "Syncing public key to: $target..."
    ssh-copy-id -i "${KEY_FILE}.pub" -o StrictHostKeyChecking=no "$target"
done

# 3. Connection Validation Auditing
echo "Auditing cluster authentication pathways..."
for target in "tony@stapp01" "steve@stapp02" "banner@stapp03"; do
    REMOTE_HOST=$(ssh -o ConnectTimeout=5 "$target" "hostname")
    echo "Connection verified: $target connected to node -> $REMOTE_HOST"
done
