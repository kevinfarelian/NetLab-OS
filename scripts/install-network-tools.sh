#!/bin/bash

set -e

echo "========================================" echo " NetLab-OS Network Tools Installer" echo "========================================"

PACKAGES=( nmap traceroute net-tools iperf3 tcpdump dnsutils openvpn putty curl )

echo "[1/3] Updating package repository..." sudo apt-get update

echo "[2/3] Installing network tools..."

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "${PACKAGES[@]}"

echo "[3/3] Verifying installed packages..."

FAILED=0

for PACKAGE in "${PACKAGES[@]}"; do if dpkg-query -W -f='Status′"PACKAGE" 2>/dev/null | grep -q "install ok installed"; then echo "[OK] $PACKAGE installed" else echo "[FAILED] $PACKAGE not installed" FAILED=1 fi done

echo "========================================"

if [ "$FAILED" -eq 0 ]; then echo "SUCCESS: All network tools installed!" else echo "ERROR: Some packages failed to install." exit 1 fi
