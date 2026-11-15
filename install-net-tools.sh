#!/bin/bash
# ==========================================
# Skrip Instalasi Paket Jaringan NetLab-OS
# ==========================================

set -e

echo "[*] Memulai instalasi network tools utama..."

# Daftar paket jaringan yang akan diinstal
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

for pkg in "${PACKAGES[@]}"; do
    echo "[*] Menginstal paket: $pkg..."
    apt-get install -y "$pkg"
done

echo "[+] Semua network tools berhasil diinstal dengan sukses!"
