#!/bin/bash
# ==========================================
# NetLab-OS Master Setup Orchestrator
# Digunakan di dalam environment Cubic
# ==========================================

set -e  # Berhenti jika ada error

echo "=========================================="
echo " Memulai Konfigurasi Dasar NetLab-OS "
echo "=========================================="

# 1. Konfigurasi Mirror APT
if [ -f "./configure-mirror.sh" ]; then
    ./configure-mirror.sh
else
    echo "[-] Peringatan: configure-mirror.sh tidak ditemukan!"
fi

# 2. Pengaturan Zona Waktu
if [ -f "./set-timezone.sh" ]; then
    ./set-timezone.sh
else
    echo "[-] Peringatan: set-timezone.sh tidak ditemukan!"
fi

# 3. Instalasi Paket Jaringan (NetLab-Tools)
if [ -f "./install-net-tools.sh" ]; then
    ./install-net-tools.sh
else
    echo "[-] Peringatan: install-net-tools.sh tidak ditemukan!"
fi
# 4. Konfigurasi Bootloader GRUB
if [ -f "./configure-grub.sh" ]; then
    ./configure-grub.sh
else
    echo "[-] Peringatan: configure-grub.sh tidak ditemukan!"
fi
echo "=========================================="
echo " Seluruh Konfigurasi & Tools Berhasil! "
echo "=========================================="
