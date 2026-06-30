#!/bin/bash
# xFusionCorp Industries Incident Response - Day 9
# Target: Database Server (stdb01)
# Objective: Diagnose and resolve MariaDB initialization failure.

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Execution Error: Root privileges required for database service restoration." >&2
  exit 1
fi

echo "Analyzing MariaDB daemon initialization logs..."
systemctl status mariadb || true

echo "Applying permission rectifications to database runtime directories..."
# Fix 1: Runtime PID directory ownership drift
if [ -d "/run/mariadb" ]; then
    chown -R mysql:mysql /run/mariadb
fi

# Fix 2: Data directory deletion or permission drift
if [ ! -d "/var/lib/mysql" ]; then
    echo "Data directory missing. Re-provisioning /var/lib/mysql..."
    mkdir -p /var/lib/mysql
fi
chown -R mysql:mysql /var/lib/mysql

# Fix 3: Configuration schema drift mapping
echo "Auditing core configuration files for invalid datadir mapping..."
if grep -q "/var/lib/mysqld" /etc/my.cnf.d/mariadb-server.cnf 2>/dev/null; then
    echo "Correcting datadir typo in mariadb-server.cnf..."
    sed -i 's/\/var\/lib\/mysqld/\/var\/lib\/mysql/g' /etc/my.cnf.d/mariadb-server.cnf
fi

echo "Restarting database daemon..."
systemctl daemon-reload
systemctl restart mariadb
systemctl enable mariadb

echo "Service Restoration Complete. Current Status:"
systemctl is-active mariadb
