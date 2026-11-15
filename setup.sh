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

echo "=========================================="
echo " Konfigurasi Dasar & Mirror Berhasil! "
echo "=========================================="
