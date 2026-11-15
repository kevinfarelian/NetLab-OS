#!/bin/bash
# Skrip Pengaturan Zona Waktu Asia/Jakarta

echo "[*] Mengatur zona waktu sistem ke Asia/Jakarta..."

if command -v timedatectl &> /dev/null; then
    timedatectl set-timezone Asia/Jakarta
else
    ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
    echo "Asia/Jakarta" > /etc/timezone
fi

echo "[+] Zona waktu berhasil diatur ke: $(date)"
