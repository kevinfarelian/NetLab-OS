#!/bin/bash

# Network Tools Installer
# Install 9 network administration tools

set -u

PACKAGES=(
    nmap
    traceroute
    net-tools
    iperf3
    tcpdump
    dnsutils
    openvpn
    putty
    curl
)

echo "======================================"
echo "       NETWORK TOOLS INSTALLER"
echo "======================================"

# Check root access
if [[ $EUID -ne 0 ]]; then
    echo "Jalankan script menggunakan sudo!"
    exit 1
fi

echo "[1] Updating package list..."
apt-get update || {
    echo "Gagal melakukan apt-get update."
    exit 1
}

echo ""
echo "[2] Installing network tools..."

FAILED=()

for PACKAGE in "${PACKAGES[@]}"; do
    echo "Installing: $PACKAGE"

    if DEBIAN_FRONTEND=noninteractive \
        apt-get install -y "$PACKAGE"; then
        echo "[SUCCESS] $PACKAGE berhasil diinstal"
    else
        echo "[FAILED] $PACKAGE gagal diinstal"
        FAILED+=("$PACKAGE")
    fi
done

echo ""
echo "======================================"
echo "          INSTALLATION RESULT"
echo "======================================"

if [[ ${#FAILED[@]} -eq 0 ]]; then
    echo "Semua tools berhasil diinstal!"
else
    echo "Paket yang gagal diinstal:"
    printf '%s\n' "${FAILED[@]}"
fi

echo "======================================"

if [[ ${#FAILED[@]} -gt 0 ]]; then
    exit 1
fi
