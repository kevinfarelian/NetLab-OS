#!/bin/bash

echo "========================================"
echo "     NetLab-OS Tools Verification"
echo "========================================"

TOOLS=(
    "nmap"
    "traceroute"
    "ifconfig"
    "iperf3"
    "tcpdump"
    "dig"
    "openvpn"
    "putty"
    "curl"
)

FAILED=0

for TOOL in "${TOOLS[@]}"; do
    if command -v "$TOOL" >/dev/null 2>&1; then
        echo "[OK] $TOOL tersedia"
    else
        echo "[FAILED] $TOOL tidak ditemukan"
        FAILED=1
    fi
done

echo "========================================"

if [ "$FAILED" -eq 0 ]; then
    echo "SUCCESS: Semua tools tersedia!"
else
    echo "WARNING: Beberapa tools belum tersedia!"
    exit 1
fi
